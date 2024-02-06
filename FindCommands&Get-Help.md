Find commands and Get-Help in Windows PowerShell notes from learn.microsoft.com

# Find cmdlets in PowerShell

You can start by using what you know about the structure of cmdlet names, along with the `Get-Command` command or the `Get-Help` command. `Get-Command` retrieves information about a command, or several commands, such as the name, category, version, and even the module that contains it. Get-Help retrieves help content about the command.

Like the `Get-Help` command, `Get-Command` accepts wildcard characters, which means that you can run the `Get-Command` *event* command and retrieve a list of commands that contain the text event in the name. `Get-Command` also has several parameters that you can use to further filter the returned results. For example, you can use the `-Noun` and `-Verb` parameters to filter out the noun and verb portions of the name, respectively.

Both parameters accept wildcards, though in most cases you won't need to use wildcards with verbs. You can even combine the parameters to further refine the results returned. Run the `Get-Command –Noun event* –Verb Get` command to get a list of commands that have nouns starting with event and that use the Get verb.

When you attempt to identify command names, try to use just the noun portion, and consider just a single-word, singular noun. For example, event and log might be good guesses when you're trying to find a command that works with Windows event logs.

# Using modules to discover cmdlets

When you use the `Get-Module` command, it displays a partial list of cmdlets that the module you reference contains. However, you can use the module in another way to find its cmdlets.

For example, if you've discovered the module `NetAdapter`, you would expect that it should contain cmdlets you can use to manage network adapters. You can find all applicable commands in that module by running the `Get-Command –Module NetAdapter` command. The `–Module` parameter restricts the results to just those commands in the designated module.

# Using Get-Help to discover cmdlets

You can perform similar searches by using `Get-Help`, including using wildcards. One advantage of using `Get-Help` instead of `Get-Command` is that `Get-Help` performs a full-text search by using your query string if it can't find a command name that matches. If you run the `Get-Command *beep*` command, no results are available. If you run the `Get-Help *beep*` command, multiple results are returned.

You can also refer to the Related Links section of a cmdlet that you know is related to the one you're searching for. This section of the help topic includes related cmdlets.

# PowerShell Gallery

The PowerShell Gallery is a central repository for Windows PowerShell–related content, including scripts and modules. The PowerShell Gallery uses the Windows PowerShell module, PowerShellGet. This module is part of Windows PowerShell 5.0 and newer.

PowerShellGet contains cmdlets for finding and installing modules, scripts, and commands from the online gallery. For example, the `Find-Command` cmdlet searches for commands, functions, and aliases. It works similar to the `Get-Command` cmdlet, including support for wildcards.

You can pass the results of the `Find-Command` cmdlet to the `Install-Module` cmdlet, which the PowerShellGet module also contains. `Install-Module` will install the module that contains the cmdlet that you discovered.

# Use command aliases in PowerShell

If you have experience using the traditional Windows Command Prompt shell (`cmd.exe`), you're likely also familiar with batch commands such as:

- `dir` for listing files and folders.
- `cd` for changing directories.
- `mkdir` for creating new directories.

In many cases, you can continue to use these commands within Windows PowerShell because, behind the scenes, these commands are running native PowerShell cmdlets. The dir command runs `Get-ChildItem`, the cd command runs `Set-Location`, and the `mkdir` command runs `New-Item`. These commands work with PowerShell because they're aliases of the cmdlets that perform the equivalent action.

# Aliases and parameters

It's important to note that aliases typically don't support the parameters that the original commands use. For example, if you run the command `dir /o:d` in the console, you'll receive an error because `Get‑ChildItem` doesn't recognize the `/o:d` parameter. Instead, you can use the `dir | sort LastAccessTime` to list the contents of the current folder sorted by last accessed date and time in the ascending order.

# Get-Alias

PowerShell includes more than just aliases for legacy batch and Linux commands. It also provides other aliases, such as `gci` for `Get-ChildItem`, which you can use to replace a full command with its abbreviated notation and minimize the amount of typing required. You can discover aliases, their definitions, and the commands that they run, by using the `Get-Alias` cmdlet. `Get‑Alias` with no parameters returns all aliases defined. You can use the `-Name` parameter, a positional parameter, which also accepts wildcards, to find the definition for specific aliases. For example, running the command `Get-Alias di*` returns aliases for both `diff` and `dir`.

