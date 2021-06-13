Set-Location 'C:\inetpub\wwwroot\Cloud'

Write-Host "Agent.Api         	" (Get-ChildItem .\Agent.Api\bin -Recurse -Filter "AltaroCloud.Agent.Api.dll").VersionInfo.FileVersion
Write-Host "AlertsWorker      	" (Get-ChildItem .\AlertsWorker -Recurse -Filter "AltaroCloud.Alerts.Worker.exe").VersionInfo.FileVersion
Write-Host "AuditWorker       	" (Get-ChildItem .\AuditWorker -Recurse -Filter "AltaroCloud.Audit.Worker.exe").VersionInfo.FileVersion
Write-Host "Authentication.Api	" (Get-ChildItem .\Authentication.Api\bin -Recurse -Filter "AltaroCloud.Authentication.Api.dll").VersionInfo.FileVersion
Write-Host "BaaS.Api            " (Get-ChildItem .\BaaS.Api\bin -Recurse -Filter "AltaroCloud.BaaS.Api.dll").VersionInfo.FileVersion
Write-Host "BackgroundWorker	" (Get-ChildItem .\BackgroundWorker -Recurse -Filter "AltaroCloud.Background.Worker.exe").VersionInfo.FileVersion
Write-Host "BillingWorker		" (Get-ChildItem .\BillingWorker -Recurse -Filter "AltaroCloud.Billing.Worker.exe").VersionInfo.FileVersion
Write-Host "MaintenanceWorker	" (Get-ChildItem .\MaintenanceWorker -Recurse -Filter "AltaroCloud.Maintenance.Worker.exe").VersionInfo.FileVersion
Write-Host "NotificationWorker  " (Get-ChildItem .\NotificationWorker -Recurse -Filter "AltaroCloud.Notifications.Worker.exe").VersionInfo.FileVersion
Write-Host "Office.Api			" (Get-ChildItem .\Office.Api\bin -Recurse -Filter "AltaroCloud.Office.Api.dll").VersionInfo.FileVersion
Write-Host "Office365Worker		" (Get-ChildItem .\Office365Worker -Recurse -Filter "AltaroCloud.Office365.Worker.exe").VersionInfo.FileVersion
Write-Host "PhysicalServer.Api	" (Get-ChildItem .\PhysicalServer.Api\bin -Recurse -Filter "AltaroCloud.PhysicalServer.Api.dll").VersionInfo.FileVersion
Write-Host "Public.Api			" (Get-ChildItem .\Public.Api\bin -Recurse -Filter "AltaroCloud.Public.Api.dll").VersionInfo.FileVersion
Write-Host "Rules.Api			" (Get-ChildItem .\Rules.Api\bin -Recurse -Filter "AltaroCloud.Rules.Api.dll").VersionInfo.FileVersion
