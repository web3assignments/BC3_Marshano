var TestContract = artifacts.require("TestContract");
module.exports = function(deployer) {
    deployer.deploy(TestContract);
    // Additional contracts can be deployed here
};