// SPDX-License-Identifier: Unlicensed
pragma solidity >=0.8.0;

import "./ERC721.sol";

contract Ownership is ERC721 {
    mapping(uint256 => mapping(address => bool)) public owned;
    mapping(address => uint256) public ownerId;

    uint256 internal _nextId = 1;

    event TransferOwnership(address indexed target, uint256 indexed fromId, uint256 indexed toId);

    constructor() ERC721("Ownership", "OWN") {
        // Empty
    }

    function tokenURI(uint256) public view virtual override returns (string memory) {
        return "";
    }

    function isOwner(address target, address account) external view returns (bool) {
        uint256 id = ownerId[target];
        if (id == 0) return false;
        return _ownerOf[id] == account;
    }

    function mint(address to) external {
        _mint(to, _nextId++);
    }

    function transferOwnership(uint256 id) external {
        require(id != 0, "INVALID_ID");
        require(_ownerOf[id] != address(0), "NOT_EXISTENT");

        uint256 prevId = ownerId[msg.sender];
        owned[prevId][msg.sender] = false;
        owned[id][msg.sender] = true;
        ownerId[msg.sender] = id;

        emit TransferOwnership(msg.sender, prevId, id);
    }
}
