$ErrorActionPreference = "Stop"
$Root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$Src = Join-Path $Root "browser\firefox-source"
if (-not (Test-Path (Join-Path $Src "mach"))) {
    throw "Firefox source not found. Run scripts\bootstrap.ps1 first."
}
Set-Location $Src
$env:MOZCONFIG = Join-Path $Root "mozconfig"
./mach build
./mach run
