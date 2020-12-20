@ECHO off

:: [x_o]
:: Creates a Task in the Task Scheduler that periodically clears the Event Logs
:: Also disables the Events so new Event Logs aren't collected.
:: You can add anything you want to happen every 15 days to EventClean.cmd

SET SYS32=%WINDIR%\System32

query user > user.txt
(For %%A IN (user.txt) DO FindStr /MIC:"defaultuser0" "%%A">NUL &&( EXIT ))
SCHTASKS /CREATE /SC MONTHLY /D 15 /TN "CleanupTasks" /TR "%WINDIR%\EventClean.cmd" /ST 12:00 /F

DEL "%AppData%\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Microsoft Edge.lnk" /F

exit