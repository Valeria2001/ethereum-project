pragma solidity >=0.6.0 <=0.8.3;
//import "./string2int.sol";
//import "https://github.com/Valeria2001/ethereum-project/blob/main/libs/oracle__api__calling.sol";
import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

//contract ERC1155Basic is ERC1155, TestIntToString, call_oracle__api {


contract ERC1155Basic is ERC1155 {  
    uint256 public COUNTER; // все должно быть приватным
    uint256 public my_contract_number_erc20;
    uint256 public my_contract_token721_id;
    string public _baseduri;     // url google cloud хостинга

    constructor() public ERC1155(""){ //обращение по api(что-то на стороне сервака будет ловить запрос)
    	_baseduri = "https://lera.github.hosting/api";
        COUNTER = 0;
    }
        

    function create_erc1155_token(uint256 number_erc20, uint256 token721_id) external returns(uint256){ //надо понять как сделать приватной позже    
       address ad_con;
       my_contract_number_erc20 = number_erc20;
       my_contract_token721_id =  token721_id;
       COUNTER++;                                   //id  токена  
       _mint(msg.sender, COUNTER, 1, "aaa");  
       //здесь пропишем функцию обращения по api к серверу flask для  создания json
       //request("aaa", "GET", _baseduri, "aaa"); //тут  обращаемся к url адресу   flask дальше  он все делает за нас
       return COUNTER;	   
    }
       
}


   
