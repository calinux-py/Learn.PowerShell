# Define an array in Windows PowerShell scripts

An array is a data structure that's designed to store a collection of items of the same type. You can think of an array as a variable containing multiple values or objects. Variables that contain a single value are useful, but for complex tasks you often need to work with groups of items. For example, you might need to update the Voice over IP (VoIP) attribute on multiple domain user accounts. Or you might need to check the status of a group of services and restart all of them that are stopped. When you put multiple objects or values into a variable, it becomes an array.

You can create an array by providing multiple values in a comma-separated list. For example:

```powershell
$computers = "LON-DC1","LON-SRV1","LON-SRV2"
$numbers = 228,43,102
```

You also can create an array by using the output from a command. For example:

```powershell
$users = Get-ADUser -Filter *
$files = Get-ChildItem C:\
```

You can verify whether a variable is an array by using the GetType() method on the variable. The BaseType listed will be System.Array.

You can create an empty array before you're ready to put content in it. This can be useful when you have a loop later on in a script that adds items to the array. For example:

```powershell
$newUsers = @()
```

You also can force an array to be created when adding a single value to a variable. This creates an array with a single value into which you can add items later. For example:

```powershell
[array]$computers="LON-DC1"
```

# Work with array lists in Windows PowerShell scripts

Within your scripts, you'll need to refer to the data that you place in arrays. You can either access all items in the array simultaneously or access them individually. To display all items in an array, you enter the variable name and then press the Enter key, just as you would for a variable with a single value.

You can refer to individual items in an array by their index number. When you create an array, each item is assigned an index number starting at 0. So, the first item placed in the array is item 0, the second item in the array is item 1, and so on. To display a specific item, place the index number in brackets after the variable name. The following example displays the first item in an array that's stored in the variable $users:

```powershell
$users[0]
```

You also can add a new item to an array. The following example adds the user account stored in `$user1` to the `$users` array:

```powershell
$users = $users + $user1
```

Alternatively, when adding items to an array, you can use the following shorthand notation:

```powershell
$users += $user1
```

To identify what you can do with the content in an array, use the Get-Member cmdlet. Pipe the contents of the array to Get-Member, and the results returned identify the properties and methods that you can use for the items in the array. For example:

```powershell
$files | Get-Member
```

To review the properties and methods available for an array rather than the items within the array, use the following syntax:

```powershell
Get-Member -InputObject $files
```

## Working with array lists

The default type of array that Windows PowerShell creates is a fixed-size array. This means that when you add an item to the array, the array is actually recreated with the additional item. When you work with relatively small arrays, this is not a concern. However, if you add thousands of items to an array one by one, recreating an array each time has a negative performance impact. The other concern when using fixed-size arrays is removing items. There's no simple method to remove an item from a fixed-size array.

To address the shortcomings of arrays, you can use an array list. An array list functions similar to an array, except that it doesn't have a fixed size. This means that you can use methods to add and remove items.

To create an array list when assigning values, use the following syntax:

```powershell
[System.Collections.ArrayList]$computers = "LON-DC1","LON-SVR1","LON-CL1"
```

To create an array list that's empty and ready to add items, use the following syntax:

```powershell
$computers=New-Object System.Collections.ArrayList
```

When you use an array list, you can use methods to both add and remove items. However, these methods will fail when you try to use them on a fixed-size array. For example:

```powershell
$computers.Add("LON-SRV2")
$computers.Remove("LON-CL1")
```

If you want to remove an item from an array list based on the index number, you use the RemoveAt() method. For example:

```powershell
$computers.RemoveAt(1)
```

# Define hash tables in Windows PowerShell Scripts

A hash table represents a similar concept to an array since it stores multiple items. However, unlike an array which uses an index number to identify each item, a hash table uses for this purpose a unique key. The key is a string that's a unique identifier for the item. Each key in a hash table is associated with a value.

The following table depicts how an array can store a list of IP addresses.

Index number -	Value
- 0	- 172.16.0.10
- 1	- 172.16.0.11
- 2 -	172.16.0.40

If the array is named `$ip`, then you access the first item in the array by using:

```powershell
$ip[0]
```

If the hash table is named `$servers`, then you access the first item in the hash table by using either of the following options:

```powershell
$servers.'LON-DC1'
$servers['LON-DC1']
```

# Work with hash tables in Windows PowerShell scripts

Working with hash tables is similar to working with an array, except that to add items to a hash table you need to provide both the key for the item and the value. The following command creates a hash table named `$servers` to store server names and IP addresses:

```powershell
$servers = @{"LON-DC1" = "172.16.0.10"; "LON-SRV1" = "172.16.0.11"}
```

Notice the following syntax in the previous example:

- It begins with the at (@) symbol.
- The keys and associated values are enclosed in braces.
- The items are separated by a semicolon.


Adding or removing items from a hash table is similar to an array list. You use the methods Add() and Remove(). For example:

```powershell
$servers.Add("LON-SRV2","172.16.0.12")
$servers.Remove("LON-DC1")
```

You can also update the value for a key. For example:

```powershell
$servers."LON-SRV2"="172.16.0.100"
```

To review all properties and methods available for a hash table, use the Get-Member cmdlet. For example:

```powershell
$servers | Get-Member
```





















