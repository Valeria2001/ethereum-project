pragma solidity ^0.6.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.3.0/contracts/token/ERC1155/IERC1155.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC1155/ERC1155.sol";
import "https://github.com/Valeria2001/ethereum-project/blob/main/erc1155-contract";

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.3.0/contracts/token/ERC721/IERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";


interface IERC20 {

    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function allowance(address owner, address spender) external view returns (uint256);

    function transfer(address recipient, uint256 amount) external returns (bool);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);


    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}


contract ERC20Basic is IERC20 {

    string public constant name = "ERC20Basic";
    string public constant symbol = "ERC";
    uint8 public constant decimals = 18;


    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
    event Transfer(address indexed from, address indexed to, uint tokens);


    mapping(address => uint256) balances;

    mapping(address => mapping (address => uint256)) allowed;

    uint256 totalSupply_ = 10 ether;

    using SafeMath for uint256;

   constructor() public {
    balances[msg.sender] = totalSupply_;
    }

    function totalSupply() public override view returns (uint256) {
    return totalSupply_;
    }

    function balanceOf(address tokenOwner) public override view returns (uint256) {
        return balances[tokenOwner];
    }

    function transfer(address receiver, uint256 numTokens) public override returns (bool) {
        require(numTokens <= balances[msg.sender]);
        balances[msg.sender] = balances[msg.sender].sub(numTokens);
        balances[receiver] = balances[receiver].add(numTokens);
        emit Transfer(msg.sender, receiver, numTokens);
        return true;
    }

    function approve(address delegate, uint256 numTokens) public override returns (bool) {
        allowed[msg.sender][delegate] = numTokens;
        emit Approval(msg.sender, delegate, numTokens);
        return true;
    }

    function allowance(address owner, address delegate) public override view returns (uint) {
        return allowed[owner][delegate];
    }

    function transferFrom(address owner, address buyer, uint256 numTokens) public override returns (bool) {
        require(numTokens <= balances[owner]);
        require(numTokens <= allowed[owner][msg.sender]);

        balances[owner] = balances[owner].sub(numTokens);
        allowed[owner][msg.sender] = allowed[owner][msg.sender].sub(numTokens);
        balances[buyer] = balances[buyer].add(numTokens);
        emit Transfer(owner, buyer, numTokens);
        return true;
    }
}


library SafeMath {
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
      assert(b <= a);
      return a - b;
    }

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
      uint256 c = a + b;
      assert(c >= a);
      return c;
    }
}

contract MAINCONTRACT {   //контракт который обьединил  в себе  все вышеизложенное

    event Bought(uint256 amount); // событие,   которое запишется в журнал
    event Sold(uint256 amount);

    IERC20 public token20;  //обьявляем структуру токена erc20
    IERC721 public token721; //обьявляем структуру токена erc721
    IERC1155 public token1155;

    constructor() public {
        token20 = new ERC20Basic(); // создаем erc20 токен из контракта  ERC20Basic
        token1155 = new ERC1155Basic();// создаем erc1155 токен из контракта  ERC1155 -- надо поменять на другой контракт
        token721 = new ERC721();//  создаем erc21 токен из контракта  ERC721
    }

    function put_aktiv(uint256 number_erc20, uint256 number_erc721, uint256 token721_id) payable public {   //функция  передачи пользователем токенов в контракт и получения токена erc1155
	uint256 token1155_id;
        require(number_erc20 > 0, "You need to send some erc20");
	require(number_erc721 == 1, "You need to send 1 erc721");
        token20.transferFrom(msg.sender, address(this), number_erc20); //функция приема erc20 
        token721.transferFrom(msg.sender, address(this), token721_id);//функция приема erc721
        token1155_id = create_erc1155_token(number_erc20, token721_id); //функция чеканки  erc1155(в этой функции  реализовано запихивание в метадату)
        token1155.safeTransferFrom(address(this), msg.sender, token1155_id, 1,"");  // Oтправляет ERC1155 заказчику
        //emit Bought(amountTobuy);
    }

    function get_aktiv(uint256 token1155_id) public {   //получение пользователем активов	
	uint256 allowance = token1155.balanceOf(msg.sender, token1155_id);// проверка на количество токенов с определенным id у заказчика
        require(allowance > 0, "you havent token1155");       
        token1155.safeTransferFrom(msg.sender, address(this), token1155_id, 1,"");  // получает ERC1155 от заказчика
        // тут должны быть функции извлечения number_erc20 и token721_id  из метадаты erc1155//
        token20.transferFrom(address(this),msg.sender, number_erc20);   // отправка заказчику_токенов erc20 
        token721.transferFrom(address(this), msg.sender, token721_id);//отправка  заказчику  erc721
        //emit Sold(amount);
    }
}
