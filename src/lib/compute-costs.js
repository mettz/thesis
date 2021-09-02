const fs = require("fs").promises;
const path = require("path");
const assert = require("assert");
const { nanoid } = require("nanoid");
const utils = require("./asm");

const COSTS_OUTPUT_TEMPLATE =
  "--------------------------------\n" +
  "  LABEL COSTS\n" +
  "--------------------------------\n" +
  "{costs}\n" +
  "\n" +
  "--------------------------------\n" +
  "  EXECUTION\n" +
  "--------------------------------\n" +
  "{execution}\n";

const main = async (
  contractDir,
  args = { enableLogging: false, outputs: "" }
) => {
  const files = await fs.readdir(contractDir).then((files) => {
    return files
      .filter((file) => path.extname(file) === ".evm")
      .map((file) => path.join(contractDir, file));
  });

  await Promise.all(
    files.map(async (filePath) => {
      const asm = await fs
        .readFile(filePath)
        .then((content) => content.toString());
      if (!asm) return;
      utils.parseAsm(asm).forEach(async (code, index) => {
        const codeKind =
          index >= 2 ? index : index === 0 ? "creation" : "deployed";
        const outputPath = `${filePath.replace(
          ".evm",
          ""
        )}.${codeKind}${path.extname(filePath)}`;
        const outDir = path.dirname(outputPath);
        const outFile = path.basename(outputPath);

        if (args.outputs.includes("i")) {
          // Output instrumented code
          await fs.writeFile(
            outputPath,
            code
              .map(
                (op) => `${op.lineNumber ? op.lineNumber + ": " : ""}${op.line}`
              )
              .join("\n")
          );
        }

        const reachableCode = utils.reachable(code);
        if (args.outputs.includes("r")) {
          // Output reachable code
          await fs.writeFile(
            `${outDir}/reachable.${outFile}`,
            code
              .map((op) => {
                const reachable = reachableCode.find(
                  (reachable) => reachable.id === op.id
                );
                return `${op.lineNumber ? op.lineNumber + ": " : ""}${
                  reachable ? reachable.line : ""
                }`;
              })
              .join("\n")
          );
        }

        const controlGraph = utils.controlGraph.create(reachableCode);
        const result = utils.controlGraph.verify(controlGraph);
        const unmatchedLabels = checkMatchingLabels(controlGraph);
        if (unmatchedLabels.length > 0)
          await fs.writeFile(
            `${outDir}/unmatchedLabels.${outFile}`,
            unmatchedLabels.join("\n")
          );
        const missed = reachableCode.filter(
          (op) => !op.visited && op.type !== "EMITLABEL"
        );
        if (missed.length > 0 && args.outputs.includes("m")) {
          // Output missed operations
          await fs.writeFile(
            `${outDir}/missed.${outFile}`,
            missed.map((op) => `${JSON.stringify(op, null, 2)}`).join("\n")
          );
        }

        if (args.outputs.includes("e")) {
          // Output execution tree
          await fs.writeFile(
            `${outDir}/execution.${outFile}`,
            treeString(controlGraph)
          );
        }

        try {
          checkLabels(controlGraph);
        } catch (e) {
          console.log(`${path.basename(outDir)}: ${e.message}`);
          if (e instanceof UncoveredError) {
            const dir = `uncovered/${path.basename(outDir)}`;
            await fs.mkdir(dir, { recursive: true });
            await fs.writeFile(`${dir}/${outFile}`, treeString(e.coveredTree));
            return;
          }
        }
        // try {
        if (args.outputs.includes("c")) {
          const { logs, costs } = computeInternalLabelsCosts(
            controlGraph,
            args.enableLogging
          );
          const externalLabelsCosts = computeExternalLabelsCosts(
            JSON.parse(JSON.stringify(controlGraph)),
            costs
          );
          console.log(externalLabelsCosts);
          if (args.enableLogging) {
            await fs.writeFile(`${outDir}/logs.${outFile}`, logs);
          }
          const costDir = path.join(
            "costs",
            `${outDir.slice(outDir.indexOf("/") + 1)}`
          );
          await fs.mkdir(costDir, { recursive: true });
          const costsFmt = Object.entries(costs)
            .map(([label, cost]) => `${label} = ${cost}`)
            .join("\n");
          // Output costs
          await fs.writeFile(
            `${costDir}/${outFile}`,
            COSTS_OUTPUT_TEMPLATE.replace("{costs}", costsFmt).replace(
              "{execution}",
              treeString(controlGraph)
            )
          );
        }
        // } catch (e) {
        //   if (e instanceof WithLogsError) {
        //     const dir = `assertionError/${path.basename(outDir)}`;
        //     await fs.mkdir(dir, { recursive: true });
        //     await fs.writeFile(`${dir}/${outFile}`, e.logs);
        //   } else {
        //     throw e;
        //   }
        // }
      });
    })
  );
};

