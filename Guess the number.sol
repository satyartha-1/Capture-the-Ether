pragma solidity >0.8.0;

contract getHash {

    bytes32 answerHash = 0xdb81b4d58595fbbbb592d3661a34cdca14d7ab379441400cbfa1b78bc447c365;
    
    uint8 public counter = 0;

    function calculateHash() public returns(uint8) {
        
        while( keccak256(abi.encodePacked(counter)) != answerHash) {
            counter++;
        }
        return counter;
    }

}
