// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

contract SimpleOperations {

    function calculateAverage(
        uint256 a,
        uint256 b
    ) public pure returns (uint256) {

        return (a + b) / 2;

    }

    function getBit(uint256 num, uint256 position) public pure returns (uint8) {
        require(position > 0);
        uint8 bit;
        
        while((num != 0) && (position != 0)){
            bit = uint8(num % 2);
            num /= 2;
            position--;
        }

        require(position == 0);
        return bit;
    }

    function sendEth(address to) public payable {
        require(to != msg.sender, "Same address");
        (bool sent, ) = payable(to).call{value: msg.value}("");
        require(sent, "Transfer failed");
    }
}
