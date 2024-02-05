Get started with Windows PowerShell Notes from learn.microsoft.com

LET’S BEGIN!

# Command-line Shell
Windows PowerShell superseded the Windows command-line interface (cmd.exe) and the limited functionality of its batch file scripting language. PowerShell accepts and returns .NET objects and includes:
-	A command-line history.
-	Tab completion and prediction.
-	Support for command and parameter aliases.
-	Chaining commands that use the Pipeline feature.
-	A robot in-console help system.

Initially, Windows PowerShell was a platform built on the .NET Framework and only worked on Windows operating systems. However, with its recent releases, PowerShell uses the .NET Core and can run on Windows, macOS, and Linux platforms. Due to their multi-platform support, these recent releases are referred to as PowerShell (rather than Windows PowerShell).

# A Scripting Language
**Commands** provide PowerShell’s main functionality. There are many varieties of command, including cmdlets, functions, filters, scripts, applications, configurations, and workflows. Commands are building blocks that you piece together by using the Windows PowerShell scripting language. Alternatively, you can run commands directly within the PowerShell console to complete a single task. 

**Cmdlets** use a Verb-Noun naming convention. For example, you can use the `Get-Command` cmdlet to list all cmdlets and functions that are registered in the command shell. The verb identifies the action for the cmdlet to perform, and the noun identifies the resource on which the cmdlet will perform its action.

# Configuration Management Framework
PowerShell incorporates the PowerShell Desired State Configuration (DSC) management framework. This framework enables you to manage enterprise infrastructure with code to help:
-	Using declarative configurations and repeatable scripts for repeatable deployments.
-	Enforcing configurations settings and identifying when configuration drift takes place from standard requirements.
-	Deploying configuration settings using push or pull models.

# Windows PowerShell Versions:
As you learn about PowerShell, it’s important to understand the various versions that you might encounter, depending upon your operating system (OS) type and edition. There are two main PowerShell platforms:
-	Windows PowerShell
-	PowerShell (originally referred to as PowerShell Core)

# Windows PowerShell
Windows PowerShell is available exclusively for the Windows OS. Windows PowerShell is an OS component, so it receives the same lifecycle support and licensing agreements as its parent OS.

# PowerShell
PowerShell is shipped, installed, and configured separately from Windows PowerShell. First released as PowerShell Core 6.0 in 2018, it was the first version that offered multi-platform support, extending its availability to macOS and Linux operating systems. 

# Identify Factors to Install and Use Windows PowerShell
As you use PowerShell to manage and automate management tasks, you take into account several considerations, including:
-	Installing and using PowerShell side-by-side with Windows PowerShell.
-	Running PowerShell using administrative credentials.
-	Identifying and modifying the execution policy in PowerShell.

# Installing and Using PowerShell Side-by-Side with Windows PowerShell
If you install the latest version of PowerShell, you end up with multiple PowerShell versions installed on your system. For example, PowerShell 7 is designed to coexist with Windows PowerShell 5.1 and will install to a new directory and enable side-by-side execution with Windows PowerShell.

Installing the latest version of PowerShell results in the following when compared to Windows PowerShell:
-	Separate installation path and executable name.
-	Separate PSModulePath.
-	Separate profiles for each version.
-	Separate event logs.

To determine the current version you’re using, enter `$PSVersionTable` in the PowerShell console.

# Running PowerShell using Administrative Credentials
On a 64-bit operating system, the PowerShell host applications are available in both 64-bit (x64) and 32-bit (x86) versions. When working with Windows PowerShell, you’ll use the 64-bit version that displays as **Windows PowerShell** or **Windows PowerShell ISE** in the Start menu. The 32-bit versions provide compatibility with locally installed 32-bit shell extensions. They display as **Windows PowerShell (x86)** or **Windows PowerShell ISE (x86)** in the Start menu.

On 32-bit operating systems, PowerShell’s host applications are available only in 32-bit versions. When working with Windows PowerShell, you’ll notice that the icons and window title bars don’t have the (x86) designation. 

If you intend to use PowerShell to perform administrative tasks on computers that have UAC enabled, you might have to take an extra step to run PowerShell cmdlets with full administrative credentials.

# Identifying and Modifying the Execution Policy in PowerShell
The execution policy in PowerShell is meant to minimize the possibility of a user unintentionally running PowerShell scripts. It controls the conditions under which PowerShell loads configuration files and scripts. This helps to prevent the execution of malicious scripts. 

To identify the effective execution policy for the current PowerShell session, use the following cmdlet:
`Get-ExecutionPolicy`

