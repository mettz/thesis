const path = require("path");
const prettier = require("prettier");
const fs = require("./fs");
const constants = require("./constants");

const compileSource = async (srcPath, outputDir) => {
  try {
    const { stdout, stderr } = await fs.execFile(constants.SOLC_BIN, [
      ...constants.SOLC_ARGS,
      outputDir,
      srcPath,
    ]);
    const artifacts = await fs
      .readdir(outputDir)
      .then((entries) => entries.map((e) => e.path));
    return {
      status: "success",
      name: path.basename(srcPath, ".sol"),
      artifacts,
      stdout,
      stderr,
    };
  } catch (e) {
    const { stdout, stderr, ...error } = e;
    return {
      status: "failure",
      name: path.basename(srcPath, ".sol"),
      error,
      stdout,
      stderr,
    };
  }
};

const compileAndFormat = async (sources, excluded) => {
  const toProcess = Object.entries(sources).filter(
    (s) => !excluded.includes(s[0])
  );
  return await Promise.all(
    toProcess.map(async ([name, srcPath]) => {
      const complexity = path.basename(path.dirname(srcPath));
      const outputDir = path.join(constants.ARTIFACTS_DIR, complexity, name);
      const result = await compileSource(srcPath, outputDir);
      if (result.status === "success") {
        const solWithLabels = result.artifacts.find((a) =>
          a.includes("_label")
        );
        const content = await fs.readFile(solWithLabels, { encoding: "utf8" });
        const formatted = prettier.format(content, { filepath: solWithLabels });
        await fs.writeFile(solWithLabels, formatted);
      }
      return result;
    })
  );
};

module.exports = { compileAndFormat };
