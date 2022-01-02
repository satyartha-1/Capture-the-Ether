pragma solidity ^0.4.21;

contract GuessTheRandomNumberChallenge {
    uint8 answer;

    function GuessTheRandomNumberChallenge() public payable {
        require(msg.value == 1 ether);
        answer = uint8(keccak256(block.blockhash(block.number - 1), now));
    }

    function isComplete() public view returns (bool) {
        return address(this).balance == 0;
    }

    function guess(uint8 n) public payable {
        require(msg.value == 1 ether);

        if (n == answer) {
            msg.sender.transfer(2 ether);
        }
    }
    uint8 public answer2;
    bytes32 _hash = 0xb0f6737f883fcbaf70755e6aac32cfad53d2decc221e1d198c4381c355c61076;
    uint256 _now = 1640891294;
    function theRandomNumber() public {
        answer2 = uint8(keccak256(_hash, _now));
    }

    uint8 public counter = 0;
    function findTheRandomNumber() public {
        while(counter!=answer) {
        counter++;
        }
    } 

}
