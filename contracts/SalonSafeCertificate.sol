// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SalonSafeCertificate is ERC721URIStorage, Ownable {
    uint256 public tokenCounter;
   mapping(address => uint256) public mintCount;


    constructor(address initialOwner)
        ERC721("SalonSafe Proof-of-Airflow", "SLNCERT")
        Ownable(initialOwner)
    {
        tokenCounter = 0;
    }

    function issueCertificate(address to, string memory metadataURI) public onlyOwner {
    uint256 tokenId = tokenCounter;
    _safeMint(to, tokenId);
    _setTokenURI(tokenId, metadataURI);
    tokenCounter++;
    mintCount[to]++;
}

    // Soulbound override for non-transferability (OpenZeppelin v5)
    function _update(address to, uint256 tokenId, address auth)
        internal
        override
        returns (address)
    {
        address from = _ownerOf(tokenId);
        require(from == address(0), "This NFT is soulbound and non-transferable");
        return super._update(to, tokenId, auth);
    }
}
