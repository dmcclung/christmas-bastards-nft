import { ethers } from "hardhat";

async function main() {
  const Loot = await ethers.getContractFactory("Loot");
  const loot = await Loot.deploy();
  await loot.deployed();

  console.log("Contract deployed to", loot.address);

  const tx = await loot.mintLoot(0);
  await tx.wait();

  const tx2 = await loot.mintLoot(1);
  await tx2.wait();
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
