#get service 
$AlertsWorkerService = Get-Service -Name "AltaroCloud.Alerts.Worker"


if($AlertsWorkerService.Status -ne "Running"){
 Write-Host "Restarting Service"
 Sleep -s 2
  #check if process is running and kill
  taskkill /im AltaroCloud.Alerts.Worker.exe /f
}else{
    Write-Host "The Service is Running"
}

Start-Service $AlertsWorkerService -Verbose