const controlGraphUtils = require("./controlGraph");
const computeCosts = require("./costs");

class Section {
  constructor(example, name, code) {
    this.example = example;
    this.name = name;
    this.code = code;
  }

  length() {
    return this.code.length;
  }

  reachable() {
    if (!this._reachableCode) {
      let isReachable = true;
      this._reachableCode = this.code.filter((opcode, index) => {
        if (opcode.type === "EMITLABEL") return true; // Labels are comments, so they're always reachable

        if (["RETURN", "REVERT", "SELFDESTRUCT"].includes(opcode.type)) {
          isReachable = false;
          return true;
        }

        if (opcode.type === "JUMP") {
          const isJumpReachable = isReachable;
          // Everything after jump is unreachable (unless there is a tag, i.e. a JUMPDEST, but now we don't know that)
          isReachable = false;
          return isJumpReachable;
        }

        if (opcode.type === "TAG") {
          isReachable = true;
          if (index === this.code.length - 1)
            // Last tag is always unreachable
            return false;
        }

        return isReachable;
      });
    }

    return this._reachableCode;
  }

  controlGraph() {
    if (!this._controlGraph) {
      this._controlGraph = controlGraphUtils.create(this.reachable());
    }

    return this._controlGraph;
  }

  verifyControlGraph() {
    const graph = this.controlGraph();
    try {
      controlGraphUtils.verify(graph);
    } catch (e) {
      console.log(e.message);
    }
  }

  costs() {
    if (!this._costs) {
      this._costs = computeCosts(this.controlGraph());
    }
    return this._costs;
  }
}

module.exports = Section;
