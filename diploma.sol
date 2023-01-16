// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Arrays.sol";
import "@openzeppelin/contracts/utils/Address.sol";

contract Diploma is ERC721, ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;

// CONSTRUCTOR ///////////////////////////////////////////////
    // creates a whitelist of addresses that can interact with the contract, makes smart contract owner whitelisted
    address[] private whitelist;
    constructor() ERC721("Diploma", "DPLMA") {
        whitelist.push(owner());
    }

// FUNCTIONS ///////////////////////////////////////////////
    // Function to mint the diploma to the students wallet
    function safeMint(address to, string memory uri) public {
        require(isWhitelisted(msg.sender), "Organization has not been approved to mint diplomas");
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
    }

    // Removing inherited transfer functions from Open Zeppelin, we want the NFT to be non-transferable
    function transferFrom(address from, address to, uint256 tokenId) public override {}
    function safeTransferFrom(address from, address to, uint256 tokenId) public override {}
    function safeTransferFrom(address from, address to, uint256 tokenId, bytes memory _data) public override {}

    // WHITELIST FUNCTIONS
    // Function to add a new school that can mint diplomas
    function addToWhitelist(address _address) public onlyOwner {
        require(whitelist.length == 0 || whitelist[whitelist.length - 1] != _address, "Address is already in the whitelist");
        whitelist.push(_address);
    }

    // Remove a school if needed
        function removeFromWhitelist(address _address) public onlyOwner{
        uint256 index = 0;
        for (uint256 i = 0; i < whitelist.length; i++) {
            if (whitelist[i] == _address) {
                index = i;
                break;
            }
        }
        delete whitelist[index];
    }

    // Check if a school's address is on the whitelist
        function isWhitelisted(address _address) public view returns (bool) {
        for (uint256 i = 0; i < whitelist.length; i++) {
            if (whitelist[i] == _address) {
                return true;
            }
        }
        return false;
    }

    // required override from solidity
    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    // returns string 
    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

}
