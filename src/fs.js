const fs = require("fs/promises");
const path = require("path");

const exists = async (path) => {
  try {
    return await fs.stat(path);
  } catch (err) {
    if (!err.message.includes("ENOENT")) {
      throw err;
    }
    return false;
  }
};

const existsFile = async (path) => {
  const stats = await exists(path);
  return stats && stats.isFile();
};

const existsDir = async (path) => {
  const stats = await exists(path);
  return stats && stats.isDirectory();
};

const readdir = async (
  dir,
  opts = { recursive: true, withFileTypes: true }
) => {
  const { recursive, ...rest } = opts;
  if (!recursive) {
    return fs.readdir(dir, rest);
  }

  const entries = await fs.readdir(dir, rest);
  return Promise.all(
    entries.map(async (single) => {
      const fullPath = path.join(dir, single.name);
      const entries = [{ path: fullPath, stats: single }];
      if (single.isDirectory()) {
        const subDirEntries = await readdir(fullPath);
        entries.push(...subDirEntries);
      }

      return entries;
    }, [])
  ).then((entries) => entries.flat());
};

const execFile = async (...args) => {
  const { promisify } = require("util");
  const { execFile: _execFile } = require("child_process");
  const promisified = promisify(_execFile);
  return await promisified(...args);
};

module.exports = { ...fs, exists, existsFile, existsDir, readdir, execFile };
