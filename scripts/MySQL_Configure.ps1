Write-Host "Configuring MySQL Instance....."
$process_config = Start-Process -verb RunAs -FilePath "$env:ProgramFiles\MySQL\MySQL Server 5.5\bin\mysqlinstanceconfig.exe" -ArgumentList "-i -q ServiceName=MySQL RootPassword=mysql Port=3306 Charset=utf8 /l `"$logPath`"" -PassThru -Wait

if ($process_config.ExitCode -eq 0){
    Write-Host "Confuring MySQL Instance Successfull"
}
else {
    Write-Host "Confuring MySQL Instance Failed:  $($process_config.ExitCode)"
}
Exit $($process_config.ExitCode)
