// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import './Allowance.sol';

contract SimpleWallet is Allowance {

    event MoneySend(address indexed _beneficiary, uint _amount);
    event MoneyReceived(address indexed _from, uint _amount);

    function withdrawMoney(address payable _to, uint _amount) public ownerOrAllowed(_amount) {
        require(_amount <= address(this).balanse, "There are not enough found in the smart contract");
        if (!isOwner()) {
            reduceAllowance(msg.sender, _amount);
        }
        emit MoneySend(_to, _amount);
        _to.transfer(_amount);
    }

    function renounceOwnership() public onlyOwner {
        revert("Can't renouce ownership here");
    }

    function sendMoney() public payable {
        emit MoneyReceived(msg.sender, msg.value);
    }
}
