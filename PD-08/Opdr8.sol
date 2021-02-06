// SPDX-License-Identifier: MIT~
//simple oracle contract to display current NL time 
pragma solidity ^0.6.0;
import "github.com/provable-things/ethereum-api/provableAPI_0.6.sol";

contract Time is usingProvable {
   string  public TimeAmsterdam;
   uint256 public priceOfUrl;
  
   constructor() public payable {}

   function __callback(bytes32 /* myid prevent warning*/ , string memory result ) override public {
       if (msg.sender != provable_cbAddress()) revert();
       TimeAmsterdam = result;
   }

   function GetAtmTijd() public payable {
       priceOfUrl = provable_getPrice("URL");
       require (address(this).balance >= priceOfUrl,
            "Add Eth");
       provable_query("URL", 
            "json(http://worldtimeapi.org/api/timezone/Europe/Amsterdam).utc_datetime");
   }
}