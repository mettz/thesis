const fs = require('fs').promises;
const path = require('path');
const util = require('util');
const assert = require('assert');
const { nanoid } = require('nanoid');

const parseAsmLine = (line) => {
  if (line.startsWith('/* emit')) {
    // label
    const fullLabel = line.split(' ')[2];
    const lastDot = fullLabel.lastIndexOf('.');
    const shortLabel = lastDot !== -1 ? fullLabel.slice(0, lastDot) : fullLabel;
    const type = lastDot !== -1 ? fullLabel.slice(lastDot + 1) : null;
    return {
      type: 'EMITLABEL',
      data: { full: fullLabel, short: shortLabel, type }
    };
  } else if (line.startsWith('tag')) {
    // tag
    return {
      type: 'TAG',
      data: { name: line.slice(0, -1) }
    };
  } else {
    const [type, ...args] = line.split(/\s/).filter(word => word !== '' && word !== '//');
    return {
      type: type.toUpperCase(),
      data: { args }
    };
  }
}

const buildExecTree = (ops, cursor = 0, tagStack = [], visited = []) => {
  const thread = [];
  while (cursor < ops.length && !visited.find(op => op.id === ops[cursor].id)) {
    thread.push({ ...ops[cursor], tagStack: [...tagStack] });
    ops[cursor].visited = true;
    visited.push(ops[cursor]);
    if (ops[cursor].type === 'PUSH' && ops[cursor].data.args[0] === '[tag]') {
      tagStack.push(`tag_${ops[cursor].data.args[1]}`);
    } else if (ops[cursor].type === 'JUMP') {
      const { data: { args: jumpArgs } } = ops[cursor];

      while (tagStack.length > 0) {
        const lastTagName = tagStack.pop();
        const tag = ops.find(op => op.type === 'TAG' && op.data.name === lastTagName);
        assert(tag, 'JUMP tag not found');

        if (!jumpArgs.includes('in') || !visited.find(op => op.id === tag.id)) {
          thread[thread.length - 1].tag = lastTagName;
          cursor = ops.findIndex(op => op.id === tag.id);
          assert.notEqual(cursor, -1);
          break;
        }

        cursor = null;
      }

      if (tagStack.length > 0 || cursor)
        continue;
      else
        break;
    } else if (ops[cursor].type === 'JUMPI') {
      const savedTagStack = [...tagStack];
      const lastTag = tagStack.pop();
      const tagIndex = ops.findIndex(op => op.type === 'TAG' && op.data.name === lastTag);
      if (tagIndex === -1) throw new Error("JUMPI tag not found");
      const trueBranch = buildExecTree(ops, tagIndex, [...tagStack], JSON.parse(JSON.stringify(visited)));
      const falseBranch = buildExecTree(ops, cursor + 1, [...tagStack], JSON.parse(JSON.stringify(visited)));
      thread[thread.length - 1].true = trueBranch;
      thread[thread.length - 1].false = falseBranch;
      thread[thread.length - 1].tagStack = savedTagStack;
      break;
    } else if (
      ops[cursor].type === 'RETURN' ||
      ops[cursor].type === 'REVERT' ||
      ops[cursor].type === 'SELFDESTRUCT' ||
      ops[cursor].type === 'STOP'
    ) {
      return thread;
    }

    cursor++;
  }

  return thread;
}

class UncoveredError extends Error {
  constructor(op, coveredTree) {
    super(`${op.line} at line ${op.lineNumber} is not covered by any label`);
    this.name = "UncoveredError";
    this.op = op;
    this.coveredTree = coveredTree;
  }
}

const ALLOWED_UNCOVERED = [];

const checkLabels = (execTree, fnStacks = [], labelStack = []) => {
  const coveredTree = [];
  for (const op of execTree) {
    if (op.type === 'EMITLABEL') {
      const { short: label, type } = op.data;
      switch (type) {
        case 'start':
          labelStack.push(label);
          break;
        case 'end': {
          const startLabel = labelStack.pop();
          if (startLabel) assert.equal(label, startLabel);
          break;
        }
      }
    } else {
      if (labelStack.length > 0 || op.type === 'TAG' || ALLOWED_UNCOVERED.includes(op.lineNumber))
        coveredTree.push({ ...op, label: labelStack[labelStack.length - 1] });
      else
        throw new UncoveredError(op, coveredTree);

      if (op.type === 'JUMP') {
        const { args } = op.data;
        if (args.includes('in')) {
          fnStacks.push([...labelStack]);
          labelStack = [];
        } else if (args.includes('out')) {
          assert.notEqual(fnStacks.length, 0);
          labelStack = fnStacks.pop();
        }
      }

      if (op.type === 'JUMPI') {
        const { true: trueBranch, false: falseBranch, ...jumpi } = coveredTree[coveredTree.length - 1];
        try {
          coveredTree[coveredTree.length - 1].true = checkLabels(trueBranch, [...fnStacks], [...labelStack]);
        } catch (e) {
          if (e instanceof UncoveredError) {
            throw new UncoveredError(e.op, [...coveredTree.slice(0, -1), { ...jumpi, true: e.coveredTree }]);
          }
        }

        try {
          coveredTree[coveredTree.length - 1].false = checkLabels(falseBranch, [...fnStacks], [...labelStack]);
        } catch (e) {
          if (e instanceof UncoveredError) {
            throw new UncoveredError(e.op, [...coveredTree.slice(0, -1), { ...jumpi, false: e.coveredTree }]);
          }
        }
      }
    }
  }

  return coveredTree;
}

