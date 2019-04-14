@ECHO OFF
REM Un-Install the tool

REG DELETE "HKCU\Software\Classes\*\shell\LyxSoft\shell\LyxSoft.TodayFile" /f

CLS
ECHO Tool Un-Install done.
ECHO You can now delete the file.
ECHO.
ECHO Li Yingxin @ 2019.04
ECHO.
ECHO Press any key to finish the un-installation.
ECHO.
PAUSE
