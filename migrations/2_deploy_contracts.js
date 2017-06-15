var CurriculumVitae = artifacts.require("./CurriculumVitae.sol");

module.exports = function(deployer) {
  deployer.deploy(CurriculumVitae);
};
