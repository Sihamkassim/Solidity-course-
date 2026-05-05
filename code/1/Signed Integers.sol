// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Contract {
    int8 public a = 20;
    int8 public b = -10;

    int16 public difference = int16(a) - int16(b);
}