ECHO It literally says not to do this in the filename
PAUSE
EXIT
@ECHO off 

SET UnwantedSystemFiles=MicrosoftEdgeBCHost.exe MicrosoftEdgeCP.exe MicrosoftEdgeDevTools.exe MicrosoftEdgeSH.exe mobsync.exe msra.exe mstsc.exe mstscax.dll PerceptionSimulationDevice.exe PerceptionSimulationExtensions.dll PerceptionSimulationManager.dll PhoneCallHistoryApis.dll phoneactivate.exe rasadhlp.dll rasppp.dll rdpsign.exe SnippingTool.exe XblGameSaveExt.dll XblGameSaveProxy.dll XblGameSaveTask.exe XblGameSave.dll XboxGipRadioManager.dll XblAuthManager.dll XblAuthManagerProxy.dll remoteaudioendpoint.dll remotepg.dll rasautou.exe raschap.dll raschapext.dll rasauto.dll raschap.dll raschapext.dll rasdiag.dll rasdial.exe rasdlg.dll raserver.exe rasgcw.dll rasman.dll rasmans.dll rasmbmgr.dll RasMediaManager.dll RASMM.dll rasmontr.dll rasphone.exe rasplap.dll rasppp.dll rastlsext.dll rdpbase.dll rdpcfgex.dll rdpcore.dll rdpcorets.dll rdpencom.dll rdpendp.dll rdpinit.exe rdpinput.exe rdpnano.dll RdpRelayTransport.dll RdaSa.exe RdpSaProxy.exe RdpSaPs.dll RdpSaUacHelper.exe rdpserverbase.dll rdpshell.exe rdpsign.exe rdpudd.dll rdsdwmdr.dll regsvc.dll RemotePosWorker.exe rdpclip.exe RdpSa.exe RemoteAppLifetimeManager.exe RemoteAppLifetimeManagerProxyStub.dll SessEnv.dll mstsc.exe TsUsbGDCoInstaller.dll tspubwmi.dll mstscax.dll change.exe umrdp.dll tskill.exe TSErrRedir.dll tscfgwmi.dll termsrv.dll sessionmsg.exe MsRdpWebAccess.dll TSWbPrxy.exe LSCSHostPolicy.dll GamePanel.exe GameBarPresenceWriter.exe GameBarPresenceWriter.proxy.dll GameChatOverlayExt.dll GameChatTranscription.dll GamePanelExternalHook.dll FileHistory.exe fhmanagew.exe CloudExperienceHostBroker.exe CloudNotifications.exe bthudtask.exe xboxgipsynthetic.dll xboxgipsvc.dll WindowsCodecsRaw.dll edgehtml.dll Windows.Media.Protection.PlayReady.dll aitstatic.exe

SET MountPath=%MOUNT%\Windows\System32
(FOR %%a IN (%UnwantedSystemFiles%) DO ( 
ECHO --------------------------------------------
ECHO Removing %%a from the Mounted Images System32 Folder...
TAKEOWN /F %MOUNTPATH%\%%a
ICACLS %MOUNTPATH%\%%a /grant administrators:F /q
TASKKILL /IM "%%a" /F
DEL /f %MOUNTPATH%\%%a
ECHO --------------------------------------------
))

SET MountPath=%MOUNT%\Windows\SysWOW64
(FOR %%a IN (%UnwantedSystemFiles%) DO (
ECHO -------------------------------------------- 
ECHO Removing %%a from the Mounted Images SysWow64 Folder...
TAKEOWN /F %MOUNTPATH%\%%a
ICACLS %MOUNTPATH%\%%a /grant administrators:F /q
TASKKILL /IM "%%a" /F
DEL /f %MOUNTPATH%\%%a
ECHO --------------------------------------------
))

ECHO Removal Finished...
PAUSE