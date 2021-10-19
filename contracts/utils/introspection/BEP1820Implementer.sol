// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.8.0;

import "./IBEP1820Implementer.sol";

/**
 * @dev Implementation of the {IBEP1820Implementer} interface.
 *
 * Contracts may inherit from this and call {_registerInterfaceForAddress} to
 * declare their willingness to be implementers.
 * {IBEP1820Registry-setInterfaceImplementer} should then be called for the
 * registration to be complete.
 */
contract BEP1820Implementer is IBEP1820Implementer {
    bytes32 constant private _BEP1820_ACCEPT_MAGIC = keccak256(abi.encodePacked("BEP1820_ACCEPT_MAGIC"));

    mapping(bytes32 => mapping(address => bool)) private _supportedInterfaces;

    /**
     * See {IBEP1820Implementer-canImplementInterfaceForAddress}.
     */
    function canImplementInterfaceForAddress(bytes32 interfaceHash, address account) public view virtual override returns (bytes32) {
        return _supportedInterfaces[interfaceHash][account] ? _BEP1820_ACCEPT_MAGIC : bytes32(0x00);
    }

    /**
     * @dev Declares the contract as willing to be an implementer of
     * `interfaceHash` for `account`.
     *
     * See {IBEP1820Registry-setInterfaceImplementer} and
     * {IBEP1820Registry-interfaceHash}.
     */
    function _registerInterfaceForAddress(bytes32 interfaceHash, address account) internal virtual {
        _supportedInterfaces[interfaceHash][account] = true;
    }
}
