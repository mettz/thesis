// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract A {
    uint256 public withGetter;
    uint256 public data;

    function f(uint256 a) private pure returns (uint256 b) {
        return a + 1;
    }

    function setData(uint256 a) public {
        data = a;
    }

    function getData() public view returns (uint256) {
        return data;
    }

    function compute(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }

    function x() public returns (uint256) {
        data = 3;
        return this.data();
    }
}

contract B is A {
    function g() public {
        A a = new A();
        uint256 val = compute(3, 5);
    }
}
