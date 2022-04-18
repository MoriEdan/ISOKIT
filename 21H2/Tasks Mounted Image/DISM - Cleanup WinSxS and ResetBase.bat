@ECHO OFF
WHOAMI
CLS
ECHO.
ECHO ========================================
ECHO [x_o]CLEANING UP COMPONENT STORE
ECHO RESETTING WINDOWS 10 BASE AND CREATING NEW VERSION
ECHO ========================================

DISM /image:%MOUNT% /Cleanup-Image /AnalyzeComponentStore

Dism /image:%MOUNT% /Optimize-ProvisionedAppxPackages

DISM /image:%MOUNT% /Cleanup-Image /StartComponentCleanup

DISM /image:%MOUNT% /Cleanup-Image /SPSuperseded

DISM /image:%MOUNT% /Cleanup-Image /StartComponentCleanup /ResetBase

DISM /image:%MOUNT% /Cleanup-Image /AnalyzeComponentStore

PAUSE
