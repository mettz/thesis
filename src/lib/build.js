const fs = require("fs/promises");
const path = require("path");
const execFileAsync = require("util").promisify(
  require("child_process").execFile
);
const computeCosts = require("./compute-costs");

const SOLC_BIN = path.resolve(
  process.cwd(),
  "../solidity/cmake-build-debug/solc/solc"
);
const SOLC_ARGS = [
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
const OUT_DIR = "out";
const EXAMPLES_DIR = path.join(process.cwd(), "examples");

const main = async () => {
  const example = process.argv[2];
  const args = process.argv.slice(3).reduce(
    (args, str) => {
      if (str.match(/outputs/)) {
        args.outputs = str.split("=").pop();
      } else if (str.match(/logs/)) {
        args.enableLogging = true;
      } else if (str.match(/exclude/) || str.match(/e/)) {
        args.exclude = str.split("=").pop().split(",");
      } else {
        throw new Error(`Unexpected argument: ${str}`);
      }
      return args;
    },
    { enableLogging: false, outputs: "", exclude: [] }
  );

  if (!example && !(await existsAsync(EXAMPLES_DIR))) {
    console.log("USAGE: ./main.js <example> [args]");
    process.exit(0);
  }

  try {
    const sources = await getSources(example || EXAMPLES_DIR);
    console.log("Compiling...");
    const results = (
      await Promise.all(
        sources.map(async (s) => {
          const exampleName = path.basename(s, ".sol");
          if (args.exclude.includes(exampleName)) {
            console.log(`Ignoring ${exampleName} since has been excluded.`);
            return;
          }
          const complexity = path.basename(path.dirname(s));
          const outDir = path.join(OUT_DIR, complexity, exampleName);
          try {
            const io = await execFileAsync(SOLC_BIN, [...SOLC_ARGS, outDir, s]);
            return {
              example: outDir.replace("out/", ""),
              status: "success",
              io,
            };
          } catch (e) {
            const { stdout, stderr, ...error } = e;
            return {
              example: outDir.replace("out/", ""),
              status: "failure",
              error,
              io: { stdout, stderr },
            };
          }
        })
      )
    ).filter(Boolean);

    await Promise.all(
      results.map(async (r) => {
        const metaDir = path.join("out", r.example, "meta");
        await fs.mkdir(metaDir, { recursive: true });
        return await Promise.all(
          Object.entries(r.io).map(
            async ([fd, content]) =>
              await fs.writeFile(
                path.join(metaDir, `${path.basename(r.example, ".sol")}.${fd}`),
                content
              )
          )
        );
      })
    );

    const failures = results.filter((r) => r.status === "failure");
    if (failures.length === 0) {
      console.log("All sources compiled successfully!");
      await Promise.all(
        results.map(async (r) => {
          await computeCosts(`out/${r.example}`, args);
        })
      );
    } else {
      console.log(
        `Compilation results: ${
          results.length - failures.length
        } sources compiled successfully, ${failures.length} source(s) not.` +
          "\n" +
          `Failed sources:\n` +
          failures.map((f) => `- ${f.example}`).join("\n")
      );
      process.exit(1);
    }
  } catch (e) {
    console.error(e.message);
    process.exit(1);
  }
};

main();
