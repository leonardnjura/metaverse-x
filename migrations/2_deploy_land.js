//an artifact is a js file representing a smart contract in json

const Land = artifacts.require("Land"); //request the Land contract

module.exports = async function (deployer) {
  const NAME = "Bates College Buildings";
  const SYMBOL = "BCB";
  const COST = web3.utils.toWei("1", "ether");

  await deployer.deploy(Land, NAME, SYMBOL, COST); //wait for contract tobe deployed

  // NOTE: 
  // when smart contracts are deployed to blockchain they are immutable, 
  // so if there was a but they will stay in that state forever, 
  // so we need to write tests    

};
