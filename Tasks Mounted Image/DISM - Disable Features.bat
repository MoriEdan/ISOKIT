DISM /image:%MOUNT% /Disable-Feature /FeatureName:WindowsMediaPlayer 
DISM /image:%MOUNT% /Disable-Feature /FeatureName:MediaPlayback 
DISM /image:%MOUNT% /Disable-Feature /FeatureName:WCF-TCP-PortSharing45 
DISM /image:%MOUNT% /Disable-Feature /FeatureName:NetFx4-AdvSrvs 
DISM /image:%MOUNT% /Disable-Feature /FeatureName:Printing-Foundation-InternetPrinting-Client 
DISM /image:%MOUNT% /Disable-Feature /FeatureName:Printing-Foundation-Features 
DISM /image:%MOUNT% /Disable-Feature /FeatureName:MSRDC-Infrastructure 
DISM /image:%MOUNT% /Disable-Feature /FeatureName:SearchEngine-Client-Package 
DISM /image:%MOUNT% /Disable-Feature /FeatureName:Printing-XPSServices-Features 
DISM /image:%MOUNT% /Disable-Feature /FeatureName:Printing-PrintToPDFServices-Features 
DISM /image:%MOUNT% /Disable-Feature /FeatureName:SmbDirect 
DISM /image:%MOUNT% /Disable-Feature /FeatureName:Internet-Explorer-Optional-amd64
DISM /image:%MOUNT% /Disable-Feature /FeatureName:WorkFolders-Client

PAUSE