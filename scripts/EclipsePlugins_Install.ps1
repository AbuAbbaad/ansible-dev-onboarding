# Usage: EclipsePlugins_Install.ps1 <PathToEclipse>
Param (
	[parameter(mandatory=$true)]
	[ValidateNotNullorEmpty ()]
	[string]$eclipsePath
	)
	
if (!(Test-Path $eclipsePath)){
    throw "Path to the Eclipse File $($eclipsePath) is invalid. Please supply a valid eclipsePath"
}

$arguments = @(
	    "-nosplash -application org.eclipse.equinox.p2.director -destination `"$eclipsePath`" -repository http://repo1.maven.org/maven2/.m2e/connectors/m2eclipse-egit/0.14.0/N/LATEST,http://dist.springsource.org/release/GRECLIPSE/e4.4/ -installIU org.sonatype.m2e.egit.feature.feature.group,org.codehaus.groovy.m2eclipse.feature.feature.group,org.codehaus.groovy.eclipse.feature.feature.group"
	)

Write-Host "Installing Eclipse m2e-egit and Groovy Related plugins..... "

#$process = Start-Process -verb RunAs -FilePath $eclipsePath\eclipsec.exe -ArgumentList $arguments -PassThru -Wait
$process = Start-Process -FilePath $eclipsePath\eclipsec.exe -ArgumentList $arguments -PassThru -Wait
if ($process.ExitCode -eq 0){
    Write-Host "Eclipse m2e-egit and Groovy Related plugins successfully installed"
}
else {
    Write-Host "Installer exit code  $($process.ExitCode) for file $($eclipsePath)"
}
Exit $($process.ExitCode)