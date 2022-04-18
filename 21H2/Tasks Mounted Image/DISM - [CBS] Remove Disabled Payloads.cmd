FOR /f %a IN ('DISM /image:%MOUNT% /get-features /format:table ^|find "| Disabled"') DO (DISM /image:%MOUNT% /disable-feature:%a /remove)

PAUSE
