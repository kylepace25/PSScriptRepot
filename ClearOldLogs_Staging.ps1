#Zip O365 Logs STG
#Set Variables
$O365LogsPath = 'C:\Altaro\Logs\o365'
$LogDateLimit = (Get-Date).AddHours(-1)
$ZipDateLimit = (Get-Date).AddDays(-2)
$RetentionDateLimit = (Get-Date).AddDays(-1)
$Worker1UNC = \\10.66.55.8\C$\Altaro\Worker_Logs\Worker_1
$Worker2UNC = \\10.66.55.8\C$\Altaro\Worker_Logs\Worker_2

#Get Old Logs
$GetOldLogs = Get-ChildItem $O365LogsPath -Recurse -Exclude "*.txt" | Where-Object {($_.LastWriteTime -lt $LogDateLimit)}

try{
#Copy Logs
$TempLogsPath = "C:\Altaro\Logs\o365\temp"
$RemoveOldZips = Get-ChildItem $TempLogsPath -Recurse -Filter "*.zip" | Where-Object {($_.LastWriteTime -lt $ZipDateLimit)}
if ($RemoveOldZips.Count -ge 1){
Remove-Item $RemoveOldZips -Force -Confirm:$false
}else{
    #continue
}
Copy-Item -Path $GetOldLogs -Destination $TempLogsPath -Recurse -Force -ErrorAction SilentlyContinue
Write-Host "Copied Old Logs to Temp" -ForegroundColor Green
}catch [System.Exception]{
    throw Write-Host "An Exception Occured : $($_.Exception.Message)" -ForegroundColor Red
    break
}

#Zip logs
Add-Type -Assembly System.IO.Compression.Filesystem
$destinationPath = 'C:\Altaro\Logs\o365' + "-Bkp_" + (Get-Date -Format ddd-dd-MM-yyy-HH-mm-ss) + '.zip'
Write-Host "Starting O365Logs Backup" -ForegroundColor Yellow
try{
[IO.Compression.ZipFile]::CreateFromDirectory($TempLogsPath, $destinationPath)
Write-Host "O365Logs Zipped Successfully" -ForegroundColor Green
}catch [System.Exception]{
    throw Write-Host "An Exception Occured : $($_.Exception.Message)" -ForegroundColor Red
    break
}

#RemoveOldLogs
try{
    $GetLogsToDelete = Get-ChildItem $O365LogsPath -Recurse -Exclude "*.txt" | Where-Object {($_.LastWriteTime -lt $RetentionDateLimit)}
if ($GetLogsToDelete.Count -ge 1){
    Remove-Item $GetLogsToDelete -Force -Confirm:$false
    Write-Host "Retention Completed" -ForegroundColor Green
    }else{
        break
    }
}catch [System.Exception]{
    throw Write-Host "An Exception Occured : $($_.Exception.Message)" -ForegroundColor Red
    break
}