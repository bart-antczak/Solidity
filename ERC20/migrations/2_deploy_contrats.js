const MyToken = artifacts.require("./MyToken.sol");

module.exports = function(deployer) {
    deployer.deploy(MyToken, 100000);
};