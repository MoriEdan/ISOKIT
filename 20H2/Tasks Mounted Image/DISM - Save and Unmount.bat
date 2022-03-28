@ECHO OFF

ECHO Commiting changes and unmounting image.

DISM /Unmount-image /MountDir:%MOUNT% /commit