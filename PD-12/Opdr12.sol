pragma solidity ^0.4.23;
//import "https://github.com/OpenZeppelin/openzeppelin-sdk/blob/master/packages/lib/contracts/Initializable.sol";
import "https://raw.githubusercontent.com/OpenZeppelin/openzeppelin-contracts/master/contracts/access/Ownable.sol";

/// @title Greetings
/// @author Marshano Nathie
contract Greetings {

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
    
    // The constructor. It accepts a string input and saves it to the contract's "greeting" variable.
    function constuctor(string _greeting) public Ownable {
        creator = msg.sender;
        greeting = _greeting;
    }
    
    //Return greeting
    function greet() onlyBy(owner) public constant returns (string) {
        return greeting;
    }

    function getBlockNumber() public constant returns (uint) {
        return block.number;
    }
    
    //Set greeting
    function setGreeting(string _newgreeting) public Ownable {
        greeting = _newgreeting;
    }
    
    function Done()
     onlyBy(owner)
     public returns(string memory) {
         return "Done";
     }
    
     /**
     @Suicide function to kill contract and return funds only of the sender is the creator of the contract
     **/

    function kill() onlyBy(owner) public {
        if (msg.sender == creator)
            selfdestruct(creator);
    }     

    uint public  creationTime = block.timestamp;
    modifier onlyBefore(uint _time)     { require(block.timestamp < _time,  "Too late");            _;}
    modifier onlyAfter(uint _time)      { require(block.timestamp > _time,  "Too soon");            _;}
    modifier condition(bool _condition) { require(_condition,               "Condition failed");    _;}
    modifier minAmount(uint _amount)    { require(msg.value >= _amount,     "Not enough ETH send"); _;}

    constructor() { owner = msg.sender;}

    function f() payable 
        onlyBy(owner) 
        minAmount(2 ether) 
        onlyAfter(creationTime + 1 minutes) 
        condition(msg.sender.balance >= 50 ether) 
        public returns(string memory) { // code
            return "Done";
    
    }
}