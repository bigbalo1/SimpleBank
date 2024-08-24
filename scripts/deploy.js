async function main() {
  console.log("Fetching contract factory...");
  const SimpleBank = await ethers.getContractFactory("SimpleBank");

  console.log("Deploying contract...");
  const simpleBank = await SimpleBank.deploy();

  console.log("Waiting for contract to be deployed...");
  await simpleBank.deployed();

  console.log("SimpleBank deployed to:", simpleBank.address);
}

main().catch((error) => {
  console.error("Deployment error:", error);
  process.exitCode = 1;
});
