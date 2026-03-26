# LUMIERE-SPACE (流光空間) 🖼️

> **將畫作有如美術館一般展示。**

LUMIERE-SPACE 是一個基於網頁的 3D 虛擬畫廊展示系統。用戶可以透過導入本地資料夾，將自己的圖片與影片瞬間轉化為一場沉浸式的私人藝術展覽。

[👉 立即體驗 LUMIERE-SPACE](https://sally802528.github.io/LUMIERE-SPACE/)

>如果你發現有些影片無法被正確播放但是有音訊，可能是瀏覽器不支援該影片的編碼，你可以試著把檔案拖進瀏覽器分頁，以檢查影片是否可以正常播放，或著你可以選擇轉檔成H.264等相容的編碼

<br>[觀看Youtube宣傳片](https://youtu.be/HWK8KETxxZM)
---

## ✨ 項目特色

許多人都有逛過畫廊，不論是在某個博物館還是美術館，畫廊是一個優美簡潔的觀賞畫作空間，配上美妙的背景音樂，一個完美的藝術之門向你開啟，
如果能自己選擇看什麼畫廊，豈不是更好的享受，自己拿手機電腦翻相簿，枯燥乏味，現在就使用LUMIERE SPACE模擬畫廊，享受更好的藝術氣息<br>
* **完全免費開源**：無任何隱形費用，代碼完全開源，這麼讚的東西竟然是免費用的嗎w(ﾟДﾟ)w!。
* **極致隱私安全**：所有運算與檔案讀取均在**本地端運行**，我們不會獲取、上傳或儲存您的任何資料。
* **零門檻操作**：無需註冊、無需登入，更不需要具備任何 3D 建模知識，你只需要享受。
* **多媒體支援**：除了靜態圖片（JPG/PNG），更支援影片（MP4）播放，讓畫作栩栩如生的動起來。
* **沉浸式體驗**：
    * 精美的環境音樂與腳步聲，療癒身心。
    * 可互動的場景物件（例如：累了可以在椅子上坐坐）。
    * 多種環境設定項，自由調整專屬你的畫廊氛圍。
    * 文青高級的按鈕文字，完美的體驗。
    * 高度融合的操作機制，每個畫面都是一種享受。
* **自由的設定**：支援如「超人」般的跳躍與移動速度，快速穿梭於藝術空間。
* **雙語支持**：完整支援中文與英文介面切換，英文恐懼也不怕。

---

## 🚀 快速上手

### 準備工作
1.  在您的電腦上新建一個資料夾。
2.  將您想要展示的檔案放入該資料夾中（支援格式：`.mp4`, `.jpg`, `.png`, `.jpeg`）。

### 開始觀展
1.  點擊進入 [LUMIERE-SPACE](https://sally802528.github.io/LUMIERE-SPACE/)。
2.  點擊「進入畫廊」。
3.  在系統彈窗中選擇您剛才準備好的**整個資料夾**。
4.  稍等片刻待讀取完成，即可開始您的 3D 藝術之旅！

---

## 🎮 操作說明

本專案採用直覺的類遊戲操作方式：

| 按鍵 | 功能描述 |
| :--- | :--- |
| **W / A / S / D** | 前、左、後、右移動 |
| **F** | 開啟 / 關閉 手電筒 |
| **E** | 切換樓層 |
| **Y** | 開啟 / 關閉 音樂與環境音 (不影響腳步聲) |
| **U** | 開啟設定介面 (可調整音量、環境參數等) |
| **ESC** | 暫停遊戲 / 釋放滑鼠指標 |
| **空白鍵** | 跳躍 |
| **左右方向鍵** | 指向影片時快轉倒放(長按加速4×) |
| **F5** | 重新初始化(網站除了設定，其他資料會在重整後消失) |
---

## 🛠️ 技術棧

* **引擎**：Three.js (WebGL)
* **開發語言**：JavaScript, HTML5, CSS3
* **技術特點**：
    * 使用瀏覽器 File System Access API 進行本地文件讀取。
    * 響應式 3D 渲染，支援大部分主流瀏覽器。

---

## 🛡️ 隱私聲明

LUMIERE-SPACE 承諾尊重您的隱私。本站任何導入資料，都是本地端運行，您的圖片與影片檔案絕不會被傳送到任何伺服器。您可以放心地導入任何私人或珍貴的影像資料。

--- 
## ©️ 開發人員
* Google Gemini 首席前端工程師
* Qimei Technology Studio 設計總監、助理工程師
* DWEP Studio 測試員
* 臺灣團隊 AI神隊友
---

## 🔩 相容性

本站採用網頁形式呈現，遊戲操作目前僅對桌面端優化，不支援手機操作
支援的格式為JPG、JPEG、PNG、MP4
並支援的編碼，以瀏覽器支援的編碼能力為主<br>避免導入過大的檔案，如:4k高清影片等，以避免導致畫面卡頓而影響體驗
<br>你必須連接網路，才可以正常取得必要貼圖，與音樂播放，不過請放心，你的資料會保持本地運行
<br>建議你使用4:3或16:9比例等圖像，系統會自動縮放圖片，所以可以支援高畫素的圖像，但是如果你放入過長的圖像，可能導致渲染出錯的問題

---

## 🧑‍🔧 錯誤報告

程式可能含有未知的錯誤，如果你發現了問題，請聯絡我們:Sally802528@gmail.com，並務必完整詳細的說明問題與你的使用環境

---

## 📜 許可證

<a href="https://sally802528.github.io/LUMIERE-SPACE/">LUMIERE-SPACE</a> © 2026 by <a href="https://qimei.framer.website/">Qimei Technology Studio</a> is licensed under <a href="https://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International</a><br><br><img src="https://mirrors.creativecommons.org/presskit/icons/cc.svg" alt="" style="max-width: 1em;max-height:1em;margin-left: .2em;">  <img src="https://mirrors.creativecommons.org/presskit/icons/by.svg" alt="" style="max-width: 1em;max-height:1em;margin-left: .2em;">  <img src="https://mirrors.creativecommons.org/presskit/icons/nc.svg" alt="" style="max-width: 1em;max-height:1em;margin-left: .2em;">  <img src="https://mirrors.creativecommons.org/presskit/icons/sa.svg" alt="" style="max-width: 1em;max-height:1em;margin-left: .2em;">

---

**LUMIERE-SPACE** - *讓每個人都能擁有專屬的美術館。*
