## Cmdlets

PowerShell uses verbs, such as Get, and nouns, such as Random, to create cmdlets. This is called the verb-noun naming standard.

Use flags to target either the verb or the noun in the command you want. The flag you specify expects a value that's a string.

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

## Get-ChildItem

**Get-ChildItem** is similar to the 'dir' command in the Windows Command Prompt or the 'ls' command in Unix-based systems. You can use it to list files and directories, filter them, and perform various operations on them within PowerShell.

### Examples

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

