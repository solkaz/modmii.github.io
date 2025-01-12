@echo off
setlocal

chdir /d "%~dp0"
if not exist support cd..

set PATH=%SystemRoot%\system32;%SystemRoot%\system32\wbem;%SystemRoot%;%homedrive%\ModMii\temp
chcp 437>nul

if not exist temp\DownloadQueues mkdir temp\DownloadQueues


::build dummy files to speed up build

call Support\d2x-beta\d2x-beta.bat

::remove setting path's with an & symbol and force default
if exist Support\settings.bat support\sfk filter -spat Support\settings.bat -!"\x26" -write -yes>nul
if exist Support\settings.bat call Support\settings.bat
if "%Drive%"=="" set Drive=COPY_TO_SD

::check if drive folder exists--if second char is ":" check if drive exists
if /i "%DRIVE%" EQU "%cd%\COPY_TO_SD" set DRIVE=COPY_TO_SD
if /i "%DRIVE:~1,1%" NEQ ":" goto:skipcheck
if exist "%DRIVE:~0,2%" (goto:skipcheck) else (set DRIVE=COPY_TO_SD)
:skipcheck


if not exist "%Drive%\WAD" mkdir "%Drive%\WAD"

echo dummy>"%DRIVE%\WAD\cIOS249[37]-d2x-v%d2x-beta-rev%.wad"
echo dummy>"%DRIVE%\WAD\cIOS250[37]-d2x-v%d2x-beta-rev%.wad"
echo dummy>"%DRIVE%\WAD\cIOS249[38]-d2x-v%d2x-beta-rev%.wad"
echo dummy>"%DRIVE%\WAD\cIOS250[38]-d2x-v%d2x-beta-rev%.wad"
echo dummy>"%DRIVE%\WAD\cIOS249[53]-d2x-v%d2x-beta-rev%.wad"
echo dummy>"%DRIVE%\WAD\cIOS250[53]-d2x-v%d2x-beta-rev%.wad"
echo dummy>"%DRIVE%\WAD\cIOS249[55]-d2x-v%d2x-beta-rev%.wad"
echo dummy>"%DRIVE%\WAD\cIOS250[55]-d2x-v%d2x-beta-rev%.wad"
echo dummy>"%DRIVE%\WAD\cIOS249[56]-d2x-v%d2x-beta-rev%.wad"
echo dummy>"%DRIVE%\WAD\cIOS250[56]-d2x-v%d2x-beta-rev%.wad"
echo dummy>"%DRIVE%\WAD\cIOS249[57]-d2x-v%d2x-beta-rev%.wad"
echo dummy>"%DRIVE%\WAD\cIOS250[57]-d2x-v%d2x-beta-rev%.wad"
echo dummy>"%DRIVE%\WAD\cIOS249[58]-d2x-v%d2x-beta-rev%.wad"
echo dummy>"%DRIVE%\WAD\cIOS250[58]-d2x-v%d2x-beta-rev%.wad"
echo dummy>"%DRIVE%\WAD\cIOS249[60]-d2x-v%d2x-beta-rev%.wad"
echo dummy>"%DRIVE%\WAD\cIOS250[60]-d2x-v%d2x-beta-rev%.wad"
echo dummy>"%DRIVE%\WAD\cIOS249[70]-d2x-v%d2x-beta-rev%.wad"
echo dummy>"%DRIVE%\WAD\cIOS250[70]-d2x-v%d2x-beta-rev%.wad"
echo dummy>"%DRIVE%\WAD\cIOS249[80]-d2x-v%d2x-beta-rev%.wad"
echo dummy>"%DRIVE%\WAD\cIOS250[80]-d2x-v%d2x-beta-rev%.wad"




::build d2xAll queue

