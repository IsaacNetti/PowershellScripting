# Created by Isaac Netti github.com/isaacnetti

# Retreive all files with download date older than 30 days
function Get-Files {
    $files = Get-ChildItem -Path "$env:USERPROFILE\Downloads" -File -Recurse | Where-Object {$_.LastWriteTime -lt (Get-Date).AddDays(-30)}
    return $files
}

# Remove all files
function Remove-Files {
    param (
        [array]$files
    )

    $numFiles = $files.Count
    $count = 0

    foreach($file in $files){
        # Keep track of percentage complete
        $count++
        $completion =($count / $numFiles) * 100

        # Display percentage
        Write-Progress -Activity "Deleting files" -PercentComplete $completion

        # Delete Files
        Remove-Files -Path $file.Fullname -WhatIf
    }
    
}

Write-Host "This program will search your 'Downloads' folder for files older than 30 days and delete them."
do {
    $response = Read-Host -Prompt "Would you like to continue? y/n"
    if ($response -eq "n") {
        exit
    }
    if ($response -eq "y") {
        Write-Host "Retreiving files..."
    }
    else {
        Write-Host "Invalid Response" -ForegroundColor Red
    }
} until (
    $response -eq "y"
)

$files = Get-Files

Write-Host "Found $($files.count) files older than 30 days"
do {
    $response = Read-Host -Prompt "Would you like to remove them? y/n"
    if ($response -eq "n") {
        exit
    }
    if ($response -eq "y") {
        Write-Host "This action is irreversable" -ForegroundColor Red
    }
    else {
        Write-Host "Invalid Response" -ForegroundColor Red
    }
} until (
    $response -eq "y"
)
do {
    $response = Read-Host -Prompt "Delete $($files.count) files? y/n"
    if ($response -eq "n") {
        exit
    }
    if ($response -eq "y") {
        Write-Host "Deleting $($files.count) files"
        Remove-Files $files
    }
    else {
        Write-Host "Invalid Response" -ForegroundColor Red
    }
} until (
    $response -eq "y"
)

Read-Host -Prompt "$($file.count) deleted. Press Enter to Exit"