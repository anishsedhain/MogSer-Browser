$ErrorActionPreference = "Stop"
$Root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$Src = Join-Path $Root "browser\firefox-source"
New-Item -ItemType Directory -Force -Path (Split-Path -Parent $Src) | Out-Null
if (-not (Test-Path (Join-Path $Src ".git"))) {
    git clone https://github.com/mozilla-firefox/firefox.git $Src
}
Set-Location $Src
python python\mozboot\bin\bootstrap.py
Write-Host ""
Write-Host "After Mozilla's bootstrap completes, use the MozillaBuild shell:"
Write-Host "  cd <MogSer>\browser\firefox-source"
Write-Host "  ./mach build"
Write-Host "  ./mach run"
