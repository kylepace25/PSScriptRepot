#Get UptimeMontior.html from Cloud Folder
$GetUptimeMonitor = Get-Childitem -Path 'C:\inetpub\wwwroot\Cloud' -Recurse -Filter "UptimeMonitor.html"

#Show count of files found in Cloud folder. 
Write-Host 'Files Found:' $GetUptimeMonitor.Count

#if count is less than 1, Stop.
If ($GetUptimeMonitor.Count -lt 1){
    Write-Host "No UptimeMonitor.html Found in Cloud folder, Stopping..."
    break
}

#Rename Uptime Montior to Remove Api's from Load Balancer
try{
   $GetUptimeMonitor | Rename-Item -NewName { $_.Name -replace 'UptimeMonitor.html','UptimeMonitor_.html'}
   $GetRenamedFiles = Get-Childitem -Path 'C:\inetpub\wwwroot\Cloud' -Recurse -Filter "*_.html"
   Write-Host "Files Renamed" $GetRenamedFiles.Count
   break
} catch [System.Exception] { 
   Write-Host "An Exception Occured" -ForegroundColor Red
   break
}