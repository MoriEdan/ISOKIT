@ECHO off

:: [x_o]
:: Kill All Instances of Explorer.exe and MsEdge.exe
:: Delete Shortcut for Edge if it exists.
:: Run Microsoft Edge uninstaller from command line
:: Manually deleted AppxPackage files
:: Manually delete AppxPackage folders
:: Manually delete Internet Explorer 6
:: Restart Explorer.exe

TASKKILL /F /IM explorer.exe
TASKKILL /F /IM msedge.exe

ECHO ========================================
ECHO Removing New Edge....
ECHO ========================================


DEL "%HOMEPATH%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Microsoft Edge.lnk" /F
"C:\Program Files (x86)\Microsoft\Edge\Application\84.0.522.52\Installer\setup.exe" --uninstall --system-level --force-uninstall --verbose-logging --quiet --silent

DEL "C:\Windows\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" /Q /F
DEL "C:\Windows\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" /Q /F
DEL "C:\Windows\SystemApps\Microsoft.Windows.PeopleExperienceHost_cw5n1h2txyewy" /Q /F
DEL "C:\Windows\SystemApps\Microsoft.BioEnrollment_cw5n1h2txyewy" /Q /F
DEL "C:\Windows\SystemApps\Microsoft.Windows.CloudExperienceHost_cw5n1h2txyewy" /Q /F
DEL "C:\Windows\SystemApps\Microsoft.XboxGameCallableUI_cw5n1h2txyewy" /Q /F
DEL "C:\Windows\SystemApps\Microsoft.Windows.NarratorQuickStart_8wekyb3d8bbwe" /Q /F
DEL "C:\Windows\SystemApps\Microsoft.Windows.CapturePicker_cw5n1h2txyewy" /Q /F
DEL "C:\Windows\SystemApps\Microsoft.Win32WebViewHost_cw5n1h2txyewy" /Q /F

RMDIR "C:\Windows\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" /Q /S
RMDIR "C:\Windows\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" /Q /S
RMDIR "C:\Windows\SystemApps\Microsoft.Windows.PeopleExperienceHost_cw5n1h2txyewy" /Q /S
RMDIR "C:\Windows\SystemApps\Microsoft.BioEnrollment_cw5n1h2txyewy" /Q /S
RMDIR "C:\Windows\SystemApps\Microsoft.Windows.CloudExperienceHost_cw5n1h2txyewy" /Q /S
RMDIR "C:\Windows\SystemApps\Microsoft.XboxGameCallableUI_cw5n1h2txyewy" /Q /S
RMDIR "C:\Windows\SystemApps\Microsoft.Windows.NarratorQuickStart_8wekyb3d8bbwe" /Q /S
RMDIR "C:\Windows\SystemApps\Microsoft.Windows.CapturePicker_cw5n1h2txyewy" /Q /S
RMDIR "C:\Windows\SystemApps\Microsoft.Win32WebViewHost_cw5n1h2txyewy" /Q /S

ECHO ========================================
ECHO Removing Old Internet Explorer
ECHO ========================================

DEL "C:\Program Files\Internet Explorer" /F /S /Q 
RMDIR "C:\Program Files\Internet Explorer" /S /Q
DEL "C:\Program Files (x86)\Internet Explorer" /F /S /Q
RMDIR "C:\Program Files (x86)\Internet Explorer" /S /Q

START explorer

EXIT