# 關於本合約

本合約係參考 [solidity.org](https://docs.soliditylang.org/en/v0.8.17/) 官方文件及其他相關教學文件初步撰寫出來的實驗合約內容。

在執行過程中需要以下項目：
* [Remix](https://remix.ethereum.org/)：可於線上使用的 Solidity IDE，集撰寫、測試及部署等功能於一身。
* [Solidity官方文件](https://docs.soliditylang.org/en/v0.8.17/)：本合約使用 Solidity 0.8.17 標準撰寫，因此使用的參考文件以該版本為主。

## 合約初覽

本合約內容主要放置在 `main.sol` 檔案內。可以直接打開閱覽。

### 逐行說明
---
在第一行會看到以下內容：
```solidity
// SPDX-License-Identifier: MIT
```
該行註解宣告合約的授權方式，一律都是 `// SPDX-License-Identifier: ` 開頭加上授權方式（例如：`MIT` 或 `BSD` ）。
以本合約為例，這代表本合約採取 `MIT` 授權方式，可以修改後任意使用，只需標明 MIT 授權條款及相關著作權聲明即可。

若是不想公開的合約，則需要宣告為 `Unlicense`。

更詳盡的授權列表，可以參見[此處](https://spdx.org/licenses/)。

---
第二行：
```solidity
pragma solidity ^0.8.17;
```

`pragma` 關鍵字代表要引用什麼項目，一開始只會引用到 `Solidity`，因此第二個單字就會是 `solidity`。

第三個關鍵字中的 `^0.8.17` ，代表要使用 `0.8.17` 以上版本，其中的 `^` 代表的就是以上。因此只要出了更新的版本，例如 `0.8.18`，在編譯發佈時則會引用 `0.8.18` 版本處理。但這麼寫可能會有意料外的風險，需要注意。


若是要固定在某個版本，則可以寫成像是 `0.8.17` 這樣，無論如何就會引用 `0.8.17` 處理。

關於 Solidity 版本號列表，可以在[此頁](https://github.com/ethereum/solc-bin/blob/gh-pages/bin/list.txt)找到。

---
第三行開始即為合約的主體內容，主要格式如下：
```solidity
contract [合約名稱] {
    // 內容
}
```

