// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract SimpleStorage {
    address public owner;
    uint256 public storedData;

    constructor() {
        owner = msg.sender;
    }

    function set(uint256 data) external payable {
        require(msg.value > 0, "Ether required");
        storedData = data;
    }

    function get() external view returns (uint256) {
        return storedData;
    }

    function contractBalance() external view returns (uint256) {
        return address(this).balance;
    }

    function withdraw(uint256 amount) external {
        require(msg.sender == owner, "Only owner can withdraw");
        require(amount <= address(this).balance, "Not enough balance");
        payable(owner).transfer(amount);
    }
}
