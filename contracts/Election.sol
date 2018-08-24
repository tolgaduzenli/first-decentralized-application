pragma solidity ^0.4.24;

contract Election{
    //Model a candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }
    //Store accounts that have voted
    mapping (address => bool) public voters;
    //Store candidates
    mapping (uint => Candidate) public candidates;
    //Store Candidates count
    uint public candidatesCount;

    constructor () public {
        addCandidate ("Candidate 1");
        addCandidate ("Candidate 2");
    }

    function addCandidate (string _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    function vote (uint _candidateId) public {
        //required that they haven't voted before
        require(!voters[msg.sender], "Voter has already voted!");

        //require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount, "Invalid candidate Id!");

        //record that voter has voted
        voters[msg.sender] = true;
        
        //update candidates vote count
        candidates[_candidateId].voteCount ++;
    }
}