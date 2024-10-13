
# prompt the user to elevate and enter administrator credentials:
Write-Host "Please make sure you have elevated and are running this script in a administrator command prompt!"
$pass = Read-Host -Prompt "Enter the password for $($Env:UserName)"
$user = 'ANT\' + $Env:UserName

Write-Host $User

#specify the time the task will run
$time = '5:10pm'

# add a scheduled task to Windows Task Scheduler to run the Updater.ps1 file during the specified time
$action = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument '-File C:\Windows\PowershellUpdateScript\Updater.ps1' -WorkingDirectory 'C:\Windows\PowershellUpdateScript'
$trigger = New-ScheduledTaskTrigger -Daily -At $time 
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "Windows Update Script" -Description "Updates and restarts Windows at a specified time every day" -RunLevel Highest -User $user -Password $pass
