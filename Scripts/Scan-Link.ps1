function Lets-HideWereARobot {
    $userAgents = @(
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.3 Safari/605.1.15',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:89.0) Gecko/20100101 Firefox/89.0',
        'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36',
        'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:85.0) Gecko/20100101 Firefox/85.0'
    )
    $headers = @{
        'User-Agent' = Get-Random -InputObject $userAgents
        'Accept' = 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8'
        'Accept-Language' = Get-Random -InputObject @('en-US,en;q=0.5', 'en-GB,en;q=0.5', 'fr-FR,fr;q=0.5', 'de-DE,de;q=0.5')
        'Connection' = 'keep-alive'
        'Upgrade-Insecure-Requests' = '1'
        'DNT' = '1'
    }
    return $headers
}

function ScanDat {
    param (
        [string]$address
    )
    

    try {
        if (-not $address) {
            return "Please provide a link."
        }
        else {
            $address = $address.Replace(":", "%3A").Replace("/", "%2F")
            $url = "https://www.ipqualityscore.com/threat-feeds/malicious-url-scanner/$address"
        }

        $headers = Lets-HideWereARobot
        $seconds = 3
        $progress = @{
            Activity = "Scan-Link"
            Status   = "Scanning URL..."
            Seconds  = $seconds
        }

        1..$seconds | ForEach-Object {
            Write-Progress @progress -PercentComplete (($_ / $seconds) * 100)
            Start-Sleep -Seconds 1
            $progress.Seconds--
        }
        Write-Progress @progress -Completed

        $response = Invoke-WebRequest -Uri $url -Headers $headers
        $responseContent = $response.Content
        $responseContent = $response.Content
        if ($responseContent -like 'Malicious URL Scanner*') {
            return "Invalid URL. Please ensure the URL has a prefix."
        }


        $text = ($responseContent -split "<(script|style).*?>|<.*?>") -join ' ' | ForEach-Object { $_.Trim() }

        $modifiedText = $text -replace "No Malware Issues", "[ - ] No malware issues" `
            -replace "\s+", " " `
            -replace "Hosting Malware", "|| [ + ] Hosting Malware" `
            -replace "Phishing Phishing Link", "|| [ + ] Phishing Link" `
            -replace "Safe Overall URL risk classification.", "Overall Risk:" `
            -replace "Suspicious Indicates reputation issues and potentially malicious activity.", "|| Suspiciousness: " `
            -replace "Malware Indicates if this domain has recently hosted malware, viruses, or C2 activity.", "" `
            -replace "Domain Domain name of the final URL after all redirections.", "|| Domain: " `
            -replace "IP Address The corresponding IP address for the URL's web server.", "|| IP Address: " `
            -replace "Phishing No Phishing Issues", "|| [ - ] No phishing issues" `
            -replace "Risk Score Overall ", "" `
            -replace "threat score from", "|| Risk score" `
            -replace "Domain Trust Rating Overall risk rating of the domain. Login to View Domain Age", "" `
            -replace "Parked Domain", "||" `
            -replace "Domain Trust Rating Overall risk rating of the domain. Login to View Website Technologies Web technologies found on this URL.", "" `
            -replace "Spamming Domain Is this domain recently sending SPAM", "|| Is this domain recently sending SPAM" `
            -replace "Estimated age of the domain.", "|| Estimated age of the domain: " `
            -replace "HTTP Status Code Status code of the HTTP request. 200 is most common.", "|| Status Code: " `
            -replace "Page Size Page size of URL's content in bytes.", "|| Page Size: " `
            -replace "Content Type MIME Type of the URL's content.", "|| Type of the URL's content: " `
            -replace "Web Server Web server of URL's content.", "|| Web server of URL's content: " `
            -replace "Hosted Content Identifies sites hosted on free services.", "|| Hosted content using free services: " `
            -replace "SPF/DMARC Record Indicates enhanced DNS mail security settings.", "|| SPF/DMARC records: " `
            -replace "DNS NS Records", "|| DNS NS Records:" `
            -replace "DNS A Records", "|| DNS A Records:" `
            -replace "amp;", "" `
            -replace "&mdash;", "-" `
            -replace "DNS MX Records", "|| DNS MX Records:" 
            

        $printStartIndex = $modifiedText.IndexOf("Get a Free API Key URL Scanning Details for")
        if ($printStartIndex -ne -1) {
            $modifiedText = $modifiedText.Substring($printStartIndex + "Get a Free API Key URL Scanning Details for ".Length)
        }

        $endIndex = $modifiedText.IndexOf("Create a free account to access more")
        if ($endIndex -ne -1) {
            $modifiedText = $modifiedText.Substring(0, $endIndex)
        }

        if ($modifiedText -match "Overall Risk: Warning - NOT SAFE") {
            Write-Host "`n`nOverall Risk: Warning - NOT SAFE" -ForegroundColor Red
            $modifiedText = $modifiedText -replace "Overall Risk: Warning - NOT SAFE", ""
        }
        
        if ($modifiedText -match "Overall Risk: Clean URL - SAFE") {
            Write-Host "`n`nOverall Risk: Clean URL - SAFE" -ForegroundColor Green
            $modifiedText = $modifiedText -replace "Overall Risk: Clean URL - SAFE", ""
        }
        if ($modifiedText -match "Malicious URL Scanner") {
            return "Invalid URL. Please make sure the URL has the full prefix."
        }


        return $modifiedText
        
    }
    catch {
        if ($_.Exception.Response.StatusCode.value__ -eq 503) {
            return "Invalid link. Please enter a valid link."
        }
        else {
            return "An error occurred: $_"
        }
    }
}

function Scan-Link {
    param (
        [Parameter(Mandatory=$true)]
        [string]$u
    )
    $result = ScanDat -address $u
    
    Write-Output $result
}

