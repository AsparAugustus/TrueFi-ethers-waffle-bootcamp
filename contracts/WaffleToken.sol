// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract WaffleToken is IERC20 {
    string public constant name = "WaffleToken";
    string public constant symbol = "WFL";
    uint8 public constant decimals = 18;

    mapping(address => uint) balances;

    // Owner => spender => value
    mapping(address => mapping(address => uint)) allowances;

    uint public initialBalance;

    constructor(uint _initialBalance) {

        initialBalance = _initialBalance;
        balances[msg.sender] = initialBalance;
    }

    function totalSupply() external view override returns (uint256) {

        return initialBalance;
        
    }

    function balanceOf(address account) external view override returns (uint256) {
        return balances[account];
    }

    //event Transfer(address, address, uint);

    function transfer(address recipient, uint256 amount) external override returns (bool) {

        // require(recipient != "0", "Requires a valid address");
        require(amount > 0, "Requires a value higher than zero");


        balances[msg.sender] -= amount;
        balances[recipient] += amount;

        emit Transfer(msg.sender, recipient, amount);

        return true;

    }
    
    
    // Part 2
    

    function allowance(address owner, address spender) public override view returns (uint256) {
        return allowances[owner][spender];
    }

    function approve(address spender, uint256 amount) external override returns (bool) {
        
        require(amount > 0, "Amount needs to be more than zero");

        allowances[msg.sender][spender] = amount;

        return true;
    }

    function transferFrom(address sender, address recipient, uint256 amount) external override returns (bool) {
        
        if(allowance(msg.sender, sender) >= amount) {
            // this.transfer(recipient, amount);

            balances[sender] -= amount;
            balances[recipient] += amount;
            allowances[msg.sender][sender] -= amount;
            return true;
        } else {
            return false;
        }
        
    }

}
