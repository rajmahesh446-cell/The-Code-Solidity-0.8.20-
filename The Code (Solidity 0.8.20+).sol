// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Import OpenZeppelin Standards
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title ElasticSupplyToken
 * @dev An ERC20 token where the supply is flexible.
 * - The Owner can MINT new tokens.
 * - Any user can BURN their own tokens.
 */
contract ElasticSupplyToken is ERC20, ERC20Burnable, Ownable {
    
    // Constructor sets the Token Name, Symbol, and the Initial Owner
    constructor(address initialOwner) 
        ERC20("ElasticMint", "ELST") 
        Ownable(initialOwner) 
    {
        // Optional: Mint some initial supply to the owner upon deployment
        // 1000 tokens with 18 decimals
        _mint(initialOwner, 1000 * 10 ** decimals());
    }

    /**
     * @dev Creates `amount` new tokens for `to`.
     * Only the contract owner can call this function.
     * This increases the total supply.
     */
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
    
    // Note: The 'burn' function is automatically included via ERC20Burnable.
    // Anyone can call burn(amount) to destroy their own tokens.
}
