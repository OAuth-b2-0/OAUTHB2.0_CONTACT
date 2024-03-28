// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

import "../../utils/BitWiseOperation.sol";

contract NotificationSystem{
    uint8 [][] messages;
    BitWiseOperation private bitop = new BitWiseOperation();

    function add_message(uint8[17] memory message) public returns(bool){
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
    function retrive_notification() public returns(uint8[][] memory){
        return messages;
    }

}