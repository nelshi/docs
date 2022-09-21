$Shell = New-Object -ComObject ("WScript.Shell")
$Favorite = $Shell.CreateShortcut([Environment]::GetFolderPath("CommonDesktopDirectory") + "\CustomShortcutName.url")
$Favorite.TargetPath = "https://docs.nels.one";
$Favorite.Save()