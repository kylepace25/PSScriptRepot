$IISLogsPath = "\\104.130.28.202\C$\inetpub\logs\LogFiles"
$LogsStorage = "C:\CMC_IIS_LogFiles"

$GetIISLogs = Get-ChildItem -Path $IISLogsPath -Recurse | Where-Object {$_.LastWriteTime -lt (Get-Date).AddDays(1) | Copy-Item -Destination $LogsStorage }

Write-Host "Copying IIS_Logs to vsfileserver"
$GetIISLogs
