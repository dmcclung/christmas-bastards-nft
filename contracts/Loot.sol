//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "hardhat/console.sol";

contract Loot is ERC721URIStorage {

    constructor() ERC721 ("Loot", "LOOT"){
        console.log("Deploying Loot");
    }

    function mintLoot(uint256 tokenId) public {
        require(tokenId >= 0 && tokenId < 1000, "Out of range");

        _safeMint(msg.sender, tokenId);
        console.log("Loot %s minted to %s", tokenId,  msg.sender);

        _setTokenURI(tokenId, "https://ipfs.io/ipfs/QmWR2CdE2JcSgqhqK8o7jWaHa1F38Pwq832zzJgkS7MdCc");
    }

}
