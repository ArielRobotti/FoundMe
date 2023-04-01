// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

//import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

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
    function sendTip(address payable _recipt)public payable{
        uint256 tip = msg.value;
        _recipt.transfer(tip-tip/10);  //el contrato se queda con el 10% de la propina
    }
    function withdraw(uint256 _amount)public payable{
        require(addressToAmountFounded[msg.sender] >= _amount);
        address payable recipient = payable(msg.sender);
        addressToAmountFounded[msg.sender] -= _amount;
        recipient.transfer(_amount);
    }
}

