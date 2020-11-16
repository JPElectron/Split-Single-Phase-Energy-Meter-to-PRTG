# Split Single Phase Energy Meter to PRTG

Allows CircuitSetup's ATM90E32 Split Single Phase Energy Meter (see https://github.com/CircuitSetup/Split-Single-Phase-Energy-Meter) 
to be graphed in PRTG (see https://www.paessler.com/prtg)

Sure there's lots of other ways to graph data from the Energy Meter, but when your client loves Microsoft and everything has to run Windows, or you already have PRTG graphing everything else on the network - why not use PRTG to graph the energy usage too!

Requires files to be placed in PRTG's custom EXE sensor path, usually: C:\Program Files (x86)\PRTG Network Monitor\Custom Sensors\EXE

- Copy all the .bat files

        emonESP-CT1.bat
        emonESP-CT2.bat
        emonESP-TotalAmps.bat
        emonESP-TotalWatts.bat

- Copy the following CURL files (you can get these at https://curl.haxx.se/windows/)

        curl.exe
        curl-ca-bundle.crt
        libcurl-x64.dll

1) Create a new device in PRTG with the IP of your ESP Energy Meter (should be given a DHCP reservation so it doesn't change)
2) Add Sensor, Custom Sensors, EXE/Script
3) Give your sensor a name, use the same name as the .bat file you are about to select
4) EXE/Script, pick: emonESP-?????.bat
5) Parameters: %host
6) Mutex Name: emonESP
7) Value Type: Float
8) Scanning Interval: 30sec to 1min

[End of Line]
