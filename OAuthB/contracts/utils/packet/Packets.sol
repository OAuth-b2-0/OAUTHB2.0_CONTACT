// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract Packets{
    uint8[17] private packet = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    
    // USER SERVER MESSAGE
    //// No Response
    function user_no_response() public returns(uint8[17] memory){
        packet[0] = 0;
        return packet;
    }
    //// Notification Token
    function user_send_notification_token(uint16 _token) public returns(uint8[17] memory){
        packet[0] = 10;
        packet[15] = uint8((_token >> 8) & (2**8 - 1));
        packet[16] = uint8(_token & (2**8 - 1));

        return packet;
    }
    function user_send_notification_token_error() public returns(uint8[17] memory){
        packet[0] = 1;
        return packet;
    }
    //// Client ID
    function  user_genrate_send_client_id(uint16 _client_id) public returns(uint8[17]){
        packet[0] = 3;
        packet[15] = uint8((_client_id >> 8) & (2**8 - 1));
        packet[16] = uint8(_client_id & (2**8 - 1));
        return packet;
    }
    function  user_genrate_send_client_id_error() public returns(uint8[17]){
        packet[0] = 3;
        return packet;
    }
    
    //// send data token
    function user_send_data_token(uint16 _change_data_token) public returns(uint8[17] memory){
        packet[0] = 3;
        packet[15] = uint8((_change_data_token >> 8) & (2**8 - 1));
        packet[16] = uint8(_change_data_token & (2**8 - 1));
        return packet;
    }
    ////// add data to user storage
    function user_send_add_data() public returns(uint8[17] memory){
        packet[0] = 13;
        return packet;
    }
    function user_send_add_data_error() public returns(uint8[17] memory){
        packet[0] = 6;
        return packet;
    }
    ////// update data to user storage
    function user_send_update_data() public returns(uint8[17] memory){
        packet[0] = 8;
        return packet;
    }
    function user_send_update_data_error() public returns(uint8[17] memory){
        packet[0] = 9;
        return packet;
    }

    //// user not allowed
    function user_not_allowed() public returns(uint8[17] memory){
        packet[0] = 255;
        return packet;
    }





    // CLIENT SERVER MESSAGE
    //// No response
    function client_no_response() public returns(uint8[17] memory){
        packet[0] = 0;
        return packet;
    }
    //// Valid and Data token Access
    function client_is_valid_access(uint16 _data_access) public returns(uint8[17] memory){
        packet[0] = 6;
        packet[15] = uint8((_data_access >> 8) & (2**8 - 1));
        packet[16] = uint8(_data_access & (2**8 - 1));
        return packet;
    }
    function client_is_valid_access_error() public returns(uint8[17] memory){
        packet[0] = 7;
        return packet;
    }
    // SMAPLE OUT
    function dumy() public returns(uint8[17] memory){
        return packet;
    }
}