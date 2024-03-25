// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;


contract ContractClock{
    uint16 private system_clock = 0;
    uint16 private system_state = 0;

    function tick() public{
        
        if (system_clock < (2*16 -1)){
            system_clock += 1;
        }else{
            system_clock = 0;
            if (system_state < (2*16 -1)){
                system_state += 1;
            }else{
                system_state = 0;
            }
            
        }
        
    }
    function get_system_clock() public view returns(uint16){
        return system_clock;
    }
    function get_system_state() public view returns(uint16){
        return system_state;
    }
    function is_valid(uint16 ref_time) public returns(bool){
        int16 delta = int16(ref_time - system_clock);
        if(delta > 0) return true;
        else return false;
    }

}