const parseAsm = require("./parseAsm");
const controlGraphUtils = require("./controlGraph");

const reachable = (code) => {
  let isReachable = true;
  return code.filter((op, index) => {
    if (op.type === "EMITLABEL") return true; // Labels are comments, so they're always reachable

    if (["RETURN", "REVERT", "SELFDESTRUCT"].includes(op.type)) {
      isReachable = false;
      return true;
    }

    if (op.type === "JUMP") {
      const isJumpReachable = isReachable;
      // Everything after jump is unreachable (unless there is a tag but now we don't know that)
      isReachable = false;
      return isJumpReachable;
    }

    if (op.type === "TAG") {
      isReachable = true;
      if (index === code.length - 1)
        // Last tag is always unreachable
        return false;
    }

    return isReachable;
  });
};

module.exports = {
  parseAsm,
  reachable,
  controlGraph: controlGraphUtils,
};
