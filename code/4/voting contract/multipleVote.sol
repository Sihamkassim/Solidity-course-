// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {

    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
    }

    Proposal[] public proposals;

    // tracks whether a user has voted before
    mapping(uint => mapping(address => bool)) public hasVoted;

    // tracks the actual vote (YES = true, NO = false)
    mapping(uint => mapping(address => bool)) public voteChoice;

    function newProposal(address target, bytes calldata data) external {
        proposals.push(
            Proposal({
                target: target,
                data: data,
                yesCount: 0,
                noCount: 0
            })
        );
    }

    function castVote(uint proposalId, bool support) external {
        Proposal storage proposal = proposals[proposalId];

        // If user already voted, remove their previous vote
        if (hasVoted[proposalId][msg.sender]) {
            bool previous = voteChoice[proposalId][msg.sender];

            if (previous) {
                proposal.yesCount--;
            } else {
                proposal.noCount--;
            }
        }

        // Apply new vote
        if (support) {
            proposal.yesCount++;
        } else {
            proposal.noCount++;
        }

        // Store/update vote
        hasVoted[proposalId][msg.sender] = true;
        voteChoice[proposalId][msg.sender] = support;
    }
}