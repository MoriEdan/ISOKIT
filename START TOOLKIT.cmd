@echo off

IF "%PROCESSOR_ARCHITECTURE%" equ "x86" SET "Arch=x86"
IF "%PROCESSOR_ARCHITECTURE%" equ "AMD64" SET "Arch=x64"

@START /b "" "%~dp0MSMG\Bin\%Arch%\NSudo.exe" -U:T -P:E "%~dp0MSMG\tk.cmd"
