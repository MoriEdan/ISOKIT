@ECHO OFF

:: Customize the default login screens
DEL %MOUNT%\Windows\Web\Screen /Q
COPY "%~dp01.jpg" "%MOUNT%\Windows\Web\Screen\img100.jpg" /Y
COPY "%~dp02.jpg" "%MOUNT%\Windows\Web\Screen\img101.jpg" /Y
COPY "%~dp03.jpg" "%MOUNT%\Windows\Web\Screen\img102.jpg" /Y
COPY "%~dp06.jpg" "%MOUNT%\Windows\Web\Screen\img103.jpg" /Y
COPY "%~dp07.jpg" "%MOUNT%\Windows\Web\Screen\img104.jpg" /Y
COPY "%~dp09.jpg" "%MOUNT%\Windows\Web\Screen\img105.jpg" /Y


:: Customize the default wallpapers
DEL %MOUNT%\Windows\Web\Wallpaper\theme1 /Q
COPY "%~dp07.jpg" "%MOUNT%\Windows\Web\Wallpaper\theme1\img1.jpg" /Y
COPY "%~dp04.jpg" "%MOUNT%\Windows\Web\Wallpaper\theme1\img2.jpg" /Y
COPY "%~dp05.jpg" "%MOUNT%\Windows\Web\Wallpaper\theme1\img3.jpg" /Y
COPY "%~dp03.jpg" "%MOUNT%\Windows\Web\Wallpaper\theme1\img4.jpg" /Y
COPY "%~dp09.jpg" "%MOUNT%\Windows\Web\Wallpaper\theme1\img13.jpg" /Y

EXIT