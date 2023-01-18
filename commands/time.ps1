# Inspired by https://superuser.com/questions/228056/windows-equivalent-to-unix-time-command
# This function will execute a command and measure the time it takes to complete
# The function returns the execution time in the form of a timespan object
function time {
    <#
    .SYNOPSIS
    This function will execute a command and measure the time it takes to complete
    The function returns the execution time in the form of a timespan object

    .DESCRIPTION
    This function will execute a command and measure the time it takes to complete
    The function returns the execution time in the form of a timespan object

    .PARAMETER Command
    The command to be executed

    .PARAMETER Quiet
    Suppress output to console

    .PARAMETER Echo
    Echo command to console

    .EXAMPLE
    PS>time {sleep 1 && echo 1 && sleep 1 && echo 2}
    1
    2

    Days              : 0
    Hours             : 0
    Minutes           : 0
    Seconds           : 2
    Milliseconds      : 21
    Ticks             : 20216106
    TotalDays         : 2.33982708333333E-05
    TotalHours        : 0.0005615585
    TotalMinutes      : 0.03369351
    TotalSeconds      : 2.0216106
    TotalMilliseconds : 2021.6106

    .EXAMPLE
    PS>time -Command {sleep 1 && echo 1 && sleep 1 && echo 2} -Quiet

    Days              : 0
    Hours             : 0
    Minutes           : 0
    Seconds           : 2
    Milliseconds      : 31
    Ticks             : 20316792
    TotalDays         : 2.35148055555556E-05
    TotalHours        : 0.000564355333333333
    TotalMinutes      : 0.03386132
    TotalSeconds      : 2.0316792
    TotalMilliseconds : 2031.6792

    .EXAMPLE
    PS>time {sleep 1 && echo 1 && sleep 1 && echo 2} -Echo
    Executing: sleep 1 && echo 1 && sleep 1 && echo 2
    1
    2

    Days              : 0
    Hours             : 0
    Minutes           : 0
    Seconds           : 2
    Milliseconds      : 24
    Ticks             : 20244229
    TotalDays         : 2.34308206018519E-05
    TotalHours        : 0.000562339694444444
    TotalMinutes      : 0.0337403816666667
    TotalSeconds      : 2.0244229
    TotalMilliseconds : 2024.4229

    .EXAMPLE
    PS>time "sleep 1 && echo 1" -Quiet -Echo
    Executing: sleep 1 && echo 1

    Days              : 0
    Hours             : 0
    Minutes           : 0
    Seconds           : 1
    Milliseconds      : 15
    Ticks             : 10154505
    TotalDays         : 1.17528993055556E-05
    TotalHours        : 0.000282069583333333
    TotalMinutes      : 0.016924175
    TotalSeconds      : 1.0154505
    TotalMilliseconds : 1015.4505
    
    .LINK 
    Source: https://github.com/sokripon/usefullpowershellstuff
    #>
    param(
        [string]$Command, # Command to be executed
        [switch]$Quiet, # Suppress output to console
        [switch]$Echo # Echo command to console
    )
    if ($Echo) {
        Write-Host "Executing: $Command" -ForegroundColor Yellow
    }
    if ($Quiet) {
        "$args"; Measure-Command { Invoke-Expression $Command 2>&1 | out-null }
    }
    else {
        "$args"; Measure-Command { Invoke-Expression $Command 2>&1 | out-default }
    }
}