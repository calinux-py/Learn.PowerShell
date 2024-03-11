# Retrieves the username, enabled status, last logon date, and OUs & DCs of all Active Directory users.

Get-ADUser -Filter * -Properties LastLogonDate | Select-Object SamAccountName, Enabled, LastLogonDate, DistinguishedName
