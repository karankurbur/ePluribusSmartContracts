pragma solidity >=0.4.11;
contract EnumId {
    
    struct Did {
        string x;
        string y;
        string organization;
        uint trustedVotes;
        bool trusted;
    }

    address owner;
    mapping(string => Did) dids;
    
    string test;

    constructor () public {
        owner = msg.sender;
    }
    
    function setTest(string memory testing) public {
        test = testing;
    }
    
    
    // function setTrusted (bytes32 didId, bool trust) public {
    //     require(msg.sender == owner);
    //     dids[didId].trusted = trust;
    // }

    function uploadDid(string memory did, string memory x, string memory y, string memory org,bool trusted ) public {
        if(msg.sender == owner) {
            dids[did] = Did(x,y,org, 0,trusted);

        }else {
            dids[did] = Did(x,y,org, 0,false);
        }
        
    }
    
    function getDid(string memory did) public view returns (string memory x, string memory y, string memory org, bool trusted) {
        return (dids[did].x,dids[did].y,dids[did].organization,dids[did].trusted);
    }

}
