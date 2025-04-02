// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

// Import OpenZeppelin ERC-20 and Ownable Contracts
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SalonSafeToken is ERC20, Ownable {
    // Constructor with initial supply and owner assignment
    constructor(uint256 initialSupply) ERC20("SalonSafe Token", "SLN") Ownable(msg.sender) {
        _mint(msg.sender, initialSupply * 10 ** decimals());
    }

    // Owner can mint more tokens if needed
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Anyone can burn their own tokens
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }
}
