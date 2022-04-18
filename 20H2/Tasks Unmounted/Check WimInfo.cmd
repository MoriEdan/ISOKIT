@ECHO OFF

DISM /Get-WimInfo /WimFIle:%mount%\sources\install.wim /index:1

PAUSE
