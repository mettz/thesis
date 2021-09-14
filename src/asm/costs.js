const assert = require("assert");

const STARTUP_LABEL = "__startup__";

const computeExternalLabelCosts = (controlGraph, internalLabelsCosts) => {
  const compute = (thread, labelStack, externalLabelsCosts) => {
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
        externalLabelsCosts[branch] = compute(
          lastOp[branch],
          [...labelStack],
          JSON.parse(JSON.stringify(externalLabelsCosts))
        );
      });
    }

    return externalLabelsCosts;
  };

  return compute(controlGraph, [STARTUP_LABEL], { [STARTUP_LABEL]: 0 });
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
              if (!removed && labelStack.length === 0) {
                throw new LabelNotFoundError(label);
              }
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

const computeCosts = (thread) => {
  const repeated = {};
  const externalLabelsCosts = { [STARTUP_LABEL]: { cost: 0, labels: [] } };
  const compute = (
    thread,
    labelStack = [],
    allLabelIds = [],
    skipStack = [],
    internalLabelsCosts = {},
    externalLabelStack = [STARTUP_LABEL]
  ) => {
    for (const op of thread) {
      if (op.type === "EMITLABEL") {
        const { id, data } = op;
        const { short: label, type } = data;
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
        } else if (type === "end") {
          if (skipStack.length > 0) {
            skipStack.shift();
          } else {
            let removed = labelStack.shift();
            while (!removed || removed.label !== label) {
              removed = labelStack.shift();
              if (!removed && labelStack.length === 0) {
                throw new LabelNotFoundError(label);
              }
            }

            assert(
              externalLabelStack.length > 0,
              "External label stack is empty"
            );
            const topExternalLabel = externalLabelStack[0];
            externalLabelsCosts[topExternalLabel].cost +=
              internalLabelsCosts[removed.label][removed.id];
            externalLabelsCosts[topExternalLabel].labels.unshift({
              label: removed.label,
              cost: internalLabelsCosts[removed.label][removed.id],
            });
          }
        } else {
          if (externalLabelsCosts[label] != null) {
            // If we found a label for which we have already computed its cost,
            // then (for now) we just skip it
            console.log(`WARNING: Found duplicated label ${label}.`);
            continue;
          }
          externalLabelsCosts[label] = { cost: 0, labels: [] };
          assert(
            externalLabelStack.length > 0,
            "External label stack is empty"
          );
          const topLabel = externalLabelStack[0];
          if (topLabel === STARTUP_LABEL) {
            // We found the first external label so we have to:
            // 1. remove the startup label
            // 2. assign its cost to the external one
            // 3. push the external onto the stack
            externalLabelStack.shift();
            externalLabelStack.unshift(label);
            externalLabelsCosts[label].cost +=
              externalLabelsCosts[STARTUP_LABEL].cost;
            externalLabelsCosts[label].labels.unshift(STARTUP_LABEL);
          } else {
            // This is not the first external label that we found,
            // so we simply push the new one and continue
            externalLabelStack.unshift(label);
          }
        }
      } else {
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
        }
      }
    }

    const lastOp = thread[thread.length - 1];
    if (lastOp.type === "JUMPI") {
      // const [trueBranchCosts, falseBranchCosts] =
      ["true", "false"].map((branch) => {
        compute(
          lastOp[branch],
          [...labelStack],
          allLabelIds,
          [...skipStack],
          JSON.parse(JSON.stringify(internalLabelsCosts)),
          [...externalLabelStack]
        );
      });

      // let internal = Object.entries(internalLabelsCosts).reduce(
      //   (merged, [label, data]) => {
      //     const [id, cost] = Object.entries(data)[0];
      //     assert.notEqual(trueBranchCosts.internal[label][id], null);
      //     assert.notEqual(falseBranchCosts.internal[label][id], null);
      //     merged[label] = {};
      //     merged[label][id] = cost;
      //     merged[label][id] += trueBranchCosts.internal[label][id] - cost;
      //     merged[label][id] += falseBranchCosts.internal[label][id] - cost;
      //     return merged;
      //   },
      //   {}
      // );
      // internal = Object.entries(trueBranchCosts.internal).reduce(
      //   (merged, [label, data]) => {
      //     const [id, cost] = Object.entries(data)[0];
      //     if (!merged[label]) {
      //       merged[label] = {};
      //     }
      //     if (!merged[label][id]) {
      //       merged[label][id] = cost;
      //     }
      //     return merged;
      //   },
      //   internal
      // );
      // internal = Object.entries(falseBranchCosts.internal).reduce(
      //   (merged, [label, data]) => {
      //     const [id, cost] = Object.entries(data)[0];
      //     if (!merged[label]) {
      //       merged[label] = {};
      //     }
      //     if (!merged[label][id]) {
      //       merged[label][id] = cost;
      //     }
      //     return merged;
      //   },
      //   internal
      // );
      // return { internal };
    }

    // return {
    //   internal: internalLabelsCosts,
    // };
  };

  compute(thread);
  return { external: externalLabelsCosts, repeated };
};

