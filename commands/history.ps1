# Gets a a list of commands from the history file. (Includes commands from other sessions.)
function Show-Old-Commands {
    [alias("history")]
    [OutputType([string[]])]
    param(
        [int]$Limit = 50,
        [switch]$StartFromOldest
    )
    <#
    .SYNOPSIS
    Get a list of commands from the history file in the order they were executed. If no limit is specified, 50 commands are returned.

    .DESCRIPTION
    Get a list of commands from the history file in the order they were executed. If no limit is specified, 50 commands are returned.

    .PARAMETER Limit
    The number of commands to return. If not specified, 50 commands are returned. If -1 is specified, all commands are returned.

    .PARAMETER FromOld
    If specified, the input will be reversed. (Last command will be first, first command will be last.)

    .OUTPUTS
    A list of commands from the history file.

    .EXAMPLE
    PS>Show-Old-Commands 10
    PS>Show-Old-Commands -Limit 10
    PS>history 10
    (Gets the 10 newest commands)

    .EXAMPLE
    PS>Show-Old-Commands -1
    PS>history -1
    (Gets all commands)

    .EXAMPLE
    PS>Show-Old-Commands -Limit 10 -StartFromOldest
    (Shows the 10 oldest commands)
    #>
    
    $originalCommands = Get-Content -Path "$env:USERPROFILE\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt"
    $commands = $originalCommands.Clone()
    
    if ($Limit -eq -1) {
        $commands = $commands
    }
    elseif ($StartFromOldest) {
        $commands = $commands | Select-Object -First $Limit
    }
    else {
        $commands = $commands | Select-Object -Last $Limit
    }

    return $commands
}