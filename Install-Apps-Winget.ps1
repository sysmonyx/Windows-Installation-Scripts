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
#   Description:    This script installs specified apps using the Windows Package Manager for Windows.
#
#   Last Updated:   20.10.2023
################################################################################################################################
# Elevate script to have Administrative privileges.
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
    { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

# Perform an initial update.
Write-Output "`nPerforming initial update . . . .`n"
winget upgrade -h --all --include-unknown
Write-Output "`nFinished initial update.`n"

################################################################################################################################
# Apps.
$apps = @(

    # Browsers.
    "Brave.Brave"                                               # Brave Browser
    "Mozilla.Firefox"                                           # Firefox
    "Google.Chrome"                                             # Google Chrome
    "LibreWolf.LibreWolf"                                       # LibreWolf
    "Microsoft.Edge"                                            # Microsoft Edge
    "Alex313031.Thorium.AVX2"                                   # Thorium (AVX2)
    "TorProject.TorBrowser"                                     # Tor Browser
    "Vivaldi.Vivaldi"                                           # Vivaldi

    # Cloud Storage.
    "Box.Box"                                                   # Box Client
    "Dropbox.Dropbox"                                           # Dropbox
    "FilenCloud.FilenSync"                                      # Filen Sync
    "Google.GoogleDrive"                                        # Google Drive
    "Mega.MEGASync"                                             # MEGASync
    "Microsoft.OneDrive"                                        # OneDrive

    # Communication.
    "Discord.Discord"                                           # Discord
    "Element.Element"                                           # Element Messenger
    "Oxen.Session"                                              # Session Messenger
    "OpenWhisperSystems.Signal"                                 # Signal Desktop
    "Telegram.TelegramDesktop"                                  # Telegram Desktop
    "Zoom.Zoom"                                                 # Zoom

    # Compression.
    "7zip.7zip"                                                 # 7-Zip
    "mcmilk.7zip-zstd"                                          # 7-Zip ZSTD
    "Giorgiotani.Peazip"                                        # PeaZip
    "RARLab.WinRAR"                                             # WinRAR

    # Development.
    "Codeblocks.Codeblocks"                                     # Code::Blocks
    "Docker.DockerDesktop"                                      # Docker Desktop
    "Git.Git"                                                   # Git
    "GitHub.GitHubDesktop"                                      # GitHub Desktop
    "Microsoft.XMLNotepad"                                      # Microsoft XML Notepad
    "MSYS2.MSYS2"                                               # MSYS2
    "OpenJS.NodeJS"                                             # NodeJS
    "Notepad++.Notepad++"                                       # Notepad++
    "PuTTY.PuTTY"                                               # PuTTY
    "JetBrains.PyCharm.Community"                               # PyCharm Community Edition
    "Python.Python.3.12"                                        # Python 3
    "Microsoft.VisualStudio.2022.Community"                     # Visual Studio Community Edition 2022
    "Microsoft.VisualStudioCode"                                # Visual Studio Code
    "WinMerge.WinMerge"                                         # WinMerge
    "WinSCP.WinSCP"                                             # WinSCP

    # Downloaders.
    "AppWork.JDownloader"                                       # Jdownloader 2
    "qBittorrent.qBittorrent"                                   # qBittorrent

    # Encryption.
    "Cryptomator.Cryptomator"                                   # Cryptomator
    "Nord.NordLocker"                                           # NordLocker
    "IDRIX.VeraCrypt"                                           # VeraCrypt

    # Game Launchers.
    "ElectronicArts.EADesktop"                                  # EA Desktop App
    "EpicGames.EpicGamesLauncher"                               # Epic Games Launcher
    "GOG.Galaxy"                                                # GOG Galaxy 2.0
    "Playnite.Playnite"                                         # Playnite
    "Valve.Steam"                                               # Steam
    "Ubisoft.Connect"                                           # Ubisoft Connect

    # Hardware Monitoring.
    "FinalWire.AIDA64.Extreme"                                  # AIDA-64 Extreme
    "CPUID.CPU-Z"                                               # CPU-Z
    "CrystalDewWorld.CrystalDiskInfo"                           # Crystal Disk Info
    "CrystalDewWorld.CrystalDiskMark"                           # Crystal Disk Mark
    "PrimateLabs.Geekbench.5"                                   # Geekbench
    "TechPowerUp.GPU-Z"                                         # GPU-Z
    "REALiX.HWiNFO"                                             # HWINFO-64
    "CPUID.HWMonitor"                                           # HWMonitor

    # Hypervisor.
    "Oracle.VirtualBox"                                         # VirtualBox
    "VMware.WorkstationPro"                                     # VMware Workstation Pro
    "VMware.WorkstationPlayer"                                  # VMware Workstation Player

    # Media Writer.
    "Balena.Etcher"                                             # Balena Etcher
    "LIGHTNINGUK.ImgBurn"                                       # ImgBurn

    # Multimedia & Entertainment.
    "Digimezzo.Dopamine.3"                                      # Dopamine 3
    "Spotify.Spotify"                                           # Spotify

    # Multimedia Tools
    "szTheory.exifcleaner"                                      # EXIF Cleaner
    "HandBrake.HandBrake"                                       # Handbrake
    "MKVToolNix.MKVToolNix"                                     # MKVToolNix

    # Networking Tools.
    "Insecure.Nmap"                                             # Nmap
    "WiresharkFoundation.Wireshark"                             # Wireshark
    "ZeroTier.ZeroTierOne"                                      # ZeroTier One

    # Password Managers.
    "Bitwarden.Bitwarden"                                       # Bitwarden
    "KeePassXCTeam.KeePassXC"                                   # KeePassXC

    # Productivity.
    "BlenderFoundation.Blender"                                 # Blender
    "Streetwriters.Notesnook"                                   # Notesnook
    "Notion.Notion"                                             # Notion
    "Nvidia.Broadcast"                                          # Nvidia Broadcast
    "OBSProject.OBSStudio"                                      # OBS Studio
    "Obsidian.Obsidian"                                         # Obsidian
    "Appest.TickTick"                                           # TickTick
    "Doist.Todoist"                                             # Todoist
    "Xmind.Xmind"                                               # Xmind

    # Remote Desktop.
    "AnyDeskSoftwareGmbH.AnyDesk"                               # AnyDesk
    "Parsec.Parsec"                                             # Parsec
    "TeamViewer.TeamViewer"                                     # TeamViewer

    # Security.
    "AdGuard.AdGuard"                                           # AdGuard Windows
    "Malwarebytes.Malwarebytes"                                 # Malwarebytes
    "OnionShare.OnionShare"                                     # OnionShare
    "ProtonTechnologies.ProtonVPN"                              # Proton VPN

    # System Maintenance.
    "BleachBit.BleachBit"                                       # Bleachbit

    # System Utilities.
    "namazso.OpenHashTab"                                       # OpenHashTab
    "Ookla.Speedtest.CLI"                                       # Ookla Speedtest CLI
    "Microsoft.PowerShell"                                      # Powershell 7
    "Microsoft.PowerToys"                                       # PowerToys
    "CodeSector.TeraCopy"                                       # TeraCopy
    "Microsoft.WindowsTerminal"                                 # Windows Terminal                  (Installed by default on Win-11)

    # Special Tools
    "Nlitesoft.NTLite"                                          # NTLite
    "TechPowerUp.NVCleanstall"                                  # NVCleanstall

################################################################################################################################
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
