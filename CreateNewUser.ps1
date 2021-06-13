$Password = ConvertTo-SecureString 'dTy5ZVQZbT22Gm53' -AsPlainText -Force
New-LocalUser "ftpscript" -Password $Password  -FullName "FTPSCRIPT" -Description "FTP SCRIPT USER." -Member "Administrators, Remote Desktop Users" 
$Password = $null