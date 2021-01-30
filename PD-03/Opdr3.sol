// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.6.10 and less than 0.7.0
pragma solidity ^0.6.10;

contract Game {
     //Character properties
     struct Character {
     uint hp;
        string name;
        uint damage;
        uint level;
    }
        //Enemy properties
  struct Enemy {
     uint ehp;
        string ename;
        uint elevel;
        string element;
        uint exp;
  }
        //Array of characters created
     Character[] public character;
     Enemy[] public enemy;
     
     //Create characters
    function _createCharacter(string memory _name, uint _level, uint _damage) private {
        characters.push(Character(_name, _level, _damage));
       
        //Create enemy
    function _createEnemy(string memory _ename, uint _elevel, string _element, uint _exp) private {
        characters.push(Enemy(_ename, _elevel, _element, _exp));
       
        //Attack an enemy reduces health based on damage
        function _attackEnemy(uint _ehp, uint damage ) public {
            _ehp = 100;
            _ehp - _damage = newehp;
            return newehp;
        }
       
        public bool EnemyisDead(uint _ehp){
            if (_ehp == 0){
                return true;
            }
            else return false;
        }
    }
 
    }