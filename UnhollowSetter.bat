:: UnhollowSetter.bat
:: launches a folder chooser to select where Unhollow dir is
:: Based on:
::  - https://stackoverflow.com/a/15885133/1683264
::  - https://stackoverflow.com/questions/21606419

@echo off
setlocal

set "psCommand="(new-object -COM 'Shell.Application')^
.BrowseForFolder(0,'Please choose a folder.',0,0).self.path""

for /f "usebackq delims=" %%I in (`powershell %psCommand%`) do set "folder=%%I"

setlocal enabledelayedexpansion
echo You chose !folder!
setx UnhollowedDllPath !folder!
endlocal