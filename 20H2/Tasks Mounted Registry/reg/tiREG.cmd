reg delete HKEY_LOCAL_MACHINE\TK_COMPONENTS\Drivers\amd64\kdnic.inf /f
reg delete HKEY_LOCAL_MACHINE\TK_SOFTWARE\Microsoft\Windows\CurrentVersion\Setup\PnpLockdownFiles\%%SystemRoot%%/System32/drivers/kdnic.sys /f
::reg delete HKEY_LOCAL_MACHINE\TK_COMPONENTS\CanonicalData\Deployments\dual_kdnic.inf_31bf3856ad364e35_10.0.19041.1_272c88640323e7fc /f
::reg delete HKEY_LOCAL_MACHINE\TK_COMPONENTS\CanonicalData\Deployments\kdnic.inf-languagepack_31bf3856ad364e35_10.0.19041.1_0eeb3cdcad56afd8 /f
::reg delete HKEY_LOCAL_MACHINE\TK_COMPONENTS\DerivedData\Components\amd64_dual_kdnic.inf_31bf3856ad364e35_10.0.19041.1_none_272c88640323e7fc /f
::reg delete HKEY_LOCAL_MACHINE\TK_COMPONENTS\DerivedData\Components\amd64_kdnic.inf.resources_31bf3856ad364e35_10.0.19041.1_en-us_6a39b593cd0620bd /f
::reg delete HKEY_LOCAL_MACHINE\TK_COMPONENTS\DerivedData\Components\amd64_kdnic.inf-languagepack_31bf3856ad364e35_10.0.19041.1_en-us_0eeb3cdcad56afd8 /f
reg delete HKEY_LOCAL_MACHINE\TK_SYSTEM\ControlSet001\Enum\ROOT\KDNIC /f
reg delete HKEY_LOCAL_MACHINE\TK_SOFTWARE\Microsoft\Windows\CurrentVersion\Setup\PnpLockdownFiles\%%SystemRoot%%/System32/drivers/kdnic.sys /f

TAKEOWN /F %MOUNT%\Windows\System32\drivers\kdnic.sys
ICACLS %MOUNT%\Windows\System32\drivers\kdnic.sys /grant administrators:F /q
del /f %MOUNT%\Windows\System32\drivers\kdnic.sys
pause