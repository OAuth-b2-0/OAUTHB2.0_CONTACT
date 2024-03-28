// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

import "../utils/packet/Packets.sol";
import "./ContractClock.sol";
import "../utils/enc/KASUMI.sol";
import "./UserControls/UserLoginSystem.sol";
import "../utils/BitWiseOperation.sol";
import "./UserControls/UserDataStorage.sol";
import "./UserControls/IssuseResolver.sol";



contract ControlSystem{

    ContractClock private clock = new ContractClock();
    UserLoginSystem private userloginsystem = new UserLoginSystem();
    BitWiseOperation private bitop = new BitWiseOperation();
    UserDataStorage private datastorage = new UserDataStorage();
    IssuseResolver private issuse_resolver = new IssuseResolver();

    event token_val(uint16 indexed val);
    uint8[] permit; 

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


        else if(opcode == 22){
            login_token = bitop.bit8_mearge(payload[16], payload[15]); 
            if(userloginsystem.check_acess_token(login_token) == false) return packet.user_client_id_token_error();
            token = issuse_resolver.make_client_id();
            return packet.user_client_id_token(token);
        }else if(opcode == 28){
            login_token = bitop.bit8_mearge(payload[16], payload[15]); 
            if(userloginsystem.check_acess_token(login_token) == false) return packet.user_permit_client_error();
            // format [opcode,client_id,clienrt_id,per1,per2,per3,per4,per5,per6,per7,per8,_,_,_,_,auth,auth]
            for(uint8 i = 0;i< permit.length;i++){
                permit.pop();
            }
            permit.push(26);
            permit.push(payload[1]);
            permit.push(payload[2]);

            permit.push(payload[3]);
            permit.push(payload[4]);
            permit.push(payload[5]);
            permit.push(payload[6]);
            permit.push(payload[7]);
            permit.push(payload[8]);
            permit.push(payload[9]);
            permit.push(payload[10]);

            if(issuse_resolver.permit_verify(permit)) return packet.user_permit_verify_succesful();
            else return packet.user_permit_verify_fail();
        }else{
            return packet.dumy();
        }
        
    }


    function DataStore_Token_AccessPoint(uint16 token,string memory new_value,string memory new_key,bool aviable) public returns(string[] memory){
        return datastorage.execute_operation(token, new_value, new_key, aviable);
    }

    function notification(uint8[17] memory payload) public returns(uint8[][] memory){
        uint16 login_token = bitop.bit8_mearge(payload[16], payload[15]); 
        require(userloginsystem.check_acess_token(login_token) == false, "user is not login");
        return issuse_resolver.get_notification();
    }

    function control_system_client(uint8[17] memory payload) public returns(uint8[17] memory){
        clock.tick();
        // uint8[17] memory dec = kasumi.decrypt(payload);
        uint8[17] memory payload_temp;
        uint16 clock_con;
        uint16 clock_sys;
        uint8 delta = 5;
        uint8[17] memory ret = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        Packets packet = new Packets();
        uint8 opcode = payload[0];
        uint16 client_id;
        if(opcode == 25){
            client_id = bitop.bit8_mearge(payload[1], payload[0]);
            uint8[] memory temp = issuse_resolver.get_permit(client_id);
            clock_sys = clock.get_system_clock();
            clock_con = clock.get_system_state();
            
            clock_sys = clock_sys + delta;
            temp[11] = uint8(clock_con >> 8);
            temp[12] = uint8(clock_con & (2**8 -1));
            temp[13] = uint8(clock_sys >> 8);
            temp[14] = uint8(clock_sys & (2**8 -1));
            temp[15] = 1;
            for(uint8 i= 0;i > 17;i++){
                ret[i] = temp[i];
            }
            return kasumi.encription(ret);
        }else if(opcode == 31){
            payload_temp = kasumi.decrypt(payload);
            clock_sys = clock.get_system_clock();
            clock_con = clock.get_system_state();
            if((clock_con == bitop.bit8_mearge(payload_temp[12], payload_temp[11]))){
                if(clock.is_valid(bitop.bit8_mearge(payload_temp[14], payload_temp[13]))) return packet.client_token_verification_success();
            }else return packet.client_token_verification_refresh();
        }else if(opcode == 35){
            //todo: add error
            payload_temp = kasumi.decrypt(payload);
            clock_sys = clock.get_system_clock();
            clock_con = clock.get_system_state();
            clock_sys = clock_sys + delta;
            payload_temp[11] = uint8(clock_con >> 8);
            payload_temp[12] = uint8(clock_con & (2**8 -1));
            payload_temp[13] = uint8(clock_sys >> 8);
            payload_temp[14] = uint8(clock_sys & (2**8 -1));
            return payload_temp;
        }
        else{
            uint8 index = opcode >> 4;
            index = index - 3;
            client_id = datastorage.add_acess_token(index, 3);
        }
    }
    
}