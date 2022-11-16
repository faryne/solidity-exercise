// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// 範例合約：實作一個含有轉帳與自毀的合約
contract Main {
    // 設定一組 map ，以 address 為 key ，記錄每個 address 的 eth 餘額
    mapping(address => uint) private balances;

    // 設定一組 map ，以 address 為 key ，記錄每個 address 的代幣餘額
    mapping(address => uint) private holdTokens;

    // msg.value 乘以此倍數即為擁有的代幣數目
    uint private times = 1000;

    // 在建構子內取得該 sender 的餘額
    constructor() payable {
        balances[msg.sender] = msg.value;
        holdTokens[msg.sender] = msg.value * times;
    }

    // getter：傳回指定位址目前的餘額，addr 是 address 型態資料
    function getSenderValue(address addr) public view returns (uint) {
        return balances[addr];
    }

    // getter：傳回指定位址目前的代幣數目，addr 是 address 型態資料
    function getSenderTokens(address addr) public view returns (uint) {
        return holdTokens[addr];
    }

    // 在指定位址加上金額
    function add(address to, uint amount) public {
        balances[to] += amount;
        holdTokens[to] += amount * times;
    }

    // 在指定位址減掉金額
    function minus(address to, uint amount) public {
        require(balances[to] > amount, unicode"餘額需大於付款數");
        balances[to] -= amount;
        holdTokens[to] -= amount * times;
    }

    // Action：呼叫者往自己的位址存入金額
    function Save(uint amount) public payable {
        add(msg.sender, amount);
    }

    // Action：轉帳
    function Transfer(address to, uint amount) public payable {
        // 從轉帳方扣
        minus(msg.sender, amount);
        // 接收方加上
        add(to, amount);
    }
}