You can also use the `Get-Alias` cmdlet to discover new cmdlets. For example, you use the batch command `del` to delete a file or folder. You can enter the command `Get-Alias del` to discover that `del` is an alias for `Remove-Item`. You can even reverse the discovery process by running the command `Get‑Alias -definition Remove-Item` to discover that `Remove-Item` has several other aliases, including `rd`, `erase`, and `ri`.

Parameters can also have aliases. For example, the `-s` parameter is an alias for `-Recurse` in the `Get‑ChildItem` cmdlet. In fact, for parameters, you can use partial parameter names just like aliases, if the portion of the name you do include in the command is enough to uniquely identify that parameter.

# New-Alias

You can also use the `New-Alias` cmdlet to create a custom alias that you can map to any existing cmdlet. Keep in mind, however, that custom aliases aren't saved between Windows PowerShell sessions. You can use a Windows PowerShell profile to recreate the alias every time you open Windows PowerShell.

# Use Show-Command and Get-Help in PowerShell

The `Show-Command` cmdlet opens a window that displays either a list of commands or a specific command's parameters. This window is the same one that displays when you select the Show Command Window option in the ISE.

To display a specific command's parameters, provide the name of the command as the value for the `‑Name` parameter. For example, to open the Show Command Window with the command used to retrieve an Active Directory user, enter the following command in the console, and then press the Enter key:

`Show-Command –Name Get-ADUser`

The `–Name` parameter is positional, so the following command produces the same result:

`Show-Command Get-ADUser`

If you select the Show Command Window option in the ISE, and your cursor is within or immediately next to a command name within the console or scripting pane, the results are the same.

# Using Get-Help
Windows PowerShell provides extensive in-product help for commands. You can access this help by using the `Get-Help` command. `Get-Help` displays all help content on the screen and lets you scroll through it. You can also use the Help function or the Man alias, which maps to the `Get-Help` command. All three return basically the same results. These results include a short and long description of the cmdlet, the syntax, any additional remarks from the help author, and links to related cmdlets or additional information online. The help and Man commands display content in the console one page at a time. The ISE displays the entire help content.

For example, to display the help information for the `Get-ChildItem` cmdlet, enter the following command in the console, and then press the Enter key:

`Get-Help Get-ChildItem`

# Get-Help parameters

The `Get-Help` command accepts parameters that allow you find additional information beyond the information displayed by default. A common reason to seek additional help is to identify usage examples for a command. Windows PowerShell commands commonly include many such examples. For instance, running the command `Get-Help Stop-Process –Examples` will provide examples of using the `Stop-Process` cmdlet.

The `-Full` parameter provides in-depth information about a cmdlet, including:

