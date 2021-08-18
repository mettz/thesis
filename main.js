const fs = require('fs').promises;
const path = require('path');
const util = require('util');
const assert = require('assert');
const { nanoid } = require('nanoid');

const COSTS_OUTPUT_TEMPLATE =
  '--------------------------------\n' +
  '  LABEL COSTS\n' +
  '--------------------------------\n' +
  '{costs}\n' +
  '\n' +
  '--------------------------------\n' +
  '  EXECUTION\n' +
  '--------------------------------\n' +
  '{execution}\n';

const main = async () => {
  const contractDir = process.argv[2];
  const args = process.argv.slice(3).reduce((args, str) => {
    if (str.match(/outputs/)) {
      args.outputs = str.split('=').pop();
    } else if (str.match(/logs/)) {
      args.enableLogging = true;
    } else {
      throw new Error(`Unexpected argument: ${str}`);
    }
    return args;
  }, { enableLogging: false, outputs: '' });

  const files = await fs.readdir(contractDir).then(files => {
    return files
      .filter(file => path.extname(file) === '.evm')
      .map(file => path.join(contractDir, file));
  });

  await Promise.all(files.map(async filePath => {
    const asm = await fs.readFile(filePath).then(content => content.toString());
    if (!asm) return;
    asm
      .split(/sub_\d+:\sassembly \{/)
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
        const codeKind = index >= 2 ? index : (index === 0 ? 'creation' : 'deployed');
        const outputPath = `${filePath.replace('.evm', '')}.${codeKind}${path.extname(filePath)}`;
        if (args.outputs.includes('i')) {
          // Output instrumented code
          await fs.writeFile(outputPath, code.map(op => `${op.lineNumber ? op.lineNumber + ': ' : ''}${op.line}`).join('\n'));
        }

        let reachable = true;
        const reachableCode = code.filter((op, index) => {
          if (op.type === 'EMITLABEL')
            return true; // Labels are comments, so they're always reachable

          if (['RETURN', 'REVERT', 'SELFDESTRUCT'].includes(op.type)) {
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
        if (args.outputs.includes('r')) {
          // Output reachable code
          await fs.writeFile(`${outDir}/reachable.${outFile}`, code.map(op => {
            const reachable = reachableCode.find(reachable => reachable.id === op.id);
            return `${op.lineNumber ? op.lineNumber + ': ' : ''}${reachable ? reachable.line : ''}`;
          }).join('\n'));
        }

        const execTree = buildExecTree(reachableCode);
        // const unmatchedLabels = checkMatchingLabels(execTree);
        // if (unmatchedLabels.length > 0)
        //   await fs.writeFile(`${outDir}/unmatchedLabels.${outFile}`, unmatchedLabels.join('\n'));
        const missed = reachableCode.filter(op => !op.visited && op.type !== 'EMITLABEL');
        if (missed.length > 0 && args.outputs.includes('m')) {
          // Output missed operations
          await fs.writeFile(
            `${outDir}/missed.${outFile}`,
            missed
              .map(op => `${JSON.stringify(op, null, 2)}`)
              .join('\n')
          );
        }

        if (args.outputs.includes('e')) {
          // Output execution tree
          await fs.writeFile(`${outDir}/execution.${outFile}`, treeString(execTree));
        }

        try {
          checkLabels(execTree);
        } catch (e) {
          console.log(`${path.basename(outDir)}: ${e.message}`);
          if (e instanceof UncoveredError) {
            const dir = `uncovered/${path.basename(outDir)}`;
            await fs.mkdir(dir, { recursive: true });
            await fs.writeFile(`${dir}/${outFile}`, treeString(e.coveredTree));
            return;
          }
        }
        // try {
        const { logs, costs } = computeCosts(execTree, args.enableLogging);
        if (args.enableLogging) {
          await fs.writeFile(`${outDir}/logs.${outFile}`, logs);
        }
        if (args.outputs.includes('c')) {
          const costsFmt = Object.entries(costs).map(([label, cost]) => `${label} = ${cost}`).join('\n');
          // Output costs
          await fs.writeFile(
            `${outDir}/costs.${outFile}`,
            COSTS_OUTPUT_TEMPLATE
              .replace('{costs}', costsFmt)
              .replace('{execution}', treeString(execTree))
          );
        }
        // } catch (e) {
        //   if (e instanceof WithLogsError) {
        //     const dir = `assertionError/${path.basename(outDir)}`;
        //     await fs.mkdir(dir, { recursive: true });
        //     await fs.writeFile(`${dir}/${outFile}`, e.logs);
        //   } else {
        //     throw e;
        //   }
        // }
      });
  }));
};

main();

class UncoveredError extends Error {
  constructor(op, coveredTree) {
    super(`${op.line} at line ${op.lineNumber} is not covered by any label`);
    this.name = "UncoveredError";
    this.op = op;
    this.coveredTree = coveredTree;
  }
}

class LabelNotFoundError extends Error {
  constructor(label) {
    super(`${label} has no matching label`);
    this.label = label;
  }
}

class WithLogsError extends Error {
  constructor(logs) {
    super('');
    this.logs = logs;
  }
}

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
          if (cursor + 1 < ops.length && ops[cursor + 1].type === 'EMITLABEL') {
            // We have to add the label that follows jump, if there is one
            thread.push({ ...ops[cursor + 1], tagStack: [...tagStack] });
          }
          cursor = ops.findIndex(op => op.id === tag.id);
          assert.notEqual(cursor, -1);
          break;
        } else {
          // This tag has been already visited, so its jump in is useless
          // but we have to inform checkLabels of this
          thread[thread.length - 1].skipped = true;
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
      // There may be some labels after this operation that we need to add to this thread
      while (cursor < ops.length && ops[cursor].type !== 'TAG') {
        if (ops[cursor].type === 'EMITLABEL' && ops[cursor].data.type === 'end') {
          thread.push({ ...ops[cursor], tagStack: [...tagStack] });
        }

        cursor++;
      }
      return thread;
    }

    cursor++;
  }

  return thread;
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
        if (args.includes('in') && !op.skipped) {
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

const checkMatchingLabels = (thread, labels = []) => {
  thread.forEach(op => {
    if (op.type === 'EMITLABEL') {
      const { data: { type, short: shortLabel } } = op;
      if (type === 'start')
        labels.push(shortLabel);

      if (type === 'end') {
        const labelIndex = labels.findIndex(startLabel => startLabel === shortLabel);
        if (labelIndex !== -1) {
          labels.splice(labelIndex, 1);
        }
      }
    }
  });

  const lastOp = thread[thread.length - 1];
  if (lastOp.true) {
    labels = checkMatchingLabels(lastOp.true, labels);
  }
  if (lastOp.false) {
    labels = checkMatchingLabels(lastOp.false, labels);
  }

  return labels;
}

const computeCosts = (thread, enableLogging = false) => {
  return computeCostsInner(thread, enableLogging);

  function computeCostsInner(thread, enableLogging, labelStack = [], allLabels = [], skipStack = [], prefix = '', logs = '') {
    for (const op of thread) {
      if (op.type === 'EMITLABEL') {
        const { id, data: { short: label, type } } = op;
        if (enableLogging)
          logs += `${prefix}${op.line}\n`;
        if (type === 'start') {
          const duplicate = allLabels.find(label => label.id === id);
          if (duplicate) {
            op.cost = duplicate.cost;
            skipStack.unshift(label);
          } else {
            op.cost = 0;
            allLabels.push(op);
            labelStack.unshift({ id, label });
          }
          if (enableLogging)
            logs += logStack(labelStack, allLabels, prefix);
        } else if (type === 'end') {
          if (skipStack.length > 0) {
            skipStack.pop();
          } else {
            let removed = labelStack.shift();
            while (!removed || removed.label !== label) {
              removed = labelStack.shift();
            }

            if (!removed) {
              throw new LabelNotFoundError(label);
            }
          }
          if (enableLogging)
            logs += logStack(labelStack, allLabels, prefix);
        }
      } else if (op.type !== 'TAG') {
        if (skipStack.length === 0) {
          assert(labelStack.length > 0, `Operation not covered by any label: ${JSON.stringify(op, null, 2)}`);
          const { id, label } = labelStack[0];
          const labelOp = allLabels.find(op => op.id === id);
          labelOp.cost++;
          if (enableLogging)
            logs += logOp(op, label, labelOp.cost, prefix);
        } else {
          if (enableLogging)
            logs += `${prefix}${op.lineNumber}: ${op.line} skipped\n`;
        }
      }
    }

    const lastOp = thread[thread.length - 1];
    if (lastOp.type === 'JUMPI') {
      prefix += '  ';
      ['true', 'false'].forEach(branch => {
        if (enableLogging)
          logs += logBranch(branch, labelStack, allLabels, prefix);

        // try {
        const branchLogs = computeCostsInner(lastOp[branch], enableLogging, JSON.parse(JSON.stringify(labelStack)), allLabels, JSON.parse(JSON.stringify(skipStack)), prefix + '  ');
        if (enableLogging && branchLogs)
          logs += branchLogs;
        // } catch (e) {
        //   if (e instanceof WithLogsError) {
        //     throw new WithLogsError(logs + e.logs);
        //   }
        // }
      });
    }

    return {
      logs: enableLogging ? logs : undefined,
      costs: allLabels.reduce((costs, op) => {
        costs[op.data.short] = op.cost;
        return costs;
      }, {}),
    }

    function logStack(labelStack, allLabels, prefix) {
      const stackStr = labelStack.map(({ id, label }) => {
        const op = allLabels.find(op => op.id === id);
        return `${label.slice(0, label.indexOf('.'))}(${op.cost})`;
      }).join(',');
      return `${prefix}labelStack = [${stackStr}]\n`;
    }
    function logOp(op, label, cost, prefix) {
      return `${prefix}${op.lineNumber}: ${op.line} ${label}.cost = ${cost}\n`;
    }
    function logBranch(branch, labelStack, allLabels, prefix) {
      return `${prefix}${branch[0].toUpperCase()}${branch.slice(1)} Branch\n` + logStack(labelStack, allLabels, prefix + '  ');
    }
  };
}

const treeString = (tree, labelCosts = {}, prefix = '') => {
  return tree.reduce((str, node) => {
    str += `${prefix}${node.lineNumber ? node.lineNumber + ': ' : ''}${node.line} ${node.label || ''}`;
    if (node.type === 'EMITLABEL' && node.cost != null) {
      str += `(cost: ${node.cost})`;
    }
    str += '\n';

    if (node.false) {
      str += `${prefix}  False Branch\n`;
      str += treeString(node.false, labelCosts, prefix + '       ');
    }

    if (node.true) {
      str += `${prefix}  True Branch\n`;
      str += treeString(node.true, labelCosts, prefix + '       ');
    }

    return str;
  }, '');
}