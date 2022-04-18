@ECHO off

:: [x_o]
:: Save Ownership information for StateRepository
:: Take Ownership of the StateRepository
:: Stop the StateRepository SERVICE
:: Use SQLITE3 to execute Commands.sql in StateRepository.srd
:: Restore Ownership of StateRepository
:: Start the StateRepository SERVICE
:: Remove AppxPackages
:: Remove AppxPackage Files

WHOAMI

ECHO =================================
ECHO SAVING ACL/TAKING OWNERSHIP
ECHO =================================

ICACLS C:\ProgramData\Microsoft\Windows\AppRepository\* /save %TEMP%\ACL.txt /t /q /c
TAKEOWN /F C:\ProgramData\Microsoft\Windows\AppRepository /a /r
ICACLS C:\ProgramData\Microsoft\Windows\AppRepository\* /grant:r administrators:F /t /q /c
ICACLS C:\ProgramData\Microsoft\Windows\AppRepository\StateRepository-Machine.srd /grant:r administrators:F

ECHO =================================
ECHO STOPPING SERVICES
ECHO =================================

powershell Stop-Service -Name "StateRepository" -Force
SC STOP AppXSvc
SC STOP StateRepository

ECHO =================================
ECHO ATTEMPTING DATABASE MODIFICATIONS
ECHO =================================

C:\F\sqlite3 "C:\ProgramData\Microsoft\Windows\AppRepository\StateRepository-Machine.srd" < "C:\F\commands.sql"

ECHO =================================
ECHO RESTORING ACL/OWNERSHIP
ECHO =================================

start "RestoreOwnership" "NSudo.exe" -U:T -P:E "C:\F\FirstRestoreOwner.cmd"

ECHO =================================
ECHO STARTING SERVICES
ECHO =================================

SC START StateRepository

ECHO =================================
ECHO REMOVE APPX PACKAGES
ECHO =================================

start /b powershell Remove-AppxPackage -Package "Microsoft.MicrosoftEdgeDevToolsClient_1000.19041.423.0_neutral_neutral_8wekyb3d8bbwe" -AllUsers
start /b powershell Remove-AppxPackage -Package "Microsoft.MicrosoftEdge_44.19041.423.0_neutral__8wekyb3d8bbwe" -AllUsers
start /b powershell Remove-AppxPackage -Package "Microsoft.Windows.PeopleExperienceHost_10.0.19041.423_neutral_neutral_cw5n1h2txyewy" -AllUsers
start /b powershell Remove-AppxPackage -Package "Microsoft.BioEnrollment_10.0.19041.423_neutral__cw5n1h2txyewy" -AllUsers
start /b powershell Remove-AppxPackage -Package "Microsoft.Windows.CloudExperienceHost_10.0.19041.423_neutral_neutral_cw5n1h2txyewy" -AllUsers
start /b powershell Remove-AppxPackage -Package "Microsoft.XboxGameCallableUI_1000.19041.423.0_neutral_neutral_cw5n1h2txyewy" -AllUsers
start /b powershell Remove-AppxPackage -Package "Microsoft.Windows.NarratorQuickStart_10.0.19041.423_neutral_neutral_8wekyb3d8bbwe" -AllUsers
start /b powershell Remove-AppxPackage -Package "Microsoft.Windows.CapturePicker_10.0.19041.423_neutral__cw5n1h2txyewy" -AllUsers
start /b powershell Remove-AppxPackage -Package "Microsoft.Win32WebViewHost_10.0.19041.423_neutral_neutral_cw5n1h2txyewy" -AllUsers

start "DeletePackages" "NSudo.exe" -U:T -P:E "C:\F\FirstPackagesToDelete.cmd"

exit