@ECHO off

:: [x_o] 
:: Restores ACL List from File
:: Set Owner as SYSTEM

ICACLS C:\ProgramData\Microsoft\Windows\AppRepository /restore %TEMP%\ACL.txt /t /q /c
ICACLS C:\ProgramData\Microsoft\Windows\AppRepository /setowner "SYSTEM" /t /q /c
ICACLS C:\ProgramData\Microsoft\Windows\AppRepository\* /setowner "SYSTEM" /t /q /c

EXIT