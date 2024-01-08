# Get-Command

PowerShell uses verbs, such as Get, and nouns, such as Random, to create cmdlets. This is called the verb-noun naming standard.
Use flags to target either the verb or the noun in the command you want. The flag you specify expects a value that's a string.
You can add pattern-matching characters to that string to ensure you express that, for example, a flag's value should start or end with a certain string.

These examples show how to use flags to filter a command list:

- -Noun: The `-Noun` flag targets the part of the command name that's related to the noun. That is, it targets everything after the hyphen (`-`). Here's a typical search for a command name:

```powershell
Get-Command -Noun a-noun*
```
This command searches for all cmdlets whose noun part starts with a-noun.

- -Verb: The -Verb flag targets the part of the command name that's related to the verb. You can combine the -Noun flag and the -Verb flag to create an even more detailed search query and type. Here's an example:

```powershell
Get-Command -Verb Get -Noun a-noun*
```
Now you've narrowed the search to specify that the verb part needs to match Get, and the noun part needs to match a-noun.

By using one or possibly two parameters, you can quickly find the cmdlet you need.

----------------------------

Complete Example:

Run the command Get-Command with the flag -Noun. Specify File* to find anything related to files.
```powershell
Get-Command -Noun File*
```

Run Get-Command. Specify the flags -Verb and -Noun.

```powershell
Get-Command -Verb Get -Noun File*
```

--------------------------

# Get-Help

By using the built-in help system in PowerShell, you can find out more about a specific command. You use the `Get-Command` cmdlet to locate a command that you need. After you've located the command, you might want to know more about what the command does and various ways to call it.

You can use the `Get-Help` core cmdlet to learn more about a command. Typically, you invoke `Get-Help` by specifying it by name and adding the `-Name` flag that contains the name of the cmdlet you want to learn about. Here's an example:
```powershell
Get-Help -Name Get-Help
```

If you don't want to display the full help page, narrow the response by adding flags to your Get-Help command. Here are some flags you can use:

- Full: Returns a detailed help page. It specifies information like parameters, inputs, and outputs that you don't get in the standard response.
- Detailed: Returns a response that looks like the standard response, but it includes a section for parameters.
- Examples: Returns only examples, if any exist.
- Online: Opens a web page for your command.
- Parameter: Requires a parameter name as an argument. It lists a specific parameter's properties.

For example, you can use the following command to return only the Examples section of the help page.

```powershell
Get-Help Get-FileHash -Examples
```

Because this output is difficult to read, you decide to use an alternative that is less verbose. That is, you use the `help` alias.

Enter the `help` command:
```powershell
help Get-FileHash
```

## Discover objects

When a cmdlet runs, it returns an object. When you invoke a cmdlet, the response you see has been formatted and might not necessarily represent all the available information for the response. To know more about what's being returned and how you can modify what is returned, you can use the command `Get-Member`.

The `Get-Member` cmdlet is meant to be piped on top of the command you run so that you can filter the output. A typical command-line invocation of `Get-Member` might look like the following example:

```powershell
Get-Process -Name 'name-of-process' | Get-Member
```

This command first produces an object result by calling `Get-Process`. That result is passed as an input to `Get-Member` by using the pipe (`|`). In return, you get a table result that includes the `Name`, `MemberType`, and `Definition` columns. You also get the type of the returned object.


## Filter a Get-Member result by using Select-Object

When you run `Get-Member`, the result is verbose. That is, many rows are returned. The object might have properties, like events and methods. To make the answer less verbose, you can filter on specific columns and also decide which columns to display. Keep in mind that the returned answer is already a subset of all the columns in the response.

Take a look at a `Get-Member` response that includes many columns. By introducing the `Select-Object` cmdlet, you can choose which columns appear in the response. The command expects either a comma-separated list of column names or a wildcard character, such as an asterisk (`*`), which indicates all columns.

When you use the `Select-Object` command in the context of `Select-Object Name, MemberType`, you specify only the columns you want. In this case, the columns are `Name` and `MemberType`. The command line would look like this:

