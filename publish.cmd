@echo off
REM Publishes your changes: commits everything and pushes to GitHub.
REM GitHub Pages then rebuilds the live site in ~1-2 minutes.
cd /d "%~dp0"

set "msg=%*"
if "%msg%"=="" set /p "msg=Enter a short description of your change: "
if "%msg%"=="" set "msg=Update dashboard"

echo.
echo Saving changes...
git add -A
git commit -m "%msg%"
if errorlevel 1 (
  echo.
  echo Nothing to publish ^(no changes since last publish^).
  pause
  exit /b 0
)

echo.
echo Uploading to GitHub...
git push origin main
if errorlevel 1 (
  echo.
  echo PUSH FAILED. Check your internet connection or Git sign-in and try again.
  pause
  exit /b 1
)

echo.
echo ============================================================
echo  Published! The live site updates in ~1-2 minutes:
echo  https://dprasadsaladi-dot.github.io/rexo-investor-dashboard/
echo ============================================================
pause
