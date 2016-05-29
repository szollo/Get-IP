# Get-IP

This is a small snippet that I load on my profile.ps1 file as a function, which translates a hostname into an IP address, and automatically copies it into the clipboard.

It uses the native Windows command `ping` rather than the `Test-Connection` PowerShell equivalent, in order to be portable on older machines.

### Usage:

`Get-IP www.google.com`

Running this command will copy the IP address of www.google.com into the clipboard