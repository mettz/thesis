const path = require("path");
const fs = require("./fs");
const constants = require("./constants");

const hasSolidityExt = (filePath) => path.extname(filePath) === ".sol";
const hasEvmExt = (filePath) => path.extname(filePath) === ".evm";
const hasBinExt = (filePath) => path.extname(filePath) === ".bin";

const findSource = async (nameOrPath) => {
  let srcPath = hasSolidityExt(nameOrPath) ? nameOrPath : `${nameOrPath}.sol`;

  if (await fs.existsFile(srcPath)) {
    // Case #3 of findSources: path to sol file
    console.log(`Found Solidity file at ${srcPath}`);
  } else {
    const exampleFolderEntries = await fs.readdir(constants.EXAMPLES_DIR);
    const targetPath = exampleFolderEntries
      .filter((entry) => entry.path.includes(srcPath) && entry.stats.isFile())
      .map((entry) => entry.path)[0];
    if (targetPath) {
      // Case #4 of findSources: name of sol file in examples
      console.log(`Found Solidity file at ${targetPath}`);
      srcPath = targetPath;
    } else {
      console.log(`Unable to locate source of ${nameOrPath}`);
      srcPath = null;
    }
  }

  if (srcPath) {
    const name = path.basename(srcPath, ".sol");
    return { [name]: srcPath };
  }
};

const findSources = async (nameOrPath) => {
  // `nameOrPath` could be:
  // 1. name of top-level directory inside examples folder
  // 2. standard directory path
  // 3. name of Solidity file inside examples folder
  // 4. standard Solidity file path
  const locations = [
    path.resolve(process.cwd(), nameOrPath),
    path.join(constants.EXAMPLES_DIR, nameOrPath),
  ];
  const location = (
    await Promise.all(
      locations.map(async (path) => (await fs.existsDir(path)) && path)
    )
  ).filter(Boolean)[0];

  if (location) {
    console.log(`Retrieving all sources inside ${location} directory...`);
    const entries = await fs.readdir(location);
    const paths = entries
      .filter(
        (e) =>
          e.stats.isFile() &&
          hasSolidityExt(e.path) &&
          path.dirname(e.path) !== constants.INSTRUMENTED_DIR
      )
      .map((e) => e.path);
    console.log(`Found ${paths.length} sources:`);
    paths.forEach((p, i) => console.log(`${i + 1}. ${p}`));
    return paths.reduce((sources, p) => {
      const name = path.basename(p, ".sol");
      sources[name] = p;
      return sources;
    }, {});
  }
};

module.exports = {
  findSource,
  findSources,
  hasSolidityExt,
  hasEvmExt,
  hasBinExt,
};
