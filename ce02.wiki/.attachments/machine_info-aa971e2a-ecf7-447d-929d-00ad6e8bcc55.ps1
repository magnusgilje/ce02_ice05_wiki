Set-StrictMode -Version latest

$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
$IsAdmin = $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if ($IsAdmin)
{
    $BitLockerStatus = ((Get-BitLockerVolume -MountPoint "C:").ProtectionStatus -eq 'On')
}
else
{
    $BitLockerStatus  = 'Unknown'
}

$info = Get-ComputerInfo 

$config = @{
    Username = $env:USERNAME
    Machine = $env:COMPUTERNAME
    Caption = $info.OsName
    Version = $info.OSVersion
    AdminAccount = $IsAdmin
    BitLockerStatus = $BitLockerStatus
    Family = ($info.CsSystemFamily)
    Processors = $info.CsProcessors.name
}

$filePath = ('{0}\{1}.json' -f $env:temp, $env:COMPUTERNAME)
$config.GetEnumerator() | ConvertTo-Json | Out-File -FilePath $filePath
Write-Output ('Writing to {0}' -f $filePath)
Set-Clipboard -path $filePath 