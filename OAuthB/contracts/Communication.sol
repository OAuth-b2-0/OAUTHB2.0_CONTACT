// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

import "./data_exchange_mech/Bytes_Array_Interface.sol";

contract Communication{
    Bytes_Array_Interface public BAI = new Bytes_Array_Interface();

    function get_random() public returns(uint){
        BAI.rand().setNumber();
        return BAI.rand().getNumber();
    }
}