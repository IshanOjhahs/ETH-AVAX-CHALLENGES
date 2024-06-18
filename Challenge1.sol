// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract AdminOnly {
    address public admin;
    uint public storedData;
    bool public paused;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can call this function");
        _;
    }

    function adminFunction1(uint x) public onlyAdmin {
        storedData = x;
    }

    function adminFunction2() public onlyAdmin {
        paused = !paused;
    }

    function changeAdmin(address newAdmin) public onlyAdmin {
        admin = newAdmin;
    }
}