echo set AdvNumber=0 >temp\DownloadQueues\d2xAll.bat
echo if /i '?GetAdvNumberOnly?' EQU 'Y' goto:endofqueue>>temp\DownloadQueues\d2xAll.bat
echo Set ROOTSAVE=off>>temp\DownloadQueues\d2xAll.bat
echo Set Option1=off>>temp\DownloadQueues\d2xAll.bat
echo Set cIOS249[37]-d2x-v8-final=*>>temp\DownloadQueues\d2xAll.bat
echo Set cIOS249[38]-d2x-v8-final=*>>temp\DownloadQueues\d2xAll.bat
echo Set cIOS249[56]-d2x-v8-final=*>>temp\DownloadQueues\d2xAll.bat
echo Set cIOS249[53]-d2x-v8-final=*>>temp\DownloadQueues\d2xAll.bat
echo Set cIOS249[55]-d2x-v8-final=*>>temp\DownloadQueues\d2xAll.bat
echo Set cIOS249[57]-d2x-v8-final=*>>temp\DownloadQueues\d2xAll.bat
echo Set cIOS249[58]-d2x-v8-final=*>>temp\DownloadQueues\d2xAll.bat
echo Set cIOS249[60]-d2x-v8-final=*>>temp\DownloadQueues\d2xAll.bat
echo Set cIOS249[70]-d2x-v8-final=*>>temp\DownloadQueues\d2xAll.bat
echo Set cIOS249[80]-d2x-v8-final=*>>temp\DownloadQueues\d2xAll.bat
echo Set cIOS250[37]-d2x-v8-final=*>>temp\DownloadQueues\d2xAll.bat
echo Set cIOS250[38]-d2x-v8-final=*>>temp\DownloadQueues\d2xAll.bat
echo Set cIOS250[53]-d2x-v8-final=*>>temp\DownloadQueues\d2xAll.bat
echo Set cIOS250[55]-d2x-v8-final=*>>temp\DownloadQueues\d2xAll.bat
echo Set cIOS250[56]-d2x-v8-final=*>>temp\DownloadQueues\d2xAll.bat
echo Set cIOS250[57]-d2x-v8-final=*>>temp\DownloadQueues\d2xAll.bat
echo Set cIOS250[58]-d2x-v8-final=*>>temp\DownloadQueues\d2xAll.bat
echo Set cIOS250[60]-d2x-v8-final=*>>temp\DownloadQueues\d2xAll.bat
echo Set cIOS250[70]-d2x-v8-final=*>>temp\DownloadQueues\d2xAll.bat
echo Set cIOS250[80]-d2x-v8-final=*>>temp\DownloadQueues\d2xAll.bat

echo :endofqueue>>temp\DownloadQueues\d2xAll.bat

support\sfk filter -spat temp\DownloadQueues\d2xAll.bat -rep _\x27_\x22_ -rep _\x3f_\x25_ -rep _"AdvNumber=0 "_"AdvNumber=0"_ -write -yes>nul

echo d2x cIOS beta MD5 Updater
echo -------------------------
echo.
echo Building d2x-beta cIOSs...
echo.
echo The 1st time ModMii runs the cIOSs will be invalid and open a text window
echo The 2nd time ModMii runs the cIOSs should be valid and not open a text window
echo.


::echo @echo off>d2xAll-Downloader.bat
::echo setlocal>>d2xAll-Downloader.bat
::echo call support\ModMii.bat L d2xALL>>d2xAll-Downloader.bat
::start /wait d2xAll-Downloader.bat

ModMii.exe L d2xALL



::del d2xAll-Downloader.bat>nul

if exist Support\settings.bat call Support\settings.bat
if "%Drive%"=="" set Drive=COPY_TO_SD

if exist d2xALL.md5 del d2xALL.md5>nul
support\fvc -c -a MD5 -r "%DRIVE%"\WAD\*.wad>>d2xALL.md5

if not exist Support\d2x-beta\d2x-beta.bat (echo Error: Missing Support\d2x-beta\d2x-beta.bat) & (@ping 127.0.0.1 -n 2 -w 1000> nul) & (exit)

echo Updating d2x MD5s...
call Support\d2x-beta\d2x-beta.bat

copy /y Support\d2x-beta\d2x-beta.bat Support\d2x-beta\d2x-beta.bak>nul

set number=0

