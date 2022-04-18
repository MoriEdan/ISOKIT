@echo off
echo Image Version: 10.0.19044.1288

DISM /image:%MOUNT% /Remove-Capability /CapabilityName:Print.Management.Console~~~~0.0.1.0
DISM /image:%MOUNT% /Remove-Capability /CapabilityName:OpenSSH.Client~~~~0.0.1.0
DISM /image:%MOUNT% /Remove-Capability /CapabilityName:OneCoreUAP.OneSync~~~~0.0.1.0
DISM /image:%MOUNT% /Remove-Capability /CapabilityName:Microsoft.Windows.WordPad~~~~0.0.1.0
DISM /image:%MOUNT% /Remove-Capability /CapabilityName:Print.Fax.Scan~~~~0.0.1.0
DISM /image:%MOUNT% /Remove-Capability /CapabilityName:Media.WindowsMediaPlayer~~~~0.0.12.0
DISM /image:%MOUNT% /Remove-Capability /CapabilityName:MathRecognizer~~~~0.0.1.0
DISM /image:%MOUNT% /Remove-Capability /CapabilityName:Hello.Face.Migration.18967~~~~0.0.1.0
DISM /image:%MOUNT% /Remove-Capability /CapabilityName:Hello.Face.18967~~~~0.0.1.0
DISM /image:%MOUNT% /Remove-Capability /CapabilityName:Browser.InternetExplorer~~~~0.0.11.0
DISM /image:%MOUNT% /Remove-Capability /CapabilityName:App.StepsRecorder~~~~0.0.1.0
DISM /image:%MOUNT% /Remove-Capability /CapabilityName:Language.Speech~~~en-US~0.0.1.0
DISM /image:%MOUNT% /Remove-Capability /CapabilityName:Language.TextToSpeech~~~en-US~0.0.1.0
DISM /image:%MOUNT% /Remove-Capability /CapabilityName:Language.OCR~~~en-US~0.0.1.0
DISM /image:%MOUNT% /Remove-Capability /CapabilityName:Language.Handwriting~~~en-US~0.0.1.0
DISM /image:%MOUNT% /Remove-Capability /CapabilityName:App.Support.QuickAssist~~~~0.0.1.0

PAUSE