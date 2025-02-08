# Things to Remember:

$$ Logical Operators

Logical Operators:
- `-gt`: Greater than
- `-ge`: Greater than or equal to
- `-lt`: Less than
- `-le`: Less than or equal to
- `-eq`: Equal to

## PowerShell Modules

To create a PowerShell module:
- Add .psm1 to the script with a function name.
- Create a folder called Modules.
- Create a folder inside Modules with the name of the module and place .psm1 into it.
- Import module by running command:
```powershell
Import-Module path\to\module
```

To automatically add modules when you startup PowerShell, open your PowerShell profile and add:
```
$env:PSModulePath = $env:PSModulePath + ";path/to/modules"
```

## PowerShell Gallery

If you want to upload a module to PowerShell Gallery:
- Create a new directory with the name of the new module.
- Create PowerShell .psm1 file with PowerShell function.
- Create a new GUID by running `New-GUID`
- Create PowerShell .psd1 file with PowerShell module information, ensuring to fill out `RootModule`, `GUID`, `FileList`.
- `RootModule` = 'YourModuleName.psm1'
- `GUID` = '##########'
- `FileList` = @('YourModuleName.psm1')
- Check `GalleryPSD1-Example.psd1` for more help
- Grab API from [PowerShell Gallery](https://www.powershellgallery.com/account/apikeys)
- When filling out the API Key, make sure to enter `*` as the GLOB for now.

Run following command:

```powershell
Publish-Module -Path "C:\Path\to\Module\" -NuGetApiKey YOUR-GALLERY-API-KEY
```
- Go back to PowerShell Gallery API and edit the newly created API key.
- Select the package which was just uploaded (refresh if it doesn't appear).

![image](https://github.com/user-attachments/assets/e157a452-6bef-469a-99c6-346e4c420ff7)


Import PowerShell Gallery module:

```powershell
Install-Module -Name YourModuleName
```

![image](https://github.com/user-attachments/assets/50d89f39-9057-4649-986a-18944773776f)


### PowerShell Gallery Errors:
- IF you receive `"The specified API key is invalid, has expired, or does not have permission to access the specified package."` - it is likely your module shares a name with another public module. Change your PowerShell module name for the directory, `.psm1`, and `.psd1` files.

--------------------------------

# My Favorites from PowerShell

Three core cmdlets allow you to delve into what cmdlets exist and what they do:

Check what version of PowerShell you are running:

```powershell
$PSVersionTable
```

Check versions available:

```powershell
winget search Microsoft.PowerShell
```

Download newest version of Powershell:

```
winget install --id Microsoft.Powershell --source winget
```

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

Verify if you have a PowerShell profile:

```powershell
Test-Path $Profile
```

Create a PowerShell profile:

```powershell
New-Item -Path $Profile -Type File -Force
```

Open PowerShell profile in notepad:

```powershell
notepad $profile
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

Search for name, check if it is enabled or disabled, and check last logon:
```powershell
Get-ADUser <username> -Properties LastLogonDate | Select-Object SamAccountName, Enabled, LastLogonDate
```

Disable an account in a specific OU:

*To make it easy, run the `Get-ADUser <username>` and then copy the `DistinguishedName:` line. Example, `CN=Bob Segar,OU=Staff,OU=TestLawFirm,DC=VMW,DC=com`

```powershell
Disable-ADAccount -Identity "CN=Bob Segar,OU=Staff,OU=TestLawFirm,DC=VMW,DC=com"
```

Locate files within the directories specified in your system's PATH environment variable, as well as in the current directory. We will search for ipconfig in this example:
```
where.exe *ipconfig*
```


# Get-ChildItem

**Get-ChildItem** is similar to the 'dir' command in the Windows Command Prompt or the 'ls' command in Unix-based systems. You can use it to list files and directories, filter them, and perform various operations on them within PowerShell.

## Examples

Locate all .txt files.
```powershell
gci -recurse *.txt
```

Locate certain words.
```powershell
gci -recurse *notes*
```

Search a specific drive.
```powershell
gci -Path C:\ -recurse *item*
```

--------------------------------

# Active Directory Cmdlets\Scripts

Display all Active Directory users by their account name and check if they are enabled or disabled.
```powershell
Get-ADUser -Filter * | Select-Object SamAccountName, Enabled
```

Search by Active Directory users by first name.
```powershell
Get-ADUser -Filter {GivenName -eq "firstname"}
```

Display all Organizational Units.
```powershell
Get-ADOrganizationalUnit -Filter *
```

Display all Active Directory computers.
```powershell
Get-ADComputer -Filter *
```

Search for name, check if it is enabled or disabled, and check last logon.
```powershell
Get-ADUser <username> -Properties LastLogonDate | Select-Object SamAccountName, Enabled, LastLogonDate
```

--------------------------------

# Interesting or HACKISH Commands:

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




# Not as interesting, but still mildly interesting:

- `Get-FileHash` - Verify the integrity of a file by confirming its hash value. Companies often post hash values of their files online for integrity verification purposes. You can validate downloads using the Get-FileHash cmdlet.


# PowerShell Security

-----------------------------------------

**PowerShell Ports:**
- 5985
- 5986

Set Execution policies to `Restricted` for departments that dont need scripting.
```powershell
Set-ExecutionPolicy Restricted
```

Set Execution policies to `allsigned` or `remotesigned` for enchanced security.
```powershell
Set-ExecutionPolicy allsigned
```


Sign PowerShell scripts to authenticate them.
```powershell
Set-AuthenticodeSignature
```

**Turn on PowerShell logging:**

`Group Policy > Computer Configuration > Administrative Templates > Windows Components > Windows PowerShell > Turn on module logging and add '*' to log all modules, Turn on PowerShell script block logging, Turn on Script Execution, Turn on PowerShell Transcription`

**Check Event Viewer logs for deeper logging check:**

`Event Viewer > Microsoft > Windows > PowerShell`

**Block PowerShell ports from remote access:**

`Windows Defender Firewall > Advanced Settings > Inbound Rules > Create new rule > Port > 5985, 5986 > Block Connection > Apply to all profiles > Name whatever`

**Change PowerShell remote listening port (to allow remote access without listening on default ports):**

```powershell
Set-Item <username>:\localhost\listener\listener*\port value <Port>
```

**To update port on computers:**

```powershell
New-PSSession <ComputerName> <Netbios> -Port <Port>
Enter-PSSession <ComputerName> <Netbios> -Port <Port>
```

- PowerShell 2.0 is enabled by default on most servers. It is recommended to remove it. Go to server manager, Remove Roles and Features, and uninstall PowerShell 2.0.

------------------------------------

Security Levels:
- User (Lowest)
- Admin (Medium)
- Root (High)
- Kernel (Highest)

As you move up the levels from User, the less permissions you will need to run scripts. Admin has more ability to run scripts than User, Root has more abiility to run script than Admin, and Kernel it essentially unchecked.

Tools to run PowerShell scripts and help with escalated privileges:
- PowerShell-Empire
- PowerSploit
