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

const main = async () => {
  const filePath = process.argv[2];
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
    .forEach(async (code) => {
      const outDir = path.dirname(filePath);
      const outFile = path.basename(filePath);
      const execTree = buildExecTree(code);
      const allLabels = computeCosts3(execTree);
      await fs.writeFile(`${outDir}/costs.${outFile}`, treeString(execTree));
    });
};

const logStack = (labelStack, allLabels, prefix) => {
  const stackStr = labelStack.map(({ id, label }) => {
    const op = allLabels.find(op => op.id === id);
    return `${label.slice(0, label.indexOf('.'))}(${op.cost})`;
  }).join(',');
  console.log(`${prefix}labelStack = [${stackStr}]`);
}
const logOp = (op, label, cost, prefix) => console.log(`${prefix}${op.lineNumber}: ${op.line} ${label}.cost = ${cost}`);
const logBranch = (branch, labelStack, allLabels, prefix) => {
  console.log(`${prefix}${branch[0].toUpperCase()}${branch.slice(1)} Branch`);
  logStack(labelStack, allLabels, prefix + '  ');
}

const computeCosts3 = (thread, labelStack = [], allLabels = [], prefix = '') => {
  let skip = '';
  for (const op of thread) {
    if (op.type === 'EMITLABEL') {
      const { id, data: { short: label, type } } = op;
      console.log(`${prefix}${op.line}`);
      if (type === 'start') {
        const duplicate = allLabels.find(label => label.id === id);
        if (duplicate) {
          op.cost = duplicate.cost;
          skip = label;
        } else {
          op.cost = 0;
          allLabels.push(op);
          labelStack.unshift({ id, label });
        }
        logStack(labelStack, allLabels, prefix);
      } else if (type === 'end') {
        if (skip === label) {
          skip = ''
        } else {
          const removed = labelStack.shift();
          assert(removed, 'End label has no matching start label');
          assert.equal(removed.label, label);
        }
        logStack(labelStack, allLabels, prefix);
      }
    } else if (op.type !== 'TAG') {
      if (!skip) {
        assert(labelStack.length > 0, `Operation not covered by any label: ${JSON.stringify(op, null, 2)}`);
        const { id, label } = labelStack[0];
        const labelOp = allLabels.find(op => op.id === id);
        labelOp.cost++;
        logOp(op, label, labelOp.cost, prefix);
      } else {
        console.log(`${prefix}${op.lineNumber}: ${op.line} skipped`);
      }
    }
  }

  const lastOp = thread[thread.length - 1];
  if (lastOp.type === 'JUMPI') {
    prefix += '  ';
    ['true', 'false'].forEach(branch => {
      logBranch(branch, labelStack, allLabels, prefix);
      computeCosts3(lastOp[branch], JSON.parse(JSON.stringify(labelStack)), allLabels, prefix + '  ');
    });
  }

  return allLabels;
}

main();

const treeString = (tree, prefix = '') => {
  return tree.reduce((str, node) => {
    str += `${prefix} ${node.lineNumber ? node.lineNumber + ': ' : ''} ${node.line} ${node.label || ''} `;
    if (node.type === 'EMITLABEL' && node.cost != null) {
      str += `(cost: ${node.cost})`;
    }
    str += '\n';

    if (node.false) {
      str += `${prefix} False Branch\n`;
      str += treeString(node.false, prefix + '       ');
    }

    if (node.true) {
      str += `${prefix} True Branch\n`;
      str += treeString(node.true, prefix + '       ');
    }

    return str;
  }, '');
}

// ==================
// FAILURES
// ==================
//
// const computeCosts2 = (thread, prefix = '', callId = 0) => {
//   let totalCost = 0;
//   let costFromLastStart = 0;
//   const labelStack = [];
//   const nonOwnedLabelCosts = new Map();
//   for (const op of thread) {
//     if (op.type === 'EMITLABEL') {
//       const { id, data: { short: label, type } } = op;
//       if (type === 'start') {
//         labelStack.forEach(({ id }) => {
//           const op = thread.find(op => op.id === id);
//           op.cost = (op.cost || 0) + costFromLastStart;
//         });
//         labelStack.push({ id, label });
//         costFromLastStart = 0;
//       } else if (type === 'end') {
//         if (labelStack.length > 0) {
//           // Owned label: this label opens and closes inside this branch so its cost can be computed directly
//           const currentLabelData = labelStack.pop();
//           assert(currentLabelData.label, label);
//           const labelOp = thread.find(op => op.id === currentLabelData.id);
//           labelOp.cost = (labelOp.cost || 0) + costFromLastStart;
//         } else {
//           // Non-owned label: this label belongs to some branch that comes before this one, so we can
//           // only compute its partial cost based on the current branch total cost and remember it
//           op.cost = totalCost;
//           nonOwnedLabelCosts.set(label, totalCost);
//         }
//       }
//     } else if (op.type !== 'TAG') {
//       totalCost++;
//       if (labelStack.length > 0)
//         costFromLastStart++;
//     }
//   }

//   console.log(`${prefix} ${callId}#: after loop: totalCost = ${totalCost}, costFromLastStart = ${costFromLastStart} `)

//   labelStack.forEach(({ id }) => {
//     const label = thread.find(op => op.id === id);
//     label.cost = (label.cost || 0) + costFromLastStart;
//   });

