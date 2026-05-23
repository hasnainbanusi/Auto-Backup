#!/bin/bash

#bakcup for /devops/cloud/auto
SOURCE_DIR="$HOME/devops/cloud/auto" # Location of the File you are running
BACKUP_DIR="$HOME/backup" 	     # Location where the backup file  will SAVE
DATE=$(date +%Y-%m-%d_%H-%M-%S)      # Date with the backup file for reference
BACKUP_FILE="backup.tar.gz"          # Actual backup file type

#create Backup Folder if not found
if [[ ! -d "$BACKUP_DIR" ]]; then
	mkdir -p "$BACKUP_DIR"
	echo "Backup Directory created successfully: $BACKUP_DIR"
fi

# Start Backup Now
echo "Backup is started..."
tar -czf "$BACKUP_DIR/$BACKUP_FILE" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"
if [[ $? -eq 0 ]]; then
	echo "Backup is Done: $BACKUP_DIR/$BACKUP_FILE"
else
	echo "Check the backup code."
fi
