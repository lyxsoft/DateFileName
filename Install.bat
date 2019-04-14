@ECHO OFF
REM Current Folder is %~dp0
REM Install

REG ADD "HKCU\Software\Classes\*\shell\LyxSoft" /f
REG ADD "HKCU\Software\Classes\*\shell\LyxSoft" /v "Icon" /d "%SystemRoot%\System32\SHELL32.dll,316" /f
REG ADD "HKCU\Software\Classes\*\shell\LyxSoft" /v "MUIVerb" /d "LyxSoft Tools" /f
REG ADD "HKCU\Software\Classes\*\shell\LyxSoft" /v "SubCommands" /d "" /f

REG ADD "HKCU\Software\Classes\*\shell\LyxSoft\shell\LyxSoft.TodayFile" /f
REG ADD "HKCU\Software\Classes\*\shell\LyxSoft\shell\LyxSoft.TodayFile" /ve /d "Create Today's File" /f
REG ADD "HKCU\Software\Classes\*\shell\LyxSoft\shell\LyxSoft.TodayFile" /v "Icon" /d "%SystemRoot%\System32\SHELL32.dll,68" /f

REG ADD "HKCU\Software\Classes\*\shell\LyxSoft\shell\LyxSoft.TodayFile\Command" /f
REG ADD "HKCU\Software\Classes\*\shell\LyxSoft\shell\LyxSoft.TodayFile\Command" /ve /d "WScript.exe """%~dp0DateFileName.vbs""" """%%1""" %%*" /f

CLS
ECHO Install done.
ECHO.
ECHO If you like to uninstall, delete the register key:
ECHO  HKCU\Software\Classes\*\shell\LyxSoft\shell\LyxSoft.TodayFile
ECHO.
ECHO Li Yingxin @ 2019.04
ECHO.
ECHO Press any key to finish the installation.
ECHO.
PAUSE
