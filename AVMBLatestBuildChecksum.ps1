$AVMBBuildPath = "\\vsfileserver\Builds\Products\Altaro VM Backup\Builds v7\AVMB" #AVMB Build Path Location in vsCMCCONF
$0x = "0x" #Needs to be added to the checksum in the beggining 

#Get Latest AVMB Build
$GetLatestAVMB = Get-ChildItem -Path $AVMBBuildPath -Recurse  | Sort-Object LastWriteTime | Select-Object -Last 1 | Get-ChildItem -File
$AVMBLatestPath = $GetLatestAVMB.FullName | Select-Object -First 1 
$AVMBLatestPath

#Get AVMB File Hash 
$GetAVMBHash = Get-FileHash -Path $AVMBLatestPath -Algorithm SHA1 
$0x + $GetAVMBHash.Hash
