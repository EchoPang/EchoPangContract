async function main() {
    const [deployer] = await ethers.getSigners();
    console.log("Deploying contracts with the account:", deployer.address);

    const initialSupply = ethers.utils.parseUnits("1000000", 18);
    const EcoFarmToken = await ethers.getContractFactory("EcoFarmToken");
    const token = await EcoFarmToken.deploy(initialSupply);

    console.log("EcoFarmToken deployed to:", token.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  }
);
