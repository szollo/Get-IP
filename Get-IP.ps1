<#
.SYNOPSIS
   Translates a hostname into an IP address, and copies it into the clipboard

.EXAMPLE
   Get-IP www.google.com

   Running this command will copy the IP address of www.google.com into the clipboard
#>
Function Get-IP {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory=$true)]
        [string] $Hostname
    )
    $regex = '\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b'
    Add-Type -AssemblyName PresentationCore
    $clipText = ping $Hostname -n 1 | Select-String -Pattern $regex |
        Select -First 1 | % { $_.Matches } | % { $_.Value } | Out-String -Stream
    [Windows.Clipboard]::SetText($clipText)
}#Function