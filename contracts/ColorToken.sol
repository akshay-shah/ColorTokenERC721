// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract ColorToken is ERC721 {

    address public admin;
    string[] public colors;
    mapping(string => bool) public doesColorExist;

    constructor() ERC721("ColorToken", "COLOR") {
        admin = msg.sender;
    }   

    function mint(address to,string memory _color) public restricted {
        require(doesColorExist[_color] == false);
        colors.push(_color);
        doesColorExist[_color] = true;
        uint _id = colors.length - 1;
        _mint(to, _id);
    }

    modifier restricted {
        require(msg.sender == admin);
        _;
    }
}