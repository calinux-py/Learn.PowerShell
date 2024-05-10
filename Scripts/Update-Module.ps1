Install-Module -Name PowerShellGet -Repository PSGallery -Force
Update-Module -Name PowerShellGet

Import-Module PowerShellGet

$apiKey = 'API-KEY'  
Publish-Module -Path "C:\PATH\TO\MODULE\FOLDER" -NuGetApiKey $apiKey
