pragma solidity ^0.6.0;
import "@openzeppelin/upgrades-core/contracts/Initializable.sol";

/// @title Greetings
/// @author Marshano Nathie
contract SmartContractGreeting is Initializable {

    // At first, an empty "address"-type variable of the name "creator". Will be set in the constructor.
    address creator;
    
    address public owner;
    // At first, an empty "string"-type variable of the name "greeting". Will be set in constructor and can be changed.
    string greeting;
    
    // Modifier for Only Owner
    modifier onlyOwner(){
        require(msg.sender == owner, "Must be owner");   _;
    }
    
    // Modifier for Only by adress
    modifier onlyBy(address account) {
        require(msg.sender == account, "Wrong address"); _;
    }
    

    function initialize(string memory _greeting) public initializer {
             creator = msg.sender;
    greeting = _greeting;
 }
    
    //Return greeting
    function greet() onlyBy(owner) public returns (string memory) {
        return greeting;
    }

    function getBlockNumber() public returns (uint) {
        return block.number;
    }
    
    //Set greeting
    function setGreeting(string memory _newgreeting) public {
        greeting = _newgreeting;
    }
    
    function Done()
     onlyBy(owner)
     public returns(string memory) {
         return "Done";
     }
    
  //  function kill() onlyBy(owner) public {
 //       if (msg.sender == creator)
  //          selfdestruct(creator);
  //  }     

  //  uint public  creationTime = block.timestamp;
  //  modifier onlyBefore(uint _time)     { require(block.timestamp < _time,  "Too late");            _;}
   // modifier onlyAfter(uint _time)      { require(block.timestamp > _time,  "Too soon");            _;}
  //  modifier condition(bool _condition) { require(_condition,               "Condition failed");    _;}
   // modifier minAmount(uint _amount)    { require(msg.value >= _amount,     "Not enough ETH send"); _;}

 //   function f() payable 
   //     onlyBy(owner) 
   //     minAmount(2 ether) 
   //     onlyAfter(creationTime + 1 minutes) 
   //     condition(msg.sender.balance >= 50 ether) 
   //     public returns(string memory) { // code
    //        return "Done";
    
    }
}