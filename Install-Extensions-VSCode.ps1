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
#   Description:    This script installs the specified Visual Studio Code Extensions automatically.
#
################################################################################################################################
# Elevate script to have Administrative privileges.
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
    { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

# Extensions.
$Extensions = @(

    # Sorted A-Z.
    "eliverlara.andromeda"                                      # Andromeda Theme
    "formulahendry.auto-close-tag"                              # Auto Close Tag
    "visualstudioexptteam"                                      # Intellicode
    "ritwickdey.liveserver"                                     # Live Server
    "pkief.material-icon-theme"                                 # Material Icon Theme
    "christian-kohler.path-intellisense"                        # Path Intellisense
    "pnp.polacode"                                              # Polacode by P&P
    "ms-vscode.PowerShell"                                      # Powershell
    "esbenp.prettier-vscode"                                    # Prettier
    "ms-python.python"                                          # Python
    "ionutvmi.reg"                                              # REG
    "ms-vscode-remote.remote-ssh"                               # Remote - SSH
    "ms-vscode-remote.remote-ssh-edit"                          # Remote - SSH: Editing Configuration Files
    "ms-vscode.remote-explorer"                                 # Remote Explorer
    "redhat.vscode-xml"                                         # XML
    "redhat.vscode-yaml"                                        # YAML

)

# Install the Extensions.
foreach ($Extension in $Extensions)
{
	 & "$env:ProgramFiles\Microsoft VS Code\bin\code.cmd" --install-extension $Extension
}

# Wait for Key-Press from user.
Write-Output "`nComplete. Press any key to continue . . . .`n"
[Console]::ReadKey($true) | Out-Null
################################################################################################################################