//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

contract ChristmasBastardsNFT is ERC721URIStorage {

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    
    constructor() ERC721 ("ChristmasBastardsNFT", "XMAS"){
        console.log("Deploying Christmas Bastards NFT");
    }

    function makeNFT() public {
        uint256 tokenId = _tokenIds.current();

        _safeMint(msg.sender, tokenId);
        console.log("NFT %s minted to %s", tokenId,  msg.sender);

        _setTokenURI(tokenId, "https://ipfs.io/ipfs/QmWR2CdE2JcSgqhqK8o7jWaHa1F38Pwq832zzJgkS7MdCc");

        _tokenIds.increment();
    }

}
