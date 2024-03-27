// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;


contract BitWiseOperation{
    function bit8_mearge(uint8 low,uint8 high) public returns(uint16){
        uint16 ret = 2**16 - 1;
        ret = ret & uint16(low);
        ret = ret | (uint16(high) << 8);
        return ret;
   }
}