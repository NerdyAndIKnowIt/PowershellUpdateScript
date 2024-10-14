#update windows

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.MessageBox]::Show("The computer will update then restart in the next several minutes. Please save your work.", "Restart Warning", 'OK', 'Warning')
Start-Sleep -Seconds 60

$job = Start-Job -ScriptBlock {
    Get-WindowsUpdate
    Install-WindowsUpdate -AcceptAll -AutoReboot
}

#if the updates take longer than 10 minutes to run, force the computer to restart
#after 9 minutes have passed, warn the user that the computer will restart in 1 minute
$restarttimeout = 600 
$warningtimeout = 540

while ($job.State -eq 'Running') {
    Start-Sleep -Seconds 60
    if ($stopwatch.Elapsed.TotalSeconds -gt $warningtimeout) {
        [System.Windows.Forms.MessageBox]::Show("The computer will restart in 1 minute. Please save your work.", "Restart Warning", 'OK', 'Warning')
        
    }

    if ($stopwatch.Elapsed.TotalSeconds -gt $restarttimeout) {
        Stop-Job -Job $job
        Restart-Computer -Force
    }
}

#if the computer requires no updates or has completed updates, restart anyways to log out stale user profiles
[System.Windows.Forms.MessageBox]::Show("The computer will restart in 1 minute. Please save your work.", "Restart Warning", 'OK', 'Warning')
Start-Sleep -Seconds 60
Restart-Computer -Force


