@echo off
setlocal EnableDelayedExpansion
echo Installing JDK. Please wait...

start /wait C:\Software\tools\downloads\java\jdk-7u79-windows-x64.exe /s INSTALLDIR="C:\Program Files\Java\jdk1.7.0_79" REBOOT=Suppress ADDLOCAL=ToolsFeature,SourceFeature AUTOUPDATE=0 SYSTRAY=0 /L C:\Software\tools\jdk1.7.0_79.log

setx JAVA_HOME "C:\Program Files\Java\jdk1.7.0_79"

rem setx PATH "%JAVA_HOME%\bin"
rem set "pathToInsert=%JAVA_HOME%\bin"

rem Check if pathToInsert is not already in system path
rem if "!path:%pathToInsert%=!" equ "%path%" (
rem   setx PATH "%pathToInsert%";"%PATH%"
rem )
