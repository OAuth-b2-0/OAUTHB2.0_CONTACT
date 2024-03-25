// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;
contract RandomNumber {
  uint randNo = 0;
  //256
   function setNumber() public {
        randNo= uint (keccak256(abi.encodePacked (msg.sender, block.timestamp, randNo)));
     }
    function getNumber() public view returns (uint) {
        return randNo;
    }
    function get_random(uint8 mask_size) public returns(uint){
        setNumber();
        return getNumber() & (2**mask_size - 1);
    }
}