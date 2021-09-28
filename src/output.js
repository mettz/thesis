const path = require("path");
const prettier = require("prettier");
const fs = require("./fs");
const constants = require("./constants");

const stdoutAndStderr = (
  sources,
  toPrint = { stdout: false, stderr: false }
) => {
  const hasToBePrinted = (src, descriptor) => {
    if (!src[descriptor]) return false;
    return Array.isArray(toPrint)
      ? toPrint[descriptor].includes(src.name)
      : toPrint[descriptor];
  };

  sources.forEach((src) => {
    const printStdout = hasToBePrinted(src, "stdout");
    const printStderr = hasToBePrinted(src, "stderr");

    if (printStdout || printStderr) {
      console.log(src.name);
    }

    if (printStdout) {
      console.log(src.stdout);
    }

    if (printStderr) {
      console.log(src.stderr);
    }
  });
};

const controlGraph = async (graph, opts = { file: null, costs: null }) => {
  const { file, costs } = opts;
  const _controlGraph = (graph, prefix = "") => {
    return graph.reduce((output, node) => {
      output += prefix;
      if (node.type === "EMITLABEL") {
        output += `(${node.lineNumber})`;
      } else {
        output += `${node.lineNumber}`;
      }

      output += `: ${node.line}`;
      if (node.type === "EMITLABEL" && costs) {
        const { short: label, type } = node.data;
        output += ` (cost: ${costs[label].cost.value})`;
      } else {
        output += ` (gas: ${
          Array.isArray(node.gas) ? node.gas.join(" + ") : node.gas
        })`;
      }
      if (node.comment) {
        output += ` ${node.comment}`;
      }
      output += "\n";

      if (node.true) {
        output += `${prefix}  True Branch\n`;
        output += _controlGraph(node.true, prefix + "    ");
      }

      if (node.false) {
        output += `${prefix}  False Branch\n`;
        output += _controlGraph(node.false, prefix + "    ");
      }

      return output;
    }, "");
  };

  const output = _controlGraph(graph);
  if (file) {
    await fs.writeFile(file, output);
  } else {
    console.log(output);
  }
};

const costs = async (labelCosts, opts = { file: null }) => {
  const { file } = opts;
  const output = JSON.stringify(labelCosts, null, 2);
  if (file) {
    await fs.writeFile(file, output);
  } else {
    console.log(output);
  }
};

const INSTRUMENTATION_FUNCS = {
  memaccess: [
    "def memaccess(offset, length):",
    "  # access with zero length will not extend the memory",
    "  if length == 0:",
    "    return",
    "",
    "  newMemorySize = words(offset + length)",
    "  if newMemorySize < currentMemorySize:",
    "    return; # do nothing if we have enough memory",
    "",
    `  cost = newMemorySize * ${constants.gasPrices.memory} + `,
    `    newMemorySize * newMemorySize / ${constants.gasPrices.quadCoeffDiv}`,
    "  if cost > currentHighestMemCost:",
    "    # consume an amount of gas equal to cost - currentHighestMemCost",
    "    currentHighestMemCost = cost",
    "",
    "  currentMemorySize = newMemorySize",
  ],
  sizeof: ["def sizeof(var):", "    return var / 32  # 32 byte == 1 EVM word"],
  sstore: [
    "def sstore(slot, data):",
    "  # Fail if not enough gas is left",
    `  if gasLeft <= ${constants.gasPrices.sstoreSentryGasEIP2200}:`,
    "    throw new Error.OUT_OF_GAS",
    "",
    "  # Noop",
    "  if current_storage[slot] == data:",
    `    # consume an amount of gas equal to ${constants.gasPrices.sstoreNoopGasEIP2200}`,
    "    return",
    "",
    "  if original_storage[slot] == current_storage[slot]:",
    "    # Create slot",
    "    if original_storage[slot] == 0:",
    `      # consumes an amount of gas equal to ${constants.gasPrices.sstoreInitGasEIP2200}`,
    "      return",
    "    else:",
    `      # consumes an amount of gas equal to ${constants.gasPrices.sstoreCleanGasEIP2200}`,
    "",
    "      # Delete slot",
    "      if data === 0:",
    `        # add an amount of gas equal to ${constants.gasPrices.sstoreClearRefundEIP2200} to refund`,
    "",
    "    return",
    "",
    `  # consumes an amount of gas equal to ${constants.gasPrices.sstoreDirtyGasEIP2200}`,
    "",
    "  if original_storage[slot] != 0:",
    "    if current_storage[slot] == 0:",
    `      # remove an amount of gas equal to ${constants.gasPrices.sstoreClearRefundEIP2200} to refund`,
    "    else if data == 0:",
    `      # add an amount of gas equal to ${constants.gasPrices.sstoreClearRefundEIP2200} to refund`,
    "",
    "    return",
    "",
    "  if original_storage[slot] == data:",
    "    if original_storage[slot] == 0:",
    `      # add an amount of gas equal to ${constants.gasPrices.sstoreInitRefundEIP2200} to refund`,
    "    else:",
    `      # add an amount of gas equal to ${constants.gasPrices.sstoreCleanRefundEIP2200} to refund`,
  ],
  exists: [
    "def exists(account):",
    "    # Checks if `account` exists. It does not have an associated cost",
    "    # but its response influence the cost of CALL",
  ],
};

