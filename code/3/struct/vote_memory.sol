contract Contract {
    enum Choices { Yes, No }

    struct Vote {
        Choices choice;
        address voter;
    }

    function createVote(Choices choice) external view returns (Vote memory) {
        return Vote({
            choice: choice,
            voter: msg.sender
        });
    }
}