const assert = require("assert");

const STARTUP_LABEL = "__startup__";

const computeExternalLabelCosts = (controlGraph, internalLabelsCosts) => {
  const externalLabelsCosts = { [STARTUP_LABEL]: 0 };
  const initialStack = [STARTUP_LABEL];
  const compute = (thread, labelStack) => {
    thread
      .filter((op) => op.type === "EMITLABEL")
      .forEach(({ id, data: { short: label, type } }) => {
        switch (type) {
          case "start": {
            const internalLabelCost = internalLabelsCosts[label][id];
            assert.notEqual(
              internalLabelCost,
              null,
              `${label} does not have an associated cost.`
            );
            assert(labelStack.length > 0, "Label stack is empty.");
            externalLabelsCosts[labelStack[0]] += internalLabelCost;
            break;
          }
          case "end": {
            // For now do nothing
            break;
          }
          case "external": {
            if (externalLabelsCosts[label] != null) {
              // If we found a label for which we have already computed its cost,
              // then (for now) we just skip it
              break;
            }
            externalLabelsCosts[label] = 0;
            assert(labelStack.length > 0, "Label stack is empty");
            const topLabel = labelStack[0];
            if (topLabel === STARTUP_LABEL) {
              // We found the first external label so we have to:
              // 1. remove the startup label
              // 2. assign its cost to the external one
              // 3. push the external onto the stack
              labelStack.shift();
              labelStack.unshift(label);
              externalLabelsCosts[label] += externalLabelsCosts[STARTUP_LABEL];
            } else {
              // This is not the first external label that we found,
              // so we simply push the new one and continue
              labelStack.unshift(label);
            }
            break;
          }
        }
      });

    const lastOp = thread[thread.length - 1];
    if (lastOp.type === "JUMPI") {
      ["true", "false"].forEach((branch) => {
        compute(lastOp[branch], [...labelStack]);
      });
    }
  };

  compute(controlGraph, initialStack);
  return externalLabelsCosts;
};

class LabelNotFoundError extends Error {
  constructor(label) {
    super(`${label} has no matching label`);
    this.label = label;
  }
}

const computeInternalLabelCosts = (thread, enableLogging = false) => {
  const logs = "";
  const prefix = "";
  const internalLabelsCosts = {};
  const compute = (
    thread,
    labelStack = [],
    allLabelIds = [],
    skipStack = []
  ) => {
    for (const op of thread) {
      if (op.type === "EMITLABEL") {
        const { id, data } = op;
        const { short: label, type } = data;
        // if (enableLogging) logs += `${prefix}${op.line}\n`;
        if (type === "start") {
          if (allLabelIds.includes(id)) {
            skipStack.unshift(label);
          } else {
            if (!internalLabelsCosts[label]) {
              internalLabelsCosts[label] = {};
            }
            internalLabelsCosts[label][id] = 0;
            allLabelIds.push(id);
            labelStack.unshift({ id, label });
          }
          // if (enableLogging) logs += logStack(labelStack, allLabels, prefix);
        } else if (type === "end") {
          if (skipStack.length > 0) {
            skipStack.shift();
          } else {
            let removed = labelStack.shift();
            while (!removed || removed.label !== label) {
              removed = labelStack.shift();
            }

            if (!removed) {
              throw new LabelNotFoundError(label);
            }
          }
          // if (enableLogging) logs += logStack(labelStack, allLabels, prefix);
        }
      } else if (op.type !== "TAG") {
        if (skipStack.length === 0) {
          assert(
            labelStack.length > 0,
            `Operation not covered by any label: ${JSON.stringify(op, null, 2)}`
          );
          const { id, label } = labelStack[0];
          assert.notEqual(
            internalLabelsCosts[label][id],
            null,
            `${label} does not have an associated cost.`
          );
          internalLabelsCosts[label][id] += op.gas;
          // if (enableLogging) logs += logOp(op, label, labelOp.cost, prefix);
        } else {
          // if (enableLogging)
          // logs += `${prefix}${op.lineNumber}: ${op.line} skipped\n`;
        }
      }
    }

    const lastOp = thread[thread.length - 1];
    if (lastOp.type === "JUMPI") {
      // prefix += "  ";
      ["true", "false"].forEach((branch) => {
        // if (enableLogging)
        // logs += logBranch(branch, labelStack, allLabels, prefix);

        // try {
        compute(
          lastOp[branch],
          // enableLogging,
          [...labelStack],
          allLabelIds,
          [...skipStack]
          // prefix + "  "
        );
        // if (enableLogging && branchLogs) logs += branchLogs;
        // } catch (e) {
        //   if (e instanceof WithLogsError) {
        //     throw new WithLogsError(logs + e.logs);
        //   }
        // }
      });
    }
  };

  // function logStack(labelStack, allLabels, prefix) {
  //   const stackStr = labelStack
  //     .map(({ id, label }) => {
  //       const op = allLabels.find((op) => op.id === id);
  //       return `${label.slice(0, label.indexOf("."))}(${op.cost})`;
  //     })
  //     .join(",");
  //   return `${prefix}labelStack = [${stackStr}]\n`;
  // }
  // function logOp(op, label, cost, prefix) {
  //   return `${prefix}${op.lineNumber}: ${op.line} ${label}.cost = ${cost}\n`;
  // }
  // function logBranch(branch, labelStack, allLabels, prefix) {
  //   return (
  //     `${prefix}${branch[0].toUpperCase()}${branch.slice(1)} Branch\n` +
  //     logStack(labelStack, allLabels, prefix + "  ")
  //   );
  // }

  compute(thread);
  return internalLabelsCosts;
};

module.exports = { computeInternalLabelCosts, computeExternalLabelCosts };
