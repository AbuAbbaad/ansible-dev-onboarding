# Create a Shortcut with Windows PowerShell
$TargetFile = "$ENV:UserProfile\eclipse\eclipse.exe"
$ShortcutFile = "$env:Public\Desktop\eclipse.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$Shortcut.TargetPath = $TargetFile
$Shortcut.Save()
