# Manage user accounts in PowerShell

User management is a core responsibility of administrators. You can use the Active Directory module for Windows PowerShell cmdlets to create, modify, and delete user accounts individually or in bulk. User account cmdlets have the word “User” or “Account” in the noun part of the name. To identify the available cmdlets, include them in wildcard name searches when you're using Get-Help or Get-Command.

The following table lists common cmdlets for managing user accounts.

Cmdlet -	Description
- New-ADUser	- Creates a user account
- Get-ADUser	- Retrieves a user account
- Set-ADUser	- Modifies properties of a user account
- Remove-ADUser	- Deletes a user account
- Set-ADAccountPassword	- Resets the password of a user account
- Unlock-ADAccount	- Unlocks a user account that's been locked after exceeding the permitted number of incorrect sign-in attempts
- Enable-ADAccount	- Enables a user account
- Disable-ADAccount	- Disables a user account

## Retrieving users
The Get-ADUser cmdlet requires that you identify the user or users that you want to retrieve. You can do this by using the -Identity parameter, which accepts one of several property values, including the Security Accounts Manager (SAM) account name or distinguished name.

Windows PowerShell only returns a default set of properties when you use Get-ADUser. To review other properties, you'll need to use the -Properties parameter with a comma-separated list of properties or the “*” wildcard.

For example, you can retrieve the default set of properties along with the department and email address of a user with the SAM account anabowman by entering the following command in the console, and then pressing the Enter key:

```powershell
Get-ADUser -Identity anabowman -Properties Department,EmailAddress
```

The other way to specify a user or users is with the -Filter parameter. The -Filter parameter accepts a query based on regular expressions, which later modules in this course describe in more detail. For example, to retrieve all AD DS users and their properties, enter the following command in the console, and then press the Enter key:

```powershell
Get-ADUser -Filter * -Properties *
```

## Creating new user accounts
When you use the New‑ADUser cmdlet to create new user accounts, the -Name parameter is required. You can also set most other user properties, including a password. When you create a new account, consider the following points:

- If you don't use the -AccountPassword parameter, then no password is set, and the user account is disabled. You can't set the -Enabled parameter as $true when no password is set.
- If you use the -AccountPassword parameter to specify a password, then you must specify a variable that contains the password as a secure string or choose to enter the password from the console. A secure string is encrypted in memory.
- If you set a password, then you can enable the user account by setting the -Enabled parameter as $true.

The following table lists common parameters for the New-ADUser cmdlet.

Parameter	- Description
- ‑AccountExpirationDate	- Defines the expiration date for a user account
- ‑AccountPassword	- Defines the password for a user account
- ‑ChangePasswordAtLogon	- Requires a user account to change passwords at the next sign-in
- ‑Department	- Defines the department for a user account
- ‑DisplayName	- Defines the display name for a user account
- ‑HomeDirectory	- Defines the location of the home directory for a user account
- ‑HomeDrive	- Defines the drive letters that map to the home directory for a user account
- ‑GivenName	- Defines the first name of a user account

To add a user account and set its Department attribute to IT , enter the following command in the console, and then press the Enter key:

```powershell
New-ADUser "Ana Bowman" -Department IT
```

# Manage groups and group memberships in PowerShell

The management of Active Directory groups closely relates to the management of users. You can use the Active Directory module for Windows PowerShell cmdlets to create and delete groups and to modify group properties. You can also use these cmdlets to change the group membership.

## Managing groups

Cmdlets for modifying groups have the text “group” in their names. Cmdlets that modify group membership by adding members to a group, for example, have the text “groupmember” in their names. Cmdlets that modify the groups that a user, computer, or other Active Directory object is a member of have the text “principalgroupmembership” in their names.

The following table lists some common cmdlets for managing groups.

Cmdlet	Description
- New-ADGroup	- Creates a new group
- Set-ADGroup	- Modifies properties of a group
- Get-ADGroup	- Displays properties of a group
- Remove-ADGroup	- Deletes a group
- Add-ADGroupMember	- Adds members to a group
- Get-ADGroupMember	- Displays members of a group
- Remove-ADGroupMember -	Removes members from a group
- Add-ADPrincipalGroupMembership	- Adds group membership to an object
- Get-ADPrincipalGroupMembership	- Displays group membership of an object
- Remove-ADPrincipalGroupMembership	- Removes group membership from an object

## Creating new groups

You can use the New‑ADGroup cmdlet to create groups. When you create groups by using the New‑ADGroup cmdlet, you must use the ‑GroupScope parameter in addition to the group name. This parameter is the only one required.

The following table lists common parameters for New‑ADGroup.

Parameter	Description
- ‑Name -	Defines the name of a group
- ‑GroupScope	- Defines the scope of a group as DomainLocal, Global, or Universal; you must provide this parameter
- ‑DisplayName	- Defines the Lightweight Directory Access Protocol (LDAP) display name for an object
- ‑GroupCategory	- Defines whether a group is a security group or a distribution group; if you don't specify either, a security group is created
- ‑ManagedBy	- Defines a user or group that can manage a group
- ‑Path	- Defines the OU or container in which a group is created
- ‑SamAccountName -	Defines a name that is backward-compatible with older operating systems

For example, to create a new group named FileServerAdmins, enter the following command in the console, and then press the Enter key:

```powershell
New-ADGroup -Name FileServerAdmins -GroupScope Global
```

## Managing group membership

As previously mentioned, you can use the `*-ADGroupMember` or the `*-ADPrincipalGroupMembership` cmdlets to manage group management in two different ways. The difference between the two is a matter of focusing on an object and modifying the groups to which it belongs, or focusing on the group and modifying the members that belong to it. Additionally, you can choose which set to use based on the decision to pipe a list of members to the command or provide a list of members.

