# Usage: Git_Install.ps1 <PathToExe> <LOADINF=C:\Downloads\git\git.ini> <LogFilePath>
Param (
	[parameter(mandatory=$true)]
	[ValidateNotNullorEmpty ()]
	[string]$msiFile,
	
	[parameter(mandatory=$true)]
	[ValidateNotNullorEmpty ()]
	[string]$LoadInfFile,
	
	[parameter(mandatory=$true)]
	[ValidateNotNullorEmpty ()]
	[string]$logPath
	)
	
if (!(Test-Path $msiFile)){
    throw "Path to the MSI File $($msiFile) is invalid. Please supply a valid MSI file"
}

$arguments = @(
	    "/SILENT"
		"/COMPONENTS=`"icons,ext\reg\shellhere,assoc,assoc_sh`""
	    "LOADINF=`"$LoadInfFile`""
		"/L"
		"`"$logPath`""
	)

Write-Host "Installing $msiFile....."
#start /wait C:\Software\tools\downloads\git\Git-2.10.1-64-bit.exe /SILENT /COMPONENTS="icons,ext\reg\shellhere,assoc,assoc_sh" /LOADINF="C:\Software\tools\downloads\git\git.ini" /L C:\Software\tools\git_install.log

$process = Start-Process -verb RunAs -FilePath $msiFile -ArgumentList $arguments -PassThru -Wait
if ($process.ExitCode -eq 0){
    Write-Host "$msiFile has been successfully installed"
}
else {
    Write-Host "Installer exit code  $($process.ExitCode) for file  $($msifile)"
}
Exit $($process.ExitCode)