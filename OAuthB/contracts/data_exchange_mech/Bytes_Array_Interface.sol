// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;
import "../utils/random_gen.sol";

contract Bytes_Array_Interface{
    // we have to make a queue for query from both client and user side
    // lets say that the client queue is cli_qu
    // and user queue is use_qu
    // the limit of request is about [from user side is 64 and from client side is 256]
    
    address private owner_address;
    RandomNumber public rand = new RandomNumber();
    uint8 private token_size =  16;
    uint8[256][17]  private cli_qu;
    uint8[64][16]   private use_qu;
    // therefore our package size is 128 bytes or 16 bytes... there bit incontency because higher 
    // bit were use for the identification in cli_qu whether it is a token communication package
    function get_client_token() internal returns(uint16){
        uint token = rand.get_random(token_size);
        return token;
    }
    function setup(address owner) internal{
        owner_address = owner;
    }

    


}
