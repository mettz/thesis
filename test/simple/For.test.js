const For = artifacts.require("For");

contract("For", () => {
  let instance;
  before(async () => {
    instance = await For.new();
  });

  it("fibonacci(uint256 n)", async () => {
    const result = await instance.fibonacci.sendTransaction(10);
    console.log(result);
  });
});
