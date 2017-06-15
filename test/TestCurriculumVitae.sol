pragma solidity ^0.4.2;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/CurriculumVitae.sol";

contract TestCurriculumVitae {

  function testIsTrue() {
    Assert.isTrue(true, "Should be true");
  }

  // function testInitialBalanceUsingDeployedContract() {
  //   MetaCoin meta = MetaCoin(DeployedAddresses.MetaCoin());

  //   uint expected = 10000;

  //   Assert.equal(meta.getBalance(tx.origin), expected, "Owner should have 10000 MetaCoin initially");
  // }

  // function testInitialBalanceWithNewMetaCoin() {
  //   MetaCoin meta = new MetaCoin();

  //   uint expected = 10000;

  //   Assert.equal(meta.getBalance(tx.origin), expected, "Owner should have 10000 MetaCoin initially");
  // }
  
}
