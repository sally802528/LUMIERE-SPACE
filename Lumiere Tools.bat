@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

:main_menu
cls
echo ==================================================
echo        流光空間 (LUMIERE-SPACE) 工具整合箱
echo ==================================================
echo.
echo  [1] 本地端定義檔生成 (custom.json)
echo  [2] 支援列表顯示
echo  [3] 線上定義檔生成 (manifest.json)
echo  [4] 工具簡要介紹
echo  [5] 新增作品資訊 (需要先生成過定義檔)
echo  [6] 前往Lumiere Space 網站
echo  [E] 關閉工具
echo.
echo ==================================================
set "choice="
set /p "choice=請輸入選項 (1/2/3/4/5/6/E): "

if /i "%choice%"=="1" goto local_gen
if /i "%choice%"=="2" goto show_support
if /i "%choice%"=="3" goto online_gen
if /i "%choice%"=="4" goto show_intro
if /i "%choice%"=="5" goto add_work_info
if /i "%choice%"=="6" goto open_url
if /i "%choice%"=="E" goto exit_tool
echo.
echo 輸入錯誤，請重新選擇！
pause
goto main_menu

:show_support
cls
echo ==================================================
echo            流光空間 支援媒體格式列表
echo ==================================================
echo.
echo  【圖片支援類】
echo   - .jpg / .jpeg (MIME: image/jpeg)
echo   - .png         (MIME: image/png)
echo   - .webp        (MIME: image/webp)
echo   - .avif        (MIME: image/avif)
echo   - .gif         (MIME: image/gif) *具備相容性警示
echo.
echo  【影片支援類】
echo   - .mp4         (MIME: video/mp4)
echo   - .mkv         (MIME: video/x-matroska)
echo.
echo ==================================================
echo 按任意鍵返回主選單...
pause >nul
goto main_menu

:show_intro
cls
echo ==================================================
echo                工具簡要介紹
echo ==================================================
echo.
echo 這是一個簡易的Lumiere Space畫廊工具，可以幫助您
echo 簡單的生成可用的定義檔，這在用於線上畫廊，定義檔
echo 是必要的，而這個工具可以簡易的生成，避免您自己
echo 耗時編寫定義檔。
echo.
echo ==================================================
echo 按任意鍵返回主選單...
pause >nul
goto main_menu

:local_gen
cls
set "OUTPUT_FILE=custom.json"
set "TEMP_LIST=temp_media_list.txt"
if exist "%TEMP_LIST%" del "%TEMP_LIST%"
if exist "%OUTPUT_FILE%" del "%OUTPUT_FILE%"

echo 正在掃描資料夾中的媒體檔案...
call :scan_files

if exist "%TEMP_LIST%" (
    powershell -NoProfile -Command ^
        "$files = Get-Content -Path '%TEMP_LIST%' -Encoding utf8;" ^
        "$output = foreach ($file in $files) {" ^
        "    [PSCustomObject]@{ file = [string]$file }" ^
        "};" ^
        "$output | ConvertTo-Json -Depth 3 | Out-File -FilePath '%OUTPUT_FILE%' -Encoding utf8"
    del "%TEMP_LIST%"
    echo.
    echo 成功！已生成本地端定義檔：%OUTPUT_FILE%
) else (
    echo.
    echo 提示：此資料夾中沒有任何符合允許類型的影音檔案。
)
echo.
echo 按任意鍵返回主選單...
pause >nul
goto main_menu

:online_gen
cls
set "OUTPUT_FILE=manifest.json"
set "TEMP_LIST=temp_media_list.txt"
if exist "%TEMP_LIST%" del "%TEMP_LIST%"
if exist "%OUTPUT_FILE%" del "%OUTPUT_FILE%"

echo ==================================================
echo             線上定義檔 (manifest.json) 生成
echo ==================================================
echo.
set /p "repo_url=請輸入線上儲存庫網址或根目錄 (直按 Enter 則預設為 /): "
if "!repo_url!"=="" set "repo_url=/"

:: 去除末尾斜線 (如果不是單獨一個斜線的話)
if not "!repo_url!"=="/" (
    if "!repo_url:~-1!"=="/" set "repo_url=!repo_url:~0,-1!"
)

echo.
echo 正在掃描資料夾中的媒體檔案...
call :scan_files

