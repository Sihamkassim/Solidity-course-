pragma solidity 0.8.20;

import "./Hero.sol";

// Mage starts with 50 health
contract Mage is Hero(50) {
    // inherits everything else from Hero
}

// Warrior starts with 200 health
contract Warrior is Hero(200) {
    // inherits everything else from Hero
}