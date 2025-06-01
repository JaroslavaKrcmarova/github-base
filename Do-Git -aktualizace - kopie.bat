@echo off
setlocal

REM Nastav cestu ke svemu repozitari
set REPO_PATH=C:\Users\krcmarova.jaroslava\....

echo Presun do slozky repozitare: %REPO_PATH%
cd /d "%REPO_PATH%"

REM Overeni, ze jsme ve spravnem Git repozitari
if not exist ".git" (
    echo Tato slozka neni Git repozitar. Ukoncuji.
    pause
    exit /b
)

REM Kontrola rozpracovaneho slouceni
git rev-parse -q --verify MERGE_HEAD >nul 2>&1
if %errorlevel%==0 (
    echo Dokonceni predchoziho slouceni...
    git commit -m "Dokonceni predchoziho slouceni (merge)"
)

REM Pridani upravenych souboru
git add .

REM Commit zmen
echo Vytvarim commit...
git commit -m "POPIS ZMENY"

REM Push na GitHub
echo Odesilam zmeny na GitHub...
git push

echo Hotovo.
pause