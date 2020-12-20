@ECHO OFF

DISM /image:%MOUNT% /get-packages | FINDSTR KB

PAUSE
