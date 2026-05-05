# 📚 Solidity Essentials

## 🔹 What is Solidity?
- A high-level programming language for implementing **Smart Contracts**.
- Targeted specifically at the **Ethereum Virtual Machine (EVM)**.
- Statically typed, supports inheritance, and complex user-defined types.

---

## 🔹 Basic Structure
Every Solidity file begins with a license identifier and a version pragma.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MyContract {
    uint256 public value; // State variable stored on-chain

    // Function to modify state
    function setValue(uint256 _value) public {
        value = _value;
    }
}
```

---

## 🔹 Common Data Types
- **uint / int**: Unsigned and signed integers (e.g., `uint256`).
- **bool**: Boolean values (`true`/`false`).
- **address**: A 20-byte Ethereum address.
- **string**: UTF-8 encoded text.
- **mapping**: Key-value pairs (`mapping(address => uint) balances`).

---

## 🔹 Functions & Mutability
| Type | Description |
| :--- | :--- |
| `view` | Reads from state, but does not modify it. |
| `pure` | Does not read from or modify state (e.g., math). |
| `payable` | Allows the function to receive Ether. |

Example:
```solidity
function add(uint a, uint b) public pure returns (uint) {
    return a + b;
}
```

---

## 🔹 Visibility Specifiers
- **public**: Accessible from anywhere (inside and outside).
- **private**: Only accessible within the current contract.
- **internal**: Like private, but also accessible by derived contracts.
- **external**: Only accessible from outside the contract.

---

## 🔹 Advanced Concepts
### Events
Used for logging activity that external apps (like frontends) can listen to.
```solidity
event Updated(uint newValue);
```

### Modifiers
Used to wrap function logic (commonly for access control).
```solidity
modifier onlyOwner() {
    require(msg.sender == owner, "Not authorized");
    _; // Executes the original function body
}
```

### Error Handling
- `require()`: Checks inputs/conditions (returns gas on fail).
- `assert()`: Checks for internal errors (consumes gas).
