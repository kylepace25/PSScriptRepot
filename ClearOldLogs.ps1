#Strictly Breaks Script Execution on First Error
Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"
$PSDefaultParameterValues['*:ErrorAction']='Stop'

#Path to Logs Repo NAS
$o365LogsRepo = "\\192.168.9.52\o365logs"

#Current Date/Time - 90Days
$dateLimit = (Get-Date).AddDays(-90)

#Get Items inside folders older than $dateLimit
$getLogs = Get-ChildItem $o365LogsRepo -Recurse -Exclude "*.txt" | Where-Object {($_.LastWriteTime -lt $dateLimit)}

#Removes Items respective to items gathered by $getlogs variable and Logs output to retentionLog.txt in the same path. 
Remove-Item $getLogs -Force -Recurse
Write-Host "Retention Completed"