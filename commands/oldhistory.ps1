# Gets a a list of commands from the history file. (Includes commands from other sessions.)
function oldhistory {
    <#
    .SYNOPSIS
    Get a list of commands from the history file. If no limit is specified, 50 commands are returned.

    .DESCRIPTION
    Get a list of commands from the history file. If no limit is specified, 50 commands are returned.

    .PARAMETER Limit
    The number of commands to return. If not specified, 50 commands are returned.

    .OUTPUTS
    A list of commands from the history file.

    .EXAMPLE
    PS>oldhistory 10
    PS>oldhistory -Limit 10
    (Gets the last 10 commands)

    .EXAMPLE
    PS>oldhistory -1
    (Gets all commands)

    #>
    param(
        [int]$Limit = 50
    )
    
    $commands = Get-Content "$env:USERPROFILE\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt"

    if ($Limit -gt 0) {
        $commands | Select-Object -Last $Limit
    }
    else {
        $commands
    }
}