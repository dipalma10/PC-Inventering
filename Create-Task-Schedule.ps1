$tempdir = "C:\Windows\temp\PowerShell-PC-Inventory"
New-Item $tempdir -ItemType Directory -Force
New-Item "$tempdir\InventoryOutput" -ItemType Directory -Force
Copy-Item ".\PowerShell-PC-Inventory.ps1" -Destination $tempdir -Force
Copy-Item ".\RunInventoryeveryday.xml" -Destination $tempdir -Force
Register-ScheduledTask -xml (Get-Content '.\RunInventoryeveryday.xml' | Out-String) -TaskName "Run Inventory every day" -Force
