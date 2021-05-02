pragma solidity ^0.5.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract SimpleToken721 is  ERC721 {

    constructor () public ERC721() {
        _mint(_msgSender(), 1);

    }
}
