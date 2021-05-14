//WARNING! Do not use in main ethereum network
//This code minting erc1155 token with sample data in it
pragma solidity >=0.6.0 <=0.8.3;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract ERC1155Basic is ERC1155 {
    uint256 public COUNTER; 
    uint256 public my_contract_number_erc20;
    uint256 public my_contract_token721_id;
    string public _baseduri;     
    constructor() public ERC1155(""){ 
        COUNTER = 0;
    }


    function create_erc1155_token(bytes calldata token_data, string calldata inside_data) external returns(uint256){ 
       COUNTER++;
       _mint(msg.sender, COUNTER, 1, token_data);
       emit URI(inside_data, COUNTER);
       _setURI(inside_data); 
       return COUNTER;
    }

}



   
