################################################################################################################################
#    /$$$$$$
#   /$$__  $$
#  | $$  \__/ /$$   /$$  /$$$$$$$ /$$$$$$/$$$$   /$$$$$$  /$$$$$$$  /$$   /$$ /$$   /$$         # Author:   Soham Ray [Sysmonyx]
#  |  $$$$$$ | $$  | $$ /$$_____/| $$_  $$_  $$ /$$__  $$| $$__  $$| $$  | $$|  $$ /$$/
#   \____  $$| $$  | $$|  $$$$$$ | $$ \ $$ \ $$| $$  \ $$| $$  \ $$| $$  | $$ \  $$$$/          # Website:  https://sysmonyx.com
#   /$$  \ $$| $$  | $$ \____  $$| $$ | $$ | $$| $$  | $$| $$  | $$| $$  | $$  >$$  $$
#  |  $$$$$$/|  $$$$$$$ /$$$$$$$/| $$ | $$ | $$|  $$$$$$/| $$  | $$|  $$$$$$$ /$$/\  $$         # Email:    contact@sysmonyx.com
#   \______/  \____  $$|_______/ |__/ |__/ |__/ \______/ |__/  |__/ \____  $$|__/  \__/
#             /$$  | $$                                             /$$  | $$
#            |  $$$$$$/                                            |  $$$$$$/
#             \______/                                              \______/
################################################################################################################################
#   Description:    This script installs WinGet (Windows Package Manager).
#                   WinGet is installed by default in consumer versions of Windows-11.
#                   This script is useful for Windows-10 & Windows-11 LTSC versions as they don't have WinGet by default.
#                   This script can also be used to install WinGet inside Windows Sandbox instance if needed.
#
#   Last Updated:   16.09.2024
################################################################################################################################
# Check if WinGet is already installed.
Write-Output "Checking if WinGet is already present in system . . . ."
try {
	winget --version
	Write-Output "WinGet is already present on this system."
	Stop-Transcript
	Exit 0
}
catch {
	Write-Output "WinGet is not detected on this system."
}

# Check if Microsoft UI XAML is present. Install if not.
Write-Output "Checking if Microsoft UI XAML is already present . . . ."
try {
	$package = Get-AppxPackage -Name "Microsoft.UI.Xaml.2.8"
	if ($package) {
		Write-Output "Microsoft.UI.Xaml.2.8 is already installed."
	}
    else {
		Write-Output "Installing Microsoft.UI.Xaml.2.8 . . . ."
		Invoke-WebRequest `
			-URI https://www.nuget.org/api/v2/package/Microsoft.UI.Xaml/2.8.6 `
			-OutFile xaml.zip -UseBasicParsing
		New-Item -ItemType Directory -Path xaml
		Expand-Archive -Path xaml.zip -DestinationPath xaml
		Add-AppxPackage -Path "xaml\tools\AppX\x64\Release\Microsoft.UI.Xaml.2.8.appx"
		Remove-Item xaml.zip
		Remove-Item xaml -Recurse
	}
}
catch {
	Write-Output "An error occurred: $($_.Exception.Message)"
}

# Update Microsoft VC-Libs.
Write-Output "Updating Microsoft.VCLibs.140.00.UWPDesktop . . . ."
Invoke-WebRequest `
	-URI https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx `
	-OutFile VCLibs.appx -UseBasicParsing
Add-AppxPackage VCLibs.appx
Remove-Item VCLibs.appx

# Install the latest version of WinGet.
Write-Output "Installing the latest version of WinGet . . . ."
Invoke-WebRequest `
    -URI https://aka.ms/getwinget `
    -OutFile winget.msixbundle
Add-AppxPackage winget.msixbundle
Remove-Item winget.msixbundle
Write-Output "Latest version of WinGet has been installed."

# Show user the installed WinGet version.
$version = winget --version
Write-Output "Installed WinGet version is - $version"

# Configure available sources.
# List all WinGet Sources.
Write-Output "Installed WinGet sources are . . . ."
winget source list
# Remove Source MSStore form WinGet. [This removes MS-Store from sources list. Comment out if you intend to keep MS-Store in the sources]
Write-Output "Removing Microsoft Store from available sources . . . ."
winget source remove msstore
# Update Sources.
Write-Output "Updating available sources . . . ."
winget source update

# Wait for Key-Press from user.
Write-Output "`nWinGet is installed & ready to use.`n"
[Console]::ReadKey($true) | Out-Null
################################################################################################################################
