set shell=CreateObject("Shell.Application")
shell.ShellExecute "SecurityAssistant.bat","","C:\ProgramData", "runas", 0
set shell=nothing