if exist "%TEMP_LIST%" (
    powershell -NoProfile -Command ^
        "$repo = '%repo_url%';" ^
        "if ($repo -eq '/') { $prefix = '/' } else { $prefix = $repo + '/' };" ^
        "$files = Get-Content -Path '%TEMP_LIST%' -Encoding utf8;" ^
        "$output = foreach ($file in $files) {" ^
        "    $ext = [System.IO.Path]::GetExtension($file).ToLower();" ^
        "    $mime = switch ($ext) {" ^
        "        '.jpg' { 'image/jpeg' }" ^
        "        '.jpeg' { 'image/jpeg' }" ^
        "        '.png' { 'image/png' }" ^
        "        '.gif' { 'image/gif' }" ^
        "        '.webp' { 'image/webp' }" ^
        "        '.avif' { 'image/avif' }" ^
        "        '.mp4' { 'video/mp4' }" ^
        "        '.mkv' { 'video/x-matroska' }" ^
        "        default { 'application/octet-stream' }" ^
        "    };" ^
        "    [PSCustomObject]@{ " ^
        "        url = $prefix + $file; " ^
        "        type = $mime " ^
        "    }" ^
        "};" ^
        "$output | ConvertTo-Json -Depth 3 | Out-File -FilePath '%OUTPUT_FILE%' -Encoding utf8"
    del "%TEMP_LIST%"
    echo.
    echo 成功！已生成線上定義檔：%OUTPUT_FILE%
) else (
    echo.
    echo 提示：此資料夾中沒有任何符合允許類型的影音檔案。
)
echo.
echo 按任意鍵返回主選單...
pause >nul
goto main_menu

:add_work_info
cls
set "TARGET_JSON="
if exist "manifest.json" set "TARGET_JSON=manifest.json"
if not exist "manifest.json" if exist "custom.json" set "TARGET_JSON=custom.json"

if "%TARGET_JSON%"=="" (
    echo ==================================================
    echo 錯誤：未偵測到任何定義檔！
    echo 必須先執行 [1] 或 [3] 生成 custom.json 或 manifest.json。
    echo ==================================================
    echo 按任意鍵返回主選單...
    pause >nul
    goto main_menu
)

echo 正在讀取定義檔：%TARGET_JSON% ...
echo.

