# This PowerShell script retrieves Active Directory users and their last logon dates, filtering for those whose last logon was more than x days ago, and then selects and displays their names along with their last logon dates.

Get-ADUser -Filter * -Properties LastLogonDate | Where-Object { $_.LastLogonDate -lt (Get-Date).AddDays(-7) } | Select-Object Name, LastLogonDate
