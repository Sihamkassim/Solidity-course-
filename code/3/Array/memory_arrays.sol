// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {

    function filterEven(uint[] calldata numbers)
        external
        pure
        returns (uint[] memory)
    {
        // 1. count evens
        uint count = 0;

        for (uint i = 0; i < numbers.length; i++) {
            if (numbers[i] % 2 == 0) {
                count++;
            }
        }

        // 2. create memory array of exact size
        uint[] memory evens = new uint[](count);

        // 3. fill it
        uint index = 0;

        for (uint i = 0; i < numbers.length; i++) {
            if (numbers[i] % 2 == 0) {
                evens[index] = numbers[i];
                index++;
            }
        }

        return evens;
    }
}