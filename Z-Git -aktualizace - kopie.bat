@echo off
cd /d "C:\Users\krcmarova.jaroslava\..."

echo === Kontroluji, zda neni rozpracovany merge ===
git rev-parse -q --verify MERGE_HEAD >nul 2>&1

if %errorlevel%==0 (
    echo Detekovan rozpracovany merge... Dokoncim ho automaticky.
    git commit -m "Dokonceni predchoziho slouceni (merge)"
)

echo === Spoustim git pull ===
git pull

echo.
pause 