// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

import "../utils/packet/Packets.sol";


contract ControlSystem{
    address private Owner;
    function set_owner(address _owner) public {
        Owner = _owner;
    }

    function control_system_user(address sender, uint8[17] memory payload) public returns(uint8[17] memory){
        Packets packet = new Packets();
        if(msg.sender == Owner){
            return packet.dumy();
        }
        else{
            return packet.user_not_allowed();
        }
    }
    function control_system_client(uint8[17] memory payload) public returns(uint8[17] memory){
        Packets packet = new Packets();
        return packet.dumy();
    }
    
}