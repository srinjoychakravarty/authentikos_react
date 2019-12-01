//0x32804f2B543f4EbEce478D9847d8446650840128  contract address on rinkeby
//deployed using remix 

pragma solidity 0.5.13;

contract Contract { 
    
    struct Journalist 
    {
        uint age;
        string name;
    }
    
    mapping (address => Journalist) journalists;
    address[] public journalistPublicKeys;
    string public ipfsHash;

    event IpfsHash(string ipfs_hash, address sender);  

    function setJournalist(address _address, uint _age, string memory _name) public 
    {
        journalists[_address].age = _age;
        journalists[_address].name = _name;
        journalistPublicKeys.push(_address);
    }
    
    function getJournalists() view public returns(address[] memory) 
    {
        return journalistPublicKeys;
    }
    
    function getJournalist(address _address) view public returns (uint, string memory) 
    {
        return (journalists[_address].age, journalists[_address].name);
    }
    
    function countjournalists() view public returns (uint256) 
    {
        return journalistPublicKeys.length;
    }

    function sendHash(string memory _hash) public 
    {   
        ipfsHash = _hash; 
        emit IpfsHash(ipfsHash, msg.sender);
    } 
    
    function getHash() public view returns (string memory x) 
    {   
        return ipfsHash;       
    }
}