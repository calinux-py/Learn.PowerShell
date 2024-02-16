# My Favorites from PowerShell

Three core cmdlets allow you to delve into what cmdlets exist and what they do:

The Get-Command cmdlet lists all of the available cmdlets on your system. Filter the list to quickly find the command you need.
```powershell
Get-Command
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

- `Get-StartApps` - Used to retrieve a list of Start menu apps and tiles for the current user on a Windows operating system.
- `Set-Clipboard` - Used to set clipboard content. Essentially clipboard injection.
- `Get-Clipboard` - Retrieve clipboard content.
- `Get-LocalUser` - Return all local users on the system.

# Not as interesting, but still mildly interesting:

- `Get-FileHash` - Verify the integrity of a file by confirming its hash value. Companies often post hash values of their files online for integrity verification purposes. You can validate downloads using the Get-FileHash cmdlet.
