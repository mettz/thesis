const assignCosts = (lhs, rhs) => {
  if (typeof rhs === "number") {
    lhs.value += rhs;
  } else if (typeof rhs === "string") {
    lhs.annotations.push(rhs);
  } else {
    lhs.value += rhs.reduce(
      (cost, val) => (typeof val === "number" ? cost + val : cost),
      0
    );
    lhs.annotations = [
      ...lhs.annotations,
      rhs.reduce(
        (annotation, val) =>
          typeof val === "string"
            ? annotation
              ? `${annotation} + ${val}`
              : val
            : annotation,
        ""
      ),
    ];
  }
};

const computeCosts = (controlGraph) => {
  const initialStack = [];
  const externalLabelsCosts = {};
  const compute = (
    thread,
    labelStack,
    startupCost = { value: 0, annotations: [] },
    skip = false
  ) => {
    for (const op of thread) {
      if (op.type === "EMITLABEL") {
        const { id, lineNumber, data } = op;
        const { short: label } = data;
        const alreadyVisited = externalLabelsCosts[label] != null;
        if (!alreadyVisited) {
          skip = false;
          externalLabelsCosts[label] = {
            cost: { owned: { value: 0, annotations: [] } },
            id,
          };
        } else {
          skip = true;
        }

        if (labelStack.length === 0) {
          externalLabelsCosts[label].cost.startup = JSON.parse(
            JSON.stringify(startupCost)
          );
          startupCost = null;
        }

        labelStack.unshift(label);
      } else if (!skip) {
        // Add instruction cost to startup until we found the first external label
        if (labelStack.length === 0) {
          assignCosts(startupCost, op.gas);
        } else {
          assignCosts(externalLabelsCosts[labelStack[0]].cost.owned, op.gas);
        }
      }
    }

    const lastOp = thread[thread.length - 1];
    if (lastOp.type === "JUMPI") {
      ["true", "false"].forEach((branch) =>
        compute(
          lastOp[branch],
          [...labelStack],
          JSON.parse(JSON.stringify(startupCost))
        )
      );
    }
  };

  compute(controlGraph, initialStack);
  return externalLabelsCosts;
};

module.exports = computeCosts;
