// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;




contract UserDataStorage {
  /*
   * @their only 256 value can be stored in this contract
   */
   int private __max_artifacts = 255;
   int private __count_artifacts = 0;
   // this is access token  
   string private __access_token = "abc";
   
   struct date{
        // date format DD/MM/YYYY
        string date_val;
        int month;
        int year;
        int day;
   }
   
   // struct for artifact
   struct artifact{
        int no;
        date created;
        date modify;
        bool is_aviable;
        bool random;
        string data;
   }

   // artifact collection
   mapping (string => artifact) private artifacts_map;
   string [] private keys;

   // utility function
   function compare(string memory str1, string memory str2) internal pure returns (bool) {
        if (bytes(str1).length != bytes(str2).length) {
            return false;
        }
        return keccak256(abi.encodePacked(str1)) == keccak256(abi.encodePacked(str2));
    }
   function is_in(string[] memory list_keys,string memory key) internal pure returns (bool) {
        for (uint i=0; i<list_keys.length; i++) {
            if(compare(list_keys[i], key)){
                return true;
            }
        }
        return false;
   }
   function random_text(uint len) internal pure returns (string memory){
    return "abc";
   }
   function random_num(uint len) internal pure returns (string memory){
    return "123";
   }


   // access functions
   function add_artifact(string memory _key,string memory _date,string memory _artifact,bool _aviable,bool _random,string memory _access_token) public{
        require(!is_in(keys, _key),"key is already present in mapping use update function");
        require(compare(__access_token, _access_token),"your access token were not match");
        date memory date_cm = date(_date,0,0,0);
        artifact memory temp = artifact(__count_artifacts,date_cm,date_cm,_aviable,_random,_artifact);
        __count_artifacts += 1;
        keys.push(_key);
        artifacts_map[_key] = temp;
   }
   function update_artifact(string memory _key,string memory _date,string memory _artifact,string memory _access_token)public {
        require(is_in(keys, _key),"key is not present in mapping use add function");
        require(compare(__access_token, _access_token),"your access token were not match");
        date memory date_m = date(_date,0,0,0);
        artifact storage temp = artifacts_map[_key];
        temp.modify = date_m;
        temp.data = _artifact;
   }
   function update_artifact_premission_aviable(string memory _key,string memory _date,bool _aviable,string memory _access_token) public{
        require(is_in(keys, _key),"key is not present in mapping use add function");
        require(compare(__access_token, _access_token),"your access token were not match");
        date memory date_m = date(_date,0,0,0);
        artifact storage temp = artifacts_map[_key];
        temp.modify = date_m;
        temp.is_aviable = _aviable;
   }
   function update_artifact_premission_random(string memory _key,string memory _date,bool _random,string memory _access_token) public{
        require(is_in(keys, _key),"key is not present in mapping use add function");
        require(compare(__access_token, _access_token),"your access token were not match");
        date memory date_m = date(_date,0,0,0);
        artifact storage temp = artifacts_map[_key];
        temp.modify = date_m;
        temp.random = _random;
   }
   
    /*
    * you have to add new permission
    */
    function get_keys(string memory _access_token) public view returns(string[] memory){
        require(compare(__access_token, _access_token),"your access token were not match");
        return keys;
    }
      function get_artifact(string memory _key,string memory _access_token)public view returns(string memory){
        require(compare(__access_token, _access_token),"your access token were not match");
        return artifacts_map[_key].data;
    }
    function artifact_modify_date(string memory _key,string memory _access_token)public view returns(string memory){
        require(compare(__access_token, _access_token),"your access token were not match");
        return artifacts_map[_key].modify.date_val;
    }
    function artifact_created_date(string memory _key,string memory _access_token)public view returns(string memory){
        require(compare(__access_token, _access_token),"your access token were not match");
        return artifacts_map[_key].created.date_val;
    }

    // access token change
    function acess_token_change(string memory _access_token) public returns (string memory){
        require(compare(__access_token, _access_token),"your access token were not match");
        __access_token = random_text(10);
        return __access_token;
    }

  }