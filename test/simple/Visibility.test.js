const A = artifacts.require("A");
const B = artifacts.require("B");

contract("A", () => {
  let instance;
  before(async () => {
    instance = await A.new();
  });

  it("setData(uint256 a)", async () => {
    const result = await instance.setData.sendTransaction(10);
    console.log(result);
  });

  it("getData()", async () => {
    const result = await instance.getData.sendTransaction();
    console.log(result);
  });

  it("x()", async () => {
    const result = await instance.x.sendTransaction();
    console.log(result);
  });
});

contract("B", () => {
  let instance;
  before(async () => {
    instance = await B.new();
  });

  it("g()", async () => {
    const result = await instance.g.sendTransaction();
    console.log(result);
  });
});

// // SPDX-License-Identifier: GPL-3.0
// pragma solidity >=0.4.16 <0.9.0;

// contract A {
//     uint256 public withGetter;
//     uint256 public data;

//     function f(uint256 a) private pure returns (uint256 b) {
//         return a + 1;
//     }

//     function setData(uint256 a) public {
//         data = a;
//     }

//     function getData() public view returns (uint256) {
//         return data;
//     }

//     function compute(uint256 a, uint256 b) internal pure returns (uint256) {
//         return a + b;
//     }

//     function x() public returns (uint256) {
//         data = 3;
//         return this.data();
//     }
// }

// contract B is A {
//     function g() public {
//         A a = new A();
//         uint256 val = compute(3, 5);
//     }
// }