//   const lastOp = thread[thread.length - 1];
//   if (lastOp.type === 'JUMPI') {
//     console.log(`${prefix} ${callId}#: before branches: totalCost = ${totalCost}, labelStack = ${JSON.stringify(labelStack.map(({ label }) => label))} `)
//     const [trueResult, falseResult] = ['true', 'false'].map((branch) => {
//       console.log(`${prefix} ${callId}#: ${branch} Branch before compute`);
//       const { totalCost, nonOwnedLabelCosts } = computeCosts2(lastOp[branch], prefix + '\t', callId + 1);
//       nonOwnedLabelCosts.forEach((cost, label) => console.log(`${label} => ${cost} `));
//       console.log(`${prefix} ${callId}#: ${branch} Branch: totalCost = ${totalCost}, nonOwnedLabelCosts = ${JSON.stringify(nonOwnedLabelCosts)} `);
//       labelStack.forEach(({ id, label }) => {
//         const labelOp = thread.find(op => op.id === id);
//         if (!labelOp.branchCosts) labelOp.branchCosts = { true: 0, false: 0 };
//         if (nonOwnedLabelCosts.has(label)) {
//           labelOp.branchCosts[branch] += nonOwnedLabelCosts.get(label);
//           assert(nonOwnedLabelCosts.delete(label));
//         } else {
//           labelOp.branchCosts[branch] += totalCost;
//         }
//       });
//       return { totalCost, nonOwnedLabelCosts };
//     });
//     trueResult.nonOwnedLabelCosts.forEach((cost, label, costs) => costs.set(label, cost + totalCost));
//     falseResult.nonOwnedLabelCosts.forEach((cost, label, costs) => costs.set(label, cost + totalCost));
//     thread.totalCost = totalCost + trueResult.totalCost + falseResult.totalCost;
//     return {
//       totalCost: totalCost + trueResult.totalCost + falseResult.totalCost,
//       nonOwnedLabelCosts: new Map([
//         ...nonOwnedLabelCosts,
//         ...trueResult.nonOwnedLabelCosts,
//         ...falseResult.nonOwnedLabelCosts
//       ])
//     };
//   }
//   thread.totalCost = totalCost;
//   return { totalCost, nonOwnedLabelCosts };
// }

// const computeCosts = (thread, labelStack = [], branch = '') => {
//   const labelCosts = labelStack.reduce((costs, labelInfo) => {
//     costs[labelInfo.id] = { label: labelInfo.label, least: 0, true: 0, false: 0 };
//     return costs;
//   }, {});
//   console.log('start');
//   console.log(labelStack);
//   console.log(labelCosts);
//   for (const op of thread) {
//     if (op.type === 'EMITLABEL') {
//       if (op.data.type === 'start') {
//         const { id, data: { short: label } } = op;
//         assert(!labelCosts[id]);
//         labelCosts[id] = { label, least: 0, true: 0, false: 0 };
//         labelStack.unshift({ id, label, owned: true });
//       } else if (op.data.type === 'end') {
//         const currentLabel = labelStack.shift();
//         assert.equal(currentLabel.label, op.data.short);
//         console.log('currentLabel', currentLabel)
//         console.log(labelStack);
//         console.log(labelCosts);
//         if (labelStack.length > 0) {
//           const topLabel = labelStack[0];
//           const costs = labelCosts[topLabel.id];
//           assert(costs);
//           if (!costs.owned && branch) {
//             costs[branch] =
//               labelCosts[currentLabel.id].least +
//               labelCosts[currentLabel.id].true +
//               labelCosts[currentLabel.id].false;
//           } else {
//             costs.least += labelCosts[currentLabel.id].least;
//             costs.true += labelCosts[currentLabel.id].true;
//             costs.false += labelCosts[currentLabel.id].false;
//           }
//         }
//       }
//     } else if (op.type !== 'TAG') {
//       assert(labelStack.length > 0, `Operation not covered by any label: ${JSON.stringify(op, null, 2)}`);
//       const topLabel = labelStack[0];
//       const costs = labelCosts[topLabel.id];
//       assert(costs);
//       if (!costs.owned && branch)
//         labelCosts[topLabel.id][branch]++;
//       else
//         labelCosts[topLabel.id].least++;
//     }
//   }
//   console.log('after loop');
//   console.log(labelStack);
//   console.log(labelCosts);

//   const lastOp = thread[thread.length - 1];
//   if (lastOp.type === 'JUMPI') {
//     const [_, falseBranchCosts] = ['true', 'false'].map(branch => {
//       console.log(`before compute ${branch}`);
//       console.log(labelStack);
//       console.log(labelCosts);
//       const branchCosts = computeCosts(lastOp[branch], JSON.parse(JSON.stringify(labelStack)), branch);
//       console.log(`after compute ${branch}`);
//       console.log(branchCosts);
//       Object.entries(branchCosts).forEach(([labelId, { label, ...costs }]) => {
//         if (labelCosts[labelId] && labelCosts[labelId].label === label) {
//           labelCosts[labelId][branch] += costs[branch];
//         } else {
//           labelCosts[labelId] = { label, ...costs };
//         }
//       });
//       console.log(`after deduplicate ${branch}`);
//       console.log(labelCosts);
//       return branchCosts;
//     });

//     // const topLabel = labelStack[labelStack.length - 1];
//     // if (topLabel) {
//     //   assert(labelCosts[topLabel.id]);
//     //   console.log('gino', Object.entries(falseBranchCosts)[0]);
//     //   labelCosts[topLabel.id].optional += Object.entries(falseBranchCosts)[0][1].least + Object.entries(falseBranchCosts)[0][1].optional;
//     // }
//   }

//   console.log(`end`);
//   console.log(labelStack);
//   console.log(labelCosts);

//   return labelCosts;
// }