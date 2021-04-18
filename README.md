# Thesis

This repo contains all work related to my undergraduate thesis.

## TODO

- [ ] Create solidity examples with their corresponding Yul compilation
  1. Example 1
  2. Example 2
  3. Example 3

# Examples

### Included features

- Functions:
  - Internal function calls
  - External function calls

### Features that should be included

- state variables
- structs, enums

### Features in doubt

- Functions:
  - Function modifiers
  - Overloading
  - `receive` and `fallback` functions
- Events
- Errors
- Inheritance and overriding
- Abstract contracts
- Interfaces
- Libraries
- Imports: I don't think these will affect the generated output, but it' s best to check. If not move to _not included_
- Others:
  - Returning Multiple Values
  - Creating contracts with `new`
  - try/catch
  - Error handling: Assert, Require, Revert and Exceptions
  - [ABI Encoding and Decoding Functions](https://docs.soliditylang.org/en/latest/units-and-global-variables.html#abi-encoding-and-decoding-functions)
  - [Mathematical and Cryptographic Functions](https://docs.soliditylang.org/en/latest/units-and-global-variables.html#mathematical-and-cryptographic-functions) (`addmod`, `mulmod` and `keccak256` excluded)
  - [Members of Address Types](https://docs.soliditylang.org/en/latest/units-and-global-variables.html#mathematical-and-cryptographic-functions) (need to check `transfer` and `send`)

### Excluded features

- Pragmas:
  - `pragma version`: assuming it is always set to the same value does not change compiler output
  - `pragma abicoder`: compiler versions greater than 0.8.0 default to `v2` so it should not matter
  - `pragma experimental`: the only allowed value is `SMTChecker` but can only be enabled while building compiler, so it is already enabled/disabled by default.
- Functions:
  - Named Calls and Anonymous Function Parameters
  - Omitted Function Parameter Names
- "Advanced features":
  - Salted contract creations / create2
  - Checked or Unchecked Arithmetic
  - Destructuring Assignments
- Other:
  - Block and Transaction Properties: they mapped directly to Yul functions (see table [here](https://docs.soliditylang.org/en/latest/yul.html#evm-dialect))
  - Type Information: useless

## Resources

- [Ethereum Docs](https://ethereum.org/en/developers/docs/)
- [EVM Opcodes](https://www.ethervm.io/)
- [Solidity Docs](https://docs.soliditylang.org/en/latest/)
