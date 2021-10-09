// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract A {
    uint256 public data;

    function setData(uint256 a) public {
        data = a;
    }
}

contract B is A {
    function g() public {
        A a = new A();
        a.setData(8);
    }
}
