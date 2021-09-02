const print = (tree, labelCosts, prefix) => {
  return tree.reduce((str, node) => {
    str += `${prefix}${node.lineNumber ? node.lineNumber + ": " : ""}${
      node.line
    } ${node.label || ""}`;
    if (node.type === "EMITLABEL" && node.cost != null) {
      str += `(cost: ${node.cost})`;
    }
    str += "\n";

    if (node.false) {
      str += `${prefix}  False Branch\n`;
      str += print(node.false, labelCosts, prefix + "    ");
    }

    if (node.true) {
      str += `${prefix}  True Branch\n`;
      str += print(node.true, labelCosts, prefix + "    ");
    }

    return str;
  }, "");
};

module.exports = (graph) => print(graph, {}, "");
