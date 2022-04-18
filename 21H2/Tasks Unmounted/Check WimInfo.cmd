@ECHO OFF

DISM /Get-WimInfo /WimFIle:"%toolkit%\MSMG\DVD\sources\install.wim" /index:1

PAUSE
