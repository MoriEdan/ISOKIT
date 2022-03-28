@ECHO OFF

IF "%PROCESSOR_ARCHITECTURE%" equ "x86" SET "Arch=x86"
IF "%PROCESSOR_ARCHITECTURE%" equ "AMD64" SET "Arch=x64"

@START /b "" "%~dp0..\MSMG\Bin\%Arch%\NSudo.exe" -U:T -P:E "%~dp0reg\tiREG.cmd"
