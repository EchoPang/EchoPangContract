// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract WasteRecordStorage {
    struct WasteRecord {
        address user;
        string wasteHash;
        uint256 timestamp;
    }

    WasteRecord[] public wasteRecords;

    event WasteRecordAdded(address indexed user, string wasteHash, uint256 timestamp);

    // 새로운 폐기물 기록의 해시값 추가
    function addWasteRecord(string memory _wasteHash) public {
        wasteRecords.push(WasteRecord(msg.sender, _wasteHash, block.timestamp));
        emit WasteRecordAdded(msg.sender, _wasteHash, block.timestamp);
    }

    // 특정 인덱스 기록 조회
    function getWasteRecord(uint256 index) public view returns (address, string memory, uint256) {
        require(index < wasteRecords.length, "Index out of bounds");
        WasteRecord storage record = wasteRecords[index];
        return (record.user, record.wasteHash, record.timestamp);
    }

    // 저장된 기록 총 개수 조회
    function getTotalRecords() public view returns (uint256) {
        return wasteRecords.length;
    }
}