// SPDX-License-Identifier: GPL-3.0
pragma solidity >0.8.0;

interface DataFeed {
    function getData(address token) external returns (uint256 value);
}

contract FeedConsumer {
    DataFeed feed;
    uint256 errorCount;

    function rate(address token) public returns (uint256 value, bool success) {
        require(errorCount < 10);
        try feed.getData(token) returns (uint256 v) {
            return (v, true);
        } catch Error(string memory) {
            errorCount++;
            return (0, false);
        } catch Panic(uint256) {
            errorCount++;
            return (0, false);
        } catch (bytes memory) {
            errorCount++;
            return (0, false);
        }
    }
}
