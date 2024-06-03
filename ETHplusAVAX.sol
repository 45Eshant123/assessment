// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract error{
    function testRequire(uint value) public pure returns (string memory) {
        require(value > 10, "Input must be greater than 10");
        return "Input is greater than 10";
    }
    function testRevert(uint value_a) public pure returns (string memory) {        
        if (value_a <= 10) {
            revert("Input must be greater than 10");
        }
        return "Input is greater than 10";
    }    
    uint public num;   
    function testAssert() public view returns (string memory) {     
        assert(num == 0);
        return "num is zero";
    } 
    error Insufficient_Balance(uint balance, uint withdraw_Amount);  
    function testCustomError(uint _withdraw_Amount) public view returns (string memory) {
        uint bal = address(this).balance;
        if (bal < _withdraw_Amount) {
            revert Insufficient_Balance({balance: bal, withdraw_Amount: _withdraw_Amount});
        }
        return "Sufficient balance for withdrawal";
    }
}
