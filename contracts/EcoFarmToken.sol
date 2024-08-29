// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract EcoFarmToken {
    string public name = "EcoFarmToken";
    string public symbol = "EFT";
    uint8 public decimals = 18;
    uint256 public totalSupply;
    
    mapping(address => uint256) public balanceOf;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event RewardIssued(address indexed user, string wasteType, uint256 amount);
    event Mint(address indexed to, uint256 amount);
    event Burn(address indexed from, uint256 amount);

    address private owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }

    constructor(uint256 initialSupply) {
        totalSupply = initialSupply * 10 ** uint256(decimals);
        balanceOf[msg.sender] = totalSupply;
        owner = msg.sender;
    }

    function getBalance(address _user) public view returns (uint256) {
        return balanceOf[_user];
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value, "Not enough tokens");
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function rewardTokens(address _user, string memory _wasteType, uint256 _reward) public {
        require(balanceOf[owner] >= _reward, "Not enough tokens to reward");
        balanceOf[owner] -= _reward;
        balanceOf[_user] += _reward;
        emit RewardIssued(_user, _wasteType, _reward);
        emit Transfer(owner, _user, _reward);
    }

    function mint(address to, uint256 amount) public onlyOwner {
        totalSupply += amount;
        balanceOf[to] += amount;
        emit Transfer(address(0), to, amount);
    }

    function burn(uint256 amount) public {
        require(balanceOf[msg.sender] >= amount, "Insufficient balance");
        totalSupply -= amount;
        balanceOf[msg.sender] -= amount;
        emit Transfer(msg.sender, address(0), amount);
    }
}