:top
SET /a number=%number%+1
if /i "%number%" EQU "1" set cios=cIOS249[37]
if /i "%number%" EQU "2" set cios=cIOS250[37]
if /i "%number%" EQU "3" set cios=cIOS249[38]
if /i "%number%" EQU "4" set cios=cIOS250[38]
if /i "%number%" EQU "5" set cios=cIOS249[53]
if /i "%number%" EQU "6" set cios=cIOS250[53]
if /i "%number%" EQU "7" set cios=cIOS249[55]
if /i "%number%" EQU "8" set cios=cIOS250[55]
if /i "%number%" EQU "9" set cios=cIOS249[56]
if /i "%number%" EQU "10" set cios=cIOS250[56]
if /i "%number%" EQU "11" set cios=cIOS249[57]
if /i "%number%" EQU "12" set cios=cIOS250[57]
if /i "%number%" EQU "13" set cios=cIOS249[58]
if /i "%number%" EQU "14" set cios=cIOS250[58]
if /i "%number%" EQU "15" set cios=cIOS249[60]
if /i "%number%" EQU "16" set cios=cIOS250[60]
if /i "%number%" EQU "17" set cios=cIOS249[70]
if /i "%number%" EQU "18" set cios=cIOS250[70]
if /i "%number%" EQU "19" set cios=cIOS249[80]
if /i "%number%" EQU "20" set cios=cIOS250[80]

copy /y d2xALL.md5 temp\d2xALL.txt>nul

support\sfk filter -spat temp\d2xALL.txt -+"%cios%-d2x-v%d2x-beta-rev%.wad" -rep _" *"__ -write -yes>nul

set /p ciosmd5= <temp\d2xALL.txt

::echo %cios%-d2x-v%d2x-beta-rev% MD5 = %ciosmd5%

support\sfk filter -spat Support\d2x-beta\d2x-beta.bat -rep _"%cios%-d2x-v\x22 set md5="*_"%cios%-d2x-v\x22 set md5=%ciosmd5%"_ -write -yes>nul

::delete wad: it will be reconstructed and confirmed later

del "%DRIVE%\WAD\%cios%-d2x-v%d2x-beta-rev%.wad">nul


if "%number%" NEQ "20" goto:top

echo.
echo d2x-beta.bat Updated
echo.

del temp\d2xALL.txt>nul
del d2xALL.md5>nul

if exist "Support\More-cIOSs\d2x-v%d2x-beta-rev%" rd /s /q "Support\More-cIOSs\d2x-v%d2x-beta-rev%"
mkdir "Support\More-cIOSs\d2x-v%d2x-beta-rev%"
copy /y Support\d2x-beta\* "Support\More-cIOSs\d2x-v%d2x-beta-rev%\">nul

del "Support\More-cIOSs\d2x-v%d2x-beta-rev%\d2x-beta.bak">nul

if exist "d2x-v%d2x-beta-rev%.zip" del "d2x-v%d2x-beta-rev%.zip">nul

cd Support\More-cIOSs
..\7za a -t7z "..\..\d2x-v%d2x-beta-rev%.zip" "d2x-v%d2x-beta-rev%\*.bat"
..\7za a -t7z "..\..\d2x-v%d2x-beta-rev%.zip" "d2x-v%d2x-beta-rev%\*.app"

cd "d2x-v%d2x-beta-rev%"

if exist "*.xml" ..\..\7za a -t7z "..\..\..\d2x-v%d2x-beta-rev%.zip" "*.xml"
if exist "*.txt" ..\..\7za a -t7z "..\..\..\d2x-v%d2x-beta-rev%.zip" "*.txt"
cd ..\..\..

echo.
echo ModMii about to verify
echo If there are 0 errors this window will close
echo.

::call support\ModMii.bat L d2xALL
::start /wait d2xAll-Downloader.bat
::del d2xAll-Downloader.bat>nul

ModMii.exe L d2xALL

findStr /I /C:"20 file(s) downloaded succcessfully" temp\ModMii_CMD_LINE_Log.txt >nul
IF not ERRORLEVEL 1 exit
echo.
echo d2x-beta.bat not updated successfully
pause