function Get-ActiveConnections {
    [CmdletBinding()]
    param (
        [string]$outputit = "$env:USERPROFILE\Desktop\ActiveNetworkConnections.html"
    )

    $port2maplol = @{
        21 = 'FTP'
        22 = 'SSH'
        23 = 'Telnet'
        25 = 'SMTP'
        53 = 'DNS'
        80 = 'HTTP'
        110 = 'POP3'
        143 = 'IMAP'
        443 = 'HTTPS'
        3389 = 'RDP'
        20 = 'FTP Data'
        69 = 'TFTP'
        79 = 'Finger'
        88 = 'Kerberos'
        109 = 'POP2'
        115 = 'SFTP'
        118 = 'SQL Services'
        123 = 'NTP'
        135 = 'MS RPC'
        137 = 'NetBIOS Name Service'
        138 = 'NetBIOS Datagram Service'
        139 = 'NetBIOS Session Service'
        161 = 'SNMP'
        162 = 'SNMP Trap'
        179 = 'BGP'
        194 = 'IRC'
        201 = 'AppleTalk Routing'
        209 = 'QMTP'
        213 = 'IPX'
        220 = 'IMAP3'
        389 = 'LDAP'
        427 = 'SLP'
        465 = 'SMTPS'
        500 = 'IKE'
        514 = 'Syslog'
        515 = 'LPD'
        530 = 'RPC'
        546 = 'DHCPv6 Client'
        547 = 'DHCPv6 Server'
        554 = 'RTSP'
        587 = 'SMTP Submission'
        631 = 'IPP'
        636 = 'LDAPS'
        993 = 'IMAPS'
        995 = 'POP3S'
        1025 = 'Microsoft RPC'
        1080 = 'SOCKS Proxy'
        1194 = 'OpenVPN'
        1433 = 'MS SQL Server'
        1521 = 'Oracle DB'
        1645 = 'RADIUS Authentication'
        1646 = 'RADIUS Accounting'
        1701 = 'L2TP'
        1723 = 'PPTP'
        1812 = 'RADIUS'
        1813 = 'RADIUS Accounting'
        2049 = 'NFS'
        2082 = 'cPanel'
        2083 = 'cPanel SSL'
        2086 = 'WHM'
        2087 = 'WHM SSL'
        2095 = 'cPanel Webmail'
        2096 = 'cPanel Webmail SSL'
        2302 = 'Halo'
        3306 = 'MySQL'
        3386 = 'GTP'
        3387 = 'Back Orifice'
        3396 = 'Printer Agent'
        3690 = 'Subversion'
        4000 = 'Remote Anything'
        5060 = 'SIP'
        5061 = 'SIP-TLS'
        5222 = 'XMPP/Jabber Client Connection'
        5223 = 'XMPP/Jabber Client Connection over SSL'
        5432 = 'PostgreSQL'
        5672 = 'AMQP'
        5900 = 'VNC'
        5984 = 'CouchDB'
        6000 = 'X11'
        6060 = 'Jenkins'
        6379 = 'Redis'
        6667 = 'IRC'
        7000 = 'Cassandra'
        8000 = 'HTTP Alternate'
        8008 = 'HTTP Alternate'
        8080 = 'HTTP Proxy'
        8081 = 'HTTP Alternate'
        8443 = 'HTTPS Alternate'
        8888 = 'HTTP Alternate / NewsEDGE'
        9000 = 'PHP-FPM'
        9001 = 'Tor network'
        9042 = 'Cassandra'
        9092 = 'Kafka'
        9200 = 'Elasticsearch'
        9300 = 'Elasticsearch'
        10000 = 'Webmin'
        11211 = 'Memcached'
        27017 = 'MongoDB'
        27018 = 'MongoDB Shard'
        27019 = 'MongoDB Config server'
        28017 = 'MongoDB Web Status'
        32400 = 'Plex Media Server'
        50000 = 'IBM DB2'
        50070 = 'HDFS'
    }

    $serviceportorwhatever = {
        param (
            [int]$Port
        )
        if ($port2maplol.ContainsKey($Port)) {
            return "$Port/$($port2maplol[$Port])"
        } else {
            return $Port
        }
    }

    $connections = Get-NetTCPConnection | Where-Object { $_.State -eq 'Established' } | ForEach-Object {
        try {
            $process = Get-Process -Id $_.OwningProcess -ErrorAction Stop
        }
        catch {
            $process = $null
        }

        [PSCustomObject]@{
            LocalAddress  = $_.LocalAddress
            LocalPort     = & $serviceportorwhatever -Port $_.LocalPort
            RemoteAddress = $_.RemoteAddress
            RemotePort    = & $serviceportorwhatever -Port $_.RemotePort
            State         = $_.State
            ProcessName   = $process.Name
            Protocol      = 'TCP'
        }
    }

    $htmlit = $connections | ConvertTo-Html -Title "Network Connections" -PreContent "<h2>Active Network Connections</h2>" -Property LocalAddress, LocalPort, RemoteAddress, RemotePort, State, ProcessName, Protocol -Body "<style>body{font-family: Arial;} table {border-collapse: collapse; width: 100%;} th, td {text-align: left; padding: 8px;} tr:nth-child(even) {background-color: #f2f2f2;} th {background-color: #4CAF50; color: white;}</style>"

    $htmlit | Out-File -FilePath $outputit
    Write-Host "HTML report has been generated at: $outputit"
    Start-Process $outputit
}

Get-ActiveConnections
