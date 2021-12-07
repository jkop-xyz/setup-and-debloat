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

New-Item -Path "C:\temp" -Name "drivers" -ItemType "directory"

Invoke-WebRequest -Uri "https://downloadmirror.intel.com/682066/Wired_driver_26.6_x64.zip" -OutFile "C:\temp\drivers\intel_nic.zip"
Expand-Archive -LiteralPath "C:\temp\drivers\intel_nic.zip" -DestinationPath "C:\temp\drivers\intel_nic"
Remove-Item -Path "C:\temp\drivers\intel_nic.zip"

Invoke-WebRequest -Uri "https://dlcdnets.asus.com/pub/ASUS/mb/01AUDIO/DRV_Audio_RTK_UWD_SS3_VAC_TP_W10_64_V6089601_20200929R.zip" -OutFile "C:\temp\drivers\realtek_audio.zip"
Expand-Archive -LiteralPath "C:\temp\drivers\realtek_audio.zip" -DestinationPath "C:\temp\drivers\realtek_audio"
Remove-Item -Path "C:\temp\drivers\realtek_audio.zip"

Invoke-WebRequest -Uri "https://dlcdnets.asus.com/pub/ASUS/wireless/USB-BT400/DR_USB_BT400_1201710_Windows.zip" -OutFile "C:\temp\drivers\asus_bt.zip"
Expand-Archive -LiteralPath "C:\temp\drivers\realtek_audio.zip" -DestinationPath "C:\temp\drivers\asus_bt"
Remove-Item -Path "C:\temp\drivers\asus_bt.zip"