// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract Packets{
    uint8[17] private packet = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    
    function user_no_response() public returns(uint8[17] memory){
        packet[0] = 0;
        return packet;
    }
    
    function user_send_notification_token(uint16 _token) public returns(uint8[17] memory){
        packet[0] = 10;
        packet[15] = uint8((_token >> 8) & (2**8 - 1));
        packet[16] = uint8(_token & (2**8 - 1));

        return packet;
    }
    function user_not_allowed() public returns(uint8[17] memory){
        packet[0] = 255;
        
        return packet;
    }

    function user_send_client_id(uint16 client_id)
    function dumy() public returns(uint8[17] memory){
        return packet;
    }
}