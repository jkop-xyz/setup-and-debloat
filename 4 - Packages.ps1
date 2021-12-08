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


# Stage 3 - packages - press any key to continue
Function WaitForKey {
        Write-Host
	Write-Host "Stage 4 - packages - press any key to continue" -ForegroundColor Black -BackgroundColor White
	[Console]::ReadKey($true) | Out-Null
}


#Installing choco packages from file
choco feature enable -n=useRememberedArgumentsForUpgrades
choco install C:\x\packages.config -y

#Installing Windows Features
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
Enable-WindowsOptionalFeature -Online -FeatureName TelnetClient -All
Enable-WindowsOptionalFeature -Online -FeatureName MicorosftWindowsPowershellV2 -All
Enable-WindowsOptionalFeature -Online -FeatureName MicorosftWindowsPowershellV2Root -All

#Downloading installers that can't autoinstall to temp directory
Invoke-WebRequest -Uri "https://www.oculus.com/download_app/?id=1582076955407037" -OutFile "C:\temp\oculus.exe"

Install-WindowsUpdate -NotCategory "Drivers" -AcceptAll -IgnoreReboot

Invoke-Item "C:\temp"

[void](Read-Host 'Press Enter to reboot…')
Restart-Computer