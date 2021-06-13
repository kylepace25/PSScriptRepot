$GetFilePath = Read-Host -Prompt "Please Insert File Path"


$GetFileHash = Get-FileHash -Path $GetFilePath -Algorithm SHA1 
$GetFileHash.Hash