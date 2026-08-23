# Magic42 Configuration Pull Script
Write-Host "Starting GitHub Sync (Pull)..." -ForegroundColor Cyan

# Check if git is initialized
if (!(Test-Path ".git")) {
    Write-Host "Initializing Git..." -ForegroundColor Yellow
    git init
    git remote add origin https://github.com/aZuZu/Magic42.git
    git branch -M main
}

# Ensure the remote URL is correct
git remote set-url origin https://github.com/aZuZu/Magic42.git

Write-Host "Pulling latest changes from GitHub..." -ForegroundColor Yellow
git pull origin main

Write-Host "Local assets are now synced with GitHub remote." -ForegroundColor Green
Pause
