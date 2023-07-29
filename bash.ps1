param(
    [string]$path = "hdfs/",
    [string]$name_of_directory = "data"
)

# Check if the directory exists
$directoryPath = Join-Path $path $name_of_directory
if (Test-Path $directoryPath -PathType Container) {
    Write-Host "There is $($name_of_directory) Directory Exists!"
}
else {
    Write-Host "$($name_of_directory) Directory Not Exists!"
    # Create the directory
    New-Item -ItemType Directory -Path $directoryPath | Out-Null
}

# Final Step: Create a scheduled task to run the script daily at 07:00 AM
$trigger = New-ScheduledTaskTrigger -Daily -At 7am

$action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "-ExecutionPolicy Bypass -File ""C:\Users\Novin\Downloads\vix\bash.ps1"""
if (
Register-ScheduledTask -TaskName "CheckDirectoryTask" -Trigger $trigger -Action $action -User "Novin"   -RunLevel Highest
){
Write-Host "Scheduled task 'CheckDirectoryTask' created to run the script daily at 07:00 AM."
}

