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
#   Description:    This script installs necessery Dependencies, Runtimes & Dev-Kits using the Windows Package Manager for Windows.
#
#   Last Updated:   19.01.2025
################################################################################################################################
# Elevate script to have Administrative privileges.
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
    { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

# Perform an initial update.
Write-Output "`n--> Performing intial update . . . .`n"
winget upgrade -h --all --include-unknown
Write-Output "`n--> Finished initial update.`n"

# Apps.
$apps = @(

    # Sorted A-Z.
    "EclipseAdoptium.Temurin.23.JDK"                            # Adoptium OpenJDK 23
    "Microsoft.DotNet.SDK.9"                                    # Microsoft DotNET SDK 9.0
    "Microsoft.DotNet.SDK.8"                                    # Microsoft DotNET SDK 8.0
    "Microsoft.DotNet.SDK.7"                                    # Microsoft DotNET SDK 7.0
    "Microsoft.DotNet.SDK.6"                                    # Microsoft DotNET SDK 6.0
    "Microsoft.DotNet.SDK.5"                                    # Microsoft DotNET SDK 5.0
    "Microsoft.DotNet.SDK.3_1"                                  # Microsoft DotNET SDK 3.1
    "Microsoft.DirectX"                                         # Microsoft DirectX
    "Microsoft.VCRedist.2005.x64"                               # Microsoft Visual C++ 2005 Redistributable (x64)
    "Microsoft.VCRedist.2005.x86"                               # Microsoft Visual C++ 2005 Redistributable (x86)
    "Microsoft.VCRedist.2008.x64"                               # Microsoft Visual C++ 2008 Redistributable (x64)
    "Microsoft.VCRedist.2008.x86"                               # Microsoft Visual C++ 2008 Redistributable (x86)
    "Microsoft.VCRedist.2010.x64"                               # Microsoft Visual C++ 2010 Redistributable (x64)
    "Microsoft.VCRedist.2010.x86"                               # Microsoft Visual C++ 2010 Redistributable (x86)
    "Microsoft.VCRedist.2012.x64"                               # Microsoft Visual C++ 2012 Redistributable (x64)
    "Microsoft.VCRedist.2012.x86"                               # Microsoft Visual C++ 2012 Redistributable (x86)
    "Microsoft.VCRedist.2013.x64"                               # Microsoft Visual C++ 2013 Redistributable (x64)
    "Microsoft.VCRedist.2013.x86"                               # Microsoft Visual C++ 2013 Redistributable (x86)
    "Microsoft.VCRedist.2015+.x64"                              # Microsoft Visual C++ 2015-2022 Redistributable (x64)
    "Microsoft.VCRedist.2015+.x86"                              # Microsoft Visual C++ 2015-2022 Redistributable (x86)

    # Media Dependencies.
    "Gyan.FFmpeg"                                               # FFMPEG static build from GYAN.DEV
)

# Install apps.
foreach ($app in $apps){
    Write-Output "`n--> Now installing : $app . . . .`n"
    winget install -eh $app
    Write-Output "`n--> Finished installing $app.`n"
}

# Perform closing update.
Write-Output "`n--> Performing closing update . . . .`n"
winget upgrade -h --all --include-unknown
Write-Output "`n--> Finished closing update.`n"

# Wait for Key-Press from user.
Write-Output "`n--> Complete. Press any key to continue . . . .`n"
[Console]::ReadKey($true) | Out-Null
################################################################################################################################
