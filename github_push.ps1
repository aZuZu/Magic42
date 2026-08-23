# Magic42 Configuration Push Script
Write-Host "Starting GitHub Sync (Push)..." -ForegroundColor Cyan

# Check if git is initialized
if (!(Test-Path ".git")) {
    Write-Host "Initializing Git..." -ForegroundColor Yellow
    git init
    git remote add origin https://github.com/aZuZu/Magic42.git
    git branch -M main
}

# Ensure the remote URL is correct
git remote set-url origin https://github.com/aZuZu/Magic42.git

$commitMsg = Read-Host "Enter commit message [Default: Update project]"
if ([string]::IsNullOrWhiteSpace($commitMsg)) {
    $commitMsg = "Update project"
}

# Stage entire project
Write-Host "Staging entire project..." -ForegroundColor Yellow
git add .

# Show what will be committed
Write-Host ""
Write-Host "Changes to be committed:" -ForegroundColor Cyan
git status --short

# Check if there is anything to commit
$changes = git diff --cached --quiet
if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "No changes to commit." -ForegroundColor Yellow
    Pause
    exit
}

Write-Host ""
Write-Host "Committing changes..." -ForegroundColor Yellow
git commit -m "$commitMsg"

Write-Host ""
Write-Host "Pushing to GitHub..." -ForegroundColor Yellow
git push origin main

Write-Host ""
Write-Host "Success! GitHub remote is now updated." -ForegroundColor Green
Pause
