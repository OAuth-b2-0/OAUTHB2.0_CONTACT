// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract Packets{
    uint8[17] private packet = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    // USER RESPONSE
    function user_login_send_access_token(uint16 token) public returns(uint8[17] memory){
        packet[0] = 2;
        packet[15] = uint8((token >> 8) & (2**8 - 1));
        packet[16] = uint8(token & (2**8 - 1));
        return packet;
    }
    function user_login_fail() public returns(uint8[17] memory){
        packet[0] = 2;
        return packet;
    }
    function user_logout_successful() public returns(uint8[17] memory){
        packet[0] = 5;
        return packet;
    }
    function user_logout_fail() public returns(uint8[17] memory){
        packet[0] = 6;
        return packet;
    }

    function user_data_add_token(uint16 token) public returns(uint8[17] memory){
        packet[0] = 8;
        packet[15] = uint8((token >> 8) & (2**8 - 1));
        packet[16] = uint8(token & (2**8 - 1));
        return packet;
    }
    function user_data_add_token_fail() public returns(uint8[17] memory){
        packet[0] = 9;
        return packet;
    }

    function user_data_update_token(uint16 token) public returns(uint8[17] memory){
        packet[0] = 11;
        packet[15] = uint8((token >> 8) & (2**8 - 1));
        packet[16] = uint8(token & (2**8 - 1));
        return packet;
    }
    function user_data_update_token_fail() public returns(uint8[17] memory){
        packet[0] = 12;
        return packet;
    }
    
    function user_data_manipulation_add_done() public returns(uint8[17] memory){
        packet[0] = 13;
        return packet;
    }

    function user_data_manipulation_update_done() public returns(uint8[17] memory){
        packet[0] = 14;
        return packet;
    }

    function user_data_manipulation_fail() public returns(uint8[17] memory){
        packet[0] = 15;
        return packet;
    }


    function user_data_view_token(uint16 token) public returns(uint8[17] memory){
        packet[0] = 17;
        packet[15] = uint8((token >> 8) & (2**8 - 1));
        packet[16] = uint8(token & (2**8 - 1));
        return packet;
    }
    function user_data_view_token_error() public returns(uint8[17] memory){
        packet[0] = 18;
        return packet;
    }

    function user_data_key_value_token(uint16 token) public returns(uint8[17] memory){
        packet[0] = 20;
        packet[15] = uint8((token >> 8) & (2**8 - 1));
        packet[16] = uint8(token & (2**8 - 1));
        return packet;
    }
    function user_data_key_value_token_error() public returns(uint8[17] memory){
        packet[0] = 21;
        return packet;
    }

    function user_client_id_token(uint16 token) public returns(uint8[17] memory){
        packet[0] = 23;
        packet[15] = uint8((token >> 8) & (2**8 - 1));
        packet[16] = uint8(token & (2**8 - 1));
        return packet;
    }
    function user_client_id_token_error() public returns(uint8[17] memory){
        packet[0] = 24;
        return packet;
    }

    function user_permit_client(uint8[17] memory permit) public returns(uint8[17] memory){
        permit[0] = 26;
        return permit;
    }
    function user_permit_client_error() public returns(uint8[17] memory){
        packet[0] = 27;
        return packet;
    }

    function user_permit_verify_succesful() public returns(uint8[17] memory){
        packet[0] = 29;
        return packet;
    }
    function user_permit_verify_fail() public returns(uint8[17] memory){
        packet[0] = 30;
        return packet;
    }


    function client_token_verification_success() public returns(uint8[17] memory){
        packet[0] = 32;
        return packet;
    }
    function client_token_verification_fail() public returns(uint8[17] memory){
        packet[0] = 33;
        return packet;
    }
    function client_token_verification_refresh() public returns(uint8[17] memory){
        packet[0] = 34;
        return packet;
    }


    function client_send_data_acess_token(uint16 token) public returns(uint8[17] memory){
        packet[0] = 39;
        packet[15] = uint8((token >> 8) & (2**8 - 1));
        packet[16] = uint8(token & (2**8 - 1));
        return packet;
    }
    function client_send_data_acess_token_error() public returns(uint8[17] memory){
        packet[0] = 40;
        return packet;
    }
    // SMAPLE OUT
    function dumy() public returns(uint8[17] memory){
        return packet;
    }
}