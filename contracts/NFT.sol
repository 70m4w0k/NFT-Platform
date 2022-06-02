// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;
 
import "../node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "../node_modules/@openzeppelin/contracts/utils/Counters.sol";
import "../node_modules/@openzeppelin/contracts/access/Ownable.sol";
 
contract NFT is ERC721, Ownable {
    
    string public baseURI;
    uint public tokenCount;

    constructor(string memory _name, string memory _symbol, string memory _baseUri) ERC721(_name, _symbol) {
        setBaseUri(_baseUri);
    }

    function setBaseUri(string memory _uri) public onlyOwner {
        baseURI = _uri;
    }

    function _baseURI() internal view override returns (string memory) {
        return baseURI;
    }

    function mint() public onlyOwner {
        tokenCount++;
        _safeMint(msg.sender, tokenCount);
    }

    function getCount() public view returns(uint) {
        return tokenCount;
    }
}