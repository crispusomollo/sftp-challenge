param(
    [string]$LocalPath = "C:\local",
    [string]$RemotePath = "/remote",
    [string]$Host = "your.server.com",
    [string]$User = "username",
    [string]$Password = $null
)

$sessionUrl = if ($Password) { "sftp://$User:$Password@$Host/" } else { "sftp://$User@$Host/" }

& winscp.com /command `
    "open $sessionUrl" `
    "synchronize local `"$LocalPath`" `"$RemotePath`"" `
    "exit"
Write-Output "Synchronized $LocalPath <-> $Host:$RemotePath"
