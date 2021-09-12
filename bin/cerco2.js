#!/usr/bin/env node
const colors = require("colors");
const { program, Option } = require("commander");
const commands = require("../src/index.js");

program
  .command("build")
  .description(
    "compiles contracts and generates different artifacts based on options"
  )
  .option(
    "-e,--example <path>",
    `build the Solidity example located at ${colors.bold("path")}`
  )
  .option(
    "-a,--examples [folder]",
    `build all the examples inside ${colors.bold(
      "folder"
    )} (default: ./examples)`
  )
  .option(
    "-x,--exclude <examples...>",
    "examples that should be ignored during compilation",
    []
  )
  .option(
    "--stdout [examples...]",
    `print stdout of ${colors.bold(
      "examples"
    )} after compilation (if passed without examples defaults to all of them)`
  )
  .option(
    "--stderr [examples...]",
    `print stderr of ${colors.bold(
      "examples"
    )} after compilation (if passed without examples defaults to all of them)`
  )
  .addOption(
    new Option(
      "-g,--graph [section]",
      `outputs assembly control graph of ${colors.bold("section")} with costs`
    )
      .choices(["creation", "deployed", "all"])
      .default("all")
  )
  .option("--no-graph", "does not output control graph")
  .option("-c,--costs", "outputs cost of each label formatted as JSON")
  .action(commands.build);

program
  .command("truffle")
  .description("compiles contracts and outputs Truffle compatible artifacts")
  .action(commands.truffle);

program.parse();
