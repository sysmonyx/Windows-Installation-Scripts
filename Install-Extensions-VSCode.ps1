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
#   Last Updated:   16.03.2024
################################################################################################################################
# Elevate script to have Administrative privileges.
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
    { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

# Extensions.
$Extensions = @(

    # Sorted A-Z.
    "formulahendry.auto-close-tag"                              # Auto Close Tag
    "ms-vscode.cpptools"                                        # C/C++
    "ms-vscode.cpptools-extension-pack"                         # C/C++ Extension Pack
    "ms-dotnettools.csharp"                                     # C#
    "gitlab.gitlab-workflow"                                    # GitLab Workflow
    "sidthesloth.html5-boilerplate"                             # HTML-5 Boilerplate
    "ecmel.vscode-html-css"                                     # HTML CSS Support
    "oderwat.indent-rainbow"                                    # Indent Rainbow
    "visualstudioexptteam.vscodeintellicode"                    # Intellicode
    "redhat.java"                                               # Language Support for JAVA
    "ritwickdey.liveserver"                                     # Live Server
    "shd101wyy.markdown-preview-enhanced"                       # Markdown Preview Enhanced
    "christian-kohler.path-intellisense"                        # Path Intellisense
    "pnp.polacode"                                              # Polacode by P&P
    "ms-vscode.PowerShell"                                      # Powershell
    "esbenp.prettier-vscode"                                    # Prettier
    "ms-python.vscode-pylance"                                  # Pylance
    "ms-python.python"                                          # Python
    "ionutvmi.reg"                                              # REG
    "ms-vscode-remote.remote-ssh"                               # Remote - SSH
    "ms-vscode-remote.remote-ssh-edit"                          # Remote - SSH: Editing Configuration Files
    "ms-vscode.remote-explorer"                                 # Remote Explorer
    "redhat.vscode-xml"                                         # XML
    "dotjoshjohnson.xml"                                        # XML Tools
    "redhat.vscode-yaml"                                        # YAML

    # Themes.
    "antfu.icons-carbon"                                        # Carbon Product Theme
    "pkief.material-icon-theme"                                 # Material Icon Theme
    "joelcrosby.one-dark-darker"                                # One Dark Darker

)

# Install the Extensions.
foreach ($Extension in $Extensions)
{
	code --install-extension $Extension
}

# Wait for Key-Press from user.
Write-Output "`nComplete. Press any key to continue . . . .`n"
[Console]::ReadKey($true) | Out-Null
################################################################################################################################
