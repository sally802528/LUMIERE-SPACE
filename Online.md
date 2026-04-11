# LUMIERE-SPACE (流光空間) 開發教學 🖼️

最新版本，加入了Github網頁線上圖庫連結系統
<br>你可以在網址中接入你的Github儲存庫網址，即可使用線上版本，你可以把連結分享給他人，讓大家也一起體驗你獨一無二的展覽

[👉 立即體驗 LUMIERE-SPACE](https://sally802528.github.io/LUMIERE-SPACE/)

[👉 範例網站 ](https://sally802528.github.io/LUMIERE-SPACE/?load=sally802528/TEST_online_LS)
https://sally802528.github.io/LUMIERE-SPACE/?load=sally802528/TEST_online_LS
<br>你可以進入範例網站，其中包含結構呈現，與畫作順序

---

## 使用前需要
注意，線上展覽需要些許資訊能力，以確保你能夠正確的了解並架設
以下是你需要的基本項目:
* **Github Pages架設**：這個功能本質上就是透過Github Page功能將儲存庫的資料透過代碼轉交到網頁中。
* **json編寫能力**：你需要簡單的概念去編寫必要的json檔，以確保網頁能正常讀取你的資料庫。

---

## 🚀 快速上手

### 簡要說明
這個系統的概念其實很簡單，透過獲取架設在其他儲存庫的Json檔，其中定義每個檔案的資料與網址
<br>系統就會按照定義檔的順序依序載入並渲染出來，而因為定義檔與資料都是與系統本身分開，所以只要有網路，架設正常就能透過網路開啟
<br>由此來做到，簡單、穩定的公開方式。

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

## manifest.json 定義檔編寫教學

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
如使用同一網址的根目錄
也可以省略網址，單獨寫根目錄檔名
<br>注意：使用簡寫時，系統會自動對應到載入來源的根目錄。請確保圖片與 manifest.json 放在同一個儲存庫資料夾中。
如下:
```
[
  {
    "url": "/1.jpg",
    "type": "image/jpeg"
  },
  {
    "url": "/2.mp4",
    "type": "video/mp4"
  }
]
```
### 新增說明文字
你可以在遊戲中按下Q鍵呼叫作品的說明視窗
而你需要在定義檔中完善每個作品的說明文字
title是標題文字，info則是詳細文字
而你必須要寫出其中一個，才可以讓用戶觸發該作品的說明介面
格式如下
```
[
  {
    "url": "/1.jpg",
    "type": "image/jpeg",
    "title":"示範空間的一些話",
    "info":"Hi!，這是Qimei Technology Studio的流光空間線上示範畫廊"
  }
]
```
### 本地端定義檔
你可以在本地端增加 custom.json 來做到類似manifest.json
相較於manifest.json的url，網址，在本地端使用"file"定義檔案，直接輸入檔名
而使用本地端定義檔，要注意，本地端不會有錯誤提示，如果錯誤會直接視同定義無效，直接進入正常的原畫廊
此檔案需放在您電腦中圖片所在的指定媒體資料夾內
並且一樣是只有定義的檔案才會顯示
格式如下
```
[
  {
    "file": "1080p.mp4",
    "title": "Night City",
    "info": "A video of a night city street, showcasing the vibrant lights and bustling atmosphere. Perfect for use in projects that require a dynamic urban backdrop."
  }
]
```
---
## 常見問題

1. 找不到設定檔 (Manifest not found)：請確認 GitHub 儲存庫根目錄是否有 manifest.json，且位於 main 或 master 分支。
2. 格式錯誤 (Invalid Format)：manifest.json 內容必須是一個 JSON 陣列 [...]，不能是單一物件。
3. 連線失敗/CORS 阻擋：請確保媒體連結是正確無誤，以及網路是否正常。
4. 沒有聲音：瀏覽器預設禁止自動播放聲音，請進入展場後點擊一次畫面以解鎖音訊，或檢查「設定」中的音量。
5. 無法載入圖片但是有寫manifest.json:請確認你的圖庫圖片是否正常，manifest.json連結類型是否正確。
6. 我可以用其他的平台放置檔案嗎:建議使用Github，因為Github相對穩定，並且不會有CORS 阻擋，因為畫廊系統本身就是屬於Github pages。
7. 顯示json錯誤:檢查json格式是否正確，每個檔案是否用逗號隔開，有沒有多餘的錯誤空格或換行
8. 畫作排序規則:畫作是按照manifest.json，從上而下的順序排列，可以參考範例網站
---
## 開發者的一封信
親愛的專業用戶你好
<br>七美科技工作室致力於發展並設計各種作品，給予更多人服務
<br>我們為此設計這個網站並維護，以七美科技三大目標創造、科技、藝術融合並產出令人驚豔的作品
<br>我們相信你看到這篇文章，代表你是個跟我們一樣，具有理想、創客精神的專業用戶
<br>而以下是給想要建立公開畫廊的用戶的一些話

<br>想必你在試圖建立一個公開的畫展時
<br>應該領悟到了一些基本需要注意的事項
<br>無外乎就是三點
1. 權利越大，責任越大
2. 設置不雅的內容，對你我他都不是好事
3. 照顧一下觀眾的想法

<br>我們都能理解你的興奮
<br>但是網路不是不法之地，你的任何壞心思都有可能害了你
<br>這邊我有幾件事希望你能做到
  1. 不要上傳引誘、詐騙點擊的內容
  2. 不要上傳成人內容或暴力血腥
  3. 不要上傳任何QR code 或連結的圖片
  4. 不要藉由圖片散播任何政治、惡意軟體、木馬、極端內容等
  5. 不要附上包含上述的文字連結在檔案說明參數

本工作室絕不容忍任何未成年性侵害的影像流通於平台
<br>如果查獲相關內容，請務必與本工作室聯絡，我們將會盡快對其處理並封鎖該連結
<br>並前往該資料庫來源進行檢舉，Github條款明令禁止包含未成年性內容的儲存庫

### 這邊感謝您的閱讀與理解，感謝您使用本服務

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
