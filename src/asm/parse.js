const { nanoid } = require("nanoid");
const Section = require("./section");

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

const parse = (text) => {
  return text.split(/sub_\d+:\sassembly \{/).map((section, i) => {
    let lineNumber = 1;
    const name = i === 0 ? "creation" : i === 1 ? "deployed" : `section${i}`;
    const code = section
      .split("\n")
      .map((line) => line.trim())
      .filter((line) => line && line !== "}" && !line.includes("{"))
      .map((line) => {
        const gasUsed = line.match(/\(gas: (\d+)\)/);
        const gas = gasUsed && Number(gasUsed[1]);
        line = gasUsed ? line.substring(0, gasUsed.index).trim() : line;
        const result = { id: nanoid(16), line, gas, ...parseLine(line) };
        if (result.type !== "EMITLABEL")
          return { lineNumber: lineNumber++, ...result };
        else return result;
      });
    return new Section(name, code);
  });
};

module.exports = parse;
