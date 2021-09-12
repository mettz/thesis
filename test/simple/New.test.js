const C = artifacts.require("C");
const D = artifacts.require("D");

contract("Modifiers", () => {
  describe("C", () => {
    let instance;
    before(async () => {
      instance = await C.new();
    });

    it("createD(uint256 arg)", async () => {
      const result = await instance.createD.sendTransaction(20);
      console.log(result);
    });

    it("createAndEndowD(uint256 arg, uint256 amount)", async () => {
      const result = await instance.createAndEndowD.sendTransaction(
        20,
        100000000
      );
      console.log(result);
    });
  });
});

// // SPDX-License-Identifier: GPL-3.0
// pragma solidity >=0.7.0 <0.9.0;

// contract D {
//     uint256 public x;

//     constructor(uint256 a) payable {
//         x = a;
//     }
// }

// contract C {
//     D d = new D(4);

//     function createD(uint256 arg) public {
//         D newD = new D(arg);
//         newD.x();
//     }

//     function createAndEndowD(uint256 arg, uint256 amount) public payable {
//         D newD = new D{value: amount}(arg);
//         newD.x();
//     }
// }
