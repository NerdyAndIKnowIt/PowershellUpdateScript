#update windows then restart the computer

Get-WindowsUpdate
Install-WindowsUpdate -AcceptAll -AutoReboot
Restart-Computer -Force