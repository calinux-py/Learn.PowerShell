# Manage IP addresses in PowerShell

PowerShell includes the NETTCPIP module, which consists of TCP/IP-specific cmdlets used to manage network settings for Windows servers and devices. You can use the NETTCPIP cmdlets to add, remove, change, and validate IP address settings.

IP address management cmdlets use the noun "NetIPAddress" in their names. You can also find them by using the Get-Command command with the -Module NetTCPIP parameter.

The following table lists common cmdlets for managing IP address settings.

| Cmdlet              | Description                          |
|---------------------|--------------------------------------|
| New-NetIPAddress    | Creates a new IP address             |
| Get-NetIPAddress    | Displays properties of an IP address |
| Set-NetIPAddress    | Modifies properties of an IP address |
| Remove-NetIPAddress | Deletes an IP address                |


