// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

event len(uint8 indexed i);
contract BitWiseOperation{
    uint8[] public __output;
    function bit8_mearge(uint8 low,uint8 high) public returns(uint16){
        uint16 ret = 2**16 - 1;
        ret = ret & uint16(low);
        ret = ret | (uint16(high) << 8);
        return ret;
   }
   function convert_uint8__to_uint817(uint8[] memory input) public  returns(uint8[17] memory output){
        // emit len(input.length);
        for(uint8 i = 0; i< 17; i++){
            output[i]= input[i];
        }
        
        return output;
   }
   function convert_uint178__to_uint8(uint8[17] memory input) public  returns(uint8[] memory ){
        // emit len(input.length);
        for(uint8 i = 0; i< 17; i++){
            __output.push(input[i]);
        }
        
        return __output;
   }
}