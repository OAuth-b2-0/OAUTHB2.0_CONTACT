// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;


contract KASUMI{
    // event debug(
    //     uint8 indexed out
    // );
    uint8[16] public key = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    constructor(uint128 _key) public{
        uint8 rev = 16;
        for(uint8 i = 0;i < 16; i++){
            rev = rev - 1;
            key[rev] = uint8((_key >> (i*8)) & (2**8 -1));
            
        }
    }
    function  show_key() public returns(uint8[16] memory){
        return key;
    }
    function encription(uint8[17] memory payload) public returns(uint8[17] memory){
        
        uint8[17] memory out = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        for(uint8 i = 1;i <= 16; i++){
            out[i] = key[i-1] ^ payload[i];
        }
        out[0] = payload[0];
        return out;

    }
    function decrypt(uint8[17] memory payload) public returns(uint8[17] memory){
        return encription(payload);
    }
}