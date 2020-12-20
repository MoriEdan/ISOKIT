@ECHO off

:: [x_o]
:: Clear/Disable Event Logs
:: Disable Hiberation/Fastboot
:: Disable Unwanted Tasks in Task Scheduler
:: Remove Setting Sync
:: Disable Telemtry
:: Disable Cloud Experiences
:: Set up Firewall in STRICT mode
:: Set Registry keys that may have changed during OS Install
:: Remove All OneDriveSync related files/keys
:: Cleanup everything except this file.
:: Restart computer

CLS

WHOAMI

ECHO ========================================
ECHO [x_o]COMPLETING SETUP, DO NOT CLOSE THIS
ECHO YOUR COMPUTER WILL RESTART WHEN DONE
ECHO ========================================

SET SYS32=%WINDIR%\System32
ECHO Checking defaultuser0 isn't running this...
QUERY user > user.txt
(FOR %%A IN (user.txt) DO FINDSTR /MIC:"defaultuser0" "%%A">NUL &&( EXIT )|| ECHO Success...)

ECHO ========================================
ECHO Clearing Event Logs and Disabling Events
ECHO This will take several minutes
ECHO Errors are normal, Some logs will remain
ECHO ========================================

WEVTUTIL EL > .\LOGLIST.TXT
FOR /f "delims=" %%a IN ( .\LOGLIST.TXT ) do WEVTUTIL CL "%%a"
FOR /f "delims=" %%a IN ('WEVTUTIL EL') do WEVTUTIL SL "%%a" /e:false
DEL /F LOGLIST.TXT

ECHO ========================================
ECHO Disabling Hiberation and Fast Boot...
ECHO ========================================

powercfg.exe /hibernate off

ECHO ========================================
ECHO Disabling Tasks...
ECHO ========================================

SCHTASKS /Change /TN "Microsoft\Windows\DiskCleanup\SilentCleanup" /disable
SCHTASKS /Change /TN "Microsoft\Windows\Input\LocalUserSyncDataAvailable" /disable
SCHTASKS /Change /TN "Microsoft\Windows\Input\MouseSyncDataAvailable" /disable
SCHTASKS /Change /TN "Microsoft\Windows\Input\PenSyncDataAvailable" /disable
SCHTASKS /Change /TN "Microsoft\Windows\Input\TouchpadUserSyncDataAvailable" /disable
SCHTASKS /Change /TN "Microsoft\Windows\International\Synchronize Language Settings" /disable
SCHTASKS /Change /TN "Microsoft\Windows\Location\WindowsActionDialog" /disable
SCHTASKS /Change /TN "Microsoft\Windows\Location\Notifications" /disable
SCHTASKS /Change /TN "Microsoft\Windows\Mobile Broadband Accounts\MNO Metadata Parser" /disable
SCHTASKS /Change /TN "Microsoft\Windows\Offline Files\Logon Synchronization" /disable
SCHTASKS /Change /TN "Microsoft\Windows\Offline Files\Background Synchronization" /disable
SCHTASKS /Change /TN "Microsoft\Windows\Ras\MobilityManager" /disable
SCHTASKS /Change /TN "Microsoft\Windows\SpacePort\SpaceAgentTask" /disable
SCHTASKS /Change /TN "Microsoft\Windows\SpacePort\SpaceManagerTask" /disable
SCHTASKS /Change /TN "Microsoft\Windows\Speech\SpeechModelDownloadTask" /disable
SCHTASKS /Change /TN "Microsoft\Windows\Workplace Join\Device-Sync" /disable
SCHTASKS /Change /TN "Microsoft\Windows\Workplace Join\Recovery-Check" /disable
SCHTASKS /Change /TN "Microsoft\Windows\Workplace Join\Automatic-Device-Join" /disable
SCHTASKS /Change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /disable
SCHTASKS /Change /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /disable
SCHTASKS /Change /TN "Microsoft\Windows\Application Experience\StartupAppTask" /disable
SCHTASKS /Change /TN "Microsoft\Windows\Autochk\Proxy" /disable
SCHTASKS /Change /TN "Microsoft\Windows\CloudExperienceHost\CreateObjectTask" /disable
SCHTASKS /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /disable
SCHTASKS /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /disable
SCHTASKS /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /disable
SCHTASKS /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver" /disable
SCHTASKS /Change /TN "Microsoft\Windows\HelloFace\FODCleanupTask" /Disable
SCHTASKS /Change /TN "Microsoft\Windows\DiskFootprint\Diagnostics" /disable
SCHTASKS /Change /TN "Microsoft\Windows\FileHistory\File History (maintenance mode)" /disable
SCHTASKS /Change /TN "Microsoft\Windows\Maintenance\WinSAT" /disable
SCHTASKS /Change /TN "Microsoft\Windows\PI\Sqm-Tasks" /disable
SCHTASKS /Change /TN "Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /disable
SCHTASKS /Change /TN "Microsoft\Windows\Windows Error Reporting\QueueReporting" /disable
SCHTASKS /Change /TN "Microsoft\Windows\Clip\License Validation" /disable
SCHTASKS /Change /TN "Microsoft\Windows\ApplicationData\DsSvcCleanup" /disable
SCHTASKS /Change /TN "Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /disable
SCHTASKS /Change /TN "Microsoft\Windows\Subscription\EnableLicenseAcquisition" /disable
SCHTASKS /Change /TN "Microsoft\Windows\Subscription\LicenseAcquisition" /disable
SCHTASKS /Change /TN "Microsoft\Windows\Diagnosis\RecommendedTroubleshootingScanner" /disable
SCHTASKS /Change /TN "Microsoft\Windows\Diagnosis\Scheduled" /disable
SCHTASKS /Change /TN "Microsoft\Windows\NetTrace\GatherNetworkInfo" /disable
ECHO Finished disabling tasks...

