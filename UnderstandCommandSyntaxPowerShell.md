Notes from the Understand the command syntax in Windows PowerShell module from learn.microsoft.com

# Discover the Structure of PowerShell Cmdlets
There are thousands of Windows PowerShell cmdlets built into the Windows operating system and other Microsoft products. Memorizing the names and the syntax for all these commands isn’t possible. Fortunately, cmdlet creators build cmdlets by using a common format that helps you predict both a cmdlet’s name and its syntax. This common format makes it much easier to discover and use cmdlets.

The common format that PowerShell cmdlets use is the `Verb-Noun` notation.

# Cmdlet Verbs
The verb portion of a cmdlet name indicates what the cmdlet does. There’s a set of approved verbs that cmdlet creators use, which provides consistency in cmdlet names. Common verbs include:
-	`Get` - Retrieves a resource, such as a file or user.
-	`Set` - Changes the data associated with a resource, such as a file or user property.
-	`New` - Creates a resource, such as a file or user.
-	`Add` - Adds a resource to a container of multiple resources.
-	`Remove` - Deletes a resource from a container of multiple resources.

This list represents just some of the verbs cmdlets use.

# Cmdlet Nouns
The noun portion of a cmdlet name indicates what kinds of resources or objects the cmdlet affects. All cmdlets that operate on the same resource should use the same noun. For example, the `Service` noun is for cmdlets that work with Windows services and the `Process` noun is for managing processes on a computer.

Nouns can also have prefixes that help the grouping of related nouns into families. For example, the Active Directory nouns start with the letters `AD` (such as `ADUser`, `ADGroup`, and `ADComputer`). Microsoft SharePoint Server cmdlets begin with the prefix `SP`, and Microsoft Azure cmdlets begin with the prefix `Az`.

# Discover the Parameters for using PowerShell
Parameters modify the actions that a cmdlet performs. You can specify no parameters, one parameter, or many parameters for a cmdlet.

# Parameter Format
Parameter names begin with a dash (-). A space separates the value you want to pass from the parameter name. If the value that you’re passing contains spaces, you’ll need to wrap the text in quotation marks. Some parameters accept multiple values, which you must separate by commas and no spaces. 

## Optional vs. Required Parameters

Parameters can be optional or required. If a parameter is required, and you run the cmdlet without providing a value for the parameter, Windows PowerShell will prompt you to provide a value for it. For example, if you run the command `Get-Item`, you’ll receive the following message from Windows PowerShell, which includes a prompt to provide a value for the -Path parameter:
` PS C:\> Get-Item cmdlet Get-Item at command pipeline position 1 Supply values for the following parameters: Path[0]:`

## Switches
**Switches** are a special case. They’re basically parameters that accept a Boolean value (true or false). They differ from actual Boolean parameters in that the value is only set to `true` if the switch is included when running the command. An example is the `-Recurse` parameter or switch of the `Get-ChildItem` cmdlet. The command `Get-ChildItem c:\ -Recurse` will return not just the items in the C:\ directory, but also those in all of its subdirectories. Without the `-Recurse` switch, only the items in the C:\ directory are returned. 

# Display the About Files Content in PowerShell
Although much of the help content in Windows PowerShell relates to commands, there are also many help files that describe PowerShell concepts. These files include information about the PowerShell scripting language, operators, and other details. This information doesn’t specifically relate to a single command, but to global shell techniques and features.

You can review a complete list of these topics by running `Get-Help about*`, and then reviewing a single topic by running `Get-Help about_topicname`. An example is `Get-Help abount_common_parameters`. These commands don’t use the `-Example` or `-Full` parameters of the `Help` command. However, theyre compatible with the `-ShowWindow` and `-Online` parameters.

When you use wildcard characters with the `Get-Help` command, `About` help files will appear in a list when their titles contain a match from your wildcard pattern. Typically, `About` help files will appear last, after any commands whose names also match your wildcard pattern. You can use the `-Category` parameter to specify a search for `About` files.

# Knowledge Check
Which of these options is the common structure that PowerShell cmdlets use? 
-	Verb-Noun
-	Noun-Verb
-	There's no specific structure that PowerShell cmdlets use.

`Answer: Verb-Noun`


# Summary

In this module, you've learned about the cmdlet structure and the parameters for using Windows PowerShell cmdlets. You've also learned how to use tab completion and how to display About files content. The following are the key takeaways:
-	The common structure cmdlet creators use, is the Verb-Noun format. This helps you predict both a cmdlet's name and its syntax, thus making it much easier to discover and use cmdlets.
-	Parameters modify the actions that a cmdlet performs. You can specify no parameters, one parameter, or many parameters for a cmdlet.
-	Tab completion is a PowerShell feature that improves the speed and ease of finding and entering cmdlets and parameters.
-	In addition to the help content relating to commands, About help files contain documentation about the PowerShell scripting language, operators, and other details. This information doesn't specifically relate to a single command, but to global shell techniques and features.
