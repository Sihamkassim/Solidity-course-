# Solidity Learning Path – Structured Notes

This document organizes all the Solidity topics you covered into a clean, structured reference guide.

---

# 1. STRUCTS

## 1.1 Basic Structs

Structs allow you to group related data together.

```solidity
struct Vote {
    Choices choice;
    address voter;
}
```

## 1.2 Enum + Struct Combination

Enums define fixed options.

```solidity
enum Choices { Yes, No }
```

Used inside structs:

```solidity
struct Vote {
    Choices choice;
    address voter;
}
```

## 1.3 Key Concepts

* Store structured data
* Used heavily in mappings and arrays
* Represent real-world objects (votes, users, proposals)

---

# 2. MAPPINGS

## 2.1 Basic Mapping

Mappings store key-value pairs.

```solidity
mapping(address => uint) balances;
```

## 2.2 Boolean Mapping (Membership)

```solidity
mapping(address => bool) public members;
```

### Add Member

```solidity
members[user] = true;
```

### Remove Member

```solidity
members[user] = false;
```

## 2.3 Struct Mapping

```solidity
mapping(uint => User) public users;
```

Used to store complex data per address or ID.

## 2.4 Nested Mapping

```solidity
mapping(address => mapping(address => bool)) connections;
```

Used for relationships between users.

## 2.5 Key Concepts

* O(1) lookup
* No iteration needed
* Best for state tracking

---

# 3. VOTING SYSTEM

## 3.1 Proposal Structure

```solidity
struct Proposal {
    address target;
    bytes data;
    uint yesCount;
    uint noCount;
}
```

## 3.2 Creating Proposals

```solidity
proposals.push(Proposal(target, data, 0, 0));
```

## 3.3 Casting Votes

```solidity
function castVote(uint proposalId, bool support) external
```

### Logic

* Increment yesCount or noCount
* Track voter state

## 3.4 Handling Vote Changes

Use mapping:

```solidity
mapping(uint => mapping(address => bool)) hasVoted;
mapping(uint => mapping(address => bool)) voteChoice;
```

### Update logic

* If previous vote exists:

  * reverse old vote
  * apply new vote

## 3.5 Events

```solidity
event ProposalCreated(uint proposalId);
event VoteCast(uint proposalId, address voter);
```

## 3.6 Execution Logic

* If yes votes >= threshold (e.g., 10)
* Execute proposal via:

```solidity
(target).call(data);
```

---

# 4. CONTRACT INHERITANCE

## 4.1 Basic Inheritance

```solidity
contract Derived is Base {}
```

* Inherits state + functions

## 4.2 Constructor Inheritance

```solidity
contract Warrior is Hero {
    constructor(uint _health) Hero(_health) {}
}
```

## 4.3 Virtual & Override

### Base

```solidity
function attack() virtual public {}
```

### Derived

```solidity
function attack() public override {}
```

## 4.4 Super Keyword

Call parent logic:

```solidity
super.attack(enemy);
```

---

# 5. OWNABLE PATTERN

## 5.1 Purpose

Restrict function access to contract owner.

## 5.2 Implementation

```solidity
address public owner;
```

## 5.3 Modifier

```solidity
modifier onlyOwner() {
    require(msg.sender == owner);
    _;
}
```

## 5.4 Usage

```solidity
function markPrice() external onlyOwner {}
```

---

# 6. EVENTS

## 6.1 Purpose

Allow frontend / indexers to listen to contract activity.

## 6.2 Example Events

```solidity
event ProposalCreated(uint proposalId);
event VoteCast(uint proposalId, address voter);
```

## 6.3 Emitting Events

```solidity
emit ProposalCreated(id);
emit VoteCast(id, msg.sender);
```

---

# 7. CONSOLE LOG (DEBUGGING)

## 7.1 Purpose

Debug smart contracts during testing (Foundry only).

## 7.2 Usage

```solidity
import "forge-std/console.sol";
```

```solidity
console.log("debug message");
console.log(value);
```

## 7.3 Notes

* Only for development/testing
* Not used in production contracts

---

# 8. KEY CONCEPTS SUMMARY

## Storage Patterns

* Structs → complex objects
* Mappings → fast lookup
* Arrays → iteration needed

## Design Patterns

* Ownable → access control
* Voting → governance systems
* Inheritance → code reuse

## Solidity Fundamentals

* calldata vs memory
* require() for validation
* events for logging
* external/public visibility differences

---

# END OF NOTES
