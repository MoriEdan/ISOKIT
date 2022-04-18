@ECHO OFF
ECHO Disable Task View Button

reg add "HKLM\TK_SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /t REG_DWORD /v ShowTaskViewButton /d 0 /f
reg add "HKLM\TK_SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MultitaskingView\AllUpView" /t REG_DWORD /v AllUpView /d 0 /f

PAUSE