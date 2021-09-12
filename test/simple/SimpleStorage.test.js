const SimpleStorage = artifacts.require("SimpleStorage");
const SimpleStorageInstrumented = artifacts.require(
  "SimpleStorageInstrumented"
);

contract("SimpleStorage", () => {
  it("get()", async () => {
    const plain = await SimpleStorage.new();
    const instrumented = await SimpleStorageInstrumented.new();

    await plain.get.sendTransaction();
    const result = await plain.get.sendTransaction();
    const plainCost = result.receipt.gasUsed;
    await instrumented.get.sendTransaction();
    const cost = await instrumented.__SimpleStorage_getCost();
    console.log(`#1 get():`);
    console.log(`plain: ${plainCost}, instrumented: ${cost}`);
  });

  it("set()", async () => {
    const plain = await SimpleStorage.new();
    const instrumented = await SimpleStorageInstrumented.new();

    let result = await plain.set.sendTransaction(10);
    let plainCost = result.receipt.gasUsed;
    await instrumented.set.sendTransaction(10);
    let cost = await instrumented.__SimpleStorage_getCost();
    console.log(`#1 set():`);
    console.log(`plain: ${plainCost}, instrumented: ${cost}`);
    await instrumented.__SimpleStorage_resetCost();
    result = await plain.set.sendTransaction(10);
    plainCost = result.receipt.gasUsed;
    await instrumented.set.sendTransaction(10);
    cost = await instrumented.__SimpleStorage_getCost();
    console.log(`#1 set():`);
    console.log(`plain: ${plainCost}, instrumented: ${cost}`);
  });
});
