const owned = artifacts.require("owned");
const destructible = artifacts.require("destructible");
const priced = artifacts.require("priced");
const Register = artifacts.require("Register");
const Mutex = artifacts.require("Mutex");

contract("Modifiers", () => {
  let ownedInstance;
  let destructibleInstance;
  let pricedInstance;
  let RegisterInstance;
  let MutexInstance;

  before(async () => {
    ownedInstance = await owned.new();
    destructibleInstance = await destructible.new();
    pricedInstance = await priced.new();
    RegisterInstance = await Register.new(200);
    MutexInstance = await Mutex.new();
  });

  it("winningProposal()", async () => {
    console.log(ownedInstance);
    console.log(destructibleInstance);
    console.log(pricedInstance);
    console.log(RegisterInstance);
    console.log(MutexInstance);
  });
});
