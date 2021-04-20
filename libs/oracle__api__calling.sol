

pragma solidity >= 0.4.22 < 0.5;
//pragma solidity ^0.4.4;
import "https://github.com/provable-things/ethereum-api/blob/master/provableAPI_0.4.25.sol"; //подобрать актуальную  версию

contract call_oracle__api is ProvableI {

    function request(string memory _query, string memory _method, string memory _url, string memory _kwargs) public payable { 
      if (provable_getPrice(“computation”) > address(this).balance) {
       emit LogNewProvableQuery(“Provable query was NOT sent, please add some ETH to cover for the query fee”);
      } 
      else {
         emit LogNewProvableQuery(“Provable query was sent, standing by for the answer…”);
         provable_query(“computation”,[_query,_method,_url,_kwargs]);
      }
    }
 } 
