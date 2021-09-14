const path = require("path");

exports.SOLC_BIN = path.resolve(
  process.cwd(),
  "../solidity/cmake-build-release/solc/solc"
);
exports.SOLC_ARGS = [
  "--gas",
  "--evm-version",
  "istanbul",
  "--lb",
  "--instrumented",
  "--ir",
  "--ir-optimized",
  "--experimental-via-ir",
  "--asm-costs",
  "--bin",
  "--bin-runtime",
  "--overwrite",
  "--optimize",
  "-o",
];

exports.ARTIFACTS_DIR = path.join(process.cwd(), "build");
exports.TRUFFLE_DIR = path.join(this.ARTIFACTS_DIR, "truffle");
exports.EXAMPLES_DIR = path.join(process.cwd(), "examples");
exports.INSTRUMENTED_DIR = path.join(this.EXAMPLES_DIR, "instrumented");
