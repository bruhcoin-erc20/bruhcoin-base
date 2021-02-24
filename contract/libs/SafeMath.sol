pragma solidity >=0.7.0 <0.8.0;

// SPDX-License-Identifier: GPLv3


/*
BruhCoin (C) BruhCoin 2021.
https://bruhco.in/
*/

library SafeMath { 
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }
    
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}