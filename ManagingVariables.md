# Define variables in Windows PowerShell scripts\

When using the Windows PowerShell pipeline, you can pass data through the pipeline and perform operations on it. This capability lets you perform many bulk operations such as:

- Querying a list of objects.
- Filtering the objects.
- Modifying the objects.
- Displaying the data.

The pipeline's primary limitation is that the process flows only in one direction and it's difficult to perform complex operations. You can use variables to solve this problem. Variables store values and objects in memory so you can perform complex and repetitive operations on them.

You can use a variable to:

- Store the name of a log file that you write data to multiple times.
- Derive and store an email address based on the name of a user account.
- Calculate and store the date representing the beginning of the most recent 30-day period, to identify whether computer accounts have authenticated during that time.

In addition to simple data types such as numbers or strings, variables can contain objects too. When a variable contains an object, you can access all of the object’s characteristics. For example, if you store an Active Directory user object in a variable, all of that user account's properties are stored in the variable as well, and you can review them. To review the variables contained in memory by reviewing the contents of the PowerShell drive named Variable, use the following command:

```powershell
Get-ChildItem Variable:
```
You can also review the variables in memory by using the Get-Variable cmdlet:

```powershell
Get-Variable
```

# Create variable names in Windows PowerShell scripts

You should create variable names that describe the data stored in them. For example, a variable that stores a user account could be `$user`, and a variable that stores the name of a log file could be `$logFileName`.

In most cases, you'll notice variables are used with a dollar sign (`$`) symbol. The `$` symbol is not part of the variable name but it distinguishes variables from other syntax elements of Windows PowerShell. For example, `$user` designates a variable named user, and the `$` symbol helps Windows PowerShell to identify that it's a variable.

You should typically limit variable names to alphanumeric characters (letters and numbers). While you can include some special characters and spaces, it becomes more confusing to use. For example, to include a space in a variable name, you need to enclose the name in braces (`{ }`). An example would be `${log File}`, where there's a space between the words log and file.

Variable names aren't case sensitive. The variables `$USER` and `$user` are interchangeable. For improved legibility, the common convention is to use lowercase characters and capitalize the first letter of each word in a variable name. Capitalizing the first word is optional depending on the situation and your preferences. For example, `$logFile` and `$LogFile` are both commonly used. However, when variables are used for parameters in a script, the first word should be capitalized for consistency with the parameters used by cmdlets. Using a capital letter acts as a separator between the words and makes the variable name more legible without using special characters such as spaces, hyphens, or underscores.

# Assign values and types to variables in Windows PowerShell scripts

When working with variable values, you use the standard mathematical operators that you're already familiar with, such as equal (`=`), plus (`+`), and minus (`–`).

To assign a value to a variable, you use the equal (`=`) operator. For example:

```powershell
$num1 = 10
$logFile = "C:\Logs\log.txt"
```

You can also assign a value to a variable by using a command that's evaluated. The result of the command is placed in the variable. For example:

```powershell
$user = Get-ADUser Administrator
$service = Get-Service W32Time
```

You can display the value of a variable by entering the variable name and then pressing the Enter key. You can also display the value as part of a command by using Write-Host. For example:

```powershell
$user
Write-Host "The location of the log file is $logFile"
```

To remove all values from a variable, you can set the variable equal to `$null`. The `$null` variable is automatically defined by Windows PowerShell as nothing. For example:

```powershell
$num1 = $null
$str1 = $null
```

You can use mathematical operators with variables, as the following example depicts:

```powershell
$area = $length * $width
$sum = $num1 + $num2
$path = $folder + $file
```

You can set the value of a variable by using the Set-Variable cmdlet. When you use this cmdlet, you don't include the `$` symbol when referring to the name, as the following example depicts:

```powershell
Set-Variable -Name num1 -Value 5
```

## Assigning a type to a variable

All variables are assigned a type. The variable type determines the data that can be stored in it. In most cases, Windows PowerShell automatically determines the type of a variable during assignment of its value. Automatic assignment of the variable type works well most of the time. However, in some cases, the data type is ambiguous, and you might prefer to set the variable type explicitly.

The following table lists the common variable types used in Windows PowerShell.

If you don't assign a variable type, Windows PowerShell assigns a type automatically based on the value you assign to the variable. When the value is contained in quotes, it's generally interpreted as a string. For example, Windows PowerShell would interpret 5 as an integer but "5" would be interpreted as a string.

You can force a variable to accept only a specific type of content by defining the type. When you define the type, Windows PowerShell attempts to convert the value you provide into the correct type. If Windows PowerShell is unable to convert the value into the correct type, it returns an error.

The following examples depict the `$num2` variable being defined as a 32-bit integer and the `$date` variable being defined as DateTime.

```powershell
[Int]$num2 = "5"
[DateTime]$date = "January 5, 2022 10:00AM"
```

You can review a variable’s type by appending the GetType() method to the name of the variable. For example:

```powershell
$date.GetType()
```

 # Identify the methods and properties of variables in Windows PowerShell scripts

Just as objects in Windows PowerShell have properties and methods, so do variables. The properties and methods that you can use vary depending on what's stored in the variable. If a variable contains an object such as an Active Directory Domain Services (AD DS) user account or a Windows service, then the properties and methods for the variable match those for the object. If a variable is the DateTime type, then the properties and methods for DateTime are available.

The simplest method for identifying the properties and methods that are available for a variable is to pipe the variable to the Get-Member cmdlet. The Get-Member cmdlet displays all the available properties and methods for a specific variable based on its variable type. For example:

```powershell
$logFile | Get-Member
```

To browse through the properties and methods for a variable, you leverage the tab completion feature by entering the name of the variable appended with a dot. When you select the Tab key, the properties and methods available for the variable display.

When you review the properties and methods for a variable, some of them will be easily understandable. If you don't understand how to use a property or method for a variable, you can review documentation for that variable type in the Microsoft .NET Framework Class Library. Each variable type has its own section in the documentation. For example, the documentation for Decimal variables is located in Decimal Struct.

The documentation for the .NET Framework is oriented towards developers and sometimes can be difficult to understand. You can also search the internet for examples relating to a specific method or property. Many examples are available online.

# Use string variables and methods in Windows PowerShell scripts

String variables are commonly used in scripts. You can use strings to store user input and other text data. There are many methods that you can use to manipulate strings. Many of these methods are seldom used, but it's good to be aware of them in case you ever need them.

The string variable has only one property, Length. When you review the length for a string variable, it returns the number of characters in the string. For example:

```powershell
$logFile.Length
```

The following table lists some of the methods available for string variables.

# Use date variables and methods in Windows PowerShell scripts

Many of the scripts that you create will need to reference the current date or a previous point in time. For example, to ensure uniqueness, you might want to create a log file name based on the current date. Additionally, you might be searching for users in AD DS that haven't signed in for an extended period of time. You can use DateTime variables to accomplish these tasks.

## DateTime properties

A DateTime variable contains both the date and the time. You can use the DateTime variable properties to access specific parts of the date or time. The following table lists some of the properties available for a DateTime variable.

Property	Description
Hour	Returns the hours of the time in 24-hour format.
Minute	Returns the minutes of the time.
Second	Returns the seconds of the time.
TimeOfDay	Returns detailed information about the time of day, including hours, minutes, and seconds.
Date	Returns only the date and not the time.
DayOfWeek	Returns the day of the week, such as Monday.
Month	Returns the month as a number.
Year	Returns the year.






















