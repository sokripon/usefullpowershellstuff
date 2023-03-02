# Returns a list of files in the path that match the search string
function Search-In-Path {
    <#
    .SYNOPSIS
    Returns a list of files in the path that match the search string

    .DESCRIPTION
    Returns a list of files in the path that match the search string

    .PARAMETER searchString
    The string to search for

    .OUTPUTS
    A list of files in the path that match the search string

    .EXAMPLE
    PS>Search-In-Path "ffmpeg.exe"
    PS>Search-In-Path "*.exe"

    #>
    [OutputType([System.IO.FileInfo])]
    param (
        [Parameter (Mandatory = $true)] [string] $searchString
    )
    $path = $env:Path
    $path.Split(';') | ForEach-Object {
        if (Test-Path $_) {
            $files = Get-ChildItem $_ -Filter $searchString
            if ($files) {
                $files
            }
        }
    }
}