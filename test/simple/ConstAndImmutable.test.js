const ConstAndImmutable = artifacts.require("ConstAndImmutable");

contract("ConstAndImmutable", (accounts) => {
  let instance;
  before(async () => {
    console.log(accounts);
    instance = await ConstAndImmutable.new(10, accounts[0]);
  });

  it("isBalanceTooHigh(address _other)", async () => {
    const result = await instance.isBalanceTooHigh.sendTransaction(accounts[1]);
    console.log(result);
  });
});
// // SPDX-License-Identifier: GPL-3.0
// pragma solidity >=0.7.4;
// uint256 constant X = 32**22 + 8;

// contract ConstAndImmutable {
//     string constant TEXT = "abc";
//     bytes32 constant MY_HASH = keccak256("abc");
//     uint256 immutable decimals;
//     uint256 immutable maxBalance;
//     address immutable owner = msg.sender;

//     constructor(uint256 _decimals, address _reference) {
//         decimals = _decimals;
//         maxBalance = _reference.balance;
//     }

//     function isBalanceTooHigh(address _other) public view returns (bool) {
//         return _other.balance > maxBalance;
//     }
// }
