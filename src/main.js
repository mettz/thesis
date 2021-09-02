const path = require("path");
const fs = require("./lib/fs");
const utils = require("./lib/utils");
const solidity = require("./lib/solidity");
const constants = require("./lib/constants");

const main = async (args) => {
  let sources;
  if (args.example) {
    sources = await utils.findSource(args.example);
  } else if (args.examples) {
    sources = await utils.findSources(args.examples);
  } else {
    console.error(`You should provide at least one example.`);
    process.exit(1);
  }

  console.log("Compiling...");
  const results = await solidity.compileAndFormat(sources, args.exclude);
  utils.outputStandardDescriptors(results, {
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
  }

  console.log("All sources compiled successfully!");
};

module.exports = main;
