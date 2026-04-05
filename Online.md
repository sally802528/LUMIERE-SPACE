# LUMIERE-SPACE (流光空間) 開發教學 🖼️

最新版本，加入了Github網頁線上圖庫連結系統
<br>你可以在網址中接入你的Github儲存庫網址，即可使用線上版本，你可以把連結分享給他人，讓大家也一起體驗你獨一無二的展覽

[👉 立即體驗 LUMIERE-SPACE](https://sally802528.github.io/LUMIERE-SPACE/)

[👉 範例網站 ](https://sally802528.github.io/LUMIERE-SPACE/?load=sally802528/TEST_online_LS)
https://sally802528.github.io/LUMIERE-SPACE/?load=sally802528/TEST_online_LS

---

## 使用前需要
注意，線上展覽需要些許資訊能力，以確保你能夠正確的了解並架設
以下是你需要的基本項目:
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
2.  網址後方寫上 /?load=使用者名稱/儲存庫名稱 (例如：/?load=sally802528/TEST_online_LS)
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
    "url": "https://sally802528.github.io/TEST_online_LS/2.mp4",
    "type": "video/mp4"
  }
]
```
---
## 常見問題

1. 找不到設定檔 (Manifest not found)：請確認 GitHub 儲存庫根目錄是否有 manifest.json，且位於 main 或 master 分支。
2. 格式錯誤 (Invalid Format)：manifest.json 內容必須是一個 JSON 陣列 [...]，不能是單一物件。
3. 連線失敗/CORS 阻擋：請確保媒體連結是正確無誤，以及網路是否正常。
4. 沒有聲音：瀏覽器預設禁止自動播放聲音，請進入展場後點擊一次畫面以解鎖音訊，或檢查「設定」中的音量。
5. 無法載入圖片但是有寫manifest.json:請確認你的圖庫圖片是否正常，manifest.json連結類型是否正確
---
## 開發者的一封信
親愛的專業用戶你好
<br>想必你在試圖建立一個公開的畫展時
<br>應該領悟到了一些基本需要注意的事項
<br>無外乎就是三點
1. 權利越大，責任越大
2. 設置不雅的內容，對你我他都不是好事
3. 照顧一下觀眾的想法

<br>我們都能理解你的興奮
<br>但是網路不是不法之地，你的任何壞心思都有可能害了你
<br>這邊我有幾件事希望你能做到
  1. 不要上傳過大的檔案
  2. 不要上傳成人內容或暴力血腥
  3. 不要上傳任何QR code 或連結的圖片
  4. 不要藉由圖片散播任何政治、惡意軟體、木馬、極端內容等

本工作室絕不容忍任何未成年性侵害的影像流通於平台
<br>如果查獲相關內容，請務必與本工作室聯絡，我們將會盡快對其處理並封鎖該連結
<br>並前往該資料庫來源進行檢舉，Github條款明令禁止包含未成年性內容的儲存庫

---
## 免責聲明
展場內容不屬於Qimei Technology Studio 所有，由於資料庫不受本工作室管制，展場內展出內容之版權與法律責任，概由該資料來源儲存庫之建立者自行承擔。
<br>若內容涉及侵權或違法之虞，請逕行聯繫內容提供者。

---
## 🧑‍🔧 錯誤報告

程式可能含有未知的錯誤，如果你發現了問題，請聯絡我們:Sally802528@gmail.com，並務必完整詳細的說明問題與你的使用環境

---

## 📜 許可證

<a href="https://sally802528.github.io/LUMIERE-SPACE/">LUMIERE-SPACE</a> © 2026 by <a href="https://qimei.framer.website/">Qimei Technology Studio</a> is licensed under <a href="https://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International</a><br><br><img src="https://mirrors.creativecommons.org/presskit/icons/cc.svg" alt="" style="max-width: 1em;max-height:1em;margin-left: .2em;">  <img src="https://mirrors.creativecommons.org/presskit/icons/by.svg" alt="" style="max-width: 1em;max-height:1em;margin-left: .2em;">  <img src="https://mirrors.creativecommons.org/presskit/icons/nc.svg" alt="" style="max-width: 1em;max-height:1em;margin-left: .2em;">  <img src="https://mirrors.creativecommons.org/presskit/icons/sa.svg" alt="" style="max-width: 1em;max-height:1em;margin-left: .2em;">

---

**LUMIERE-SPACE** - *讓每個人都能擁有專屬的美術館。*
