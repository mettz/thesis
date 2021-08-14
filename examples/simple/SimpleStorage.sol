// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract SimpleStorage {
    uint256 storedData;

    function set(uint256 x) private {
        storedData = x;
    }

    function get() public returns (uint256) {
        set(5);
        return storedData;
    }
}
