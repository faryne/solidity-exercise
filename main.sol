// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// 範例合約：實作一個含有轉帳與自毀的合約
contract Main {
    // 總池內有一百萬枚代幣
    uint public totalNum = 1000000;

    // 設定一組 map ，以 address 為 key ，記錄每個 address 的餘額
    mapping(address => uint) balances;

    // 在建構子內取得該 sender 的餘額
    constructor() payable {
        balances[msg.sender] = msg.value;
    }

    // getter：取得目前代幣總數。可供公開呼叫。
    function getTotal() public view returns(uint) {
        return totalNum;
    }

    // getter：傳回指定位址目前的餘額，addr 是 address 型態資料
    function getSender(address addr) public view returns (uint) {
        return balances[addr];
    }

    function add(address to, uint amount) public payable returns (bool) {
        balances[to] += amount;
        return true;
    }

    function minus(address to, uint amount) public payable returns (bool) {
        balances[to] -= amount;
        return true;
    }

    // Action：轉帳
    function Transfer(address to, uint amount) public payable returns (bool) {
        require(balances[msg.sender] > amount);
        // 從轉帳方扣
        minus(msg.sender, amount);
        // 接收方加上
        add(to, amount);

        return true;
    }

    // Action：自毀 N 個代幣，連帶導致池內的代幣總量減少
    function Destroy(uint amount) public returns (bool) {
        require(balances[msg.sender] > amount);
        minus(msg.sender, amount);
        totalNum -= amount;
        return true;
    }

}