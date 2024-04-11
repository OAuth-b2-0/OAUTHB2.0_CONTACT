// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

import "../../utils/BitWiseOperation.sol";

contract NotificationSystem{
    uint8 [][] public  messages;
    BitWiseOperation private bitop = new BitWiseOperation();

    function add_message(uint8[] memory message) public returns(bool){
        messages.push(message);
        return true;
    }
    function remove_message(uint16 message_id) public returns(bool){
        for(uint8 i = 0;i < messages.length ; i++){
            if(bitop.bit8_mearge(messages[i][1],messages[i][0]) == message_id){
                delete messages[i];
                return true;
            }
        }
        return false;
    }
    // function get(uint16 message_id) public returns(uint8[17] memory){
    //     uint8[17] memory temp = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    //     for(uint8 i = 0;i < messages.length ; i++){
    //         if(bitop.bit8_mearge(messages[i][1],messages[i][0]) == message_id){
    //             return bitop.convert_uint8__to_uint817(messages[i]);
    //         }
    //     }
    //     return temp;
    // }
    function retrive_notification() public returns(uint8[][] memory){
        return messages;
    }

}