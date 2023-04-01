// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract FoundMe {

    mapping(address => uint256) aportes;

    function found() public payable{
        aportes[msg.sender] += msg.value;
    }
    function getFoundFrom(address _founder)public view returns(uint256){
        return aportes[_founder];
    }
    function getFoundFromyMe()public view returns(uint256){
        return aportes[msg.sender];
    }
    
}