<#
.NOTES
   Author      : Dane C.
   GitHub      : https://github.com/TheDaneH3
#>

# Inform user of what the script does
Write-Host "`nThis script will create the necessary registry keys to fix the Oculus OVR88948175 setup issue.`n"
Write-Host "Created for the IT 3630 class at Mizzou.`n"

# Wait for the user to input a key to continue
Write-Host "Press any key to continue...`n"
$null = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

# Check if the "Oculus VR, LLC" key exists under HKEY_CURRENT_USER\SOFTWARE
if (!(Test-Path "HKCU:\SOFTWARE\Oculus VR, LLC")) {
    # Create the "Oculus VR, LLC" key under HKEY_CURRENT_USER\SOFTWARE
    New-Item -Path "HKCU:\SOFTWARE" -Name "Oculus VR, LLC"  | Out-Null
    Write-Host "Key 'Oculus VR, LLC' created.`n"
}
else {
    Write-Host "Key 'Oculus VR, LLC' already exists. Skipping creation.`n"
}

# Check if the "Oculus" key exists under "Oculus VR, LLC"
if (!(Test-Path "HKCU:\SOFTWARE\Oculus VR, LLC\Oculus")) {
    # Create the "Oculus" key under "Oculus VR, LLC"
    New-Item -Path "HKCU:\SOFTWARE\Oculus VR, LLC" -Name "Oculus"  | Out-Null
    Write-Host "Key 'Oculus' created.`n"
}
else {
    Write-Host "Key 'Oculus' already exists. Skipping creation.`n"
}

# Check if the "Libraries" key exists under "Oculus"
if (!(Test-Path "HKCU:\SOFTWARE\Oculus VR, LLC\Oculus\Libraries")) {
    # Create the "Libraries" key under "Oculus"
    New-Item -Path "HKCU:\SOFTWARE\Oculus VR, LLC\Oculus" -Name "Libraries"  | Out-Null
    Write-Host "Key 'Libraries' created.`n"
}
else {
    Write-Host "Key 'Libraries' already exists. Skipping creation.`n"
}

# Script Complete
Write-Host "Script Complete!`n"
Write-Warning "Please restart the Oculus software to apply changes."

# Pause at the end of the script
Write-Host "`nPress any key to continue..."
$null = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
