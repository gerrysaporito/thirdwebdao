// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Whitelist {
  // Max number of whitelisted addresses allowed
  uint8 public maxWhitelistedAddresses;

  // Create a mapping of whitelisted addresses
  mapping(address => bool) public whitelistedAddresses;

  // Track of how many addresses have been whitelisted
  uint public numAddressesWhitelisted;

  constructor(uint8 _maxWhitelistedAddresses) {
    maxWhitelistedAddresses = _maxWhitelistedAddresses;
  }

  /*
   * Function: Adds the address of hte sender to the whitelist
   */
   function addAddressToWhitelist() public {
     // Check if user has already been whitelisted
     require(!whitelistedAddresses[msg.sender], 'Sender has already been whitelisted.');
     //Check if there are still whitelist spots available
     require(numAddressesWhitelisted < maxWhitelistedAddresses, 'No more whitelist spots available');
     whitelistedAddresses[msg.sender] = true;

     numAddressesWhitelisted += 1;
   }
}