$BackupDir = "E:\backups"
$ProjectDir = "E:\workspace\project"
$BackupName = "ue5_project_backup_$(Get-Date -Format 'yyyyMMdd_HHmmss').zip"

Compress-Archive -Path $ProjectDir -DestinationPath "$BackupDir\$BackupName"

# Keep only the last 5 backups
Get-ChildItem $BackupDir -Filter *.zip | Sort-Object CreationTime -Descending | Select-Object -Skip 5 | Remove-Item -Forcea