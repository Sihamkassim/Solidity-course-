contract Contract {

    mapping(address => bool) public members;

    function addMember(address user) external {
        members[user] = true;
    }
}