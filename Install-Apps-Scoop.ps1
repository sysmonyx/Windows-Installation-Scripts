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
#   Description:    This script installs specified apps using the Scoop Package Manager for Windows.
#
#   Last Updated:   30.04.2023
################################################################################################################################
# Perform an initial update.
Write-Output "`nPerforming initial update . . . .`n"
choco upgrade all
Write-Output "`nUpdate complete.`n"

# Apps.
$apps = @(

    # Sorted A-Z.

)

# Install apps.
foreach ($app in $apps){
    Write-Output "`n# Now installing : $app . . . .`n"
    choco install $app -yr
    Write-Output "`n# Finished installing $app.`n"
}

# Perform closing update.
Write-Output "`nPerforming closing update . . . .`n"
choco upgrade all
Write-Output "`nUpdate complete.`n"

# Wait for Key-Press from user.
Write-Output "`nComplete. Press any key to continue . . . .`n"
[Console]::ReadKey($true) | Out-Null
################################################################################################################################