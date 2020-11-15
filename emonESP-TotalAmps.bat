@ECHO OFF
REM get lastvalues from emonESP
REM get TotalAmps

setlocal enableextensions disabledelayedexpansion

set DeviceIP=%1

cd\
cd "C:\Program Files (x86)\PRTG Network Monitor\Custom Sensors\EXE"

curl.exe -s -o "lastvalues.txt" -m 2 "http://%DeviceIP%/lastvalues" 

(for /f tokens^=1^-9delims^=^,^" %%a in (lastvalues.txt) Do (
    echo(%%a:%%b:%%c:%%d:%%e:%%f:%%g:%%h:%%i
        )
)>lastvalues-replc.txt

for /f "tokens=10 delims=:" %%o in (lastvalues-replc.txt) Do (
    echo %%o:ok
)

EXIT

REM In PRTG, click Add Sensor, Custom Sensors, EXE/Script
REM Give your sensor a name, such as: TotalAmps
REM EXE/Script, pick: emonESP-TotalAmps.bat
REM Parameters: %host
REM Mutex Name: emonESP
REM Value Type: Float
REM Scanning Interval: 30sec to 1min
