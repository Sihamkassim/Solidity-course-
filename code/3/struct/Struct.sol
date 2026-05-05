contract Contract {
    enum Choices { Yes, No }

    struct Vote {
        Choices choice;
        address voter;
    }

    Vote public vote;

    function createVote(Choices choice) external {
        vote = Vote({
            choice: choice,
            voter: msg.sender
        });
    }
}