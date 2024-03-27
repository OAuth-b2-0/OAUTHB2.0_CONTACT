// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

import "../../utils/RandomNumber.sol";

contract UserLoginSystem{

    RandomNumber private rand = new RandomNumber();
    // limit the no of user
    uint8 private limit = 5;
    uint8 private usercount = 0; 
    uint16[]  acess_code;

    function is_in(uint16[] memory list,uint16 token) internal returns(bool){
        for(uint8 i = 0; i < list.length; i++){
            if(list[i] == token){
                return true;
            }
        }
        return false;
    }

    function genrate_token() internal returns(uint16){
        return uint16(rand.get_random(16));
    }

    function add_acess() public returns(uint16){
        uint16 token;
        if(acess_code.length >= limit){
            return 0;
        }
        while(true){
            token = genrate_token();
            if(token == 0) continue;
            if(is_in(acess_code, token) == false){
                acess_code.push(token);
                break;
            }
        }
        return token;
    }
    function remove_acess_token(uint16 token) public returns(bool){
        
        for(uint8 i = 0; i < acess_code.length; i++){
            if(acess_code[i] == token){
                delete acess_code[i];
                return true;
            }
        }
        return false;
        
    }
    function check_acess_token(uint16 token) public returns(bool){
        return is_in(acess_code, token);
    }


}