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
#   Last Updated:   23.02.2025
################################################################################################################################
# Perform an initial update.
Write-Output "`n--> Performing initial update . . . .`n"
winget upgrade -h --all --include-unknown
Write-Output "`n--> Finished initial update.`n"

################################################################################################################################
# Apps.
$apps = @(

    # Sorted A-Z.
    "9PFHDD62MXS1"                                              # Apple Music Preview
    "9WZDNCRFJ4MV"                                              # Lenovo Vantage
    "9MSMLRH6LZF3"                                              # Microsoft Notepad
    "9PCFS5B6T72H"                                              # Microsoft Paint
    "9WZDNCRFJBH4"                                              # Microsoft Photos
    "9NBLGGH5R558"                                              # Microsoft To Do
    "9NKSQGP7F2NH"                                              # WhatsApp Desktop
    "9WZDNCRFHVN5"                                              # Windows Calculator

    # Media Extensions.
    "9MVZQVXJBQ9V"                                              # AV1 Video Extension
    "9pmmsr1cgpwg"                                              # HEIF Image Extension
    "9N4WGH0Z6VHQ"                                              # HEVC Video Extensions for Device Manufacturers
    "9n95q1zzpmh4"                                              # MPEG-2 Video Extension
    "9nctdw2w1bh8"                                              # RAW Image Extension
    "9n4d0msmp0pt"                                              # VP9 Video Extension
    "9n5tdp8vcmhs"                                              # Web Media Extension
    "9pg2dk419drg"                                              # Webp Image Extension

)
################################################################################################################################
# Install apps.
foreach ($app in $apps){
    Write-Output "`n--> Now installing : $app . . . .`n"
    winget install -eh --id $app
    Write-Output "`n--> Finished installing $app.`n"
}

# Perform closing update.
Write-Output "`--> Performing closing update . . . .`n"
winget upgrade -h --all --include-unknown
Write-Output "`--> Finished closing update.`n"

# Wait for Key-Press from user.
Write-Output "`n--> Complete. Press any key to continue . . . .`n"
[Console]::ReadKey($true) | Out-Null
################################################################################################################################
