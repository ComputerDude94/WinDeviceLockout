# Define the registry path for the legal notice
$registryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"

# Define the caption and text for the legal notice
$legalNoticeCaption = "Device Locked"
$legalNoticeText = "This device is locked, please return it to West Chester University Help Desk to preserve your files."

# Set the legal notice caption
Set-ItemProperty -Path $registryPath -Name "LegalNoticeCaption" -Value $legalNoticeCaption

# Set the legal notice text
Set-ItemProperty -Path $registryPath -Name "LegalNoticeText" -Value $legalNoticeText

Write-Host "Login screen message has been set successfully."
