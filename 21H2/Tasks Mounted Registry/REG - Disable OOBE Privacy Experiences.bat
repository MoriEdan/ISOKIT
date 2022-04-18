@ECHO OFF
ECHO Disable OOBE Privacy Experiences

reg add "HKLM\TK_SOFTWARE\Policies\Microsoft\Windows\OOBE" /t REG_DWORD /v DisablePrivacyExperience /d 1 /f

PAUSE