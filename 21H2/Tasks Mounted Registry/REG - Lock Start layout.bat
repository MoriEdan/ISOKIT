@ECHO OFF
ECHO Lock Start Layout
reg add "HKLM\TK_SOFTWARE\Policies\Microsoft\Windows\Explorer" /t REG_DWORD /v LockedStartLayout /d 1 /f

PAUSE