// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract D {
    uint256 public x;

    constructor(uint256 a) payable {
        x = a;
    }
}

contract C {
    D d = new D(4);

    function createD(uint256 arg) public {
        D newD = new D(arg);
        newD.x();
    }

    function createAndEndowD(uint256 arg, uint256 amount) public payable {
        D newD = new D{value: amount}(arg);
        newD.x();
    }
}
