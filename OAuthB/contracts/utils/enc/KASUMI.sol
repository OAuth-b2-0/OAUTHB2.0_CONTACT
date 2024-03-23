// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract KASUMI{
    bytes1[128] private key;
    constructor(bytes1[128] memory _key) public{
        key = _key;
    }
}