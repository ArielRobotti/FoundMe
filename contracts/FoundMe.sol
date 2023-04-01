// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";


contract FoundMe{
    mapping (address => uint256) addressToAmountFounded;
    function found() public payable{
        addressToAmountFounded[msg.sender] += msg.value;
    }
    function getFounds(address _acount)public view returns(uint256){
        return addressToAmountFounded[_acount];
    }
    function getMyAmount()public view returns(uint256){
        return addressToAmountFounded[msg.sender];
    }
}

