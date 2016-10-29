# Usage: MySQL_Install.ps1 <Path to the MSI> <LogFile Path>
Param (
	[parameter(mandatory=$true)]
	[ValidateNotNullorEmpty ()]
	[string]$msiFile,
	
	[parameter(mandatory=$true)]
	[ValidateNotNullorEmpty ()]
	[string]$logPath
	)
	
if (!(Test-Path $msiFile)){
    throw "Path to the MSI File $($msiFile) is invalid. Please supply a valid MSI file"
}

#msiexec /i "C:\Software\tools\downloads\mysql\mysql-5.5.53-winx64.msi" /log "C:\Software\tools\mysql-server.log" /qn
$arguments = @(
	    "/i"
	    "`"$msiFile`""
		"/log"
		"`"$logPath`""
	    "/qn"
	    "/norestart"
	)

Write-Host "Installing $msiFile....."
$process = Start-Process -FilePath msiexec.exe -ArgumentList $arguments -PassThru -Wait
if ($process.ExitCode -eq 0){
    Write-Host "$msiFile has been successfully installed"
}
else {
    Write-Host "Installer exit code  $($process.ExitCode) for file  $($msifile)"
}
Write-Host "Confuring MySQL Instance....."
$process_config = Start-Process -FilePath "$env:ProgramFiles\MySQL\MySQL Server 5.5\bin\mysqlinstanceconfig.exe" -ArgumentList "-i -q ServiceName=MySQL RootPassword=mysql Port=3306 Charset=utf8 /l `"$logPath`"" -PassThru -Wait

if ($process_config.ExitCode -eq 0){
    Write-Host "Confuring MySQL Instance Successfull"
}
else {
    Write-Host "Confuring MySQL Instance Failed:  $($process_config.ExitCode)"
}