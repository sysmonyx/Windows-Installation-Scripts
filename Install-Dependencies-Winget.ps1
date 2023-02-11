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
################################################################################################################################
# Elevate script to have Administrative privileges.
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
    { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

# Perform an initial update.
Write-Output "`nPerforming intial update . . . .`n"
winget upgrade -h --all --include-unknown
Write-Output "`nFinished initial update.`n"

# Apps.
$apps = @(

    # Sorted A-Z.
    "EclipseAdoptium.Temurin.20.JDK"                            # Adoptium OpenJDK 20
    "Microsoft.DotNet.SDK.7"                                    # Microsoft DotNET SDK 7.0
    "Microsoft.DotNet.SDK.6"                                    # Microsoft DotNET SDK 6.0
    "Microsoft.DotNet.SDK.5"                                    # Microsoft DotNET SDK 5.0
    "Microsoft.DirectX"                                         # Microsoft DirectX
    "Microsoft.VC++2005Redist-x64"                              # Microsoft Visual C++ 2005 Redistributable (x64)
    "Microsoft.VC++2005Redist-x86"                              # Microsoft Visual C++ 2005 Redistributable (x86)
    "Microsoft.VC++2008Redist-x64"                              # Microsoft Visual C++ 2008 Redistributable (x64)
    "Microsoft.VC++2008Redist-x86"                              # Microsoft Visual C++ 2008 Redistributable (x86)
    "Microsoft.VC++2010Redist-x64"                              # Microsoft Visual C++ 2010 Redistributable (x64)
    "Microsoft.VC++2010Redist-x86"                              # Microsoft Visual C++ 2010 Redistributable (x86)
    "Microsoft.VC++2012Redist-x64"                              # Microsoft Visual C++ 2012 Redistributable (x64)
    "Microsoft.VC++2012Redist-x86"                              # Microsoft Visual C++ 2012 Redistributable (x86)
    "Microsoft.VC++2013Redist-x64"                              # Microsoft Visual C++ 2013 Redistributable (x64)
    "Microsoft.VC++2013Redist-x86"                              # Microsoft Visual C++ 2013 Redistributable (x86)
    "Microsoft.VC++2015-2022Redist-x64"                         # Microsoft Visual C++ 2015-2022 Redistributable (x64)
    "Microsoft.VC++2015-2022Redist-x86"                         # Microsoft Visual C++ 2015-2022 Redistributable (x86)

)

# Install apps.
foreach ($app in $apps){
    Write-Output "`n# Now installing : $app . . . .`n"
    winget install -eh $app
    Write-Output "`n# Finished installing $app.`n"
}

# Perform closing update.
Write-Output "`nPerforming closing update . . . .`n"
winget upgrade -h --all --include-unknown
Write-Output "`nFinished closing update.`n"

# Wait for Key-Press from user.
Write-Output "`nComplete. Press any key to continue . . . .`n"
[Console]::ReadKey($true) | Out-Null
################################################################################################################################
