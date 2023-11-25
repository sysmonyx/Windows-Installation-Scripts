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
#   Description:    This script installs specified apps from the Microsoft Store using the Windows Package Manager for Windows.
#
#   Last Updated:   12.11.2023
################################################################################################################################
# Elevate script to have Administrative privileges.
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
    { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

# Perform an initial update.
Write-Output "`nPerforming initial update . . . .`n"
winget upgrade -h --all --include-unknown
Write-Output "`nFinished initial update.`n"

# Apps.
$apps = @(

    # Sorted A-Z.
    "9PFHDD62MXS1"                                              # Apple Music Preview
    "9MVZQVXJBQ9V"                                              # AV1 Video Extension
    "9N4WGH0Z6VHQ"                                              # HEVC Video Extensions for Device Manufacturers
    "9WZDNCRFJ4MV"                                              # Lenovo Vantage
    "9MSMLRH6LZF3"                                              # Microsoft Notepad
    "9PCFS5B6T72H"                                              # Microsoft Paint
    "9WZDNCRFJBH4"                                              # Microsoft Photos
    "9NBLGGH5R558"                                              # Microsoft To Do
    "9NKSQGP7F2NH"                                              # WhatsApp Desktop
    "9WZDNCRFHVN5"                                              # Windows Calculator

)

# Install apps.
foreach ($app in $apps){
    Write-Output "`n# Now installing : $app . . . .`n"
    winget install -eh --id $app
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