const instrumented = async (sources, assemblies) => {
  Object.values(sources).forEach(async (p) => {
    const base = `${path.basename(p).replace(".sol", "_instrumented.sol")}`;
    const dir = path.join(
      constants.ARTIFACTS_DIR,
      path.relative(constants.EXAMPLES_DIR, p).replace(".sol", "")
    );
    const fullPath = path.format({ base, dir });
    let instrumented = await fs.readFile(fullPath, {
      encoding: "utf8",
    });
    const funcToAdd = [];
    const instrument = (label, data) => {
      if (data.annotations.length > 0) {
        Object.keys(INSTRUMENTATION_FUNCS)
          .filter((name) => !funcToAdd.includes(name))
          .forEach((name) => {
            const hasFunc = data.annotations.find((ann) => ann.includes(name));
            if (hasFunc) {
              funcToAdd.push(name);
            }
          });
      }

      return instrumented.replace(
        label,
        `${label.replace(".incomplete", "")}\n__costAcc = __costAcc + ${
          data.value
        };${
          data.annotations.length > 0
            ? "/* + " + data.annotations.join(" + ") + " */"
            : ""
        }`
      );
    };
    await Promise.all(
      assemblies
        .filter((asm) => asm.path.startsWith(dir))
        .map(async (asm) => {
          await Promise.all(
            asm.sections.map(async (section) => {
              const costs = section.costs();
              Object.entries(costs).forEach(([label, { cost }]) => {
                if (cost.startup) {
                  const startupLabelComment = `/* ${label}.startup.incomplete */`;
                  if (instrumented.includes(startupLabelComment)) {
                    instrumented = instrument(
                      startupLabelComment,
                      cost.startup
                    );
                  } else {
                    cost.owned.value = cost.startup.value;
                    cost.owned.annotations = [
                      ...cost.owned.annotations,
                      ...cost.startup.annotations,
                    ];
                  }
                }

                const labelComment = `/* ${label}.incomplete */`;
                if (instrumented.includes(labelComment)) {
                  instrumented = instrument(labelComment, cost.owned);
                }
              });
            })
          );
        })
    );

    if (funcToAdd.length > 0) {
      instrumented += "\n\n\n/*\n * Additional functions definitions:\n*";
      instrumented +=
        "\n*  " +
        funcToAdd
          .map((fnName) => INSTRUMENTATION_FUNCS[fnName].join("\n*  "))
          .join("\n*\n*\n*  ");
      instrumented += "\n*\n*/";
    }

    const formatted = prettier.format(instrumented, { filepath: fullPath });
    await fs.writeFile(fullPath, formatted);
  });
};

module.exports = { stdoutAndStderr, controlGraph, costs, instrumented };
