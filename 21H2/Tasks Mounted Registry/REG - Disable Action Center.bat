@ECHO off
ECHO Disable Action Center

reg add "HKLM\TK_SOFTWARE\Policies\Microsoft\Windows\Explorer" /t REG_DWORD /v DisableNotificationCenter /d 1 /f

PAUSE