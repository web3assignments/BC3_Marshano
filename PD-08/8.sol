// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
import "github.com/provable-things/ethereum-api/provableAPI_0.6.sol";


contract VreemdeValuta is usingProvable {
   string  public euroNaarVreemdeValuta;
   uint256 public priceOfUrl;
   uint public valutaUsd = 10;
   constructor() public payable {}

   function __callback(bytes32 /* myid prevent warning*/ , string memory result ) override public {
       if (msg.sender != provable_cbAddress()) revert();
       euroNaarVreemdeValuta = result;
   }

    function RequestValutaLocal()view public returns(uint valutaUsd){ 
        }
    

   function GetVreemdeValuta() public payable {
       priceOfUrl = provable_getPrice("URL");
       require (address(this).balance >= priceOfUrl,
            "please add some ETH to cover for the query fee");
       provable_query("URL", 
            "json(https://api.exchangeratesapi.io/latest");
   }
}