- A description of each parameter.
- Whether each parameter has a default value (although this information isn't consistently documented across all commands).
- Whether a parameter is mandatory.
- Whether a parameter can accept a value in a specific position (in which case the position number, starting from 1, is given) or whether you must enter the parameter name (in which case named displays).
- Whether a parameter accepts pipeline input and, if so, how.

Other Get-Help parameters include:

‑ `-ShowWindow`. Displays the help topic in a separate window, which makes it much easier to access help while entering commands.
‑ `-Online`. Displays the online version of the help topic (typically the most up-to-date information) in a browser window.
‑ `-Parameter ParameterName`. Displays the description of a named parameter.
‑ `-Category`. Displays help only for certain categories of commands, such as cmdlets and functions.


# Using Get-Help to find commands

The `Get-Help` command can be very useful for finding commands. It accepts wildcard characters (`*`, `?`), notably the asterisk (`*`) wildcard character. When you ask for help and use wildcard characters with a partial command name, Windows PowerShell will display a list of matching help topics.

By using the information you learned earlier about the verb-noun structure of cmdlets, you can use `Get-Help` as a tool to discover cmdlets even if you don't know their names. For example, if you want all cmdlets that operate on processes, you can enter the command `Get-Help *process*` in the console, and then press the Enter key. The results match the ones returned by the command `Get-Command *process*`, except that `Get-Help` displays a synopsis. This synopsis is a short description that helps you identify the command you want.

Sometimes, you might specify a wildcard search that doesn't match any command name. For example, running `Get-Help *beep*` won't find any commands that have beep in their name. When no results are found, the help system performs a full-text search of available command descriptions and synopses. This search locates any help files that contain beep. If there's only a single file with a match, the help system displays its content, rather than displaying a one-item list. In the case of the search term beep, `Get-Help` returns a list of two topics: `Set-PSReadlineOption`, a cmdlet, and about_Special_Characters, a conceptual help topic.

# Interpret the help file contents and update the local help content in PowerShell

When you find the command that you need for a task, you can use its help file to learn how to use it. One way to learn is to review the examples and try to understand their usage. However, it's uncommon for examples to cover all possible variations of that's command's usage. Learning to interpret the help-file syntax can help you to identify all capabilities of a given command.

# Get-EventLog help

Use the help for `Get-EventLog` as an example. If you enter the command `Get-Help Get-EventLog` in the console and press the Enter key, the help returns the following syntax:
```powershell
Get-EventLog [-LogName] <String> [[-InstanceId] <Int64[]>] [-After <DateTime>] [-AsBaseObject] [-Before <DateTime>] [-ComputerName <String[]>] [-EntryType {Error | Information | FailureAudit | SuccessAudit | Warning}] [-Index <Int32[]>] [-Message <String>] [-Newest <Int32>] [-Source <String[]>] [-UserName <String[]>] [<CommonParameters>]

Get-EventLog [-AsString] [-ComputerName <String[]>] [-List] [<CommonParameters>]
```

The two blocks of text are parameter sets, each of which represents a way in which you can run the command. Notice that each parameter set has many parameters, and they both have several parameters in common. You can't mix and match parameters between sets. That is, if you decide to use the `–List` parameter, you can't also use `–LogName`, because these parameters don't appear together in the same parameter set.

The `–LogName` parameter name is enclosed in square brackets, meaning it's a positional parameter. You can't run the command without a log name. However, you don't have to enter the `–LogName` parameter name. You do need to pass the log name string as the first parameter, because that's the position in the help file where the `–LogName` parameter appears. Therefore, the following two commands provide the same results:

```powershell
Get-EventLog –LogName Application
Get-EventLog Application
```

# Omitting parameter names

Be cautious when omitting parameter names, for a few reasons. You can't omit every parameter. For example, the `‑ComputerName` parameter can't have the parameter name omitted. Additionally, you can quickly lose track of where things go. When you provide parameter names, the parameters can appear in any order, as the following command depicts:
```powershell
Get-EventLog –ComputerName LON-DC1 –LogName Application –Newest 10
```

However, when you omit parameter names, you must ensure to enter parameters in the correct order. For example, the following command won't work because the log name value doesn't appear in the correct position:
```powershell
Get-EventLog –ComputerName LON-DC1 Application
```

# Specifying multiple values

Some parameters accept more than one value. In the SYNTAX section, a double-square-bracket notation in the parameter value type designates these parameters. For example:
```powershell
-ComputerName <string[]>
```

The above syntax indicates that the `–ComputerName` parameter can accept one or more string values. One way to specify multiple values is by using a comma-separated list. You don't have to enclose the values in quotation marks, unless the values themselves contain a comma or white space, such as a space or tab character. For example, use the following command to specify multiple computer names:
```powershell
Get-EventLog –LogName Application –ComputerName LON-CL1,LON-DC1
```

# Summary

In this module, you've learned the strategies and tools to find Windows PowerShell cmdlets based on the actions they perform and the features or technologies they manage. The following are the key takeaways:

- Modules are groups of related PowerShell capabilities that are bundled together into a single unit. Modules help with organizing cmdlets into distributable units.
- Finding the cmdlet that you need from the extensive built-in help of Windows PowerShell can be a challenge. Using the –Module parameter and Get Help can make this task easier.
- Batch commands used in the traditional Windows Command Prompt shell (`cmd.exe`) can also be used within Windows PowerShell. This is because these batch commands are aliases of the cmdlets that perform the equivalent action.
- The `Show-Command` cmdlet opens a window that displays either a list of commands or a specific command's parameters. To display a specific command's parameters, provide the name of the command as the value for the `‑Name` parameter.
- The `Get-Help` command can help you access the extensive in-product help for commands that Windows PowerShell provides.
- Learning to interpret the help-file syntax can help you to identify all capabilities of a given command.
- Windows PowerShell 3.0 and newer versions don't ship with help files. Instead, help files are available as an online service. Run Update-Help to scan your computer for all installed modules, retrieve online help locations for each, and try to download their respective help files.
