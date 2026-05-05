pragma solidity 0.8.20;

contract Contract {
    enum Choices { Yes, No }

    struct Vote {
        Choices choice;
        address voter;
    }

    Vote[] public votes;

    function createVote(Choices choice) external {
        votes.push(Vote({
            choice: choice,
            voter: msg.sender
        }));
    }

    function changeVote(Choices newChoice) external {
        bool found = false;

        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == msg.sender) {
                votes[i].choice = newChoice;
                found = true;
                break;
            }
        }

        require(found, "No existing vote found");
    }
}