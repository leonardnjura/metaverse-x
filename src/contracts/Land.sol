// SPDX-License-Identifier: MIT

pragma solidity ^0.8.2;


import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";



contract Land is ERC721 {
    uint256 public cost = 1 ether;
    uint256 public maxSupply = 5;
    uint256 public totalSupply = 0;

    struct Building {
        string name;
        address owner;
        int256 posX;
        int256 posY;
        int256 posZ;
        uint256 sizeX;
        uint256 sizeY;
        uint256 sizeZ;
    }

    Building[] public buildings;

    constructor(
        string memory _name,
        string memory _symbol,
        uint256 _cost
    ) ERC721(_name, _symbol) {
        cost = _cost;
        buildings.push(
            Building("City Hall", address(0x0), 0, 0, 0, 10, 10, 10) //address(0x0) means available land
        );
        buildings.push(Building("Stadium", address(0x0), 0, 10, 0, 10, 5, 3));
        buildings.push(
            Building("University", address(0x0), 0, -10, 0, 10, 5, 3)
        );
        buildings.push(
            Building("Shopping Plaza 1", address(0x0), 10, 0, 0, 5, 25, 5)
        );
        buildings.push(
            Building("Shopping Plaza 2", address(0x0), -10, 0, 0, 5, 25, 5)
        );
    }

    function mint(uint256 _id) public payable {
        uint256 supply = totalSupply;
        require(supply <= maxSupply);
        require(buildings[_id - 1].owner == address(0x0)); //ensure that land to be minted/sold has no owner currently
        require(msg.value >= 1 ether); //money must be greater than one ether

        //ready to buy land..
        buildings[_id - 1].owner = msg.sender;
        totalSupply = totalSupply + 1;
        _safeMint(msg.sender, _id); //from ERC721 contracts, handles the buying
    }

    //implement funcs from ERC721
    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) public override {
        require(
            _isApprovedOrOwner(_msgSender(), tokenId),
            "ERC721: transfer caller is not owner or approved"
        );

        buildings[tokenId - 1].owner = to;
        _transfer(from, to, tokenId);
    }

    function getBuildings() public view returns (Building[] memory) {
        //reads from blockchain
        return buildings;
    }

    function getBuilding(uint256 _id) public view returns (Building memory) {
        return buildings[_id - 1];
    }
}