const computeCostsV2 = (graph) => {
  const initialStack = [{ label: STARTUP_LABEL, internal: false }];
  const internalLabelsCosts = {};
  const externalLabelsCosts = { [STARTUP_LABEL]: { cost: 0, labels: [] } };
  const compute = (
    thread,
    labelStack,
    allLabelIds = [],
    skipStack = [],
    prefix = ""
  ) => {
    for (const op of thread) {
      if (op.type === "EMITLABEL") {
        const { id, data } = op;
        const { short: label, type } = data;
        const labelPlusId = `${label}-${id}`;
        if (type === "start") {
          if (allLabelIds.includes(id)) {
            skipStack.unshift(labelPlusId);
          } else {
            internalLabelsCosts[labelPlusId] = { cost: 0 };
            allLabelIds.push(id);
            labelStack.unshift({ label: labelPlusId, internal: true });
          }
        } else if (type === "end") {
          if (skipStack.length > 0) {
            const skipped = skipStack.shift();
            if (skipStack.length === 0) {
              const { label, internal } = labelStack[0];
              const costsObj = internal
                ? internalLabelsCosts
                : externalLabelsCosts;
              costsObj[label].cost += internalLabelsCosts[skipped].cost;
              if (!internal) {
                externalLabelsCosts[label].labels.unshift(skipped);
              }
            }
          } else {
            const toRemoveIndex = labelStack.findIndex(
              (e) => e.label.split("-")[0] === label
            );
            const firstInternal = labelStack.findIndex(
              ({ internal }) => internal
            );
            const removedSlice = labelStack.slice(
              firstInternal,
              toRemoveIndex + 1
            );
            console.log(
              `${prefix}Before remove: ${labelStack.map(({ label }) => label)}`
            );
            labelStack = [
              ...labelStack.slice(0, firstInternal),
              ...labelStack.slice(toRemoveIndex + 1),
            ];
            console.log(
              `${prefix}After remove: ${labelStack.map(({ label }) => label)}`
            );

            if (toRemoveIndex === 0) {
              const newFirst = labelStack[0];
              const costsObj = newFirst.internal
                ? internalLabelsCosts
                : externalLabelsCosts;
              const labelWithId = Object.keys(internalLabelsCosts).find(
                (k) => k.split("-")[0] === label
              );
              costsObj[newFirst.label].cost +=
                internalLabelsCosts[labelWithId].cost;
              if (!newFirst.internal) {
                externalLabelsCosts[newFirst.label].labels.unshift(labelWithId);
              }
            } else {
              console.log(
                `${prefix}Removed slice: [${removedSlice.map(
                  ({ label }) => label
                )}]`
              );
              console.log(
                `${prefix}   Before: [${labelStack
                  .slice(0, firstInternal)
                  .map(({ label }) => label)}]`
              );
            }
          }
        } else {
          if (skipStack.length > 0) continue;
          if (externalLabelsCosts[label] != null) {
            // If we found a label for which we have already computed its cost,
            // then (for now) we just skip it
            console.log(`WARNING: Found duplicated label ${label}.`);
            continue;
          }
          externalLabelsCosts[label] = { cost: 0, labels: [] };
          const externalLabels = labelStack.filter(({ internal }) => !internal);
          assert(externalLabels.length > 0);
          if (externalLabels.length === 1) {
            assert.equal(externalLabels[0].label, STARTUP_LABEL);
            externalLabelsCosts[label].labels.unshift(STARTUP_LABEL);
          }
          labelStack.unshift({ label, internal: false });
        }
      } else {
        if (skipStack.length === 0) {
          assert(
            labelStack.length > 0,
            `Operation not covered by any label: ${JSON.stringify(op, null, 2)}`
          );
          const { label, internal } = labelStack[0];
          const costsObj = internal ? internalLabelsCosts : externalLabelsCosts;
          assert.notEqual(
            costsObj[label].cost,
            null,
            `${label} does not have an associated cost.`
          );
          costsObj[label].cost += 1 /*op.gas*/;
        }
      }
    }

    const lastOp = thread[thread.length - 1];
    if (lastOp.type === "JUMPI") {
      ["true", "false"].forEach((branch) => {
        console.log(`${prefix}${branch} branch`);
        compute(
          lastOp[branch],
          [...labelStack],
          allLabelIds,
          [...skipStack],
          prefix + "  "
        );
      });
    }
  };

  compute(graph, initialStack);
  return { external: externalLabelsCosts, internal: internalLabelsCosts };
};

module.exports = {
  computeInternalLabelCosts,
  computeExternalLabelCosts,
  computeCosts: computeCostsV2,
};
