// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract ParentContract {
    uint256 private value;

    function getValue() public view returns (uint256) {
        return value;
    }

    function multiply(uint256 x, uint256 y) public pure returns (uint256) {
        return x * y;
    }

    function setValue(uint256 newValue) public payable {
        require(msg.value > 0, "Ether is required to set value");
        value = newValue;
    }
}

contract ChildContract is ParentContract {
    function fetchValue() public view returns (uint256) {
        return getValue();
    }

    function multiplyNumbers(uint256 x, uint256 y) public pure returns (uint256) {
        return multiply(x, y);
    }

    function updateValue(uint256 newValue) public payable {
        setValue(newValue);
    }
}
