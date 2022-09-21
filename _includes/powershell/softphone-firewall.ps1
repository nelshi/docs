$profiles = Get-ChildItem -Path 'C:\Users' -Directory
Foreach ($profile in $profiles) {
    $ExePath = Join-Path -Path $profile.Fullname -ChildPath 'appdata\local\bt\softphoneapp\softphone.exe'
    if (!(Get-NetFirewallApplicationFilter -Program $ExePath)) {
        New-NetFirewallRule -Displayname "softphone.exe" -Direction Inbound -Program $ExePath
    }
}