const controlGraphUtils = require("./controlGraph");
const costsUtils = require("./costs");

class Section {
  constructor(name, code) {
    this.name = name;
    this.code = code;
  }

  reachable() {
    if (!this._reachableCode) {
      let isReachable = true;
      this._reachableCode = this.code.filter((op, index) => {
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

  costs(labelKind = "all") {
    switch (labelKind) {
      case "internal":
        return this._internalLabelCosts();
      case "external":
        return this._externalLabelCosts();
      case "all":
        return {
          internal: this._internalLabelCosts(),
          external: this._externalLabelCosts(),
        };
      default:
        throw new Error(
          `Unknown label kind: expected 'internal', 'external' or 'all' but found ${labelKind}`
        );
    }
  }

  _externalLabelCosts() {
    if (!this._externalCosts) {
      this._externalCosts = costsUtils.computeExternalLabelCosts(
        this.controlGraph(),
        this._internalLabelCosts()
      );
    }
    return this._externalCosts;
  }

  _internalLabelCosts() {
    if (!this.internalCosts) {
      this.internalCosts = costsUtils.computeInternalLabelCosts(
        this.controlGraph()
      );
    }
    return this.internalCosts;
  }
}

module.exports = Section;
