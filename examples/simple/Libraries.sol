// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.6.0 <0.9.0;

library Math {
    function sum(uint256 a, uint256 b) public pure returns (uint256) {
        return a + b;
    }
}

contract Libraries {
    function compute(uint256 a, uint256 b) public view returns (uint256) {
        return a * Math.sum(b, block.timestamp);
    }
}