// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

import "../utils/packet/Packets.sol";
import "./ContractClock.sol";
import "../utils/enc/KASUMI.sol";
import "./UserControls/UserLoginSystem.sol";
import "../utils/BitWiseOperation.sol";



contract ControlSystem{

    ContractClock private clock = new ContractClock();
    UserLoginSystem private userloginsystem = new UserLoginSystem();
    BitWiseOperation private bitop = new BitWiseOperation();

    event token_val(uint16 indexed val); 

    KASUMI private kasumi;

    constructor(uint128 key) public{
        kasumi = new KASUMI(key);
    }

    function control_system_user(uint8[17] memory payload) public returns(uint8[17] memory){
        clock.tick();
        Packets packet = new Packets();
        uint8 opcode = payload[0];
        uint16 token;
        if(opcode == 1){
            // login
            token =  userloginsystem.add_acess();
            emit token_val(token);
            if (token == 0) return packet.user_login_fail();
            return packet.user_login_send_access_token(token);
        }
        else if(opcode == 4){
            // logout
            token = bitop.bit8_mearge(payload[16], payload[15]); 
            emit token_val(token);
            bool val = userloginsystem.remove_acess_token(token);
            if(val) return packet.user_logout_successful();
            return packet.user_logout_fail();
        }else{
            return packet.dumy();
        }
        
    }





    function control_system_client(uint8[17] memory payload) public returns(uint8[17] memory){
        clock.tick();
        uint8[17] memory dec = kasumi.decrypt(payload);
        return dec;
    }
    
}