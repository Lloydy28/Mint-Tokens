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