ECHO ========================================
ECHO Removing Setting Sync...
ECHO ========================================

DEL /F /Q "%SYS32%\Tasks\Microsoft\Windows\SettingSync\*"

ECHO ========================================
ECHO Disabling Microsoft Telemetry...
ECHO ========================================

TAKEOWN /F %SYS32%\CompatTelRunner.exe
ICACLS %SYS32%\CompatTelRunner.exe /q /deny "Everyone:(MA,GA,WO)" /inheritancelevel:r
ICACLS %SYS32%\CompatTelRunner.exe /q /deny "SYSTEM:(MA,GA,WO)"

ECHO ========================================
ECHO Disabling CloudExperienceHostBroker...
ECHO ========================================

TAKEOWN /F %SYS32%\CloudExperienceHostBroker.exe
ICACLS %SYS32%\CloudExperienceHostBroker.exe /q /deny "Everyone:(MA,GA,WO)" /inheritancelevel:r
ICACLS %SYS32%\CloudExperienceHostBroker.exe /q /deny "SYSTEM:(MA,GA,WO)"

ECHO ========================================
ECHO Setting up Advanced Firewall in Strict Mode..
ECHO ========================================

NETSH advfirewall import "FireWallRules.wfw"
ECHO Pausing for 10 seconds for rule propagation..
TIMEOUT 10

ECHO ========================================
ECHO Setting Registry Keys...
ECHO ========================================

REG add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /t REG_DWORD /v RDPVGCInstalled /d 0 /f
REG add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /t REG_DWORD /v RDPVGSInstalled /d 0 /f
REG add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /t REG_DWORD /v NtfsEncryptPagingFile /d 1 /f
REG add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /t REG_DWORD /v PlatformSupportMiracast /d 0 /f

