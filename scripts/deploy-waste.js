async function main() {
  const [deployer] = await ethers.getSigners();
  console.log("Deploying contracts with the account:", deployer.address);

  const WasteRecordStorage = await ethers.getContractFactory("WasteRecordStorage");
  const wasteRecordStorage = await WasteRecordStorage.deploy();

  console.log("WasteRecordStorage deployed to:", wasteRecordStorage.address);
}

main()
.then(() => process.exit(0))
.catch((error) => {
  console.error(error);
  process.exit(1);
});
