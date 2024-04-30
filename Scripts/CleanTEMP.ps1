# used to sanitize a machine after exposure to malware/adware

Get-ChildItem -Path $env:TEMP -Recurse -Force | Remove-Item -Recurse -Force -Confirm:$false -ErrorAction SilentlyContinue
Clear-RecycleBin -Force -Confirm:$false -ErrorAction SilentlyContinue
