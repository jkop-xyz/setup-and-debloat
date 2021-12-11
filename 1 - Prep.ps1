# Relaunch the script with administrator privileges
RequireAdmin


    $ErrorActionPreference = "SilentlyContinue"
    If ($Error) {$Error.Clear()}

# Stage 1 - prep - press any key to continue
Function WaitForKey {
        Write-Host
	Write-Host "Stage 1 - prep - press any key to continue" -ForegroundColor Black -BackgroundColor White
	[Console]::ReadKey($true) | Out-Null
}
WaitForKey
Set-Executionpolicy unrestricted

#Installing chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

#Install Git and clone repo
choco install git --params "'/NoShellIntegration'" -y

#Move module and import
Copy-Item "C:\script\saides-modules.psm1" -Destination "C:\Program Files\WindowsPowerShell\Modules\saides-modules\" -Recurse
Import-Module saides-modules

#Change svchost split threshold
#4 GB	68764420
#6 GB	103355478
#8 GB	137922056
#12 GB	307767570
#16 GB	376926742
#24 GB	622221348
#32 GB	861226034
#64 GB	1729136740
$value = "861226034"
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control" -Type "DWord" -Name "SvcHostSplitThresholdInKB" -Value "$value"

Write-Host "Starting stage 2 - debloat"
Start-Sleep -s 3
."\2 - Debloat.ps1"