REG add "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /t REG_DWORD /v fAllowFullControl /d 0 /f
REG add "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /t REG_DWORD /v fAllowToGetHelp /d 0 /f
REG add "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /t REG_DWORD /v fEnableChatControl /d 0 /f
REG add "HKLM\SOFTWARE\Microsoft\Assistance\Client\1.0\Settings" /t REG_DWORD /v GlobalOnlineAssist /d 0 /f
REG add "HKLM\SOFTWARE\Microsoft\COM3" /t REG_DWORD /v RemoteAccessEnabled /d 0 /f

REG add "HKLM\SOFTWARE\Microsoft\Input" /t REG_DWORD /v InputServiceEnabledForCCI /d 0 /f
REG add "HKLM\SOFTWARE\Microsoft\Input" /t REG_DWORD /v InputServiceEnabled /d 0 /f
REG add "HKLM\SOFTWARE\Microsoft\Clipboard" /t REG_DWORD /v IsClipboardSignalProducingFeatureAvailable /d 0 /f
REG add "HKLM\SOFTWARE\Microsoft\Clipboard" /t REG_DWORD /v IsCloudAndHistoryFeatureAvailable /d 0 /f
REG add "HKLM\SOFTWARE\Microsoft\Internet Explorer" /t REG_DWORD /v IntegratedBrowser /d 0 /f

REG add "HKLM\SOFTWARE\Microsoft\Wisp\MultiTouch" /t REG_DWORD /v MultiTouchEnabled /d 0 /f
REG add "HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\AboveLock" /t REG_DWORD /v AllowCortanaAboveLock /d 0 /f
REG add "HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\DataProtection" /t REG_DWORD /v AllowDirectMemoryAccess /d 0 /f
REG add "HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\Experience" /t REG_DWORD /v AllowCortana /d 0 /f

REG add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing" /t REG_DWORD /v EnableLog /d 0 /f
REG add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\ConnectedSearch" /t REG_DWORD /v ConnectedSearchUseWeb /d 0 /f
REG add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Spectrum" /t REG_DWORD /v SharedExperiencesEnabled /d 0 /f
REG add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\PrecisionTouchPad" /t REG_DWORD /v AAPDisabled /d 1 /f
REG add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" /t REG_DWORD /v EnableWebContentEvaluation /d 0 /f
REG add "HKLM\SYSTEM\ControlSet001\Control\Diagnostics\Performance" /t REG_DWORD /v DisableDiagnosticTracing /d 1 /f

REG add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\MobilityCenter" /t REG_DWORD /v NoMobilityCenter /d 1 /f
REG add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\CredSSP\Parameters" /t REG_DWORD /v AllowEncryptionOracle /d 0 /f
REG add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\PrecisionTouchPad" /t REG_DWORD /v AAPDisabled /d 1 /f
REG add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy" /t REG_DWORD /v TailoredExperiencesWithDiagnosticDataEnabled /d 0 /f
REG add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Syncmgr" /t REG_DWORD /v Installed /d 0 /f

REG add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /t REG_DWORD /v AllowOnlineTips /d 0 /f
REG add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /t REG_DWORD /v NoWebServices /d 1 /f
REG add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /t REG_DWORD /v DisableAppInstallsOnFirstLogon /d 1 /f
REG add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /t REG_DWORD /v MachineOobeUpdates /d 0 /f
REG add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /t REG_DWORD /v ActiveSetupDisabled /d 1 /f
REG add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /t REG_DWORD /v Start_TrackDocs /d 0 /f

::REG add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\FlightedFeatures" /t REG_DWORD /v ComponentUIForWinRTPicker /d 0 /f
REG add "HKLM\SOFTWARE\Microsoft\Windows\ScheduledDiagnostics" /t REG_DWORD /v EnabledExecution /d 0 /f
REG add "HKLM\SOFTWARE\Policies\Microsoft\Windows\ScheduledDiagnostics" /t REG_DWORD /v EnabledExecution /d 0 /f
REG add "HKLM\SOFTWARE\Microsoft\Windows\ScriptedDiagnosticsProvider\Policy" /t REG_DWORD /v EnableQueryRemoteServer /d 0 /f
REG add "HKLM\SOFTWARE\Policies\Microsoft\Windows\ScriptedDiagnostics" /t REG_DWORD /v EnableDiagnostics /d 0 /f

