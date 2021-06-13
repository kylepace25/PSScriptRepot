#Get Already Renamed UptimeMontior_.html from Cloud Folder
$GetRenamedUptimeMonitor = Get-Childitem -Path 'C:\inetpub\wwwroot\Cloud' -Recurse -Filter "UptimeMonitor_.html"

#Show count of files found in Cloud folder. 
Write-Host 'Files Found for Restore:' $GetRenamedUptimeMonitor.Count

#if count is less than 1, Stop.
If ($GetRenamedUptimeMonitor.Count -lt 1){
    Write-Host "No UptimeMonitor_.html Found in Cloud folder, Stopping..."
    break
}

#Rename Uptime Montior to Restore Api's to Load Balancer
try{
   $GetRenamedUptimeMonitor | Rename-Item -NewName { $_.Name -replace 'UptimeMonitor_.html','UptimeMonitor.html'}
   $GetRestoredFiles = Get-Childitem -Path 'C:\inetpub\wwwroot\Cloud' -Recurse -Filter "UptimeMonitor.html"
   Write-Host "Files Restored" $GetRestoredFiles.Count
   break
} catch [System.Exception] { 
   Write-Host "An Exception Occured" -ForegroundColor Red
   break
}