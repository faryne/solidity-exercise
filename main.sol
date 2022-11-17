// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// 範例合約：實作一個可以儲存文字內容的合約
contract Main {
    // 設定一組 map ，以 address 為 key ，記錄每個 address 丟來的文字內容
    mapping(address => string) private messages;

    address private requester;

    // 在建構子設定 requester 的值
    constructor() payable {
        requester = msg.sender;
    }

    function AddContent(string memory content) public {
        messages[requester] = content;
    }

    // getter：傳回指定位址所存入的文字內容，addr 是 address 型態資料
    function GetSenderContent(address addr) public view returns (string memory) {
        return messages[addr];
    }

    function GetMyContent() public view returns (string memory) {
        return messages[requester];
    }

}