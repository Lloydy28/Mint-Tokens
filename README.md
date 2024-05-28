### Project: Create and Mint Token
For this project, you will write a smart contract to create your own ERC20 token and deploy it using HardHat or Remix. Once deployed, you should be able to interact with it for your walk-through video. From your chosen tool, the contract owner should be able to mint tokens to a provided address and any user should be able to burn and transfer tokens.

### Code
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
//name of the contract
contract BITCOIN is ERC20 {
    address public stocker;
    // Constructor to give a name to the token
    constructor() ERC20("BITCOIN", "bit")
    // Adjusting mint with decimals
     {
        stocker = msg.sender;
        _mint(msg.sender, 1000000 * (100 ** decimals())); 
    }
    // A modifier that is only limited to the Stocker
    modifier Stocker() 
    {
        require(msg.sender == stocker, "Caller is not the stocker");
        _;
    }
    // Function to mint new tokens, this can be only called by the Stocker
    function createbitcoins(address receiver, uint256 total) external Stocker 
    {
        _mint(receiver, total);
    }
    // Overridden transfer function to handle custom logic, if needed
    function transferbitcoins(address reciever, uint256 total) external returns (bool) 
    {
        _transfer(msg.sender, reciever, total);
        return true;
    }
    // Function to burn tokens from the caller's account
    function destroybitcoins(uint256 total) external 
    {
        _burn(msg.sender, total);
    }
}



### Author
NTC

Tenefrancia, John Lloyd B.

8215176@ntc.edu.ph
