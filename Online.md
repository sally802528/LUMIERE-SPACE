# LUMIERE-SPACE (流光空間) 線上圖庫架設教學 🖼️

最新版本，加入了Github網頁圖庫連結系統
<br>你可以在網址中接入你的Github儲存庫網址，即可使用線上版本，你可以把連結分享給他人，讓大家也一起體驗你獨一無二的展覽

[👉 立即體驗 LUMIERE-SPACE](https://sally802528.github.io/LUMIERE-SPACE/)

---

## 使用前需要
注意，線上展覽需要些許資訊能力，以確保你能夠正確的了解並架設
以下是你需要的基本項目
* **Github Pages架設**：這個功能本質上就是透過Github Page功能將儲存庫的資料透過代碼轉交到網頁中。
* **json編寫能力**：你需要簡單的概念去編寫必要的json檔，以確保網頁能正常讀取你的資料庫。

---

## 🚀 快速上手

### 準備工作
1.  登入Github並建立儲存庫。
2.  將您想要展示的檔案放入該儲存庫中，由於檔案大小限制，本功能建議使用一般JPG檔。
3.  新增manifest.json檔案。
4.  進入儲存庫設定，並點選Pages，尋找Build and deployment其中之Branch項目，選擇 main 後按 Save 
5.  完成後進入Actions，並檢查Pages是否正常部署完成，完成後複製部署得專屬網址
6.  完成後回到manifest.json檔案，並按照格式編寫檔案，範例請見下方教學。
7.  確定完成後回到Actions，並檢查Pages是否正常部署完成

### 開始觀展
1.  點擊進入 [LUMIERE-SPACE](https://sally802528.github.io/LUMIERE-SPACE/)。
2.  網址後方寫上 /?load=你的網址/manifest.json，指向寫好的manifest.json檔案
3.  按下Enter，如果步驟正常，網頁就會讀取並佈展了

---

## manifest.json 編寫教學

檔案結構很簡單，就是這個檔案的連結跟類型
<br>url要寫上每個檔案的網址，以儲存庫網址+檔名組成，儲存庫網址會在Actions等處標記
```
[
  {
    "url": "https://sally802528.github.io/TEST_online_LS/1.jpg",
    "type": "image/jpeg"
  },
  {
    "url": "https://sally802528.github.io/TEST_online_LS/2.jpg",
    "type": "image/jpeg"
  }
]
```
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