REG add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting\BrokerUp" /t REG_DWORD /v WWAJSE /d 0 /f
REG add "HKLM\SOFTWARE\Microsoft\Clipboard" /t REG_DWORD /v IsClipboardSignalProducingFeatureAvailable /d 0 /f
REG add "HKLM\SOFTWARE\Microsoft\Clipboard" /t REG_DWORD /v IsCloudAndHistoryFeatureAvailable /d 0 /f

REG add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Maps" /t REG_DWORD /v AutoDownloadAndUpdateMapData /d 0 /f
REG add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Messaging" /t REG_DWORD /v AllowMessageSync /d 0 /f
REG add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /t REG_DWORD /v AllowGameDVR /d 0 /f

REG add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /t REG_DWORD /v DisableCloudOptimizedContent /d 1 /f
REG add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /t REG_DWORD /v DisableSoftLanding /d 1 /f
REG add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /t REG_DWORD /v DisableWindowsConsumerFeatures /d 1 /f
REG add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Connect" /t REG_DWORD /v AllowProjectionToPC /d 0 /f

REG add "HKLM\SOFTWARE\Microsoft\DataCollection\Default\WifiAutoConnectConfig" /t REG_DWORD /v AutoConnectEnabled /d 0 /f
REG add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /t REG_DWORD /v AllowCommercialDataPipeline /d 0 /f
REG add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /t REG_DWORD /v AllowDesktopAnalyticsProcessing /d 0 /f
REG add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /t REG_DWORD /v AllowTelemetry /d 0 /f
REG add "HKLM\SOFTWARE\Policies\Microsoft\Windows\FileHistory" /t REG_DWORD /v Disabled /d 1 /f

REG add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /t REG_DWORD /v DisableLocation /d 1 /f
REG add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /t REG_DWORD /v DisableLocationScripting /d 1 /f
REG add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /t REG_DWORD /v DisableSensors /d 1 /f
REG add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /t REG_DWORD /v DisableWindowsLocationProvider /d 1 /f

REG add "HKLM\SOFTWARE\Policies\Microsoft\Windows\NetCache" /t REG_DWORD /v BackgroundSyncEnabled /d 0 /f
REG add "HKLM\SOFTWARE\Policies\Microsoft\Windows\NetCache" /t REG_DWORD /v BackgroundSyncEnabledForForcedOffline /d 0 /f
REG add "HKLM\SOFTWARE\Policies\Microsoft\Windows\NetCache" /t REG_DWORD /v Enabled /d 0 /f

REG add "HKLM\SOFTWARE\Policies\Microsoft\Windows\NvCache" /t REG_DWORD /v EnableNvCache /d 0 /f
REG add "HKLM\SOFTWARE\Policies\Microsoft\Windows\NvCache" /t REG_DWORD /v EnablePowerModeState /d 0 /f
REG add "HKLM\SOFTWARE\Policies\Microsoft\Windows\NvCache" /t REG_DWORD /v EnableSolidStateMode /d 0 /f
REG add "HKLM\SOFTWARE\Policies\Microsoft\Windows\NvCache" /t REG_DWORD /v OptimizeBootAndResume /d 0 /f

REG add "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /t REG_DWORD /v DisableFileSync /d 1 /f
REG add "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /t REG_DWORD /v DisableFileSyncNGSC /d 1 /f
REG add "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /t REG_DWORD /v DisableLibrariesDefaultSaveToOneDrive /d 1 /f
REG add "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /t REG_DWORD /v DisableMeteredNetworkFileSync /d 1 /f

