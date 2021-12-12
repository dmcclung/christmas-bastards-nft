//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "hardhat/console.sol";

contract Loot is ERC721URIStorage {
    string private beginSvg = "<svg xmlns='http://www.w3.org/2000/svg' preserveAspectRatio='xMinYMin meet' viewBox='0 0 350 350'><style>.base { fill: white; font-family: serif; font-size: 14px; }</style><rect width='100%' height='100%' fill='black' />";
    string private endSvg = "</svg>";

    string[] private items = [
        "Clothes", 
        "Leather Armor", 
        "Chain Mail", 
        "Half Plate", 
        "Full Plate", 
        "Magic Armor",
        "Erdrick's Armor",
        "Leather Shield",
        "Small Shield",
        "Iron Shield",
        "Large Shield",
        "Silver Shield",
        "Herb",
        "Wings",
        "Torch",
        "Dragon's Scale",
        "Fairy Water",
        "Key",
        "Ball of Light",
        "Erdrick's Tablet",
        "Fairies' Flute",
        "Silver Harp",
        "Staff of Rain",
        "Stone of Sunlight",
        "Gwaelin's Love",
        "Erdrick's Token",
        "Rainbow Drop",
        "Cursed Belt",
        "Death Necklace",
        "Fighter's Ring"
    ];

    constructor() ERC721 ("Loot", "LOOT") {
        console.log("Deploying Loot");
    }

    function pickItem(uint256 tokenId, string memory order) internal view returns (string memory) {
        string memory seed = string(abi.encodePacked(order, Strings.toString(tokenId)));
        uint256 rand = uint256(keccak256(abi.encodePacked(seed)));
        // Squash the # between 0 and the length of the array to avoid going out of bounds.
        rand = rand % items.length;
        return items[rand];
    }

    function mintLoot(uint256 tokenId) public {
        require(tokenId >= 0 && tokenId < 1000, "Out of range");

        _safeMint(msg.sender, tokenId);
        console.log("Loot %s minted to %s", tokenId,  msg.sender);

        string memory first = string(abi.encodePacked("<text x='50%' y='10%' class='base' text-anchor='middle'>", pickItem(tokenId, "First"), "</text>"));
        string memory second = string(abi.encodePacked("<text x='50%' y='30%' class='base' text-anchor='middle'>", pickItem(tokenId, "Second"), "</text>"));
        string memory third = string(abi.encodePacked("<text x='50%' y='50%' class='base' text-anchor='middle'>", pickItem(tokenId, "Third"), "</text>"));
        string memory fourth = string(abi.encodePacked("<text x='50%' y='70%' class='base' text-anchor='middle'>", pickItem(tokenId, "Fourth"), "</text>"));
        string memory fifth = string(abi.encodePacked("<text x='50%' y='90%' class='base' text-anchor='middle'>", pickItem(tokenId, "Fifth"), "</text>"));

        string memory svg = string(abi.encodePacked(beginSvg, first, second, third, fourth, fifth, endSvg));

        console.log("\n--------------------");
        console.log(svg);
        console.log("--------------------\n");

        _setTokenURI(tokenId, "https://ipfs.io/ipfs/QmWR2CdE2JcSgqhqK8o7jWaHa1F38Pwq832zzJgkS7MdCc");
    }

}