const main = async () => {
  const contractOutDir = process.argv[2];
  const files = await fs.readdir(contractOutDir).then(files => {
    return files
      .filter(file => path.extname(file) === '.evm')
      .map(file => path.join(contractOutDir, file));
  });
  await Promise.all(files.map(async filePath => {
    const asm = await fs.readFile(filePath).then(content => content.toString());
    if (!asm) return;
    asm
      .split('stop')
      .map(asm => {
        let lineNumber = 1;
        return asm
          .split('\n')
          .map(line => line.trim())
          .filter((line) => line && line !== '}' && !line.includes('{'))
          .map(line => {
            const result = { id: nanoid(16), line, ...parseAsmLine(line) };
            if (result.type !== 'EMITLABEL')
              return { lineNumber: lineNumber++, ...result };
            else
              return result;
          })
      })
      .forEach(async (code, index) => {
        const codeKind = index === 0 ? 'creation' : 'deployed';
        const outputPath = `${filePath.replace('.evm', '')}.${codeKind}${path.extname(filePath)}`;
        await fs.writeFile(outputPath, code.map(op => `${op.lineNumber ? op.lineNumber + ': ' : ''}${op.line}`).join('\n'));
        let reachable = true;
        const reachableCode = code.filter((op, index) => {
          if (['RETURN', 'REVERT', 'SELFDESTRUCT', 'STOP'].includes(op.type)) {
            reachable = false;
            return true;
          }

          if (op.type === 'JUMP') {
            const isJumpReachable = reachable;
            reachable = false; // Everything after jump is unreachable (unless there is a tag but now we don't know that)
            return isJumpReachable;
          }

          if (op.type === 'TAG') {
            reachable = true;
            if (index === code.length - 1) // Last tag is always unreachable
              return false;
          }

          return reachable;
        })
        const outDir = path.dirname(outputPath);
        const outFile = path.basename(outputPath);
        // await fs.writeFile(`${outDir}/reachable.${outFile}`, code.map(op => {
        //   const reachable = reachableCode.find(reachable => reachable.id === op.id);
        //   return `${op.lineNumber ? op.lineNumber + ': ' : ''}${reachable ? reachable.line : ''}`;
        // }).join('\n'));
        const execTree = buildExecTree(reachableCode);
        const missed = reachableCode.filter(op => !op.visited);
        if (missed.length > 0) {
          await fs.writeFile(
            `${outDir}/missed.${outFile}`,
            missed
              .map(op => `Operation not visited: \n${JSON.stringify(op, null, 2)}`)
              .join('\n')
          );
        }
        await fs.writeFile(`${outDir}/execution.${outFile}`, treeString(execTree));
        let coveredTree;
        try {
          coveredTree = checkLabels(execTree);
        } catch (e) {
          console.log(e.message);
          if (e instanceof UncoveredError) {
            coveredTree = e.coveredTree;
          }
        }
        await fs.writeFile(`${outDir}/covered.${outFile}`, treeString(coveredTree));
      });
  }));
};


main();

const treeString = (tree, prefix = '') => {
  return tree.reduce((str, node) => {
    str += `${prefix}${node.lineNumber ? node.lineNumber + ': ' : ''}${node.line} ${node.label || ''}\n`// [${node.labelStack.reverse().map(label => label.replace('.internal.start', '')).join(',')}]`;
    // str += `${prefix}${node.lineNumber ? node.lineNumber + ': ' : ''}${node.line} ${node.tagStack.length > 0 ? 'tagStack = [' + node.tagStack.reverse().map(tag => tag.replace('tag_', '')).join(',') + ']' : ''}`;

    if (node.false) {
      str += `${prefix}  False Branch\n`;
      str += treeString(node.false, prefix + '       ');
    }

    if (node.true) {
      str += `${prefix}  True Branch\n`;
      str += treeString(node.true, prefix + '       ');
    }

    return str;
  }, '');
}