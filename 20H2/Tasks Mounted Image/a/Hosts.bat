@ECHO OFF

::[x_o] Replaces the host file and others with more secure versions
:: Also blocks Edge Updates

DEL %TEMP%\ACL.txt /F

SET HOSTPATH="%MOUNT%\Windows\System32\drivers\etc"

:: Save ACL & Take Ownership
ICACLS %HOSTPATH% /save %TEMP%\ACL.txt /t /q /c
TAKEOWN /F %HOSTPATH% /a /r
ICACLS %HOSTPATH% /grant:r administrators:F /t /q /c

:: Delete Old Files
DEL "%HOSTPATH%" /Q /F

:: Copy New Hosts file Etc
COPY "%~dp0etc\hosts" "%HOSTPATH%\hosts" /Y
COPY "%~dp0etc\lmhosts.sam" "%HOSTPATH%\lmhosts.sam" /Y
COPY "%~dp0etc\networks" "%HOSTPATH%\networks" /Y
COPY "%~dp0etc\protocol" "%HOSTPATH%\protocol" /Y
COPY "%~dp0etc\services" "%HOSTPATH%\services" /Y

:: Restore ACL and Ownership
ICACLS %MOUNT%\Windows\System32\drivers /restore %TEMP%\ACL.txt /t /q /c
ICACLS %HOSTPATH% /setowner "SYSTEM" /t /q /c

PAUSE