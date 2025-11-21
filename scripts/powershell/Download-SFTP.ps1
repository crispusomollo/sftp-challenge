param(
    [Parameter(Mandatory=$true)][string]$RemoteFile,
    [Parameter(Mandatory=$true)][string]$LocalPath,
    [string]$Host = "your.server.com",
    [string]$User = "username",
    [string]$Password = $null
)

$sessionUrl = if ($Password) { "sftp://$User:$Password@$Host/" } else { "sftp://$User@$Host/" }

& winscp.com /command `
    "open $sessionUrl" `
    "get `"$RemoteFile`" `"$LocalPath`"" `
    "exit"
Write-Output "Downloaded $RemoteFile to $LocalPath"
