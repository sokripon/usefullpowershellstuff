# This is a personal function, which means you need to change the phone ip and you also need nmap
function Get-Phone-IP {
    $ipAddress = "192.168.0.170"
    return $ipAddress
}

# Gets the openport of an wirelessdebugged android device
function Get-Open-Ports-Phone {
    param (
        [Parameter (Mandatory = $false)] [string] $ipAddress
    )
    if ($ipAddress -eq "") {
        $ipAddress = Get-Phone-IP
        
    }
    $nmapResult = nmap -p 1-65535 -T4 $ipAddress | Select-String 'open.*'
    $openPorts = $nmapResult | ForEach-Object { $_.ToString().Split('/')[0] }
    return $openPorts
}

function Get-DefaultGateway {
    $ipconfig = ipconfig | Select-String "Default Gateway"
    $gateway = ($ipconfig -split ": ")[1].Trim()
    return $gateway
}



function Connect-ADB {
    $ipAddress = Get-Phone-IP
    Write-Host "Phone IP is ${ipAddress}" -ForegroundColor Yellow
    $ports = Get-Open-Ports-Phone
    Write-Host "Found open ports: ${ports}" -ForegroundColor Yellow
    # Write a loop to check if the adb connection can be etablisched
    foreach ($port in $ports) {
        Write-Host "Trying to connect to ${ipAddress}:${port}" -ForegroundColor Yellow
        $adbResult = adb connect ${ipAddress}:${port}
        if ($adbResult -match "connected") {
            Write-Host "Connected to ${ipAddress}:${port}" -ForegroundColor Green
            Write-Host $adbResult
            return
        }
        else {
            Write-Host "Could not connect to ${ipAddress}:${port}" -ForegroundColor Red
            Write-Host "Disconnecting from ${ipAddress}:${port}" -ForegroundColor Yellow
            adb disconnect ${ipAddress}:${port}
        }
    }

}