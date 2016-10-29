@echo off
setlocal EnableDelayedExpansion
echo Installing MySQL Server. Please wait...

start /wait msiexec /i "C:\Software\tools\downloads\mysql\mysql-5.5.53-winx64.msi" /log "C:\Software\tools\mysql-server.log" /qn

echo Configurating MySQL Server...

"%ProgramFiles%\MySQL\MySQL Server 5.5\bin\mysqlinstanceconfig.exe" -i -q ServiceName=MySQL RootPassword=mysql Port=3306 Charset=utf8

echo MySQL has been installed successfully

rem setx PATH "%PATH%;%ProgramFiles%\MySQL\MySQL Server 5.5\bin;"
rem cd /
rem C:
rem mysql --user=root --password=mysql -e "CREATE DATABASE PETCLINIC;"
rem set "pathToInsert=%ProgramFiles%\MySQL\MySQL Server 5.5\bin"
rem Check if pathToInsert is not already in system path
rem if "!path:%pathToInsert%=!" equ "%path%" (
rem    setx PATH "%PATH%";"%pathToInsert%"
rem )
