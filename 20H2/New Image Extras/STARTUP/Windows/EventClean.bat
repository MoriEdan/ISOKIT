@ECHO off

:: [x_o]
:: Creates a Task in the Task Scheduler that periodically clears the Event Logs
:: Also disables the Events so new Event Logs aren't collected.
:: You can add anything you want to happen every 15 days to EventClean.cmd

CLS

:init
SETLOCAL DisableDelayedExpansion
SET "batchPath=%~0"
FOR %%k IN (%0) DO SET batchName=%%~nk
SET "vbsGetPrivileges=%temp%\OEgetPriv_%batchName%.vbs"
SETLOCAL EnableDelayedExpansion
:checkPrivileges
NET FILE 1>Nul 2>Nul
IF '%errorlevel%' == '0' (ECHO ELEVATED & GOTO gotPrivileges) ELSE (GOTO getPrivileges)
:getPrivileges
IF '%1'=='ELEV' (ECHO ELEVATED & SHIFT /1 & GOTO gotPrivileges )
ECHO Elevating shell..
ECHO Set UAC = CreateObject^("Shell.Application"^) > "%vbsGetPrivileges%"
ECHO args = "ELEV " >> "%vbsGetPrivileges%"
ECHO For Each strArg in WScript.Arguments >> "%vbsGetPrivileges%"
ECHO args = args ^& strArg ^& " "  >> "%vbsGetPrivileges%"
ECHO Next >> "%vbsGetPrivileges%"
ECHO UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%vbsGetPrivileges%"
"%SystemRoot%\System32\WScript.exe" "%vbsGetPrivileges%" %*
EXIT /B
:gotPrivileges
SETLOCAL & PUSHD .
CD /d %~dp0
IF '%1'=='ELEV' (DEL "%vbsGetPrivileges%" 1>NUL 2>NUL  &  SHIFT /1)
TIMEOUT /T 3

ECHO ========================================
ECHO Clearing Event Logs and Disabling Event Logging...
WEVTUTIL EL > .\LOGLIST.TXT
for /f "delims=" %%a in ( .\LOGLIST.TXT ) do WEVTUTIL CL "%%a"
for /f "delims=" %%a in ('WEVTUTIL EL') do WEVTUTIL SL "%%a" /e:false
ECHO ========================================