REG add "HKLM\SOFTWARE\Policies\Microsoft\Windows\OOBE" /t REG_DWORD /v DisablePrivacyExperience /d 1 /f
REG add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Personalization" /t REG_DWORD /v NoLockScreenCamera /d 1 /f
REG add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Personalization" /t REG_DWORD /v NoLockScreenSlideshow /d 1 /f
REG add "HKLM\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds" /t REG_DWORD /v AllowBuildPreview /d 0 /f
REG add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Registration Wizard Control" /t REG_DWORD /v NoRegistration /d 1 /f
REG add "HKLM\SYSTEM\ControlSet001\Control\SCMConfig" /t REG_DWORD /v EnableSvchostMitigationPolicy /d 1 /f
REG add "HKLM\SOFTWARE\AMD\CN" /t REG_DWORD /v CollectGIData /d 0 /f

REG add "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync" /t REG_DWORD /v EnableBackupForWin8Apps /d 0 /f
REG add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /t REG_DWORD /v ConnectedSearchUseWeb /d 0 /f
REG add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /t REG_DWORD /v DisableWebSearch /d 1 /f
REG add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /t REG_DWORD /v AllowCortana /d 0 /f
REG add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /t REG_DWORD /v AllowCortanaAboveLock /d 0 /f
REG add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /t REG_DWORD /v AllowSearchToUseLocation /d 0 /f
REG add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /t REG_DWORD /v AllowCloudSearch /d 0 /f

ECHO ========================================
ECHO Removing One Drive....
ECHO ========================================

REG delete "HKEY_CLASSES_ROOT\CLSID\{099EB73C-FF12-45C5-BF64-F0277733A6E2}" /f
REG delete "HKEY_CLASSES_ROOT\CLSID\{34212D32-6E9E-11E2-BDA0-6B2B6288709B}" /f
REG delete "HKEY_CLASSES_ROOT\CLSID\{3FC77A3B-14C6-41B6-ACC5-ED80223D81C4}" /f
REG delete "HKEY_CLASSES_ROOT\CLSID\{D6ABE021-1DE0-49F4-895D-E9694D28F0A4}" /f
REG delete "HKEY_CLASSES_ROOT\CLSID\{DDB93701-527B-4250-B619-672EFD3C5B21}" /f
REG delete "HKEY_CLASSES_ROOT\WOW6432Node\CLSID\{099EB73C-FF12-45C5-BF64-F0277733A6E2}" /f
REG delete "HKEY_CLASSES_ROOT\WOW6432Node\CLSID\{3FC77A3B-14C6-41B6-ACC5-ED80223D81C4}" /f
REG delete "HKEY_CLASSES_ROOT\WOW6432Node\CLSID\{D6ABE021-1DE0-49F4-895D-E9694D28F0A4}" /f
REG delete "HKEY_CLASSES_ROOT\WOW6432Node\CLSID\{DDB93701-527B-4250-B619-672EFD3C5B21}" /f
REG delete "HKEY_CLASSES_ROOT\WOW6432Node\CLSID\{34212D32-6E9E-11E2-BDA0-6B2B6288709B}" /f
REG delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Publishers\{f43c3c35-22e2-53eb-f169-07594054779e}" /f
DEL "C:\Windows\System32\OneDriveSettingSyncProvider.dll" /f
DEL "C:\Windows\SysWOW64\OneDriveSettingSyncProvider.dll" /f
DEL "%HOMEPATH%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\OneDrive.lnk" /f
DEL "C:\ProgramData\Microsoft OneDrive" /F /S /Q
RMDIR "C:\ProgramData\Microsoft OneDrive" /S /Q
RMDIR "C:\ProgramData\Packages" /S /Q

ECHO ========================================
ECHO Exiting and Running Cleanup...
ECHO ========================================

DEL C:\Windows\FireWallRules.wfw
DEL C:\Windows\FirstLoginTrustedInstaller.cmd
DEL C:\Windows\FirstLoginTask.cmd
DEL C:\Windows\NSudo.exe
DEL C:\Windows\user.txt
DEL "C:\F" /F /S /Q 
RMDIR "C:\F" /S /Q 

SHUTDOWN /R /T 10 /F
EXIT
pause
exit