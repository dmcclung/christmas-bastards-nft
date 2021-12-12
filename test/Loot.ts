import { expect } from "chai";
import { ethers } from "hardhat";

describe("Loot", function () {
  let loot: any;

  beforeEach(async () => {
    const Loot = await ethers.getContractFactory("Loot");
    loot = await Loot.deploy();
    await loot.deployed();
  });

  it("should deploy successfully", async () => {
    expect(loot.address).to.not.be.null;
  });

  it("should mint", async () => {
    let tx = await loot.mintLoot(0);
    await tx.wait();

    tx = await loot.mintLoot(1);
    await tx.wait();

    tx = await loot.mintLoot(3);
    await tx.wait();
  });

  it("should reject ids out of range", async () => {
    let errorMessage;
    try {
      const tx = await loot.mintLoot(10000);
      await tx.wait();
    } catch (err: any) {
      errorMessage = err.message;
    }
    expect(errorMessage).to.equal(
      "VM Exception while processing transaction: reverted with reason string 'Out of range'"
    );
  });

  it("should reject already minted tokenIds", async () => {
    let tx = await loot.mintLoot(0);
    await tx.wait();

    let errorMessage;
    try {
      tx = await loot.mintLoot(0);
      await tx.wait();
    } catch (err: any) {
      errorMessage = err.message;
    }
    expect(errorMessage).to.equal(
      "VM Exception while processing transaction: reverted with reason string 'ERC721: token already minted'"
    );
  });
});
