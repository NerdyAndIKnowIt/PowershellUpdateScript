# Powershell Update Script
_Made by Breanna Chase (chasbrec)_
Source repository: https://github.com/NerdyAndIKnowIt/PowershellUpdateScript

### Description:
These scripts are for automatically updating and restarting shared Amazon Windows computers every Sunday at 5:30am during maintenance window. This will reduce time that IT will need to spend manually updating shared computers, ensure any stale profiles are logged out to increase performance.

### Prerequisites to use:
- you must have administrator permissions

### How to use:
1. Go to the github repository: https://github.com/NerdyAndIKnowIt/PowershellUpdateScript
2. Download the Updater.ps1 and Scheduler.ps1 file from Github by clicking on the files, click the "3 dots" option in the top right, then click download.
3. Open File Explorer, go to this location: C:\Users\Public
4. Create a new folder called: PowershellUpdateScript
5. Copy Updater.ps1 and Scheduler.ps1 from your downloads folder and move them into the C:\Users\Public\PowershellUpdateScript folder
6. Elevate in the command prompt
7. Right click on the Windows desktop icon, press Windows Powershell (Admin) to run Powershell as an administrator
8. Enter your administrator credentials when prompted
9. Type this command: cd C:\Users\Public\PowershellUpdateScript
10. Type this command: .\Scheduler.ps1
11. Profit!

## FAQ
- Q: Will it warn users before restarting? 
- A: Yes, it warns users before the updates start and after 9 minutes of running updates it will warn users that the computer will restart in 1 minute. It will restart regardless if updates are needed or not to clear stale user profiles.

- Q: Will this run outside of the scheduled time?
- A: No

- Q: If a computer is asleep or shutdown, will the script still run?
- A: Yes if the computer is asleep. It will not boot the computer if it is turned off to run the script and it will not run the script if the computer missed the scheduled time. This is to minimize the impact to operations.

Please reach out if you have any questions, thanks!