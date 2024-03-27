// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;


contract StringFunction{
    // utility function
   function compare(string memory str1, string memory str2) internal pure returns (bool) {
        if (bytes(str1).length != bytes(str2).length) {
            return false;
        }
        return keccak256(abi.encodePacked(str1)) == keccak256(abi.encodePacked(str2));
    }
   function is_in(string[] memory list_keys,string memory key) internal pure returns (bool) {
        for (uint i=0; i<list_keys.length; i++) {
            if(compare(list_keys[i], key)){
                return true;
            }
        }
        return false;
   }
}