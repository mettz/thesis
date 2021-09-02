const assert = require("assert");

const STARTUP_LABEL = "__startup__";

const computeExternalLabelsCosts = (controlGraph, internalLabelsCosts) => {
  const externalLabelsCosts = { [STARTUP_LABEL]: 0 };
  const initialStack = [STARTUP_LABEL];
  const computeCosts = (thread, labelStack) => {
    thread
      .filter((op) => op.type === "EMITLABEL")
      .forEach(({ data: { short: label, type } }) => {
        // if (enableLogging) logs += `${prefix}${op.line}\n`;
        switch (type) {
          case "start": {
            const internalLabelCost = internalLabelsCosts[label];
            assert(
              internalLabelCost,
              `${label} does not have an associated cost.`
            );
            assert(labelStack.length > 0, "Label stack is empty.");
            externalLabelsCosts[initialStack[0]] += internalLabelCost;
            // if (enableLogging) logs += logStack(labelStack, allLabels, prefix);
            break;
          }
          case "end": {
            // if (skipStack.length > 0) {
            //   skipStack.pop();
            // } else {
            //   let removed = labelStack.shift();
            //   while (!removed || removed.label !== label) {
            //     removed = labelStack.shift();
            //   }

            //   if (!removed) {
            //     throw new LabelNotFoundError(label);
            //   }
            // }
            // if (enableLogging) logs += logStack(labelStack, allLabels, prefix);
            // For now do nothing
            break;
          }
          case "external": {
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
          }
        }
      });

    const lastOp = thread[thread.length - 1];
    if (lastOp.type === "JUMPI") {
      // prefix += "  ";
      ["true", "false"].forEach((branch) => {
        // if (enableLogging)
        //   logs += logBranch(branch, labelStack, allLabels, prefix);

        computeCosts(
          lastOp[branch],
          [...labelStack]
          // enableLogging,
          // JSON.parse(JSON.stringify(labelStack)),
          // allLabels,
          // JSON.parse(JSON.stringify(skipStack)),
          // prefix + "  "
        );
        // if (enableLogging && branchLogs) logs += branchLogs;
      });
    }

    // return {
    //   logs: enableLogging ? logs : undefined,
    //   costs: allLabels.reduce((costs, op) => {
    //     costs[op.data.short] = op.cost;
    //     return costs;
    //   }, {}),
    // };

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
  };

  computeCosts(controlGraph, initialStack);
  return externalLabelsCosts;
};

exports.computeExternalLabelsCosts = computeExternalLabelsCosts;
