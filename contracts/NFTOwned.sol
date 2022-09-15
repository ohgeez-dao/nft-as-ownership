// SPDX-License-Identifier: Unlicensed
pragma solidity >=0.8.0;

interface IOwnership {
    function isOwner(address target, address account) external returns (bool);

    function transferOwnership(uint256 id) external;
}

abstract contract NFTOwned {
    address public constant OWNERSHIP = 0x0000000000000000000000000000000000000000;

    event SetOwnerId(uint256 indexed newOwnerId);

    modifier onlyOwner() virtual {
        require(IOwnership(OWNERSHIP).isOwner(address(this), msg.sender), "UNAUTHORIZED");
        _;
    }

    constructor(uint256 ownerId) {
        IOwnership(OWNERSHIP).transferOwnership(ownerId);
    }

    function setOwnerId(uint256 ownerId) public virtual onlyOwner {
        IOwnership(OWNERSHIP).transferOwnership(ownerId);
    }
}
