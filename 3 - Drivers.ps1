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

# Stage 3 - drivers - press any key to continue
Function WaitForKey {
        Write-Host
	Write-Host "drivers - press any key to continue" -ForegroundColor Black -BackgroundColor White
	[Console]::ReadKey($true) | Out-Null
}

Invoke-WebRequest -Uri "https://downloadmirror.intel.com/682066/Wired_driver_26.6_x64.zip" -OutFile "C:\temp\drivers\intel_nic.zip"
Invoke-WebRequest -Uri "https://dlcdnets.asus.com/pub/ASUS/mb/01AUDIO/DRV_Audio_RTK_UWD_SS3_VAC_TP_W10_64_V6089601_20200929R.zip" -OutFile "C:\temp\drivers\realtek_audio.zip"