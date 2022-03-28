@ECHO off

:: [x_o]
:: This RunOnce task is located in the NTUSER.DAT file
:: Most files will be deleted automatically once first login tasks are completed.


:: [x_o]
:: Creates a Task in the Task Scheduler that periodically clears the Event Logs
:: Also disables the Events so new Event Logs aren't collected.
:: You can add anything you want to happen every 15 days to EventClean.cmd
START /b "" "FirstLoginTask.cmd"


:: [x_o]
:: Save Ownership information for StateRepository
:: Take Ownership of the StateRepository
:: Stop the StateRepository SERVICE
:: Use SQLITE3 to execute Commands.sql in StateRepository.srd
:: Restore Ownership of StateRepository
:: Start the StateRepository SERVICE
:: Remove AppxPackages
:: Remove AppxPackage Files
START /b "" "C:\F\FirstStateRepository.cmd"


:: [x_o]
:: Clear/Disable Event Logs
:: Disable Hiberation/Fastboot
:: Disable Unwanted Tasks in Task Scheduler
:: Remove Setting Sync
:: Disable Telemtry
:: Disable Cloud Experiences
:: Set up Firewall in STRICT mode
:: Set Registry keys that may have changed during OS Install
:: Cleanup everything except this file.
:: Restart computer
START /b "" "NSudo.exe" -U:T -P:E "FirstLogin.cmd"

EXIT