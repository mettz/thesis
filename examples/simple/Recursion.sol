// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract Recursion {
    uint256 storedData;

    function fib(uint256 x) private pure returns (uint256) {
        if (x < 2) {
            return 1;
        } else {
            return fib(x - 1) + fib(x - 2);
        }
    }

    function fact_tail(uint256 n, uint256 a) private pure returns (uint256) {
        if (n <= 1) {
            return a;
        } else {
            return fact_tail(n - 1, n * a);
        }
    }

    function get_fib(uint256 x) public pure returns (uint256) {
        if (x == 1) {
            return get_fib1();
        } else {
            return fib(x);
        }
    }

    function get_fib1() public pure returns (uint256) {
        return fib(1);
    }

    function get_fact(uint256 n) public pure returns (uint256) {
        return fact_tail(n, 1);
    }

    function get_fact1() public pure returns (uint256) {
        return fact_tail(1, 1);
    }
}
