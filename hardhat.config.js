require("@nomiclabs/hardhat-ethers");

const INFURA_API_KEY = vars.get("INFURA_API_KEY");
const SEPOLIA_PRIVATE_KEY = vars.get("SEPOLIA_PRIVATE_KEY");

module.exports = {
  solidity: "0.8.20",
  networks: {
    "arbitrum-sepolia": {
      url:
        "https://arbitrum-sepolia.infura.io/v3/" + INFURA_API_KEY,
        accounts: [SEPOLIA_PRIVATE_KEY]
    },
  },
};
