@echo off
title Solvence Publisher
color 0A

echo.
echo  ==========================================
echo   SOLVENCE PORTFOLIO PUBLISHER
echo   McQworow Brand
echo  ==========================================
echo.

:: Navigate to repo folder — UPDATE THIS PATH IF NEEDED
cd /d "C:\Users\ADMIN\Desktop\Cliff\AID_Office\PORTFOLIO\Personal Portfolio"

echo  [1/4] Staging all changes...
git add .
if %errorlevel% neq 0 (
  echo  ERROR: git add failed. Check your repo folder path.
  pause
  exit /b
)

echo  [2/4] Pulling latest from GitHub...
git pull origin main --no-rebase
if %errorlevel% neq 0 (
  echo  WARNING: Pull had issues. Trying to continue...
)

echo.
set /p MESSAGE= Enter your publish note (e.g. New post: Blocks of Change): 
if "%MESSAGE%"=="" set MESSAGE=Site update

echo.
echo  [3/4] Committing: %MESSAGE%
git commit -m "%MESSAGE%"

echo.
echo  [4/4] Pushing to GitHub...
git push origin main
if %errorlevel% neq 0 (
  echo.
  echo  ERROR: Push failed. Check your internet connection.
  pause
  exit /b
)

echo.
echo  ==========================================
echo   PUBLISHED SUCCESSFULLY!
echo   Live in ~60 seconds at:
echo   https://thesolvence.github.io/portfolio
echo  ==========================================
echo.
pause
