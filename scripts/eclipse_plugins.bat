@echo off
echo Installing Eclipse m2e-egit and Groovy Related plugins..... 

%USERPROFILE%\eclipse\eclipsec.exe -nosplash ^
-application org.eclipse.equinox.p2.director ^
-destination %USERPROFILE%\eclipse ^
-repository http://repo1.maven.org/maven2/.m2e/connectors/m2eclipse-egit/0.14.0/N/LATEST,^
http://dist.springsource.org/release/GRECLIPSE/e4.4/ ^
-installIU org.sonatype.m2e.egit.feature.feature.group,^
org.codehaus.groovy.m2eclipse.feature.feature.group,^
org.codehaus.groovy.eclipse.feature.feature.group

echo Eclipse Plugins Installation done....
