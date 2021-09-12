const checkMatchingLabels = (thread, labels = []) => {
  thread.forEach((op) => {
    if (op.type === "EMITLABEL") {
      const {
        data: { type, short: shortLabel },
      } = op;
      if (type === "start") labels.push(shortLabel);

      if (type === "end") {
        const labelIndex = labels.findIndex(
          (startLabel) => startLabel === shortLabel
        );
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
};

const checkLabels = (execTree, fnStacks = [], labelStack = []) => {
  const coveredTree = [];
  for (const op of execTree) {
    if (op.type === "EMITLABEL") {
      const { short: label, type } = op.data;
      switch (type) {
        case "start":
          labelStack.push(label);
          break;
        case "end": {
          const startLabel = labelStack.pop();
          if (startLabel) assert.equal(label, startLabel);
          break;
        }
      }
    } else {
      if (
        labelStack.length > 0 ||
        op.type === "TAG" ||
        ALLOWED_UNCOVERED.includes(op.lineNumber)
      )
        coveredTree.push({ ...op, label: labelStack[labelStack.length - 1] });
      else throw new UncoveredError(op, coveredTree);

      if (op.type === "JUMP") {
        const { args } = op.data;
        if (args.includes("in") && !op.skipped) {
          fnStacks.push([...labelStack]);
          labelStack = [];
        } else if (args.includes("out")) {
          assert.notEqual(fnStacks.length, 0);
          labelStack = fnStacks.pop();
        }
      }

      if (op.type === "JUMPI") {
        const {
          true: trueBranch,
          false: falseBranch,
          ...jumpi
        } = coveredTree[coveredTree.length - 1];
        try {
          coveredTree[coveredTree.length - 1].true = checkLabels(
            trueBranch,
            [...fnStacks],
            [...labelStack]
          );
        } catch (e) {
          if (e instanceof UncoveredError) {
            throw new UncoveredError(e.op, [
              ...coveredTree.slice(0, -1),
              { ...jumpi, true: e.coveredTree },
            ]);
          }
        }

        try {
          coveredTree[coveredTree.length - 1].false = checkLabels(
            falseBranch,
            [...fnStacks],
            [...labelStack]
          );
        } catch (e) {
          if (e instanceof UncoveredError) {
            throw new UncoveredError(e.op, [
              ...coveredTree.slice(0, -1),
              { ...jumpi, false: e.coveredTree },
            ]);
          }
        }
      }
    }
  }

  return coveredTree;
};
