$TopFolder = 'c:\users'
$SigFolder = 'AppData\Roaming\Microsoft\Signatures'


$FolderList = Get-ChildItem $TopFolder -Directory -Exclude default, Public

foreach ($Item in $FolderList)
    {
    if (Test-Path (Join-Path -Path $Item -ChildPath $SigFolder))
        {
        $compPath = "$Item" + "\" + "$SigFolder" + "\*"
        Remove-Item $compPath -Recurse
        }
    }