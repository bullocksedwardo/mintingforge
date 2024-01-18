// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract NFT is ERC721, ERC721URIStorage {
    Counters.Counter private _tokenIds;

    //auto-increment field for each token
    //https://t.me/cryptodippdough/

    address contractAddress;

    constructor(address marketplaceAddress) ERC721("CryptoDippDough Tokens", "CDDT") {
        contractAddress = marketplaceAddress;

    /// @notice creates a new token
    /// @param tokenUri : token URI
    function createToken(string memory tokenURI) public returns (uint256) {
        //set a new token id for the token to be minted
        uint256 newTokenId = _tokenIds.current();
        _tokenIds.increment();

        _mint(msg.sender, newTokenId); //mint the token
        _setTokenURI(newTokenId, tokenURI); //generate token uri
        setApprovalForAll(contractAddress, true); //grant transaction permissions to the marketplace contract

        //return the new token id
        return newTokenId;
    }