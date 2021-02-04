pragma solidity ^0.7.0;

contract Opdr3 {
    address _huidigAdres;
    mapping(address => uint256) public HuidigAdresInContract;

     constructor()  public payable {
        require(msg.value >= 1 ether, "Niet genoeg Ether!");
        HuidigAdresInContract[msg.sender] = msg.value;
        _huidigAdres = msg.sender;
        RaadofEven(msg.value);
    }

    event Winnings(address winner, uint256 winning);
    event VelorenAdres(address winner, uint256 winning);

    function RaadofEven(uint256 stake) public {
        if (stake % 2 == 0) {
            Winning(stake);
        } else {
            emit VelorenAdres(msg.sender, stake);
        }
    }

    function Winning(uint256 stake) private {
        uint256 percentage = (stake / _huidigAdres.balance) * 100;
        if (percentage > 50) {
            StuurWinningnaarAdres(stake * 1); 
        } 
        else {
            StuurWinningnaarAdres(stake * 1);
        }
    }

    function StuurWinningnaarAdres(uint256 winning) private {
        emit Winnings(msg.sender, winning);
        address payable verstuurbareAdres = payable(_huidigAdres);
        (bool transferSucceeded, ) = verstuurbareAdres.call{value: winning}("");
        require(
            transferSucceeded,
            "Niet genoeg ETH in het adres gevonden, transaction failed"
        );
    }
}