`*-ADGroupMember` cmdlets modify the membership of a group. For example:

- You can add or remove members of a group.
- You can pass a list of groups to these cmdlets.
- You can't pipe a list of members to these cmdlets.

`*-ADPrincipalGroupMembership` cmdlets modify the group membership of an object such as a user. For example:

- You can add a user account as a member to a group.
- You can't provide a list of groups to these cmdlets.
- You can pipe a list of members to these cmdlets.


# Manage computer accounts in PowerShell

The Active Directory module for Windows PowerShell also has cmdlets to create, modify, and delete computer accounts. You can use these cmdlets for individual operations or as part of a script to perform bulk operations. The cmdlets for managing computer objects have the text “computer” in their names.

The following table lists cmdlets that you can use to manage computer accounts.

Cmdlet -	Description
- New-ADComputer	- Creates a new computer account
- Set-ADComputer	- Modifies properties of a computer account
- Get-ADComputer	- Displays properties of a computer account
- Remove-ADComputer	- Deletes a computer account
- Test-ComputerSecureChannel	- Verifies or repairs the trust relationship between a computer and the domain
- Reset-ComputerMachinePassword	- Resets the password for a computer account

## Creating new computer accounts

You can use the New-ADComputer cmdlet to create a new computer account before you join the computer to the domain. You do this so that you can create the computer account in the correct OU before deploying the computer.

The following table lists common parameters for New-ADComputer.

Parameter	- Description
- ‑Name	- Defines the name of a computer account
- ‑Path	- Defines the OU or container where a computer account is created
- ‑Enabled	- Defines whether the computer account is enabled or disabled; by default, a computer account is enabled, and a random password is generated

The following example is a command that you can use to create a computer account:

```powershell
New-ADComputer -Name LON-CL10 -Path "ou=marketing,dc=adatum,dc=com" -Enabled $true
```

## Repairing the trust relationship for a computer account

You can use the Test-ComputerSecureChannel cmdlet with the -Repair parameter to repair a lost trust relationship between a computer and a domain. You must run the cmdlet on the computer with the lost trust relationship.

## Account vs. device management cmdlets

-ADComputer cmdlets are part of the Active Directory module and manage the computer object, not the physical device or its operating system. For example, you can use the Add‑Computer cmdlet to join a computer to a domain. To manage the properties of the physical computer and its operating system, use the -Computer cmdlets.

# Manage organizational units and Active Directory objects in PowerShell

Windows PowerShell provides cmdlets that you can use to create, modify, and delete Active Directory Domain Services (AD DS) Organizational Units (OUs). Like the cmdlets for users, groups, and computers, you can use these cmdlets for individual operations or as part of a script to perform bulk operations. OU management cmdlets have the text “organizationalunit” in the name.

The following table lists cmdlets that you can use to manage OUs.

Cmdlet -	Description
- New-ADOrganizationalUnit	- Creates an OU
- Set-ADOrganizationalUnit	- Modifies properties of an OU
- Get-ADOrganizationalUnit	- Displays properties of an OU
- Remove-ADOrganizationalUnit -	Deletes an OU

## Creating new OUs
You can use the New‑ADOrganizationalUnit cmdlet to create a new OU to represent departments or physical locations within your organization.

The following table lists common parameters for the New‑ADOrganizationalUnit cmdlet.

Parameter	- Description
- ‑Name	- Defines the name of a new OU
- ‑Path	- Defines the location of a new OU
- ‑ProtectedFromAccidentalDeletion -	Prevents anyone from accidentally deleting an OU; the default value is $true

The following example is a command to create a new OU:

```powershell
New-ADOrganizationalUnit -Name Sales -Path "ou=marketing,dc=adatum,dc=com" -ProtectedFromAccidentalDeletion $true
```

## Active Directory object cmdlets

You'll sometimes need to manage Active Directory objects that don't have their own management cmdlets, such as contacts. You might also want to manage multiple object types in a single operation, such as moving users and computers from one OU to another OU. The Active Directory module provides cmdlets that allow you to create, delete, and modify these objects and their properties. Because these cmdlets can manage all objects, they repeat some functionality of the cmdlets for managing users, computers, groups, and OUs.

`*-ADObject` cmdlets sometimes perform faster than cmdlets that are specific to object type. This is because those cmdlets add the cost of filtering the set of applicable objects to their operations. Cmdlets for changing generic Active Directory objects have the text “Object” in the noun part of the name.

The following table lists cmdlets that you can use to manage Active Directory objects.

Cmdlet -	Description
- New-ADObject	- Creates a new Active Directory object
- Set-ADObject	- Modifies properties of an Active Directory object
- Get-ADObject	- Displays properties of an Active Directory object
- Remove-ADObject	- Deletes an Active Directory object
- Rename-ADObject	- Renames an Active Directory object
- Restore-ADObject	- Restores a deleted Active Directory object from the Active Directory Recycle Bin
- Move-ADObject	- Moves an Active Directory object from one container to another container
- Sync-ADObject	- Syncs an Active Directory object between two domain controllers

## Creating a new Active Directory object

You can use the New‑ADObject cmdlet to create objects. When using New-ADObject, you must specify the name and the object type.

The following table lists common parameters for New‑ADObject.

Parameter -	Description
- ‑Name	- Defines the name of an object
- ‑Type	- Defines the LDAP type of an object
- ‑OtherAttributes -	Defines properties of an object that isn't accessible from other parameters
- ‑Path	- Defines the container in which an object is created

The following command creates a new contact object:

```powershell
New-ADObject -Name "AnaBowmancontact" -Type contact
```









