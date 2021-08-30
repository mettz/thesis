// SPDX-License-Identifier: GPL-3.0
pragma solidity >0.7.0 <0.9.0;

contract owned {
    constructor() {
        owner = payable(msg.sender);
    }

    address payable owner;
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function.");
        _;
    }
}

contract destructible is owned {
    function destroy() public onlyOwner {
        selfdestruct(owner);
    }
}

contract priced {
    modifier costs(uint256 price) {
        if (msg.value >= price) {
            _;
        }
    }
}

contract Register is priced, destructible {
    mapping(address => bool) registeredAddresses;
    uint256 price;

    constructor(uint256 initialPrice) {
        price = initialPrice;
    }

    function register() public payable costs(price) {
        registeredAddresses[msg.sender] = true;
    }

    function changePrice(uint256 _price) public onlyOwner {
        price = _price;
    }
}

contract Mutex {
    bool locked;
    modifier noReentrancy() {
        require(!locked, "Reentrant call.");
        locked = true;
        _;
        locked = false;
    }

    function f() public noReentrancy returns (uint256) {
        (bool success, ) = msg.sender.call("");
        require(success);
        return 7;
    }
}
