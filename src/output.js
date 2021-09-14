const colors = require("colors");
const path = require("path");
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
      console.log(colors.bold.yellow(`${src.name}`));
    }

    if (printStdout) {
      console.log(colors.italic.cyan(` STDOUT`));
      process.stdout.write(
        src.stdout
          .split("\n")
          .map((l) => colors.bold.cyan("  │ ") + l)
          .join("\n")
      );
      console.log();
      console.log(colors.bold.cyan("  └──\n"));
    }

    if (printStderr) {
      console.log(colors.italic.red(` STDERR`));
      process.stdout.write(
        src.stderr
          .split("\n")
          .map((l) => colors.bold.red("  │ ") + l)
          .join("\n")
      );
      console.log();
      console.log(colors.bold.red("  └──\n"));
    }
  });
};

const controlGraph = async (graph, opts = { file: null, costs: null }) => {
  const { file, costs } = opts;
  const _controlGraph = (graph, prefix = "") => {
    return graph.reduce((output, node) => {
      output += `${prefix}${node.lineNumber ? node.lineNumber + ": " : ""}${
        node.line
      }`;
      if (node.type === "EMITLABEL" && costs) {
        const { short: label, type } = node.data;
        if (type === "start") {
          output += ` (cost: ${costs.internal[`${label}-${node.id}`].cost})`;
        } else if (type === "external") {
          output += ` (cost: ${costs.external[label].cost})`;
        }
      }
      output += "\n";

      if (node.false) {
        output += `${prefix}  False Branch\n`;
        output += _controlGraph(node.false, prefix + "    ");
      }

      if (node.true) {
        output += `${prefix}  True Branch\n`;
        output += _controlGraph(node.true, prefix + "    ");
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
    assemblies
      .filter((asm) => asm.path.startsWith(dir))
      .forEach((asm) => {
        asm.sections.forEach((section) => {
          const costs = section.costs();
          Object.entries(costs.external).forEach(([label, { cost }]) => {
            const labelComment = `/* ${label} */`;
            const commentIndex = instrumented.indexOf(labelComment);
            if (commentIndex > -1 && instrumented[commentIndex - 1] !== ";") {
              instrumented = instrumented.replace(
                labelComment,
                `__costAcc = __costAcc + ${cost};${labelComment}`
              );
            }
          });
        });
      });

    await fs.writeFile(fullPath, instrumented);
    await fs.mkdir(constants.INSTRUMENTED_DIR, { recursive: true });
    await fs.copyFile(fullPath, path.join(constants.INSTRUMENTED_DIR, base));
  });
};

module.exports = { stdoutAndStderr, controlGraph, costs, instrumented };
