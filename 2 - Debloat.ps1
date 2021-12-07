
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


==========================================================================================================================================================================


# Stage 2 - debloat - press any key to continue
Function WaitForKey {
        Write-Host
	Write-Host "Stage 2 - debloat - press any key to continue" -ForegroundColor Black -BackgroundColor White
	[Console]::ReadKey($true) | Out-Null
}


#Functions to run from module
WaitForKey
SetPhotoViewerAssociation
SetControlPanelSmallIcons
EnableFileDeleteConfirm
RemovePinnedIconsFromTaskbar
MicrosoftChatButtonFromTaskbar
HideTaskbarSearchBox
HideTaskView
HideTaskbarPeopleIcon
RemoveENKeyboard
RemoveENKeyboard
RemoveENKeyboard
HideQuickAcessfromExplorer
HideRecycleBin
NoRecycleBin
JPEGComp
#DisableDefender
#DisableDefenderCloud
#DisableXboxFeatures
DisableTelemetry
DisableWiFiSense
DisableSmartScreen
DisableWebSearch
DisableAppSuggestions
DisableActivityHistory
DisableBackgroundApps
DisableLocationTracking
DisableMapUpdates
DisableFeedback
DisableTailoredExperiences
DisableAdvertisingID
DisableCortana
DisableErrorReporting
DisableAutoLogger
DisableDiagTrack
DisableWAPPush
DisableSharingMappedDrives
DisableAdminShares
DisableUpdateRestart
DisableRemoteAssistance
DisableRemoteDesktop
DisableIndexing
RemoveOneDrive
RemoveMicrosoftApps


Write-Output "Disabling Windows Services"

Set-Service WbioSrvc -StartupType Disabled
Set-Service CertPropSvc -StartupType Disabled
Set-Service DevicePickerUserSvc_2d9f8 -StartupType Disabled
Set-Service WalletService -StartupType Disabled
Set-Service WPDBusEnum -StartupType Disabled
Set-Service DPS -StartupType Disabled
Set-Service TrkWks -StartupType Disabled
Set-Service MapsBroker -StartupType Disabled
Set-Service iphlpsvc -StartupType Disabled
Set-Service PcaSvc -StartupType Disabled
Set-Service TabletInputService -StartupType Disabled
Set-Service stisvc -StartupType Disabled
Set-Service WerSvc -StartupType Disabled
Set-Service NcaSvc -StartupType Disabled
Set-Service irmon -StartupType Disabled
Set-Service AJRouter -StartupType Disabled
Set-Service ALG -StartupType Disabled
Set-Service AppMgmt -StartupType Disabled
Set-Service wbengine -StartupType Disabled
Set-Service PeerDistSvc -StartupType Disabled
Set-Service CertPropSvc -StartupType Disabled
Set-Service DiagTrack -StartupType Disabled
Set-Service DsSvc -StartupType Disabled
Set-Service DusmSvc -StartupType Disabled
Set-Service DoSvc -StartupType Disabled
Set-Service Fax -StartupType Disabled
Set-Service lfsvc -StartupType Disabled
Set-Service irmon -StartupType Disabled
Set-Service SharedAccess -StartupType Disabled
Set-Service IpxlatCfgSvc -StartupType Disabled
Set-Service wlidsvc -StartupType Disabled
Set-Service AppVClient -StartupType Disabled
Set-Service MSiSCSI -StartupType Disabled
Set-Service smphost -StartupType Disabled
Set-Service SmsRouter -StartupType Disabled
Set-Service NaturalAuthentication -StartupType Disabled
Set-Service NetTcpPortSharing -StartupType Disabled
Set-Service Netlogon -StartupType Disabled
Set-Service NcdAutoSetup -StartupType Disabled
Set-Service CscService -StartupType Disabled
Set-Service WpcMonSvc -StartupType Disabled
Set-Service SEMgrSvc -StartupType Disabled
Set-Service PhoneSvc -StartupType Disabled
Set-Service RpcLocator -StartupType Disabled
Set-Service RemoteRegistry -StartupType Disabled
Set-Service RetailDemo -StartupType Disabled
Set-Service RemoteAccess -StartupType Disabled
Set-Service SensorDataService -StartupType Disabled
Set-Service SensrSvc -StartupType Disabled
Set-Service SensorService -StartupType Disabled
Set-Service shpamsvc -StartupType Disabled
Set-Service SCardSvr -StartupType Disabled
Set-Service ScDeviceEnum -StartupType Disabled
Set-Service SCPolicySvc -StartupType Disabled
Set-Service SNMPTRAP -StartupType Disabled
Set-Service WebClient -StartupType Disabled
Set-Service WFDSConSvc -StartupType Disabled
Set-Service wcncsvc -StartupType Disabled
Set-Service wisvc -StartupType Disabled
Set-Service WMPNetworkSvc -StartupType Disabled
Set-Service icssvc -StartupType Disabled
Set-Service spectrum -StartupType Disabled
Set-Service FontCache3.0.0.0 -StartupType Disabled
Set-Service WinRM -StartupType Disabled
Set-Service WwanSvc -StartupType Disabled

# Wait for key press
Function WaitForKey {
	Write-Host
	Write-Host "Press Any Key To Restart PC..." -ForegroundColor Black -BackgroundColor White
	[Console]::ReadKey($true) | Out-Null
}
WaitForKey


# Restart computer
Function Restart {
	Restart-Computer
}
Restart