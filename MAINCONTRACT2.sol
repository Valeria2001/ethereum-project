pragma solidity >=0.6.0 <=0.8.3;


import "@openzeppelin/contracts/token/ERC1155/IERC1155.sol";
import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "./erc1155-contract.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC1155/ERC1155Holder.sol";


contract MAINCONTRACT5 is  ERC1155Holder {

    IERC20 public token20;  //обьявляем структуру токена erc20
    IERC721 public token721; //обьявляем структуру токена erc721
    ERC1155Basic public token1155;

    event DoneStuff(address from);

    /**
     * @dev Constructor sets token that can be received
     */
   constructor(IERC20 token1, IERC721 token2, IERC1155 token3)  public {
        token20 = token1; // создаем erc20 токен из контракта  ERC20Basic
        //token1155 = token3;// создаем erc1155 токен из контракта  ERC1155 -- надо поменять на другой контракт
        token721 = token2;//  создаем erc21 токен из контракта  ERC721
        token1155 = new ERC1155Basic();
    }
    /**
     * @dev Do stuff, requires tokens
     */
    function doStuff(uint256 amount20, uint256 token721_id) external {
        address from = msg.sender;
        uint256 token1155_id;

        token20.transferFrom(from, address(this), amount20);
        token721.transferFrom(from, address(this), token721_id);
        token1155_id = token1155.create_erc1155_token(amount20, token721_id); //функция чеканки  erc1155
        require(token1155_id > 0, "ERC1155: not created");
        token4.safeTransferFrom(address(this), from, token1155_id, 1,"");
        emit DoneStuff(from);
    }
}
