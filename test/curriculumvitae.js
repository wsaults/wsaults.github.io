var CurriculumVitae = artifacts.require("./CurriculumVitae.sol");

contract('CurriculumVitae', function(accounts) {
    
    it("setIdentity function should fill in values", function() {
        var contractInstance;
        return CurriculumVitae.deployed().then(function(instance) {
            contractInstance = instance;
            return contractInstance.setIdentity("Will Saults", "Developer", "Some guy learning Solidity", "http://example.com", "email@example.com", "0x00000000000000000000000000000000deadbeef");
        }).then(function() {
            return contractInstance.getAuthor();
        }).then(function(results) {
            var [author, email] = results;
            assert.equal(author, "Will Saults", "The authors are the same");
            assert.equal(email, "email@example.com", "The emails are the same");
        }).then(function() {
            return contractInstance.getTitle();
        }).then(function(results) {
            assert.equal(results, "Developer", "The titles are the same");
        }).then(function() {
            return contractInstance.getDescription();
        }).then(function(results) {
            assert.equal(results, "Some guy learning Solidity", "The description is the same");
        }).then(function() {
            return contractInstance.getAddress();
        }).then(function(results) {
            assert.equal(results, "http://example.com", "The urls are the same");
        }).then(function() {
            return contractInstance.getTipAddress();
        }).then(function(results) {
            assert.equal(results, "0x00000000000000000000000000000000deadbeef", "The tip address is the same");
        });
    });

    it("message count and messages should match", function() {
        var contractInstance;
        return CurriculumVitae.deployed().then(function(instance) {
            contractInstance = instance;
            contractInstance.setMessage("I am a great message", {from: accounts[0], gas: 200000});
            return contractInstance.getMessageCount();
        }).then(function(count) {
            assert.equal(count.toNumber(), 1, "The counts are the same");
        }).then(function() {
            return contractInstance.getMessage(1);
        }).then(function(message) {
            assert.equal(message, "I am a great message", "The messages are the same");
        });
    });
});
