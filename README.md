# Windows 10 Professional - Full Strip & Lockdown Edition
 Current Supported Version: 21H2 (OS Build 19044.1288)
 
[You can download the Most Recent ISO here if you don't want to make it yourself](https://mega.nz/file/40glhTaA#4F-bfFZsvsWoIAmXPTz0-CYDehI7pGNMvuzMnHB-c_4)

This image includes all modifications here and is ready to install on any PC. Security by default, Just install and go.

Please install this with no internet connection for the best experience, especially on slower machines.

# HIGHLIGHTS IN THIS VERSION:

- Customized OS install (Unattend.xml)
- All prepackaged apps have been removed.
- All optional features have been disabled by default.
- All remote access has been removed.
- Kernel debugging has been removed.
- Strict firewall rules are imported on first login.
- Extremely Strict process/service mitigations applied at first login.
- Strict group policy.
- All Microsoft Experiences and Tracking etc has been disabled.
- Most Error reporting, diagnostics and data collection has been disabled.
- Most Event logs have been disabled (some cant be disabled).
- One drive / Edge and Internet Explorer have been removed.
- The start menu has been cleared of excess apps.
- Settings have been hidden to avoid alteration.
- A significant number of Scheduled Tasks have been disabled.
- An extreme number of registry keys have been tweaked to give you more privacy/security by default.
- A significant amount of services have been removed or had their capabilities limited.

# NOTES REGARDING ANTI-CHEATS

Invasive drivers can not run on this image by default, Please read carefully.

https://github.com/HypsyNZ/ISOKIT/wiki/NOTES-REGARDING-ANTI-CHEATS
 
# GETTING STARTED MAKING YOUR OWN IMAGE

You don't have to use the download, everything to make it yourself is right here.

Scripts that modify the registry require you to mount the registry first with MSMG.

You'll need to create an environment variable called `MOUNT` that points to `MSMG\Mount\Install`

This ISOKit includes a reduced version of MSMG to make it easier to mount images etc, You can use DISM Directly if you wish.

All the scripts are set up to use the `MOUNT` variable.

 # IMAGE ADDITION SETUP
 
 ## [FOLDER] STARTUP\DEFAULT
- Place NTUser.dat in Mount\Install\Users\Default after mounting image
- Changes multiple registry settings
- Runs the first login script


## [FOLDER] STARTUP\F
- Drag and drop folder into Mount\Install after mounting image
- Contains logic to delete packages (Including IsInBox)
- Uses SQLite to automatically edit StateRepository so you can remove system apps.


## [FOLDER] STARTUP\Windows
- Drag and drop folder into Mount\Install after mounting image
- Contains default Group Policy (Full lockdown)
- Contains "Unattend.xml" to configure OOBE and the image
- Contains FireWall rules, replace/delete FireWallRules.wfw if you wish.
- Contains EventClean.cmd which will remain after the first login.

# COMMAND ELEVATION
 
 ## TrustedInstaller - Command Prompt
 - Run the command prompt as NT Authority\TrustedInstaller
 
 ## TrustedInstaller - Regedit
 - Edit the registry as NT Authority\TrustedInstaller
 
 
# DISM Mounted Tasks

### Remove Provisioned Packages
- Removes a majority of the bloat (Default UWP Apps)

### Disable Packages
- Removes things like user experiences and hello face

### Disable Features
- Disables the "Optional Features" that are installed by default 

### Disable Capabilities
- Removes various optional packages

### Cleanup WinSxS and ResetBase
- Cleans up the image and removes superceded updates etc.

### Check Installed Image Updates
- Checks what updates and already in the image

# REGISTRY Mounted Tasks

### Allow Payload Removal
- Lets you remove files for payloads that were removed

### Default Mitigations [!IMPORTANT]
- Default Mitigations to protect services and programs from manipulation by external processes and various other exploits.

### Disable Recent Docs
- Disables "Recent Opened Documents" functionality.

### Disable Telemetry
- Disables Microsofts ability to collect telemetry information

### Disable UAC
- Turns off User Account Control

### Hide Settings
- Hides settings that you dont want the user to view or edit

### Remove KDNIC as Trusted Installer
- Elevates you to NT Authority and removes the Kernel Debugging Network Driver and its assosiated files.

### Remove Services as TrustedInstaller
- Removes various Windows Services from the image permanantly.

### Remove ThisPC Folders
- Removes annoying folders in file explorer


# DISABLE UNWANTED TASKS (FirstLogin.cmd)

```
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
```

# CHANGE UNWANTED REGISTRY SETTINGS (FirstLogin.cmd)
```
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
```

Please make sure you read everything carefully if you make your own image.

## ACTIVATION / LICENSE

This is a legitimate image made with official tools and known sources of good information, This image is not made or endorsed or supported by Microsoft in any way.

You will still need to activate windows with your license or use your organizations activation service.

All rights reserved by Microsoft, This image can receive windows updates but may stop receiving them at any time at Microsofts sole discretion.