// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract C {
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
        data = 3; // internal access
        return this.data(); // external access
    }
}

// This will not compile
/*
contract D {
    function readData() public {
        C c = new C();
        uint256 local = c.f(7); // error: member `f` is not visible
        c.setData(3);
        local = c.getData();
        local = c.compute(3, 5); // error: member `compute` is not visible
    }
}
*/

contract E is C {
    function g() public {
        C c = new C();
        uint256 val = compute(3, 5); // access to internal member (from derived to parent contract)
    }
}
