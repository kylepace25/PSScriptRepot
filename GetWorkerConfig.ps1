$ConfigPath = "C:\Users\kyle.pace\Desktop\Test.txt"

Get-Content -Path $ConfigPath | Where-Object {$_ -like '*queue*'}