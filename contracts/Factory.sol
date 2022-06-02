// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

// importing the ERC-721 contract to deploy for an collection
import "./NFT.sol";

contract Factory {

    uint public collectionCount;

    mapping(uint => address) public collections;

    event NFTCollectionCreated(string _artistName, address _collectionAddress, uint _timestamp);

    function createNFTCollection(string memory _artistName, string memory _artistSymbol, string memory _baseUri, bytes32 _salt) external returns (address collectionAddress) {
        NFT nft = new NFT{salt: _salt}(_artistName, _artistSymbol, _baseUri);
        collectionCount++;
        collections[collectionCount] = address(nft);
        nft.transferOwnership(msg.sender);
        emit NFTCollectionCreated(_artistName, collectionAddress, block.timestamp);
        return collections[collectionCount];
    }

    function getCollection(uint _id) external view returns(address) {
      return collections[_id];
    }

    function getCount() external view returns(uint) {
      return collectionCount;
    }
}
