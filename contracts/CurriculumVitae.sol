pragma solidity ^0.4.8;

import "./CVExtender.sol";
import "./mortal.sol";

contract CurriculumVitae is CVExtender, mortal {

    event messageSet();
    
    struct Identity {
        string _name;
        string _title;
        string _description;
        string _url;
        string _email;
        address _tipAddress;
    }

    Identity identity;

    uint messageCount;
    mapping (uint => string) _message;

    function CurriculumVitae() {
        setIdentity("Will Saults", "Developer", "Just a guy and his Solidity.", "https://wsaults.github.io/", "wpsaults@gmail.com", "0x178Bc6a8ffF5DF6E8B1A358b0BC37647Dc02E57D");
        _message[messageCount++] = "I am the creator!";
    }

    function setIdentity(string name, string title, string description, string url, string email, address tipAddress) onlyOwner {
        identity = Identity(name, title, description, url, email, tipAddress);
    }
     
    /**
     * Below is for our CV!
     **/
    function getAddress() constant returns(string) {
        return identity._url;
    }
    
    function getDescription() constant returns(string) {
        return identity._description;
    }

    function getTitle() constant returns(string) {
        return identity._title;
    }

    function getAuthor() constant returns(string, string) {
        return (identity._name, identity._email); 
    }

    function getTipAddress() constant returns(address) {
        return identity._tipAddress; 
    }

    function getMessageCount() constant returns(uint) {
        return messageCount;
    }

    function getMessage(uint index) constant returns(string) {
        return _message[index];
    }

    function setMessage(string message) {
        if (bytes(message).length == 0) throw;
        _message[messageCount++] = message;
        messageSet();
    }
}