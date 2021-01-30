const { deployProxy } = require('@openzeppelin/truffle-upgrades');
var SmartContractGreeting = artifacts.require("SmartContractGreeting");

module.exports = async function(deployer) {
    const Greetingcontract = await deployProxy(SmartContractGreeting, {deployer});
    console.log(`Address of Greetingcontract: ${Greetingcontract.address}`)
};