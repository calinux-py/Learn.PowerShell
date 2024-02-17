# Automate management tasks using the Group Policy management cmdlets

You can use Windows PowerShell to automate the management of most tasks involving Group Policy Objects (GPOs), including creating, deleting, backing up, reporting, and importing GPOs. You can also associate GPOs with Active Directory Domain Services (AD DS) OUs, including setting GPO inheritance and permissions. Group Policy management cmdlets require Remote Server Administration Tools (RSAT) installed.

Group Policy management cmdlets are part of the GroupPolicy module for Windows PowerShell. Cmdlet names include the prefix “GP” in the names, and most have “GPO” as the noun.

| Cmdlet           | Description                                                     |
|------------------|-----------------------------------------------------------------|
| New-GPO          | Creates a new GPO                                               |
| Get-GPO          | Retrieves a GPO                                                  |
| Set-GPO          | Modifies properties of a GPO                                     |
| Remove-GPO       | Deletes a GPO                                                    |
| Rename-GPO       | Renames a GPO                                                    |
| Backup-GPO       | Backs up one or more GPOs in a domain                            |
| Copy-GPO         | Copies a GPO from one domain to another domain                    |
| Restore-GPO     | Restores a GPO from backup files                                 |
| New-GPLink       | Links a GPO to an AD DS container                                |
| Import-GPO       | Imports GPO settings from a backed-up GPO                         |
| Set-GPRegistryValue | Configures one or more registry-based policy settings in a GPO |

## Creating a new GPO

New-GPO requires only the -Name parameter, which must be unique in the domain in which you create the GPO. By default, the GPO is created in the domain of the user who is running the command. New-GPO also doesn't link the created GPO to an AD DS container. To link a GPO to a container, use the New-GPLink cmdlet.

The following command creates a new GPO from a starter GPO:

```powershell
New-GPO -Name "IT Team GPO" -StarterGPOName "IT Starter GPO"
```
The following command links the new GPO to an AD DS organizational unit:

```powershell
New-GPLink -Name "IT Team GPO" -Target "OU=IT,DC=adatum,DC=com"
```

# Manage server roles and services using PowerShell cmdlets

The ServerManager module for PowerShell contains cmdlets for managing server features, roles, and services. These cmdlets are the equivalent of the Server Manager user interface. The Server Manager cmdlet names include the noun “WindowsFeature.”

The following table lists the server management cmdlets.

| Cmdlet                   | Description                                                                                         |
|--------------------------|-----------------------------------------------------------------------------------------------------|
| Get-WindowsFeature       | Obtains and displays information about Windows Server roles, services, and features that are installed or are available for installation |
| Install-WindowsFeature   | Installs one or more roles, services, or features                                                    |
| Uninstall-WindowsFeature | Uninstalls one or more roles, services, or features                                                   |

The following command installs network load balancing on the local server:

```powershell
Install-WindowsFeature "nlb"
```

# Manage Hyper-V Virtual Machines using PowerShell cmdlets

PowerShell offers more than 200 cmdlets for managing Hyper-V Virtual machines (VMs), virtual hard disks, and other components of a Hyper-V environment. Hyper-V cmdlets are available in the Hyper-V module for PowerShell.

The Hyper-V cmdlets are available when you install the Hyper-V Management tools feature on a Windows client operating system, or the Hyper-V Module for Windows PowerShell feature on Windows Server.

Hyper-V cmdlets use one of three prefixes:

- “VM” for virtual machine cmdlets
- “VHD” for virtual hard disk cmdlets
- “VFD” for virtual floppy disk cmdlets

The following table lists common cmdlets for managing Hyper-V VMs.

| Cmdlet          | Description                            |
|-----------------|----------------------------------------|
| Get-VM          | Gets properties of a VM                |
| Set-VM          | Sets properties of a VM                |
| New-VM          | Creates a new VM                       |
| Start-VM        | Starts a VM                            |
| Stop-VM         | Stops a VM                             |
| Restart-VM      | Restarts a VM                          |
| Suspend-VM      | Pauses a VM                            |
| Resume-VM       | Resumes a paused VM                    |
| Import-VM       | Imports a VM from a file               |
| Export-VM       | Exports a VM to a file                 |
| Checkpoint-VM   | Creates a checkpoint of a VM           |

# Manage Internet Information Services using PowerShell cmdlets

The Web server role includes Internet Information Services (IIS), which is commonly used to manage websites and web-based applications. IIS supports PowerShell cmdlets to allow you to configure and manage application pools, websites, web applications, and virtual directories.

IIS management cmdlets are available in the IISAdministration module for PowerShell and have the prefix “IIS” in the noun part of their names. Sites use the noun “IISSite”.

To manage web-based applications, you can use the WebAdministration module for PowerShell, which includes cmdlets for managing web applications. These cmdlets use the noun "WebApplication". Cmdlets for managing application pools use the noun “WebAppPool”.

The following table lists common IIS and web application administration cmdlets.

| Cmdlet                | Description                                                      |
|-----------------------|------------------------------------------------------------------|
| New-IISSite           | Creates a new IIS website                                        |
| Get-IISSite           | Gets properties and configuration information about an IIS website |
| Start-IISSite         | Starts an existing IIS website on the IIS server                 |
| Stop-IISSite          | Stops an IIS website                                             |
| New-WebApplication    | Creates a new web application                                    |
| Remove-WebApplication | Deletes a web application                                        |
| New-WebAppPool        | Creates a new web application pool                               |
| Restart-WebAppPool    | Restarts a web application pool                                  |

























