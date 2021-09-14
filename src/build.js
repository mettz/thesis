const path = require("path");
const fs = require("./fs");
const utils = require("./utils");
const solidity = require("./solidity");
const asmUtils = require("./asm");
const output = require("./output");
const constants = require("./constants");

const build = async (args) => {
  let sources;
  if (args.example) {
    sources = await utils.findSource(args.example);
  } else if (args.examples) {
    sources = await utils.findSources(
      typeof args.examples === "string" ? args.examples : constants.EXAMPLES_DIR
    );
  } else {
    console.error(`You should provide at least one example.`);
    process.exit(1);
  }

  console.log("Compiling...");
  const results = await solidity.compileAndFormat(sources, args.exclude);
  output.stdoutAndStderr(results, {
    stdout: args.stdout,
    stderr: args.stderr,
  });

  const failures = results.filter((r) => r.status === "failure");
  if (failures.length > 0) {
    console.log(
      `Compilation results: ${
        results.length - failures.length
      } sources compiled successfully, ${failures.length} source(s) not.` +
        "\n" +
        `Failed examples:\n` +
        failures.map(({ name }) => `- ${name}`).join("\n")
    );
    process.exit(1);
  }

  console.log("All sources compiled successfully!");
  const asmFiles = await Promise.all(
    results
      .map(({ artifacts }) => artifacts)
      .flatMap((paths) =>
        paths
          .filter((path) => utils.hasEvmExt(path))
          .map(async (path) => {
            const code = await fs.readFile(path, { encoding: "utf8" });
            return { path, code };
          })
      )
  );

  const assemblies = asmFiles
    .filter((asm) => asm.code)
    .map((asm) => {
      const sections = asmUtils.parse(asm.code);
      return { ...asm, sections };
    });

  // await output.instrumented(sources, assemblies);

  assemblies.forEach(async (asm) => {
    const baseFilename = path.basename(asm.path, ".evm");
    const folder = path.dirname(asm.path);

    if (args.graph) {
      const targetSections =
        args.graph === "all"
          ? asm.sections
          : asm.sections.filter((s) => s.name === args.graph);

      await Promise.all(
        targetSections.map(async (section) => {
          if (section.name !== "deployed") return;
          const file = path.join(
            folder,
            `${baseFilename}.${section.name}.graph`
          );
          const costs = section.costs();
          await output.controlGraph(section.controlGraph(), {
            file,
            costs,
          });
        })
      );
    }

    // if (args.costs) {
    //   await Promise.all(
    //     asm.sections.map(async (section) => {
    //       if (section.name !== "deployed") return;
    //       const file = path.join(
    //         folder,
    //         `${baseFilename}.${section.name}.costs.json`
    //       );
    //       const costs = section.costs();
    //       await output.costs(costs, { file });
    //     })
    //   );
    // }
  });
};

module.exports = build;
