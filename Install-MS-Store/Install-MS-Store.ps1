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
#   Description:    This script installs the Microsoft Store & WinGet-CLI to LTSC editions of Windows 10/11.
#
#   Last Updated:   19.03.2025
################################################################################################################################
# Download the latest releast of WinGet from the official GitHub repo.
Write-Output "`n--> Downloading the latest version of WinGet-CLI . . . ."
$releaseUrl = "https://api.github.com/repos/microsoft/winget-cli/releases/latest"
$response = Invoke-RestMethod -Uri $releaseUrl
$asset = $response.assets | Where-Object { $_.name -match "\.msixbundle$" }
$downloadUrl = $asset.browser_download_url
$scriptDir = $PSScriptRoot
$filePath = Join-Path -Path $scriptDir -ChildPath $asset.name
Invoke-WebRequest -Uri $downloadUrl -OutFile $filePath
Write-Host "`n--> Downloaded WinGet-CLI to: $filePath"

################################################################################################################################
# Parse files to trim version details.
# Find the Windows Store app bundle.
$Store = Get-ChildItem -Path . -Filter "*WindowsStore*.msixbundle" -File -ErrorAction SilentlyContinue | Select-Object -First 1
# Find the WinGet-CLI app bundle.
$WinGet = Get-ChildItem -Path . -Filter "*Microsoft.DesktopAppInstaller*.msixbundle" -File -ErrorAction SilentlyContinue | Select-Object -First 1
# Find the .NET-Framework appx files for x64 and x86 architectures.
$FrameworkX64 = Get-ChildItem -Path . -Filter "*NET.Native.Framework*.appx" -File -ErrorAction SilentlyContinue | Where-Object { $_.Name -match "x64" } | Select-Object -First 1
$FrameworkX86 = Get-ChildItem -Path . -Filter "*NET.Native.Framework*.appx" -File -ErrorAction SilentlyContinue | Where-Object { $_.Name -match "x86" } | Select-Object -First 1
# Find the Runtime appx files for x64 and x86 architectures.
$RuntimeX64 = Get-ChildItem -Path . -Filter "*NET.Native.Runtime*.appx" -File -ErrorAction SilentlyContinue | Where-Object { $_.Name -match "x64" } | Select-Object -First 1
$RuntimeX86 = Get-ChildItem -Path . -Filter "*NET.Native.Runtime*.appx" -File -ErrorAction SilentlyContinue | Where-Object { $_.Name -match "x86" } | Select-Object -First 1
# Find the UI-XAML appx files for x64 and x86 architectures.
$XAMLX64 = Get-ChildItem -Path . -Filter "*UI.Xaml*.appx" -File -ErrorAction SilentlyContinue | Where-Object { $_.Name -match "x64" } | Select-Object -First 1
$XAMLX86 = Get-ChildItem -Path . -Filter "*UI.Xaml*.appx" -File -ErrorAction SilentlyContinue | Where-Object { $_.Name -match "x86" } | Select-Object -First 1
# Find the VCLibs-UWP appx files for x64 and x86 architectures.
$VCLibsUWPX64 = Get-ChildItem -Path . -Filter "*VCLibs.140.00.UWPDesktop_14.0*.appx" -File -ErrorAction SilentlyContinue | Where-Object { $_.Name -match "x64" } | Select-Object -First 1
$VCLibsUWPX86 = Get-ChildItem -Path . -Filter "*VCLibs.140.00.UWPDesktop_14.0*.appx" -File -ErrorAction SilentlyContinue | Where-Object { $_.Name -match "x86" } | Select-Object -First 1
# Find the VCLibs appx files for x64 and x86 architectures.
$VCLibsX64 = Get-ChildItem -Path . -Filter "*VCLibs.140.00_14.0*.appx" -File -ErrorAction SilentlyContinue | Where-Object { $_.Name -match "x64" } | Select-Object -First 1
$VCLibsX86 = Get-ChildItem -Path . -Filter "*VCLibs.140.00_14.0*.appx" -File -ErrorAction SilentlyContinue | Where-Object { $_.Name -match "x86" } | Select-Object -First 1

# Output the found file paths for verification.
Write-Output "`n--> Found Packages:"
Write-Host "MS-Store Package: $($Store.Name)"
Write-Host "Winget-CLI Package: $($WinGet.Name)"
Write-Host ".NET-Framework-x64: $($FrameworkX64.Name)"
Write-Host ".NET-Framework-x86: $($FrameworkX86.Name)"
Write-Host ".NET-Runtime x64: $($RuntimeX64.Name)"
Write-Host ".NET-Runtime-x86: $($RuntimeX86.Name)"
Write-Host "UI-XAML-x64: $($XAMLX64.Name)"
Write-Host "UI-XAML-x86: $($XAMLX86.Name)"
Write-Host "VCLibs-UWP-x64: $($VCLibsUWPX64.Name)"
Write-Host "VCLibs-UWP-x86: $($VCLibsUWPX86.Name)"
Write-Host "VCLibs-x64: $($VCLibsX64.Name)"
Write-Host "VCLibs-x86: $($VCLibsX86.Name)"

################################################################################################################################
# Install MS-Store with all the dependencies.
Write-Output "`n--> Installing MS-Store with all the dependencies . . . ."
Add-AppxPackage $Store -DependencyPath $FrameworkX64, $FrameworkX86, $RuntimeX64, $RuntimeX86, $XAMLX64, $XAMLX86, $VCLibsUWPX64, $VCLibsUWPX86, $VCLibsX64, $VCLibsX86
Write-Output "`n--> Microsoft Store installed succesfully."
# Install WinGet-CLI.
Write-Output "`n--> Installing WinGet-CLI . . . ."
Add-AppxPackage $WinGet
Write-Output "`n--> WinGet-CLI installed successfully."

# Wait for Key-Press from user.
Write-Output "`n--> Complete. Press any key to continue . . . .`n"
[Console]::ReadKey($true) | Out-Null
################################################################################################################################
