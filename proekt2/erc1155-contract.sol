pragma solidity >=0.6.0 <=0.8.3;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";



contract ERC1155Basic is ERC1155 {
    uint256 public COUNTER; // все должно быть приватным
    uint256 public my_contract_number_erc20;
    uint256 public my_contract_token721_id;
    string public _baseduri;     
    constructor() public ERC1155(""){ 
        COUNTER = 0;
    }


    function create_erc1155_token(bytes calldata token_data) external returns(uint256){ //надо понять как сделать приватной позже
       COUNTER++;
       _mint(msg.sender, COUNTER, 1, token_data);
       return COUNTER;
    }

}



   
