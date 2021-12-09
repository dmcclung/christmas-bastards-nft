import { expect } from "chai";
import { ethers } from "hardhat";

describe("Christmas Bastards", function () {
  it("should deploy successfully", async function () {
    const ChristmasBastardsNFT = await ethers.getContractFactory("ChristmasBastardsNFT");
    const christmasBastardsNFT = await ChristmasBastardsNFT.deploy();
    await christmasBastardsNFT.deployed();

    console.log("Contract deployed to:", christmasBastardsNFT.address);

    expect(true).to.be.true;
  });
});
