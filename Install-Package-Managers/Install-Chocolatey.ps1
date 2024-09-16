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
#   Description:    This script Installs Chocolatey Package Manager for Windows & performs an initial update.
#
#   Last Updated:   30.04.2023
################################################################################################################################
# Elevate script to have Administrative privileges.
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
    { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

# Bypass Execution Policy for this script.
Write-Output "`nBypassing Execution Policy for this script . . . .`n"
Set-ExecutionPolicy Bypass -Scope Process

# Install Chocolatey.
Write-Output "`nInstalling Chocolatey . . . .`n"
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
Write-Output "`nChocolatey instalaltion is complete . . . .`n"

# Show Chocolatey version info.
$version = choco --version
Write-Output "`nInstalled Chocolatey version is -> $version`n"

# Perform a full update of Chocolatey & all packages.
Write-Output "`nPerforming full update . . . .`n"
choco upgrade all

# Open the HELP menu for the user.
Write-Output "`nOpening the HELP menu . . . .`n"
choco --help

# Wait for Key-Press from user.
Write-Output "`nComplete. Press any key to continue . . . .`n"
[Console]::ReadKey($true) | Out-Null
################################################################################################################################