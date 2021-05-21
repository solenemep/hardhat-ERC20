//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

import "hardhat/console.sol";

contract ERC20 {
    mapping(address => uint256) private _balances;
    string private _name;
    string private _symbol;

    event Transfer(
        address indexed sender,
        address indexed recipient,
        uint256 amount
    );

    constructor(address owner_, uint256 initialSupply_) {
        _name = "CoinCoin";
        _symbol = "CC";
        _balances[owner_] = initialSupply_;
        emit Transfer(address(0), owner_, initialSupply_);
    }

    // getters
    function name() public view returns (string memory) {
        return _name;
    }

    function symbol() public view returns (string memory) {
        return _symbol;
    }

    function balanceOf(address account) public view returns (uint256) {
        return _balances[account];
    }
}
