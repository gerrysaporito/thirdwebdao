const { ethers } = require('hardhat');

async function main() {
  /*
   * A ContractFactory in ether.js is an abstraction used to deploy new stmart contracts.
   * This means whitelistContract here is a foctory for instances of our Whitelist contract.
   */
  const WhitelistContract = await ethers.getContractFactory('Whitelist');
  const whitelist = await WhitelistContract.deploy(10);
  await whitelist.deployed();

  console.log('Whitelist Contract Address:', whitelist.address);
}

main()
  .then(() => process.exit(0))
  .catch((e) => {
    console.error(error);
    process.exit(1);
  });
