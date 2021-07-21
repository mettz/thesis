# Thesis

This repo contains all work related to my undergraduate thesis.

possibile titolo: calcolo del cost model esatto di un programma in Solidity

# TODO NEXT

- Se esiste la rappresentazione del bytecode EVM in Yul
  - Scrivere parte che prende in input bytecode (ASM o bytecode diretto), fa visita:
    1. controlla che tutto il codice sia coperto da label
    2. associare ad ogni label il costo
- Gestione label interne: identificarle in modo particolare

# TODO

- [x] Aggiungere esempi con ricorsione e funzioni `fallback` e `receive`
- [x] Verificare se sono presenti esempi con chiamate di funzioni internal più complesse
- [x] Iniziare a guardare il compilatore
  - [x] provare a modificarlo aggiungendo un'istruzione emit per emettere una label
  - [x] vedere dove finisce la label emessa in particolare controllare se:
    - [x] viene duplicata -> quando nel codice si fa uso dei modifier sì (e.g. BlindAuction) altrimenti no, ma potrebbe essere dovuto al fatto che Yul ha i loop e quindi non li unrolla
    - [x] viene preceduta da altro codice -> sì in praticamente tutti gli esempi
  - [x] iniziare a pensare come gestire le funzioni che vengono generate e non hanno costo O(1)

# Examples

### Included features

