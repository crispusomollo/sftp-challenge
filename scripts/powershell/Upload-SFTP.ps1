param(
    [Parameter(Mandatory=$true)][string]$LocalFile,
    [Parameter(Mandatory=$true)][string]$RemotePath,
    [string]$Host = "your.server.com",
    [string]$User = "username",
    [string]$Password = $null
)

# This script relies on WinSCP CLI being installed and in PATH (winscp.com)
$sessionUrl = if ($Password) { "sftp://$User:$Password@$Host/" } else { "sftp://$User@$Host/" }

& winscp.com /command `
    "open $sessionUrl" `
    "put `"$LocalFile`" `"$RemotePath`"" `
    "exit"
Write-Output "Uploaded $LocalFile to $Host:$RemotePath"
