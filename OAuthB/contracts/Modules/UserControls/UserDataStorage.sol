// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;


import "../../utils/StringFunction.sol";
import "../../utils/RandomNumber.sol";

contract UserDataStorage {
   int private __max_artifacts = 255;
   uint8 private __count_artifacts = 0;

   // string function
   StringFunction private string_function = new StringFunction();
   // random number genrator
   RandomNumber private rand = new RandomNumber();
   
   // struct for artifact
   struct artifact{
        uint8 index;
        uint created;
        uint modify;
        bool is_aviable;
        string data;
   }

   // artifact collection
   mapping (string => artifact) private artifacts_map;
   string [] private artifact_index;
   uint16 [][] tokens_permission;
   string[]  ret;
   // format [token, value acess permission(0~255), opcode]

   function is_in(uint16[][] memory list,uint16 token) internal returns(bool){
        for(uint8 i = 0; i < list.length; i++){
            if(list[i][0] == token){
                return true;
            }
        }
        return false;
    }

    function genrate_token() internal returns(uint16){
        return uint16(rand.get_random(16));
    }


    function add_acess_token(uint16 element_acess, uint16 opcode) public returns(uint16 ){
        uint16 token;
        while(true){
            token = genrate_token();
            if(is_in(tokens_permission, token) == false){
                uint16[3] memory temp = [token,element_acess,opcode];
                tokens_permission.push(temp);
                break;
            }
        }
        return token;
    }
    function clear_internel_list() internal{
        for(uint8 j = 0; j < ret.length;j++){
                        ret.pop();
        }
    }
    function execute_operation(uint16 token,string memory new_value,string memory new_key,bool aviable) public returns(string[] memory){
        // this function view, update, add
        // todo: add delete function and handle index updating
        clear_internel_list();
        for(uint8 i = 0; i < tokens_permission.length; i++){
            if(tokens_permission[i][0] == token){
                uint16[] memory temp = tokens_permission[i];
                artifact memory me_temp;
                artifact storage st_temp;
                if(temp[2] == 1){
                    me_temp = artifact(__count_artifacts,block.timestamp,block.timestamp,false,new_value);
                    artifacts_map[new_key]= me_temp;
                    artifact_index.push(new_key);
                    __count_artifacts = __count_artifacts + 1;
                    ret.push(new_value);

                }else if(temp[2] == 2){
                    st_temp = artifacts_map[artifact_index[temp[1]]];
                    st_temp.modify = block.timestamp;
                    st_temp.data = new_value;
                    ret.push(new_value);
                }else if(temp[2] == 3){
                    me_temp = artifacts_map[artifact_index[temp[1]]];
                    ret.push(me_temp.data);
                }else if(temp[2] == 4){
                    for(uint8 j = 0; j < artifact_index.length;j++){
                        ret.push(artifact_index[j]);
                    }
                }else if(temp[2] == 5){
                    st_temp = artifacts_map[artifact_index[temp[1]]];
                    st_temp.modify = block.timestamp;
                    st_temp.is_aviable = aviable;
                    if(aviable) ret.push("true");
                    else ret.push("false");
                }
                break;
            }
        }
        return ret;
    }

   
   
  }