const fs = require('fs');
const { EVM } = require("evm");
const evm = new EVM('60806040523415600f5760006000fd5b604d80601e608039806080f350fe60806040526004361015156047576000803560e01c636d4ce63c141560455734156027578081fd5b80600319360112156036578081fd5b60058155600560805260206080f35b505b60006000fd');

fs.writeFileSync('SimpleStorage.evm.from-bytecode', evm.getOpcodes().reduce((output, opcodeData) => {
  output += opcodeData.name;
  if (opcodeData.name.startsWith('PUSH')) {
    output += ' ' + opcodeData.pushData.toString('hex');
  }
  output += '\n';
  return output
}, ''));