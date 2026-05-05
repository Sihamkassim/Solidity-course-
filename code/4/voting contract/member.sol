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

    mapping(uint => mapping(address => bool)) public hasVoted;
    mapping(uint => mapping(address => bool)) public voteChoice;

    // ✅ MEMBERS LIST
    mapping(address => bool) public isMember;

    // EVENTS
    event ProposalCreated(uint proposalId);
    event VoteCast(uint proposalId, address voter);

    // ✅ CONSTRUCTOR (sybil resistance setup)
    constructor(address[] memory initialMembers) {
        isMember[msg.sender] = true; // deployer is always a member

        for (uint i = 0; i < initialMembers.length; i++) {
            isMember[initialMembers[i]] = true;
        }
    }

    // ---------------- PROPOSALS ----------------
    function newProposal(address target, bytes calldata data) external {
        require(isMember[msg.sender], "Not a member");

        proposals.push(
            Proposal({
                target: target,
                data: data,
                yesCount: 0,
                noCount: 0
            })
        );

        emit ProposalCreated(proposals.length - 1);
    }

    // ---------------- VOTING ----------------
    function castVote(uint proposalId, bool support) external {
        require(isMember[msg.sender], "Not a member");

        Proposal storage proposal = proposals[proposalId];

        // handle vote change
        if (hasVoted[proposalId][msg.sender]) {
            bool previous = voteChoice[proposalId][msg.sender];

            if (previous) {
                proposal.yesCount--;
            } else {
                proposal.noCount--;
            }
        }

        // apply new vote
        if (support) {
            proposal.yesCount++;
        } else {
            proposal.noCount++;
        }

        hasVoted[proposalId][msg.sender] = true;
        voteChoice[proposalId][msg.sender] = support;

        emit VoteCast(proposalId, msg.sender);
    }
}