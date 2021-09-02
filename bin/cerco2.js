#!/usr/bin/env node
const colors = require("colors");
const { program, Option } = require("commander");
const main = require("../src/main.js");
const constants = require("../src/lib/constants");

program
  .option(
    "-e,--example <path>",
    `build the Solidity example located at ${colors.bold("path")}`
  )
  .option(
    "-a,--examples [folder]",
    `build all the examples inside ${colors.bold("folder")}`,
    constants.EXAMPLES_DIR
  )
  .option(
    "-x,--exclude <examples...>",
    "examples that should be ignored during compilation",
    []
  )
  .option(
    "--stdout <examples...>",
    `print stdout of ${colors.bold(
      "examples"
    )} after compilation (useful in case of failure)`,
    []
  )
  .option(
    "--stderr <examples...>",
    `print stderr of ${colors.bold(
      "examples"
    )} after compilation (useful in case of failure)`,
    []
  )
  .addOption(
    new Option(
      "-g,--graph [section]",
      `outputs assembly control graph of ${colors.bold("section")}`
    )
      .choices(["creation", "deployed", "all"])
      .default("all")
  );

program.parse(process.argv);

const args = program.opts();
if (Object.entries(args).length === 0) {
  program.outputHelp();
  process.exit(0);
}

main(args);
