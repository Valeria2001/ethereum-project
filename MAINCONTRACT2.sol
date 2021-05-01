pragma solidity ^0.5.0;

import "./myERC721.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";


contract tokenFactory {

    address[] tokenAddress;
    //IERC20 token20;  обьявляем структуру токена erc20

   constructor(IERC20 token1)  public {

    IERC20 token20; 

   }
 
    function deploy721Contract(string calldata name,string calldata symbol,string calldata baseUrl) external returns (myERC721 cardAddress) { //сюда передаются параметры для токена из веба
        
        token20.transferFrom(msg.sender, address(this), 1);
        token20.transferFrom(msg.sender, address(this), 1);// тут должны быть  id erc20  на основе чего генерится  все
        myERC721 newCards = new myERC721(name, symbol, baseUrl);

        tokenAddress.push(address(newCards));  //надо  дбавить  erc1155 factory
        return newCards;
    }

}
