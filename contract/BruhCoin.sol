pragma solidity >=0.7.0 <0.8.0;

// SPDX-License-Identifier: GPLv3

/*
BruhCoin (C) BruhCoin 2021.
https://bruhco.in/
*/

import './libs/SafeMath.sol';

contract BruhCoin {
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
    event Transfer(address indexed from, address indexed to, uint tokens);

    mapping(address => uint256) balances;
    mapping(address => mapping (address => uint256)) allowed;
    
    uint256 totalSupply_;
    uint8 version_;

    using SafeMath for uint256;

    /*
    erc20 Token Info
    */
    string public constant name = "BruhCoin";
    string public constant symbol = "BRUH";
    uint8 public constant decimals = 18;
    
    /*
    Cool
    */

    constructor(uint256 total) public {
        version_ = 1;
    	totalSupply_ = total;
    	balances[msg.sender] = totalSupply_;
    }  

    /*
    Returns the total supply of BruhCoins.
    */
    function totalSupply() public view returns (uint256) {
    	return totalSupply_;
    }
    
    /*
    Gets the balance of a given address.
    */
    function balanceOf(address tokenOwner) public view returns (uint) {
        return balances[tokenOwner];
    }

    /*
    Transfer some Bruh to a given address.
    */
    function transfer(address receiver, uint numTokens) public returns (bool) {
        require(numTokens <= balances[msg.sender]);
        balances[msg.sender] = balances[msg.sender].sub(numTokens);
        balances[receiver] = balances[receiver].add(numTokens);
        emit Transfer(msg.sender, receiver, numTokens);
        return true;
    }

    /*
    Approve a transfer.
    */
    function approve(address delegate, uint numTokens) public returns (bool) {
        allowed[msg.sender][delegate] = numTokens;
        Approval(msg.sender, delegate, numTokens);
        return true;
    }

    /*
    Get the allowance.
    */
    function allowance(address owner, address delegate) public view returns (uint) {
        return allowed[owner][delegate];
    }

    /*
    Transfer some Bruh.
    */
    function transferFrom(address owner, address buyer, uint numTokens) public returns (bool) {
        require(numTokens <= balances[owner]);    
        require(numTokens <= allowed[owner][msg.sender]);
    
        balances[owner] = balances[owner].sub(numTokens);
        allowed[owner][msg.sender] = allowed[owner][msg.sender].sub(numTokens);
        balances[buyer] = balances[buyer].add(numTokens);
        Transfer(owner, buyer, numTokens);
        return true;
    }
    
    /*
    Return the version of Bruh contract.
    */
    function bruh() public view returns (uint) {
        return version_;
    }
}