:: 呼叫 PowerShell 執行互動式作品資訊注入 (加入 :s 跳過功能)
powershell -NoProfile -Command ^
    "$jsonPath = '%TARGET_JSON%';" ^
    "$jsonContent = Get-Content -Raw -Path $jsonPath -Encoding utf8 | ConvertFrom-Json;" ^
    "$mediaItems = @();" ^
    "foreach ($item in $jsonContent) {" ^
    "    if ($item.PSObject.Properties['url'] -or $item.PSObject.Properties['file']) {" ^
    "        $mediaItems += $item" ^
    "    }" ^
    "};" ^
    "if ($mediaItems.Count -eq 0) {" ^
    "    Write-Host '定義檔中沒有包含任何可編輯的作品檔案項目。' -ForegroundColor Yellow;" ^
    "    return;" ^
    "}" ^
    "$count = 0;" ^
    "$total = $mediaItems.Count;" ^
    "$abort = $false;" ^
    "foreach ($item in $mediaItems) {" ^
    "    $count++;" ^
    "    $fileName = if ($item.PSObject.Properties['url']) { Split-Path $item.url -Leaf } else { $item.file };" ^
    "    Clear-Host;" ^
    "    Write-Host '==================================================' -ForegroundColor Cyan;" ^
    "    Write-Host ('目前正在編寫 [第 {0} / {1} 個作品]：{2}' -f $count, $total, $fileName) -ForegroundColor White;" ^
    "    Write-Host '--------------------------------------------------';" ^
    "    Write-Host '【控制指令提示】輸入 [:w] 儲存進度並結束 ｜ 輸入 [:q] 放棄編輯並取消 ｜ 輸入 [:s] 跳過此項目';" ^
    "    Write-Host '【刪除提示】直接按下 Enter 送出空值，將會自動清除該項目的欄位';" ^
    "    Write-Host '==================================================' -ForegroundColor Cyan;" ^
    "    $currentTitle = if ($item.PSObject.Properties['title']) { $item.title } else { '' };" ^
    "    $currentInfo = if ($item.PSObject.Properties['info']) { $item.info } else { '' };" ^
    "    if ($currentTitle) { Write-Host ('當前標題: {0}' -f $currentTitle) -ForegroundColor Gray };" ^
    "    $inputTitle = Read-Host '[請輸入作品標題 (title)]';" ^
    "    if ($inputTitle -eq ':w' -or $inputTitle -eq ':W') { break; };" ^
    "    if ($inputTitle -eq ':q' -or $inputTitle -eq ':Q') { $abort = $true; break; };" ^
    "    if ($inputTitle -eq ':s' -or $inputTitle -eq ':S') { continue; };" ^
    "    if ($currentInfo) { Write-Host ('當前詳情: {0}' -f $currentInfo) -ForegroundColor Gray };" ^
    "    $inputInfo = Read-Host '[請輸入作品詳情 (info)]';" ^
    "    if ($inputInfo -eq ':w' -or $inputInfo -eq ':W') {" ^
    "        if ($inputTitle) { $item | Add-Member -NotePropertyName 'title' -NotePropertyValue $inputTitle -Force } else { $item.PSObject.Properties.Remove('title') };" ^
    "        break;" ^
    "    };" ^
    "    if ($inputInfo -eq ':q' -or $inputInfo -eq ':Q') { $abort = $true; break; };" ^
    "    if ($inputTitle) { $item | Add-Member -NotePropertyName 'title' -NotePropertyValue $inputTitle -Force } else { $item.PSObject.Properties.Remove('title') };" ^
    "    if ($inputInfo) { $item | Add-Member -NotePropertyName 'info' -NotePropertyValue $inputInfo -Force } else { $item.PSObject.Properties.Remove('info') };" ^
    "}" ^
    "if ($abort) {" ^
    "    Write-Host '已放棄編輯，本次變更已恢復。' -ForegroundColor Red;" ^
    "    Start-Sleep -Seconds 2;" ^
    "} else {" ^
    "    $jsonContent | ConvertTo-Json -Depth 5 | Out-File -FilePath $jsonPath -Encoding utf8;" ^
    "    Write-Host ('更新成功！作品資訊已寫入 {0}' -f $jsonPath) -ForegroundColor Green;" ^
    "    Start-Sleep -Seconds 2;" ^
    "}"

goto main_menu

:open_url
echo.
echo 正在開啟網頁 https://lumierespace.qts.dpdns.org/ ...
start "" "https://lumierespace.qts.dpdns.org/"
timeout /t 2 >nul
goto main_menu

:scan_files
for /f "delims=" %%I in ('dir /b /a-d 2^>nul') do (
    set "ext=%%~xI"
    set "ext=!ext:~1!"
    
    :: 轉為小寫進行比對
    for %%A in (a b c d e f g h i j k l m n o p q r s t u v w x y z) do (
        set "ext=!ext:%%A=%%A!"
    )

    :: 判斷是否為允許的類型
    set "is_valid=0"
    if "!ext!"=="jpg"  set "is_valid=1"
    if "!ext!"=="png"  set "is_valid=1"
    if "!ext!"=="avif" set "is_valid=1"
    if "!ext!"=="mkv"  set "is_valid=1"
    if "!ext!"=="mp4"  set "is_valid=1"
    if "!ext!"=="webp" set "is_valid=1"
    
    if "!is_valid!"=="1" (
        echo %%I>> "%TEMP_LIST%"
    )
    
    :: 如果是 GIF 則特別詢問
    if "!ext!"=="gif" (
        echo.
        :ask_gif
        set "choice_gif="
        set /p "choice_gif=偵測到GIF[%%I]，畫廊可能無法完整的顯示與播放，您確定要生成包含這個檔案的定義檔嗎？(Y/N) [預設為 Y]: "
        if /i "!choice_gif!"=="" set "choice_gif=Y"
        if /i "!choice_gif!"=="Y" (
            echo %%I>> "%TEMP_LIST%"
        ) else if /i "!choice_gif!"=="N" (
            echo 已捨去 %%I
        ) else (
            echo 輸入錯誤，請重新輸入。
            goto ask_gif
        )
    )
)
exit /b

:exit_tool
echo.
echo 感謝使用，祝您佈展順利 Good luck！
timeout /t 2 >nul
exit