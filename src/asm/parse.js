const { nanoid } = require("nanoid");
const Section = require("./section");
const constants = require("../constants");

const parseLine = (line) => {
  if (line.includes("emit")) {
    // label
    const fullLabel = line.split(" ")[2];
    const lastDot = fullLabel.lastIndexOf(".");
    const shortLabel = lastDot !== -1 ? fullLabel.slice(0, lastDot) : fullLabel;
    const type = lastDot !== -1 ? fullLabel.slice(lastDot + 1) : "external";
    return {
      type: "EMITLABEL",
      data: { full: fullLabel, short: shortLabel, type },
    };
  } else if (line.startsWith("tag")) {
    // tag
    return {
      type: "TAG",
      data: { name: line.slice(0, -1) },
    };
  } else {
    const [type, ...args] = line
      .split(/\s/)
      .filter((word) => word !== "" && word !== "//");
    return {
      type: type.toUpperCase(),
      data: { args },
    };
  }
};

const split = (expression, operator) => {
  const result = [];
  let braces = 0;
  let currentChunk = "";
  for (let i = 0; i < expression.length; ++i) {
    const curCh = expression[i];
    if (curCh == "(") {
      braces++;
    } else if (curCh == ")") {
      braces--;
    }
    if (braces == 0 && operator == curCh) {
      result.push(currentChunk);
      currentChunk = "";
    } else currentChunk += curCh;
  }
  if (currentChunk != "") {
    result.push(currentChunk);
  }
  return result;
};

const isVariable = (arg) => arg.match(/^[a-z_][a-z0-9_]*$/i);
const isFunction = (arg) => arg.match(/^[a-z0-9_]+\(.*\)/i);

const computeGas = (opcode, solcComputed, comment) => {
  if (solcComputed !== Infinity && solcComputed > 0) {
    return solcComputed;
  }

  if (typeof constants.GAS_FORMULAE[opcode] === "number") {
    return constants.GAS_FORMULAE[opcode];
  }

  if (typeof constants.GAS_FORMULAE[opcode] === "function" && comment) {
    const args = split(comment.match(/\((.*)\)/)[1], ",")
      .reverse()
      .map((arg) => (arg.startsWith("var_") ? arg.replace("var_", "") : arg));
    const hasVarOrFuncs = args.find(
      (arg) => isVariable(arg) || isFunction(arg)
    );
    if (hasVarOrFuncs) {
      return constants.GAS_FORMULAE[opcode](...args);
    }
  } else if (
    opcode !== "MLOAD" &&
    opcode !== "EMITLABEL" &&
    opcode !== "KECCAK256" &&
    // This is not supported since it's too complex to handle anyway
    // (see Assembly::assemble or GasMeter::estimateMax)
    !opcode.includes("ASSIGNIMMUTABLE")
  ) {
    throw new Error(`${opcode} not convered with comment or gas formula`);
  }

  return 0;
};

const parseFromEvm = (example, text) => {
  return text.split(/sub_\d+:\sassembly \{/).map((section, i) => {
    let lineNumber = 1;
    const name = i === 0 ? "creation" : i === 1 ? "deployed" : `section${i}`;
    const code = section
      .split("\n")
      .map((line) => line.trim())
      .filter((line) => line && line !== "}" && !line.includes("{"))
      .map((line) => {
        const gasUsed = line.match(/\(gas: (\d+|infinite)\)/);
        const gasComputedBySolc =
          gasUsed &&
          Number(gasUsed[1] === "infinite" ? Infinity : Number(gasUsed[1]));
        line = gasUsed ? line.replace(gasUsed[0], "").trim() : line;
        const comment = line.match(/\/\* (.*) \*\//);
        line = comment ? line.replace(comment[0], "").trim() : line;
        const result = {
          id: nanoid(16),
          line,
          comment: comment && comment[0],
          ...parseLine(line),
        };
        result.gas =
          result.type === "TAG"
            ? 1
            : computeGas(result.type, gasComputedBySolc, comment && comment[1]);
        return {
          ...result,
          lineNumber: result.type !== "EMITLABEL" ? lineNumber++ : lineNumber,
        };
      });
    return new Section(example, name, code);
  });
};

module.exports = parseFromEvm;
