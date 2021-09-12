// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract For {
  function fibonacci(uint256 n) public pure returns (uint256 b) {
    if (n == 0) {
      return 0;
    }
    uint256 a = 1;
    b = 1;
    for (uint256 i = 2; i < n; i++) {
      uint256 c = a + b;
      a = b;
      b = c;
    }
    return b;
  }
}
