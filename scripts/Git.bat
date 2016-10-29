@echo off
echo Installing GIT. Please wait...

start /wait C:\Software\tools\downloads\git\Git-2.10.1-64-bit.exe /SILENT /COMPONENTS="icons,ext\reg\shellhere,assoc,assoc_sh" /LOADINF="C:\Software\tools\downloads\git\git.ini" /L C:\Software\tools\git_install.log
