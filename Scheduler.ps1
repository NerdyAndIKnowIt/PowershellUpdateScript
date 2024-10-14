
# prompt the user to elevate and enter administrator credentials:
Write-Host "This script creates a scheduled task for updating Amazon Windows computers and restarting them every Sunday at 5:30am."
Write-Host "Please make sure you have elevated your permissions and are running this script in an administrator command prompt!"

#hide the password from console view
$pass = Read-Host -Prompt "Enter the password for $($Env:UserName)"

$user = 'ANT\' + $Env:UserName

#specify the time the task will run
$time = '5:30am'

#run the script even if the computer is asleep or on battery power
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -WakeToRun

# add a scheduled task to Windows Task Scheduler to run the Updater.ps1 file during the specified time
$action = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument '-File C:\Users\chasbrec\Documents\Repos\PowershellUpdateScript\Updater.ps1' -WorkingDirectory 'C:\Windows\PowershellUpdateScript'
$trigger = New-ScheduledTaskTrigger -Weekly -DaysOfWeek Sunday -At $time
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "Windows Update Script" -Description "Updates and restarts Windows at a specified time every day" -Settings $settings -RunLevel Highest -User $user -Password $pass


#-File C:\Users\Public\PowershellUpdateScript\Updater.ps1