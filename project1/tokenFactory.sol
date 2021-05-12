pragma solidity ^0.5.0;

import "https://github.com/v0landem0rt/ethereum-project/blob/main/project1/myERC721.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";


contract tokenFactory {

    address[] tokenAddress;
    IERC20 token20;  

   constructor(IERC20 token1)  public {

    token20 = token1;

   }


    function deploy721Contract(string calldata name,string calldata symbol,string calldata baseUrl) external returns (myERC721 cardAddress) { //сюда передаются параметры для токена из веба
       
        
        myERC721 newCards = new myERC721(name, symbol, baseUrl);

        tokenAddress.push(address(newCards)); 
        return newCards; //returns msg.sender erc721 token
    }

}
