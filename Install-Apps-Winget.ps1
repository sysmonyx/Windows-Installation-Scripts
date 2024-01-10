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

# Apps.
$apps = @(

    # Sorted A-Z.
    "mcmilk.7zip-zstd"                                          # 7-Zip ZSTD
    "AdGuard.AdGuard"                                           # AdGuard Windows
    "FinalWire.AIDA64.Extreme"                                  # AIDA-64 Extreme
    "AnyDeskSoftwareGmbH.AnyDesk"                               # AnyDesk
    "Balena.Etcher"                                             # Balena Etcher
    "Bitwarden.Bitwarden"                                       # Bitwarden
    "BleachBit.BleachBit"                                       # Bleachbit
    "BlenderFoundation.Blender"                                 # Blender
    "Box.Box"                                                   # Box Client
    "Brave.Brave"                                               # Brave Browser
    "Codeblocks.Codeblocks"                                     # Code::Blocks
    "CPUID.CPU-Z"                                               # CPU-Z
    "Cryptomator.Cryptomator"                                   # Cryptomator
    "CrystalDewWorld.CrystalDiskInfo"                           # Crystal Disk Info
    "CrystalDewWorld.CrystalDiskMark"                           # Crystal Disk Mark
    "Discord.Discord"                                           # Discord
    "Docker.DockerDesktop"                                      # Docker Desktop
    "Digimezzo.Dopamine.3"                                      # Dopamine 3
    "dev47apps.DroidCam"                                        # DroidCam Client
    "Dropbox.Dropbox"                                           # Dropbox
    "ElectronicArts.EADesktop"                                  # EA Desktop App
    "Element.Element"                                           # Element Messenger
    "EpicGames.EpicGamesLauncher"                               # Epic Games Launcher
    "szTheory.exifcleaner"                                      # EXIF Cleaner
    "FilenCloud.FilenSync"                                      # Filen Sync
    "Mozilla.Firefox"                                           # Firefox
    "PrimateLabs.Geekbench.5"                                   # Geekbench
    "Git.Git"                                                   # Git
    "GitHub.GitHubDesktop"                                      # GitHub Desktop
    "GOG.Galaxy"                                                # GOG Galaxy 2.0
    "Google.Chrome"                                             # Google Chrome
    "Google.Drive"                                              # Google Drive
    "TechPowerUp.GPU-Z"                                         # GPU-Z
    "HandBrake.HandBrake"                                       # Handbrake
    "REALiX.HWiNFO"                                             # HWINFO-64
    "CPUID.HWMonitor"                                           # HWMonitor
    "LIGHTNINGUK.ImgBurn"                                       # ImgBurn
    "AppWork.JDownloader"                                       # JDownloader 2
    "KeePassXCTeam.KeePassXC"                                   # KeePassXC
    "LibreWolf.LibreWolf"                                       # LibreWolf
    "Malwarebytes.Malwarebytes"                                 # Malwarebytes
    "MarkText.MarkText"                                         # MarkText
    "Mega.MEGASync"                                             # MEGASync
    "Microsoft.Edge"                                            # Microsoft Edge
    "Microsoft.XMLNotepad"                                      # Microsoft XML Notepad
    "MKVToolNix.MKVToolNix"                                     # MKVToolNix
    "Insecure.Nmap"                                             # Nmap
    "OpenJS.NodeJS"                                             # NodeJS
    "Nord.NordLocker"                                           # NordLocker
    "Notepad++.Notepad++"                                       # Notepad++
    "Streetwriters.Notesnook"                                   # Notesnook
    "Notion.Notion"                                             # Notion
    "Nlitesoft.NTLite"                                          # NTLite
    "TechPowerUp.NVCleanstall"                                  # NVCleanstall
    "Nvidia.Broadcast"                                          # Nvidia Broadcast
    "OBSProject.OBSStudio"                                      # OBS Studio
    "Obsidian.Obsidian"                                         # Obsidian
    "Microsoft.OneDrive"                                        # OneDrive
    "OnionShare.OnionShare"                                     # OnionShare
    "Ookla.Speedtest.CLI"                                       # Ookla Speedtest CLI
    "namazso.OpenHashTab"                                       # OpenHashTab
    "Parsec.Parsec"                                             # Parsec
    "Playnite.Playnite"                                         # Playnite
    "splode.pomotroid"                                          # Pomotroid
    "Microsoft.PowerShell"                                      # Powershell 7
    "Microsoft.PowerToys"                                       # PowerToys
    "ProtonTechnologies.ProtonVPN"                              # Proton VPN
    "PuTTY.PuTTY"                                               # PuTTY
    "JetBrains.PyCharm.Community"                               # PyCharm Community Edition
    "Python.Python.3.11"                                        # Python 3
    "qBittorrent.qBittorrent"                                   # qBittorrent
    "Oxen.Session"                                              # Session Messenger
    "ShareX.ShareX"                                             # ShareX
    "OpenWhisperSystems.Signal"                                 # Signal Desktop
    "Shabinder.SpotiFlyer"                                      # SpotiFlyer
    "Spotify.Spotify"                                           # Spotify
    "Valve.Steam"                                               # Steam
    "TeamViewer.TeamViewer"                                     # TeamViewer
    "Telegram.TelegramDesktop"                                  # Telegram Desktop
    "CodeSector.TeraCopy"                                       # TeraCopy
    "Alex313031.Thorium"                                        # Thorium Browser
    "Appest.TickTick"                                           # TickTick
    "Doist.Todoist"                                             # Todoist
    "TorProject.TorBrowser"                                     # Tor Browser
    "Ubisoft.Connect"                                           # Ubisoft Connect
    "IDRIX.VeraCrypt"                                           # VeraCrypt
    "Microsoft.VisualStudio.2022.Community"                     # Visual Studio Community Edition 2022
    "Microsoft.VisualStudioCode"                                # Visual Studio Code
    "VMware.WorkstationPro"                                     # VMware Workstation Pro
    "Microsoft.WindowsTerminal"                                 # Windows Terminal                  (Installed by default on Win-11)
    "WinMerge.WinMerge"                                         # WinMerge
    "WinSCP.WinSCP"                                             # WinSCP
    "WiresharkFoundation.Wireshark"                             # Wireshark
    "XMind.XMind"                                               # Xmind
    "ZeroTier.ZeroTierOne"                                      # ZeroTier One
    "Zoom.Zoom"                                                 # Zoom

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
