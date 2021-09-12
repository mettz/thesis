const ViewAndPure = artifacts.require("ViewAndPure");

contract("ViewAndPure", () => {
  let instance;
  before(async () => {
    instance = await ViewAndPure.new();
  });

  it("f(uint256 a, uint256 b)", async () => {
    const result = await instance.f.sendTransaction(10, 20);
    console.log(result);
  });

  it("g(uint256 a, uint256 b)", async () => {
    const result = await instance.f.sendTransaction(20, 10);
    console.log(result);
  });
});
