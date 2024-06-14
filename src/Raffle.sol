// SPDX-License-Identifier: MIT

// LAYOUT OF CONTRACTS:
// version
// imports
// errors
// interfaces, libraries, contracts
// Type declarations
// State variables
// Events
// Modifiers
// Functions

// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// view & pure functions

pragma solidity ^0.8.19;

/**
 * @title A s imple Raffle Contract
 * @author Clarus
 * @notice This contract is for creating a simple raffle
 * @dev Implements Chainlink VRFv2
 */
contract Raffle {

    // ERRORS // 

    error Raffle__notEnoughEthSent();

    
    uint256 private immutable i_entranceFee;
    address payable [] private storage s_players;

    constructor(uint256 entranceFee) {
        i_entranceFee = entranceFee;
    }

    function enterRaffle() external payable {
        if (msg.value < i_entranceFee) {
            revert Raffle__notEnoughEthSent();
        }
        s_players.push(payable(msg.sender));
    }

    function pickWinner() public {}

    // Getter Functions // 

    function getEntranceFee() externale view returns(uint256) {
        returns i_entranceFee;
    }
}
