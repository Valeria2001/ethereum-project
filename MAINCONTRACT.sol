pragma solidity >=0.6.0 <=0.8.3;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.4/contracts/token/ERC1155/IERC1155.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.4/contracts/token/ERC1155/ERC1155.sol";
import "https://github.com/Valeria2001/ethereum-project/blob/main/erc1155-contract.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.4/contracts/token/ERC20/IERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.4/contracts/token/ERC721/IERC721.sol";

contract MAINCONTRACT5 is  ERC1155Basic {   //контракт который обьединил  в себе  все вышеизложенное


    IERC20 public token20;  //обьявляем структуру токена erc20
    IERC721 public token721; //обьявляем структуру токена erc721
    IERC1155 public token1155;

    constructor(IERC20 token1, IERC721 token2, IERC1155 token3)  public {
        token20 = token1; // создаем erc20 токен из контракта  ERC20Basic
        token1155 = token3;// создаем erc1155 токен из контракта  ERC1155 -- надо поменять на другой контракт
        token721 = token2;//  создаем erc21 токен из контракта  ERC721
    }

    function put_aktiv(uint256 allowance, uint256 number_erc20, uint256 number_erc721, uint256 token721_id, address payable adres_sender, address payable adres_contract) public payable  {   //функция  передачи пользователем токенов в контракт и получения токена erc1155
	uint256 token1155_id;
        require(number_erc20 > 0, "You need to send some erc20");
    	require(number_erc721 == 1, "You need to send 1 erc721");
        token20.approve(adres_sender, allowance); //approve  allowance
        //uint256 allowance = token20.allowance(adres_sender, adres_contract);
        //require(allowance >= 1, "Check the token allowance");
        //token20.transfer(adres_contract,1);
        token20.transferFrom(adres_sender, adres_contract, number_erc20); //функция приема erc20 
        token721.transferFrom(adres_sender, adres_contract, token721_id);//функция приема erc721
        token1155_id = create_erc1155_token(number_erc20, token721_id); //функция чеканки  erc1155
        token1155.safeTransferFrom(adres_contract, adres_sender, token1155_id, 1,"");  // Oтправляет ERC1155 заказчику
        //emit Bought(amountTobuy);
    }


    function get_aktiv(uint256 token1155_id, uint256 number_erc20, uint token721_id) public {   //получение пользователем активов	
	uint256 allowance = token1155.balanceOf(msg.sender, token1155_id);// проверка на количество токенов с определенным id у заказчика
        require(allowance > 0, "you havent token1155");       
        token1155.safeTransferFrom(msg.sender, address(this), token1155_id, 1,"");  // получает ERC1155 от заказчика
        //token1155._burn(address(this), token1155_id, 1);//удаление 
        token20.transferFrom(address(this),msg.sender, number_erc20);   // отправка заказчику_токенов erc20 
        token721.transferFrom(address(this), msg.sender, token721_id);//отправка  заказчику  erc721
        //emit Sold(amount);
    }
}