- State Variables: present in multiple examples
- Functions: present in multiple examples
  - [Internal function calls](https://docs.soliditylang.org/en/latest/control-structures.html#internal-function-calls)
  - [External function calls](https://docs.soliditylang.org/en/latest/control-structures.html#external-function-calls)
  - [View functions](https://docs.soliditylang.org/en/latest/contracts.html#view-functions)
  - [Pure functions](https://docs.soliditylang.org/en/latest/contracts.html#pure-functions)
  - [Constructors](https://docs.soliditylang.org/en/latest/contracts.html#constructors)
- [Control Structures](https://docs.soliditylang.org/en/latest/control-structures.html#control-structures): missing `do`, `break`, `continue`
- Structs: present in multiple examples
- [Visibility & Getters](https://docs.soliditylang.org/en/latest/contracts.html#visibility-and-getters): `Visibility.sol`
- [Constants and Immutables variables](https://docs.soliditylang.org/en/latest/contracts.html#constant-and-immutable-state-variables): `ConstAndImmutable.sol`
- [Libraries](https://docs.soliditylang.org/en/latest/contracts.html#libraries): `Libraries.sol`
- [Block and Transaction Properties](https://docs.soliditylang.org/en/latest/units-and-global-variables.html#block-and-transaction-properties): they map directly to Yul functions (see table [here](https://docs.soliditylang.org/en/latest/yul.html#evm-dialect)): present in multiple examples
- Error handling: present in multiple examples
  - [Errors](https://docs.soliditylang.org/en/latest/structure-of-a-contract.html#errors)
  - [Functions](https://docs.soliditylang.org/en/latest/control-structures.html#error-handling-assert-require-revert-and-exceptions)
  - [try/catch](https://docs.soliditylang.org/en/latest/control-structures.html#try-catch): `TryCatch.sol`
  - [Errors and the Revert statement](https://docs.soliditylang.org/en/latest/contracts.html#errors-and-the-revert-statement)

### Features that should be included

- Types:
  - Booleans: `&&` and `||` are short-circuited so they generate always the same code while `!` maps directly to the builtin function `iszero` and `==` (and consequently `!=`) maps to `eq`
  - Integers: comparisons operators maps to builtins, the same applies for shift operators and bitwise operators. All maths operations map to builtin functions with additional checks such as overflow for multiplication and non-zero denominator for division (see [Checked or Unchecked Arithmetic](https://docs.soliditylang.org/en/latest/control-structures.html#checked-or-unchecked-arithmetic) for more details) except exponentiation that is performed through an helper function
  - Fixed Point Numbers: not fully supported so ignore them
  - Address:
    - [Members of Address Types](https://docs.soliditylang.org/en/latest/units-and-global-variables.html#members-of-address-types): `transfer` and `send` maps to `call(...)` see `BlindAuction.sol`
  - Contract Types: every contract define it's own type but they are treated as addresses in Yul
  - Fixed sized arrays: very similar to integers they mapped directly to integers literal of 32 bytes. Indexing is interesting because it's achived through shifting
  - Enums: treated as integers like in C
  - Reference Types: be careful about generated code in the following [cases](https://docs.soliditylang.org/en/latest/types.html#data-location-and-assignment-behaviour)
    - Arrays: all the operations available are implemented through custom generated functions (see members usage example [here](https://docs.soliditylang.org/en/latest/types.html#array-members))
  - Mappings: very similar to other storage types except they can be stored only inside storage and cannot be used as functions parameters or return values (see [here](https://docs.soliditylang.org/en/latest/types.html#mapping-types) for a detailed explanation)
  - [Conversions](https://docs.soliditylang.org/en/latest/types.html#conversions-between-elementary-types): they are really complex so they generate a lot of code but, from a superficial point of view, it's just a bunch of one line functions that often boil down to a single line in optimized code
  - Recursion and Tail Recursion: tocheck
  - [Function Modifiers](https://docs.soliditylang.org/en/latest/contracts.html#function-modifiers): tocheck
  - [receive](https://docs.soliditylang.org/en/latest/contracts.html#receive-ether-function) and [fallback](https://docs.soliditylang.org/en/latest/contracts.html#fallback-function) functions: tocheck

### Features in doubt

- [Events](https://docs.soliditylang.org/en/latest/contracts.html#events): events represent a Solidity-specific (in the sense of a language designed for writing Smart Contracts) feature, though an advanced one, so it is probably worth to cover them
- Contracts Creation:
  - [Creating contracts with `new`](https://docs.soliditylang.org/en/latest/control-structures.html#creating-contracts-via-new)
  - [Salted contract creations / create2](https://docs.soliditylang.org/en/latest/control-structures.html#salted-contract-creations-create2): this is an addition to the above feature
- Others:
  - [ABI Encoding and Decoding Functions](https://docs.soliditylang.org/en/latest/units-and-global-variables.html#abi-encoding-and-decoding-functions): they map to certain code, need to check the compiler to know precisely which
  - [Checked or Unchecked Arithmetic](https://docs.soliditylang.org/en/latest/control-structures.html#checked-or-unchecked-arithmetic): obviously generates different code but it's also a really advanced feature

### Excluded features

- [Pragmas](https://docs.soliditylang.org/en/latest/layout-of-source-files.html#pragmas):
  - `pragma version`: assuming it is always set to the same value does not change compiler output
  - `pragma abicoder`: compiler versions greater than 0.8.0 default to `v2` so it should not matter
  - `pragma experimental`: the only allowed value is `SMTChecker` but can only be enabled while building compiler, so it is already enabled/disabled by default.
- Functions:
  - [Named Calls and Anonymous Function Parameters](https://docs.soliditylang.org/en/latest/control-structures.html#named-calls-and-anonymous-function-parameters): at least a bit of syntactic sugar must appear in every programming language :)
  - [Omitted Function Parameter Names](https://docs.soliditylang.org/en/latest/control-structures.html#omitted-function-parameter-names): at least another bit of syntactic sugar must appear in every programming language :))
  - [Overloading](https://docs.soliditylang.org/en/latest/contracts.html#function-overloading): not interesting because overloaded functions are compiled as if they were two different functions in Yul
  - [Free standing functions](https://docs.soliditylang.org/en/latest/contracts.html#functions): since they have an implicit `internal` visibility they are treated in the exact same way i.e. they do not appear in the public contract interface
- Too advanced features:
  - [Inheritance, Overriding, Modifier Overriding](https://docs.soliditylang.org/en/latest/contracts.html#inheritance)
  - [Multiple Inheritance, Linearization & Arguments for Base Constructors](https://docs.soliditylang.org/en/latest/contracts.html#multiple-inheritance-and-linearization)
  - [Abstract Contracts](https://docs.soliditylang.org/en/latest/contracts.html#abstract-contracts)
  - [Interfaces](https://docs.soliditylang.org/en/latest/contracts.html#interfaces)
  - [Array Slice](https://docs.soliditylang.org/en/latest/types.html#array-slices): only available for super recent version of compiler
  - [Iterable Mappings](https://docs.soliditylang.org/en/latest/types.html#iterable-mappings)
  - [Operators Involving LValues](https://docs.soliditylang.org/en/latest/types.html#operators-involving-lvalues): generates really different code based on the L-Value so it's too complex to handle (see the example in the doc for possible L-Values)
- Other:
  - [Destructuring Assignments & Returning Multiple Values](https://docs.soliditylang.org/en/latest/control-structures.html#destructuring-assignments-and-returning-multiple-values): Yul functions can return multiple values so it follows the same rules as Solidity and does not produce different code
  - [Type Information](https://docs.soliditylang.org/en/latest/units-and-global-variables.html#type-information): they are useless
  - [Ether Units, Time Units & Contracts related variables](https://docs.soliditylang.org/en/latest/units-and-global-variables.html#ether-units): they always map to the same thing (certain values for units, same instructions for `this` and `selfdestruct`)
  - [Mathematical and Cryptographic Functions](https://docs.soliditylang.org/en/latest/units-and-global-variables.html#mathematical-and-cryptographic-functions): `addmod`, `mulmod` and `keccak256` maps directly to Yul functions while `sha256`, `ripemd160`, `ecrecover` maps to `staticcall(g, a, in, insize, out, outsize)` where `a` equals respectively to 2, 3 and 1
  - [Using for](https://docs.soliditylang.org/en/latest/contracts.html#using-for): at least one more bit of syntactic sugar must appear in every programming language :))
  - [Imports](https://docs.soliditylang.org/en/latest/layout-of-source-files.html#importing-other-source-files): They do not affect the generated output, as long as the imported code is not used

## Additional Notes on Examples

- The following paragraph describe the _Order of Evaluation of Expressions_ in Soldity:
  ```
  The evaluation order of expressions is not specified (more formally, the order in which the children of one node in the expression tree are evaluated is not specified, but they are of course evaluated before the node itself). It is only guaranteed that statements are executed in order and short-circuiting for boolean expressions is done.
  ```
- Variables initialization:
  ```
  A variable which is declared will have an initial default value whose byte-representation is all zeros. The “default values” of variables are the typical “zero-state” of whatever the type is. For example, the default value for a bool is false. The default value for the uint or int types is 0. For statically-sized arrays and bytes1 to bytes32, each individual element will be initialized to the default value corresponding to its type. For dynamically-sized arrays, bytes and string, the default value is an empty array or string. For the enum type, the default value is its first member.
  ```
- Scoping follows the "classical" rules

# Resources

- [Ethereum Docs](https://ethereum.org/en/developers/docs/)
- [EVM Opcodes](https://www.ethervm.io/)
- [Solidity Docs](https://docs.soliditylang.org/en/latest/)
