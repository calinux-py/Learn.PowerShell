Sleep 10

do {
    # find and start wallpaper64.exe
    Get-ChildItem -Recurse -Path C:\ -Filter "wallpaper64.exe" | Select-Object -First 1 | ForEach-Object { Start-Process $_.FullName }

    # sleep 5 seconds
    Start-Sleep -Seconds 5

    # see if wallpaper64.exe is running
    $process = Get-Process wallpaper64 -ErrorAction SilentlyContinue

    # if found, exit the script
    if ($process) {
        exit
    }

    # if not found, the loop will continue
} while ($true)
