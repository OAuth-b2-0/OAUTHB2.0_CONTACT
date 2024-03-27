// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

import "../utils/packet/Packets.sol";
import "./ContractClock.sol";
import "../utils/enc/KASUMI.sol";
import "./UserControls/UserLoginSystem.sol";
import "../utils/BitWiseOperation.sol";
import "./UserControls/UserDataStorage.sol";



contract ControlSystem{

    ContractClock private clock = new ContractClock();
    UserLoginSystem private userloginsystem = new UserLoginSystem();
    BitWiseOperation private bitop = new BitWiseOperation();
    UserDataStorage private datastorage = new UserDataStorage();

    event token_val(uint16 indexed val); 

    KASUMI private kasumi;

    constructor(uint128 key) public{
        kasumi = new KASUMI(key);
    }

    function control_system_user(uint8[17] memory payload) public returns(uint8[17] memory){
        clock.tick();
        //TODO: add not login feature
        Packets packet = new Packets();
        uint8 opcode = payload[0];
        uint16 token;
        uint16 login_token;
        if(opcode == 1){
            // login
            token =  userloginsystem.add_acess();
            emit token_val(token);
            if (token == 0) return packet.user_login_fail();
            return packet.user_login_send_access_token(token);
        }
        else if(opcode == 4){
            // logout
            login_token = bitop.bit8_mearge(payload[16], payload[15]); 
            emit token_val(login_token);
            bool val = userloginsystem.remove_acess_token(login_token);
            if(val) return packet.user_logout_successful();
            return packet.user_logout_fail();
        }else if(opcode == 7){
            login_token = bitop.bit8_mearge(payload[16], payload[15]); 
            if(userloginsystem.check_acess_token(login_token) == false) return packet.user_data_add_token_fail();
            token = datastorage.add_acess_token(0, 1);
            return packet.user_data_add_token(token);
        }else if(opcode == 10){
            login_token = bitop.bit8_mearge(payload[16], payload[15]); 
            if(userloginsystem.check_acess_token(login_token) == false) return packet.user_data_update_token_fail();
            token = datastorage.add_acess_token(bitop.bit8_mearge(payload[14], payload[13]), 2);
            return packet.user_data_update_token(token);
        }else if(opcode == 16){
            login_token = bitop.bit8_mearge(payload[16], payload[15]); 
            if(userloginsystem.check_acess_token(login_token) == false) return packet.user_data_view_token_error();
            token = datastorage.add_acess_token(bitop.bit8_mearge(payload[14], payload[13]), 3);
            return packet.user_data_view_token(token);
        }else if(opcode == 19){
            login_token = bitop.bit8_mearge(payload[16], payload[15]); 
            if(userloginsystem.check_acess_token(login_token) == false) return packet.user_data_key_value_token_error();
            token = datastorage.add_acess_token(bitop.bit8_mearge(payload[14], payload[13]), 4);
            return packet.user_data_key_value_token(token);
        }
        else{
            return packet.dumy();
        }
        
    }


    function DataStore_Token_AccessPoint(uint16 token,string memory new_value,string memory new_key,bool aviable) public returns(string[] memory){
        return datastorage.execute_operation(token, new_value, new_key, aviable);
    }


    function control_system_client(uint8[17] memory payload) public returns(uint8[17] memory){
        clock.tick();
        uint8[17] memory dec = kasumi.decrypt(payload);
        return dec;
    }
    
}