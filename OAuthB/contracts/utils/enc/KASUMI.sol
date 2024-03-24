// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract KASUMI{
    int128 private key;
    constructor(int128 _key) public{
        key = _key;
    }
}