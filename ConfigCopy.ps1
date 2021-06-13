#Trailing BACKSLASH is IMPORTANT
[string]$Master = "C:\Altaro\Cloud\"
[string]$Temp = "C:\Altaro\Temp\Temp_Cloud\"
Function Copy-envconfigs {
    param (
        [Parameter(Mandatory=$true,Position=0)]
        [string]$OldLocation,
        [Parameter(Mandatory=$true,Position=1)]
        [string]$NewLocation
    )

    $Folders = Get-ChildItem -Path $OldLocation -Directory
    Foreach ($Folder in $Folders){
        New-item -ItemType Directory -Path $NewLocation -Name $Folder -Force
    }
    $MasterConfigs = Get-ChildItem -Path $OldLocation -Depth 1 -Recurse -Include "*.ConnectionStrings.config", "*.Secrets.config"
    foreach ($file in $MasterConfigs){
        #Copy Files in Temp Location
        Copy-Item -path $File.FullName -Destination (($File.FullName).ToString()).replace("$($OldLocation)", "$($NewLocation)") -Force
    }
}
Copy-envconfigs -Oldlocation $Master -NewLocation $Temp
# editing Temp

<#----
Copy-envconfigs -OldLocation $Temp -Newlocation $Master
Remove-item $Temp -Recurse -Force
$TempName = $Temp.split("\")[-2]
$TempDir = $Temp.replace("$($TempName)\","")
New-item -ItemType Directory -Path $TempDir -Name $TempName -Force
------#>