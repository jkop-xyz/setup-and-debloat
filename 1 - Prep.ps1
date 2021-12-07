# Relaunch the script with administrator privileges
Function RequireAdmin {
	If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")) {
		Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`" $PSCommandArgs" -WorkingDirectory $pwd -Verb RunAs
		Exit
	}
}
RequireAdmin


    $ErrorActionPreference = "SilentlyContinue"
    If ($Error) {$Error.Clear()}

# Stage 1 - prep - press any key to continue
Function WaitForKey {
        Write-Host
	Write-Host "prep - press any key to continue" -ForegroundColor Black -BackgroundColor White
	[Console]::ReadKey($true) | Out-Null
}

#Installing chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

#Install Git and clone repo
choco install git --params "'/NoShellIntegration'" -y
git clone "x" C:\script\

#Move module and import
Copy-Item "C:\script\saides-modules.psm1" -Destination "C:\Program Files\WindowsPowerShell\Modules\saides-modules\" -Recurse
Import-Module saides-modules

Write-Host "Starting stage 2 - debloat"
Start-Sleep -s 3
$script2 = $PSScriptRoot+"\2 - Debloat.ps1"
&$script2
