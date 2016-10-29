param($p1,$p2)
$create_file = New-Item -Path $env:temp\path.txt -ItemType file
$path = $env:path -split ';' | Tee-Object -FilePath $create_file
$content = Get-Content $create_file
$myArray = New-Object System.Collections.ArrayList
foreach ($line in $content)
{
[void]$myArray.add($line)
}
if($myArray -eq $p1)
    {
        Write-Host Already ENV available in Path
    }
    else
    {
       write-host Variable not available in the ENV Path so Script adding it in Path variable
       $expand = [System.Environment]::ExpandEnvironmentVariables($p1)
       [Environment]::SetEnvironmentVariable("Path", "$expand;" + $env:Path, [EnvironmentVariableTarget]::$p2)   
    }
Remove-Item -Path $create_file -Force