// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract SimpleBank {
    struct Account {
        uint256 balance;
        bool exists;
    }

    mapping(address => Account) private accounts;

    modifier accountExists(address account) {
        require(accounts[account].exists, "Account does not exist.");
        _;
    }

    function createAccount() external {
        require(!accounts[msg.sender].exists, "Account already exists.");
        accounts[msg.sender] = Account(0, true);
    }

    function deposit() external payable accountExists(msg.sender) {
        accounts[msg.sender].balance += msg.value;
    }

    function withdraw(uint256 amount) external accountExists(msg.sender) {
        require(accounts[msg.sender].balance >= amount, "Insufficient balance.");
        accounts[msg.sender].balance -= amount;
        payable(msg.sender).transfer(amount);
    }

    function transfer(address to, uint256 amount) external accountExists(msg.sender) accountExists(to) {
        require(accounts[msg.sender].balance >= amount, "Insufficient balance.");
        accounts[msg.sender].balance -= amount;
        accounts[to].balance += amount;
    }

    function checkBalance() external view accountExists(msg.sender) returns (uint256) {
        return accounts[msg.sender].balance;
    }
}
