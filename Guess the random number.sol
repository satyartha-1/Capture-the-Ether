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
    
/* 
in this challenge we need to find the block number and now value to calculate the hash. Here the block number is the one in which the current transaction is included.
We find the block number by searching our tx hash on etherscan i.e 0x2a6c25466ede5bcb22db483ac906d473efbfdbd8c5026afe236b8bf5a146d61c.
In our case, block details are at https://ropsten.etherscan.io/block/11720099 . So block.number - 1 equals 11720098. To find the blockhash of block 11720098 we look at hash at https://ropsten.etherscan.io/block/11720098
OR we can refer the parent hash of block 11720099.

To find 'now', look at the timestamp of our transaction i.e https://ropsten.etherscan.io/tx/0x2a6c25466ede5bcb22db483ac906d473efbfdbd8c5026afe236b8bf5a146d61c. But this time is 
in the date time format. We need to convert it to epoch time in order for it to be used for calculating the hash. Use online converters for this purpose. Epoch time is entered 
in seconds. 

The data types of data is very important as it changes the calculated hash. _hash is a bytes32 type and epoch time is a uint256 type.

Finally we convert the calculated answer2 to uint8 to match with data type of answer.
*/
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
