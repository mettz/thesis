const Ballot = artifacts.require("Ballot");

contract("Ballot", () => {
  let instance;
  before(async () => {
    instance = await Ballot.new([
      web3.utils.fromAscii("Trump"),
      web3.utils.fromAscii("Byden"),
      web3.utils.fromAscii("Clinton"),
      web3.utils.fromAscii("Bush"),
      web3.utils.fromAscii("Obama"),
      web3.utils.fromAscii("Sanders"),
    ]);
  });

  it("winningProposal()", async () => {
    console.log(instance);
  });
});

// contract Ballot {
//     struct Voter {
//         uint256 weight;
//         bool voted;
//         address delegate;
//         uint256 vote;
//     }
//     struct Proposal {
//         bytes32 name;
//         uint256 voteCount;
//     }
//     address public chairperson;
//     mapping(address => Voter) public voters;
//     Proposal[] public proposals;

//     constructor(bytes32[] memory proposalNames) {
//         chairperson = msg.sender;
//         voters[chairperson].weight = 1;
//         for (uint256 i = 0; i < proposalNames.length; i++) {
//             proposals.push(Proposal({name: proposalNames[i], voteCount: 0}));
//         }
//     }

//     function giveRightToVote(address voter) public {
//         require(
//             msg.sender == chairperson,
//             "Only chairperson can give right to vote."
//         );
//         require(!voters[voter].voted, "The voter already voted.");
//         require(voters[voter].weight == 0);
//         voters[voter].weight = 1;
//     }

//     function delegate(address to) public {
//         Voter storage sender = voters[msg.sender];
//         require(!sender.voted, "You already voted.");
//         require(to != msg.sender, "Self-delegation is disallowed.");
//         while (voters[to].delegate != address(0)) {
//             to = voters[to].delegate;
//             require(to != msg.sender, "Found loop in delegation.");
//         }
//         sender.voted = true;
//         sender.delegate = to;
//         Voter storage delegate_ = voters[to];
//         if (delegate_.voted) {
//             proposals[delegate_.vote].voteCount += sender.weight;
//         } else {
//             delegate_.weight += sender.weight;
//         }
//     }

//     function vote(uint256 proposal) public {
//         Voter storage sender = voters[msg.sender];
//         require(sender.weight != 0, "Has no right to vote");
//         require(!sender.voted, "Already voted.");
//         sender.voted = true;
//         sender.vote = proposal;
//         proposals[proposal].voteCount += sender.weight;
//     }

//     function winningProposal() public view returns (uint256 winningProposal_) {
//         uint256 winningVoteCount = 0;
//         for (uint256 p = 0; p < proposals.length; p++) {
//             if (proposals[p].voteCount > winningVoteCount) {
//                 winningVoteCount = proposals[p].voteCount;
//                 winningProposal_ = p;
//             }
//         }
//     }

//     function winnerName() public view returns (bytes32 winnerName_) {
//         winnerName_ = proposals[winningProposal()].name;
//     }
// }
