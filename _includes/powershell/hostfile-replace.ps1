Set-ExecutionPolicy -ExecutionPolicy Unrestricted

$ip1 = "1.1.1.1"
$ip2 = "8.8.8.8"
$hst1 = "example.co.uk"
$hst2 = "example.com"
$hostFilePath = "$($env:windir)\system32\Drivers\etc\hosts"
$hostfile = Get-Content -Path $hostFilePath
$newHostFileEntry1 = "{0} {1}" -f $ip1, $hst1
$newHostFileEntry2 = "{0} {1}" -f $ip2, $hst2

# Delete all text after what is defined as $matchString
$lastIndexOfNewArray = 0
$matchString = '127.0.0.1\s+localhost'

for ($index = 0; $index -lt $hostfile.Count; $index++) {
    if ($hostfile[$index] -match $matchString) {
        $lastIndexOfNewArray = $index
        break
    }
}
$newHostFileContent = $Hostfile[0..$lastIndexOfNewArray]

# Adds entry for local IP address if conditions resolve to $true
if ($newHostFileContent -notcontains "127.0.0.2 hostname1" -and 
    (-not($newHostFileContent -like $newHostFileEntry1))) {
        $newHostFileContent = New-Object System.Collections.ArrayList(,$newHostFileContent)
        $newHostFileContent.Add($newHostFileEntry1) > $null
        $newHostFileContent.Add($newHostFileEntry2) > $null
}

Out-File -Encoding UTF8 -FilePath $hostFilePath -InputObject $newHostFileContent -Append:$false -Confirm:$false