const assert = require("assert");

const createControlGraph = (ops, cursor = 0, tagStack = [], visited = []) => {
  const thread = [];
  while (
    cursor < ops.length &&
    !visited.find((op) => op.id === ops[cursor].id)
  ) {
    thread.push({ ...ops[cursor], tagStack: [...tagStack] });
    ops[cursor].visited = true;
    visited.push(ops[cursor]);
    if (ops[cursor].type === "PUSH" && ops[cursor].data.args[0] === "[tag]") {
      tagStack.push(`tag_${ops[cursor].data.args[1]}`);
    } else if (ops[cursor].type === "JUMP") {
      const {
        data: { args: jumpArgs },
      } = ops[cursor];

      while (tagStack.length > 0) {
        const lastTagName = tagStack.pop();
        const tag = ops.find(
          (op) => op.type === "TAG" && op.data.name === lastTagName
        );
        assert(tag, "JUMP tag not found");

        if (
          !jumpArgs.includes("in") ||
          !visited.find((op) => op.id === tag.id)
        ) {
          thread[thread.length - 1].tag = lastTagName;
          if (cursor + 1 < ops.length && ops[cursor + 1].type === "EMITLABEL") {
            // We have to add the label that follows jump, if there is one
            thread.push({ ...ops[cursor + 1], tagStack: [...tagStack] });
          }
          cursor = ops.findIndex((op) => op.id === tag.id);
          assert.notEqual(cursor, -1);
          break;
        } else {
          // This tag has been already visited, so its jump in is useless
          // but we have to inform checkLabels of this
          thread[thread.length - 1].skipped = true;
        }

        cursor = null;
      }

      if (tagStack.length > 0 || cursor) continue;
      else break;
    } else if (ops[cursor].type === "JUMPI") {
      const savedTagStack = [...tagStack];
      const lastTag = tagStack.pop();
      const tagIndex = ops.findIndex(
        (op) => op.type === "TAG" && op.data.name === lastTag
      );
      if (tagIndex === -1) throw new Error("JUMPI tag not found");
      const trueBranch = createControlGraph(
        ops,
        tagIndex,
        [...tagStack],
        JSON.parse(JSON.stringify(visited))
      );
      const falseBranch = createControlGraph(
        ops,
        cursor + 1,
        [...tagStack],
        JSON.parse(JSON.stringify(visited))
      );
      thread[thread.length - 1].true = trueBranch;
      thread[thread.length - 1].false = falseBranch;
      thread[thread.length - 1].tagStack = savedTagStack;
      break;
    } else if (
      ops[cursor].type === "RETURN" ||
      ops[cursor].type === "REVERT" ||
      ops[cursor].type === "SELFDESTRUCT" ||
      ops[cursor].type === "STOP"
    ) {
      // There may be some labels after this operation that we need to add to this thread
      while (cursor < ops.length && ops[cursor].type !== "TAG") {
        if (
          ops[cursor].type === "EMITLABEL" &&
          ops[cursor].data.type === "end"
        ) {
          thread.push({ ...ops[cursor], tagStack: [...tagStack] });
        }

        cursor++;
      }
      return thread;
    }

    cursor++;
  }

  return thread;
};

module.exports = (ops) => createControlGraph(ops, 0, [], []);
