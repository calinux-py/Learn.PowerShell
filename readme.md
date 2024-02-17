# My Favorites from PowerShell

Three core cmdlets allow you to delve into what cmdlets exist and what they do:

The Get-Command cmdlet lists all of the available cmdlets on your system. Filter the list to quickly find the command you need.
```powershell
Get-Command
```

The Microsoft.PowerShell.Management module includes many built-in cmdlets that can be used to obtain information and perform specific operations on a local computer. To review the cmdlets included in this module, you can enter the following:
```powershell
Get-command -module Microsoft.PowerShell.Management
```

Run the Get-Help core cmdlet to invoke a built-in help system. You can also run an alias help command to invoke Get-Help but improve the reading experience by paginating the response.
```powershell
Get-Help
```

When you call a command, the response is an object that contains many properties. Run the Get-Member core cmdlet to drill down into that response and learn more about it.
```powershell
Get-Member
```

You can also review the variables in memory by using the Get-Variable cmdlet:

```powershell
Get-Variable
```

You can review the length for a string variable and it returns the number of characters in the string. For example:

```powershell
$logFile.Length
```

You can split content, such as IP addresses. For example:

```powershell
$ip = "10.100.4.2"
$ip.Split(".")
```

You can store the output of commands into variables. For example:

```powershell
$users = Get-LocalUser
```

You can also work with specific objects within the array. For example:

```powershell
$user[2]
```

Create an array list:

```powershell
$nums = "0", "1", "2", "3"
```

The following command creates a hash table named $servers to store server names and IP addresses:

```powershell
$servers = @{"LON-DC1" = "172.16.0.10"; "LON-SRV1" = "172.16.0.11"}
```

Adding or removing items from a hash table is similar to an array list. You use the methods Add() and Remove(). For example:

```powershell
$servers.Add("LON-SRV2","172.16.0.12")
$servers.Remove("LON-DC1")
```

Search for Active Directory users:

```powershell
Get-ADUser -Identity anabowman
```

Display all Active Directory users and their properities:

```powershell
Get-ADUser -Filter * -Properties *
```

Disable an account in Active Directory:

```powershell
Disable-ADAccount <username>
```

Enable an account in Active Directory:

```powershell
Enable-ADAccount <username>
```

Unlock user account in Active Directory that has been located after exceeding sign-in attempts:

```powershell
Unlock-ADAccount <username>
```

Remove an account from Active Directory:

```powershell
Remove-ADUser <username>
```

Create a new user account and set it to change password at next logon, assign it a temp password to enable it, and then enable the account:

```powershell
New-ADUser <username> -ChangePasswordAtLogon $true; Set-ADAccountPassword <username>; EnableADAccount <username>
```


# Get-ChildItem

**Get-ChildItem** is similar to the 'dir' command in the Windows Command Prompt or the 'ls' command in Unix-based systems. You can use it to list files and directories, filter them, and perform various operations on them within PowerShell.

## Examples

`Locate all .txt files.`
```powershell
gci -recurse *.txt
```

`Locate certain words.`
```powershell
gci -recurse *notes*
```

`Search a specific drive.`
```powershell
gci -Path C:\ -recurse *item*
```

--------------------------------

# Interesting or HACKISH Commands:

| Cmdlet                    | Description                                                                                         |
|---------------------------|-----------------------------------------------------------------------------------------------------|
| Get-StartApps             | Used to retrieve a list of Start menu apps and tiles for the current user on a Windows operating system. |
| Set-Clipboard             | Used to set clipboard content. Essentially clipboard injection.                                      |
| Get-Clipboard             | Retrieve clipboard content.                                                                         |
| Get-LocalUser             | Return all local users on the system.                                                               |
| Get-NetFirewallProfile    | Gets properties for a firewall profile.                                                             |
| Get-NetFirewallRule       | Gets properties for a firewall rule.                                                                |
| Get-ComputerInfo          | Retrieves all system and operating system properties from the computer
 |
| Get-Service               | Retrieves a list of all services on the computer
 |
| Get-EventLog              | Retrieves events and event logs from local and remote computers (only available in Windows PowerShell 5.1)
 |
| Get-Process               | Retrieves a list of all active processes on a local or remote computer
 |
| Clear-EventLog            | Deletes all of the entries from the specified event logs on the local computer or on remote computers
 |
| Clear-RecycleBin	        | Deletes the content of a computer's recycle bin




# Not as interesting, but still mildly interesting:

- `Get-FileHash` - Verify the integrity of a file by confirming its hash value. Companies often post hash values of their files online for integrity verification purposes. You can validate downloads using the Get-FileHash cmdlet.
