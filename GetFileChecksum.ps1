#get checksum of previous build
Get-ChildItem C:\inetpub\wwwroot\Cloud -Recurse| Get-FileHash -Algorithm MD5| Format-List Hash | Out-File "C:\Altaro\Checksum\ChecksumBeforeDeployment.log" 

#get file version
(Get-ChildItem C:\inetpub\wwwroot\Cloud -Recurse -Filter "AltaroCloud*.dll" -Exclude "AltaroCloud.Contracts.Dto.dll").VersionInfo.FileVersion

Get-ChildItem C:\inetpub\wwwroot\Cloud -Recurse| Get-FileHash -Algorithm MD5| Format-List Hash | Out-File "C:\Altaro\Checksum\ChecksumAfterUnzipping.log" 

Compare-Object -ReferenceObject $(Get-Content C:\Altaro\Checksum\ChecksumBeforeDeployment.log) -DifferenceObject $(Get-Content C:\Altaro\Checksum\ChecksumAfterUnzipping.log)