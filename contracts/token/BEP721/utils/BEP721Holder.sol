// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "../IBEP721Receiver.sol";

  /**
   * @dev Implementation of the {IBEP721Receiver} interface.
   *
   * Accepts all token transfers.
   * Make sure the contract is able to use its token with {IBEP721-safeTransferFrom}, {IBEP721-approve} or {IBEP721-setApprovalForAll}.
   */
contract BEP721Holder is IBEP721Receiver {

    /**
     * @dev See {IBEP721Receiver-onBEP721Received}.
     *
     * Always returns `IBEP721Receiver.onBEP721Received.selector`.
     */
    function onBEP721Received(address, address, uint256, bytes memory) public virtual override returns (bytes4) {
        return this.onBEP721Received.selector;
    }
}
