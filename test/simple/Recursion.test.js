const Recursion = artifacts.require("Recursion");

contract("Recursion", () => {
  let instance;
  before(async () => {
    instance = await Recursion.new();
  });

  it("get_fib(uint256 x)", async () => {
    const result = await instance.get_fib.sendTransaction(10);
    console.log(result);
  });

  it("get_fib1()", async () => {
    const result = await instance.get_fib1.sendTransaction();
    console.log(result);
  });

  it("get_fact(uint256 n)", async () => {
    const result = await instance.get_fact.sendTransaction(10);
    console.log(result);
  });

  it("get_fact1()", async () => {
    const result = await instance.get_fact1.sendTransaction();
    console.log(result);
  });
});
