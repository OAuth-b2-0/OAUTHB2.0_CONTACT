// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;


import "../../utils/StringFunction.sol";

contract UserDataStorage {
  /*
   * @their only 256 value can be stored in this contract
   */
   int private __max_artifacts = 255;
   int private __count_artifacts = 0;
   StringFunction private string_function = new StringFunction();
   
   // struct for artifact
   struct artifact{
        int no;
        uint created;
        uint modify;
        bool is_aviable;
        bool random;
        string data;
   }

   // artifact collection
   mapping (string => artifact) private artifacts_map;
   string [] private artifact_index;
   uint8 [][] private tokens;

   
   
  }