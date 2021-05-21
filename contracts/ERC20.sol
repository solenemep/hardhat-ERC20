//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

import "hardhat/console.sol";

contract ERC20 {
    mapping(address => uint256) private _balances;
    mapping(address => mapping(address => uint256)) private _allowances;
    string private _name;
    string private _symbol;

    event Transfer(address indexed from, address indexed to, uint256 amount);
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 amount
    );

    constructor(address owner_, uint256 initialSupply_) {
        _name = "CoinCoin";
        _symbol = "CC";
        _balances[owner_] = initialSupply_;
        emit Transfer(address(0), owner_, initialSupply_);
    }

    // functions
    function transfer(address to, uint256 amount) public {
        require(
            _balances[msg.sender] >= amount,
            "SmartWallet: Not enough Ether to transfer"
        );
        require(to != address(0), "SmartWallet: transfer to the zero address");
        _balances[msg.sender] -= amount;
        _balances[to] += amount;
        emit Transfer(msg.sender, to, amount);
    }

    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) public {
        require(
            _allowances[from][msg.sender] >= amount,
            "SmartWallet: transfer amount exceeds allowance"
        );
        require(
            _balances[from] >= amount,
            "SmartWallet: Not enough Ether to transfer"
        );
        require(to != address(0), "SmartWallet: transfer to the zero address");
        _allowances[from][msg.sender] -= amount;
        _balances[from] -= amount;
        _balances[to] += amount;
        emit Transfer(from, to, amount);
    }

    function approve(address spender, uint256 amount) public {
        require(
            spender != address(0),
            "SmartWallet: approve to the zero address"
        );
        _allowances[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
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

    function allowance(address owner, address spender)
        public
        view
        returns (uint256)
    {
        return _allowances[owner][spender];
    }
}
