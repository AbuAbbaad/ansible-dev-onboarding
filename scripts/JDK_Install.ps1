# Usage: JDK_Install.ps1 <PathToMSI> <INSTALLDIR=C:\Program Files\Java\jdk1.7.0_79> <LogFilePath>
Param (
	[parameter(mandatory=$true)]
	[ValidateNotNullorEmpty ()]
	[string]$msiFile,
	
	[parameter(mandatory=$true)]
	[ValidateNotNullorEmpty ()]
	[string]$InstallDir,
	
	[parameter(mandatory=$true)]
	[ValidateNotNullorEmpty ()]
	[string]$logPath
	)
	
if (!(Test-Path $msiFile)){
    throw "Path to the MSI File $($msiFile) is invalid. Please supply a valid MSI file"
}

#msiexec /i "C:\Software\tools\downloads\mysql\mysql-5.5.53-winx64.msi" /log "C:\Software\tools\mysql-server.log" /qn
$arguments = @(
	    "/s"
	    "INSTALLDIR=`"$InstallDir`""
		"REBOOT=Suppress"
		"ADDLOCAL=ToolsFeature,SourceFeature"
		"AUTOUPDATE=0"
		"SYSTRAY=0"
		"/L"
		"`"$logPath`""
	)

Write-Host "Installing $msiFile....."
#start /wait C:\Software\tools\downloads\java\jdk-7u79-windows-x64.exe /s INSTALLDIR="C:\Program Files\Java\jdk1.7.0_79" REBOOT=Suppress ADDLOCAL=ToolsFeature,SourceFeature AUTOUPDATE=0 SYSTRAY=0 /L C:\Software\tools\jdk1.7.0_79.log

$process = Start-Process -FilePath $msiFile -ArgumentList $arguments -PassThru -Wait
if ($process.ExitCode -eq 0){
    Write-Host "$msiFile has been successfully installed"
}
else {
    Write-Host "Installer exit code  $($process.ExitCode) for file  $($msifile)"
}

#TODO: Add to Playbook win_environment setx JAVA_HOME "C:\Program Files\Java\jdk1.7.0_79"