const SimpleToken721 =  artifacts.require('SimpleToken721');
const tokenFactory = artifacts.require('tokenFactory');
const myERC721 = artifacts.require('myERC721');
const SimpleToken20 = artifacts.require('SimpleToken20');

module.exports = async function (deployer) {
  await deployer.deploy(SimpleToken20);
  const token1 = await SimpleToken20.deployed();
  await deployer.deploy(myERC721,'a','b','c');
  await deployer.deploy(tokenFactory, token1.address);
  await deployer.deploy(SimpleToken721);
}
