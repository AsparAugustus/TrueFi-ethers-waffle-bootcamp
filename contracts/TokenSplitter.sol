pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

/**
 * TokenSplitter
 * Splits transferred tokens
 */

contract TokenSplitter {
    IERC20 public token;
    address first;
    address second;

    constructor(IERC20 _token, address _first, address _second) {
        token = _token;
        first = _first;
        second = _second;
    }

    function split() public payable {

        if(msg.value > 0) {

            // Use transfer from msg.sender to first and second
            uint _amount = msg.value/2;
            token.transferFrom(msg.sender, first, _amount);
            token.transferFrom(msg.sender, second, (msg.value - _amount));
        }

    } 

}
