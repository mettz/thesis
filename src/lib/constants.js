const path = require("path");

exports.SOLC_BIN = path.resolve(
  process.cwd(),
  "../solidity/cmake-build-debug/solc/solc"
);
exports.SOLC_ARGS = [
  "--lb",
  "--ir",
  "--ir-optimized",
  "--experimental-via-ir",
  "--asm",
  "--bin",
  "--overwrite",
  "--optimize",
  "-o",
];

exports.ARTIFACTS_DIR = path.join(process.cwd(), "artifacts");
exports.EXAMPLES_DIR = path.join(process.cwd(), "examples");
