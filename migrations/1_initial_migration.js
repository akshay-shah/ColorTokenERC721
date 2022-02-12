const Migrations = artifacts.require("ColorToken");

module.exports = function (deployer) {
  deployer.deploy(Migrations);
};