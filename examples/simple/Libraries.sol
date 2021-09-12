// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.6.0 <0.9.0;
struct Data {
    mapping(uint256 => bool) flags;
}

library Set {
    function insert(Data storage self, uint256 value) public returns (bool) {
        if (self.flags[value]) return false;
        self.flags[value] = true;
        return true;
    }

    function remove(Data storage self, uint256 value) public returns (bool) {
        if (!self.flags[value]) return false;
        self.flags[value] = false;
        return true;
    }

    function contains(Data storage self, uint256 value)
        public
        view
        returns (bool)
    {
        return self.flags[value];
    }
}

contract Libraries {
    Data knownValues;

    function register(uint256 value) public {
        require(Set.insert(knownValues, value));
    }
}
