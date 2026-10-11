
# push-text-reader.ps1 - Kid simple push for text_reader repo
Write-Host "Text Reader Push - Kid Version" -ForegroundColor Cyan

Set-Location $HOME\Downloads

if (-not (Test-Path "text_reader")) {
    Write-Host "Cloning text_reader..." -ForegroundColor Yellow
    git clone https://github.com/anishimori123/text_reader.git
}

Set-Location text_reader

# Copy files from Downloads (you must download them first)
Write-Host "Copying files..." -ForegroundColor Cyan
Copy-Item "$HOME\Downloads\radio_v816_fixed_full.html" -Destination index.html -Force -ErrorAction SilentlyContinue
Copy-Item "$HOME\Downloads\text_reader_README.md" -Destination README.md -Force -ErrorAction SilentlyContinue
Copy-Item "$HOME\Downloads\text_reader_CHANGELOG.md" -Destination CHANGELOG.md -Force -ErrorAction SilentlyContinue
Copy-Item "$HOME\Downloads\text_reader_VERSION" -Destination VERSION -Force -ErrorAction SilentlyContinue

New-Item -ItemType Directory -Force -Path memory | Out-Null
Copy-Item "$HOME\Downloads\text_reader_memory_*.md" -Destination memory\ -Force -ErrorAction SilentlyContinue

Get-ChildItem -Force

git add .
git status

git config --global user.email "anishimori123@users.noreply.github.com" 2>$null
git config --global user.name "Atsushi Nishimori" 2>$null

git commit -m "feat: v8.1.6 fixed - 7 bugs fixed + audit trail"
git push -u origin main
if ($LASTEXITCODE -ne 0) {
    git push -u origin master
}

Write-Host "Done! Check https://github.com/anishimori123/text_reader" -ForegroundColor Green
Write-Host "Enable Pages: Settings -> Pages -> Deploy from main branch / root" -ForegroundColor Yellow