module.exports = main;

class UncoveredError extends Error {
  constructor(op, coveredTree) {
    super(`${op.line} at line ${op.lineNumber} is not covered by any label`);
    this.name = "UncoveredError";
    this.op = op;
    this.coveredTree = coveredTree;
  }
}

class LabelNotFoundError extends Error {
  constructor(label) {
    super(`${label} has no matching label`);
    this.label = label;
  }
}

class WithLogsError extends Error {
  constructor(logs) {
    super("");
    this.logs = logs;
  }
}

const computeInternalLabelsCosts = (thread, enableLogging = false) => {
  return computeCostsInner(thread, enableLogging);

  function computeCostsInner(
    thread,
    enableLogging,
    labelStack = [],
    allLabels = [],
    skipStack = [],
    prefix = "",
    logs = ""
  ) {
    for (const op of thread) {
      if (op.type === "EMITLABEL") {
        const {
          id,
          data: { short: label, type },
        } = op;
        if (enableLogging) logs += `${prefix}${op.line}\n`;
        if (type === "start") {
          const duplicate = allLabels.find((label) => label.id === id);
          if (duplicate) {
            op.cost = duplicate.cost;
            skipStack.unshift(label);
          } else {
            op.cost = 0;
            allLabels.push(op);
            labelStack.unshift({ id, label });
          }
          if (enableLogging) logs += logStack(labelStack, allLabels, prefix);
        } else if (type === "end") {
          if (skipStack.length > 0) {
            skipStack.pop();
          } else {
            let removed = labelStack.shift();
            while (!removed || removed.label !== label) {
              removed = labelStack.shift();
            }

            if (!removed) {
              throw new LabelNotFoundError(label);
            }
          }
          if (enableLogging) logs += logStack(labelStack, allLabels, prefix);
        }
      } else if (op.type !== "TAG") {
        if (skipStack.length === 0) {
          assert(
            labelStack.length > 0,
            `Operation not covered by any label: ${JSON.stringify(op, null, 2)}`
          );
          const { id, label } = labelStack[0];
          const labelOp = allLabels.find((op) => op.id === id);
          labelOp.cost++;
          if (enableLogging) logs += logOp(op, label, labelOp.cost, prefix);
        } else {
          if (enableLogging)
            logs += `${prefix}${op.lineNumber}: ${op.line} skipped\n`;
        }
      }
    }

    const lastOp = thread[thread.length - 1];
    if (lastOp.type === "JUMPI") {
      prefix += "  ";
      ["true", "false"].forEach((branch) => {
        if (enableLogging)
          logs += logBranch(branch, labelStack, allLabels, prefix);

        // try {
        const branchLogs = computeCostsInner(
          lastOp[branch],
          enableLogging,
          JSON.parse(JSON.stringify(labelStack)),
          allLabels,
          JSON.parse(JSON.stringify(skipStack)),
          prefix + "  "
        );
        if (enableLogging && branchLogs) logs += branchLogs;
        // } catch (e) {
        //   if (e instanceof WithLogsError) {
        //     throw new WithLogsError(logs + e.logs);
        //   }
        // }
      });
    }

    return {
      logs: enableLogging ? logs : undefined,
      costs: allLabels.reduce((costs, op) => {
        costs[op.data.short] = op.cost;
        return costs;
      }, {}),
    };

    function logStack(labelStack, allLabels, prefix) {
      const stackStr = labelStack
        .map(({ id, label }) => {
          const op = allLabels.find((op) => op.id === id);
          return `${label.slice(0, label.indexOf("."))}(${op.cost})`;
        })
        .join(",");
      return `${prefix}labelStack = [${stackStr}]\n`;
    }
    function logOp(op, label, cost, prefix) {
      return `${prefix}${op.lineNumber}: ${op.line} ${label}.cost = ${cost}\n`;
    }
    function logBranch(branch, labelStack, allLabels, prefix) {
      return (
        `${prefix}${branch[0].toUpperCase()}${branch.slice(1)} Branch\n` +
        logStack(labelStack, allLabels, prefix + "  ")
      );
    }
  }
};
