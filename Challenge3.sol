// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract EventContract {
    event UserRegistered(address indexed user, string name);
    event ItemAdded(uint256 indexed itemId, string itemName, uint256 quantity);
    event PaymentReceived(address indexed payer, uint256 amount);
    event Withdrawal(address indexed recipient, uint256 amount);

    function registerUser(address userAddress, string memory userName) external {
        emit UserRegistered(userAddress, userName);
    }

    function addItem(uint256 itemId, string memory itemName, uint256 quantity) external {
        emit ItemAdded(itemId, itemName, quantity);
    }

    function receivePayment() external payable {
        emit PaymentReceived(msg.sender, msg.value);
    }

    function withdraw(uint256 amount) external {
        payable(msg.sender).transfer(amount);
        emit Withdrawal(msg.sender, amount);
    }
}