You can configure the following policy settings:
-	`AllSigned`: Limits script execution on all signed scripts. This setting requires that all scripts are signed by a trusted publisher, including scripts that you write on the local computer.
-	`Default`: Sets the default execution policy, which is **Restricted** for Windows clients and **RemoteSigned** for Windows servers.
-	`RemoteSigned`: This is the default execution policy for Windows server computers. Scripts can run, but the policy requires a digital signature from a trusted publisher on scripts and configuration files that have been downloaded from the internet. This setting doesn’t require digital signatures on scripts that are written on the local computer.
-	`Restricted`: This is the default execution policy for Windows client computers. It permits running individual commands, but it doesn’t allow scripts.
-	`Unrestricted`: This is the default execution policy for non-Windows computers, which you can’t change. It allows unsigned scripts to run. This policy warns the user before running scripts and configuration files that aren’t from the local intranet zone.
-	`Undefined`: Indicates that there isn’t an execution policy set in the current scope. If the execution policy in all scopes is **Undefined**, the effective execution policy is **Restricted** for Windows clients and **RemoteSigned** for Windows Server.

To change the execution policy in PowerShell, use the following command:
`Set-ExecutionPolicy -ExecutionPolicy <PolicyName>`

# Configure the Windows PowerShell Console

Select PowerShell icon in the console window. From the shortcut menu, select Properties, and then select the Font tab to change size, font style, color, etc.

# Copying and Pasting
The console host supports copying and pasting to and from the clipboard. It also supports using standard keyboard shortcuts, though they might not always work. This could be because of other applications that are running on the local computer and have changed settings for keyboard shortcuts. To enable this functionality, make sure that QuickEdit Mode is enabled in the console’s Properties dialog box. In the Edit Options section of the Options tab, enable keyboard shortcuts for copy and paste by selecting Enable Ctrl key shortcuts. 

# Use Visual Studio Code with PowerShell
Visual Studio Code (VS Code) is a Microsoft script editor that provides a rich interactive script editing experience. This experience is similar to the PowerShell Integrated Scripting Environment (ISE) when you use it with the PowerShell extension. 

## ISE Mode in Visual Studio Code
After you install VS Code and the PowerShell extension, you can replicate the ISE experience by turning on ISE Mode.

Enabling ISE Mode makes several notable changes to the way VS Code works, including:
-	Mapping keyboard functions in VS Code so they match the ones used in the ISE.
-	Allowing you to replicate the VS Code user interface to resemble the ISE.
-	Enabling ISE-like tab completion.
-	Providing several ISE themes to make the VS Code editor look like the ISE.

# Knowledge Check
You want to start PowerShell 7 from the command line. Which command will you run?
-	Powershell.exe
-	pwsh.exe
-	powersh.exe

Answer: `pwsh.exe`

Explanation: This is the executable name for PowerShell Core versions 6 and above, including PowerShell 7. The traditional powershell.exe is associated with Windows PowerShell, which is based on the .NET Framework, as opposed to the newer PowerShell versions based on .NET Core or .NET 5/6+.

Why might you decide to use the ISE versus the console host?
-	Supports richer editing capabilities and can display a wider range of fonts.
-	Essential for running even a few commands.
-	Both of the above.

Answer: `Supports richer editing capabilities and cand display a wider range of fonts.`

Explanation: The ISE supports richer editing capabilities and can display a wider range of fonts. It's also compatible with double-byte character sets, making it compatible with a wider variety of written languages. However, if you're simply running a few commands, the console is sufficient. 


# Summary
In this module, you were introduced to Windows PowerShell and its functionalities. The following are the key takeaways:

PowerShell is an automation solution that consists of a command-line shell, a scripting language, and a configuration-management framework.
There are two main PowerShell platforms, Windows PowerShell and PowerShell (originally referred to as PowerShell Core), based on the operating system and edition.
Users primarily interact with Windows PowerShell through an application that embeds, or hosts, the PowerShell's engine. Two primary hosts that Microsoft provides are the Windows PowerShell console and the Windows PowerShell Integrated Scripting Environment (ISE).
The Windows PowerShell console host can be customized by specifying custom preferences like font size and type, the size and position of the console window and the screen buffer, the color scheme, and keyboard shortcuts.
The Windows PowerShell ISE allows for customizing of panes and views. It is a graphical environment that provides a script editor, a debugger, an interactive console, and several auxiliary tools.
Visual Studio Code (VS Code) is a Microsoft script editor that provides a rich and interactive script editing experience.
