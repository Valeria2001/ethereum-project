pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract SimpleToken20 is ERC20 {

    /* Constructor that gives _msgSender() all of existing tokens.
     */
    constructor () public ERC20() {
        _mint(_msgSender(), 1);
    }
}
