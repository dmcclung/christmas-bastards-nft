import { expect } from "chai";
import { ethers } from "hardhat";

describe("Loot", function () {
  it("should deploy successfully", async function () {
    const Loot = await ethers.getContractFactory("Loot");
    const loot = await Loot.deploy();
    await loot.deployed();

    console.log("Contract deployed to", loot.address);

    expect(loot.address).to.not.be.null;
  });
});
