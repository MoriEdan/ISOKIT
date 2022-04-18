[x_o] Instructions to add this to a new image


[FOLDER] STARTUP\DEFAULT
:: Place NTUser.dat in Mount\Install\Users\Default after mounting image
:: Changes multiple registry settings
:: Runs the first login script


[FOLDER] STARTUP\F
:: Drag and drop folder into Mount\Install after mounting image
:: Contains logic to delete packages (Including IsInBox)


[FOLDER] STARTUP\Windows
:: Drag and drop folder into Mount\Install after mounting image
:: Contains default Group Policy (Full lockdown)
:: Contains "Unattend.xml" to configure OOBE
:: Contains FireWall rules, replace/delete FireWallRules.wfw if you wish.
:: Contains EventClean.cmd which will remain after the first login.


[FOLDER] EXTRAS
:: Optional Extras to Include with the .Iso if you wish
:: Keep in mind that the image doesn't have a default browser at all (Chrome included)
:: Add_Lock_Drive_to_Context_Menu adds "Lock Drive" to the context menu (Bitlocker)
:: Remove_Edge_Task uses the REAL edge uninstaller to remove everything edge related
:: Remove_Edge_Task also has a task you can import that will remove it automatically (Place in Windows)