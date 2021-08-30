// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;

contract C {
    function f(uint256 a, uint256 b) public view returns (uint256) {
        return a * (b + 42) + block.timestamp;
    }

    function g(uint256 a, uint256 b) public pure returns (uint256) {
        return a * (b + 42);
    }
}