```powershell
Get-Process -Name 'name-of-process' | Get-Member | Select-Object Name, MemberType
```

-------------------------

# Connect commands into a pipeline

Running a command can be powerful, you get data from your local machine or from across the network. To be even more effective, you need to learn how to get the data that you want. Most commands operate on objects, as input or as output, or both. Objects have properties and you may want to access a subset of those properties and present them in a report. You might also want to sort the data based on one or more properties. But how do you get there?

## Use Get-Member to inspect output

When you pass the results of a command to `Get-Member`, `Get-Member` returns information about an object, like:

- The type of object being passed to Get-Member.
- The Properties of the object that may be evaluated.
- The Methods of the object that may be executed.

Let's demonstrate this fact by running `Get-Member` on the command `Get-Process`.

```powershell
Get-Process | Get-Member
```

The output shows the type of object that the Get-Process command returns (System.Diagnostics.Process). The rest of the response shows the name, type, and definition of the object's members. You can see that If you want to fit Get-Process with another command in a pipeline, pairing it with Get-Member is a good first step.


## Select-Object

By default, when you run a command that is going to output to the screen, PowerShell automatically adds the command `Out-Default`. When the output data is a collection of objects, PowerShell looks at the object type to determine if there's a registered view for that object type. If it finds one, it uses that view.

The view generally doesn't contain all the properties of an object because it wouldn't display properly on screen, so only some of the most common properties are included in the view.

You can override the default view by using `Select-Object` and choosing your own list of properties. You can then send those properties to `Format-Table` or `Format-List`, to display the table however you like.

Consider the result of running `Get-Process` on the process `zsh`.

What you see is a view that represents what you most likely want to see from this command. However, this view doesn't show you a complete set of information. In order to see something different, you can explicitly specify which properties you want to see in the result.

## Getting the full response
What you've seen so far is a limited response. To present the full response, you use a wildcard `*`, like so: 

```powershell
Get-Process zsh | Format-List -Property *
```

The * character shows you every attribute and its value, which allows you to investigate the values you're interested in. The full response also uses presentation names for properties instead of the actual property names, and presentation names look good in a report.

## Selecting specific columns
To limit the response and find a middle ground between the default response and the full response, you want to select some properties you're interested in and have that as parameter input to `Select-Object`. But, and here's a problem, you need to use the real names for the columns. How do you find out the real names? Use `Get-Member`. A call to `Get-Member` gives you all the properties and their actual names.

From the default response, the properties `Id` and `ProcessName` are most likely called the same, but CPU(s) is a presentation name, real property names tend to consist of only text characters and no spaces. To find out the real name for a specific property, you can use `Get-Member`:

```powershell
Get-Process zsh | Get-Member -Name C*
```

You now get a list of all members with names that start with a `C`. Among them is `CPU`, which is likely what you want.

You now know how to use `Select-Object` to ask for exactly what you need with the correct property names, like so:

```powershell
Get-Process zsh | Select-Object -Property Id, Name, CPU
```

## Sorting
When you use `Sort-Object` in a pipeline, PowerShell sorts the output data by using the default properties first. If no such properties exist, it then tries to compare the objects themselves. The sorting is either by ascending or descending order.

By providing properties, you can choose to sort by specific columns, like so:

```powershell
Get-Process | Sort-Object -Descending -Property Name
```

In the preceding command, we're sorting by the column `Name` in descending order. To sort by more than one column, separate the column names with a comma, like so:

```powershell
Get-Process | Sort-Object -Descending -Property Name, CPU
```

In addition to sorting by column name, you can also provide your own custom expression. In this example, we use a custom expression to sort by the columns `Name` and `CPU` and control the sort order for each column.

```powershell
Get-Process 'some process' | Sort-Object -Property @{Expression = "Name"; Descending = $True}, @{Expression = "CPU"; Descending = $False}
```

The preceding example demonstrates how powerful and flexible `Sort-Object` can be. This subject is a bit advanced and out of scope for this module, but is revisited in more advanced modules.


--------------------------

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

