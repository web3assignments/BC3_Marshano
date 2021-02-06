const { deployProxy, upgradeProxy } = require('@openzeppelin/truffle-upgrades');
var SmartContractGreeting = artifacts.require("SmartContractGreeting");
module.exports = async function(deployer) {    
    const SmartContractGreeting=await SmartContractGreeting.deployed()
    const SmartContractGreeting=await upgradeProxy(SmartContractGreeting.address,{ deployer });
    console.log(`Address of SmartContractGreeting: ${SmartContractGreeting.address}`)
    console.log("Doing some tests with the just upgraded contract");
}
