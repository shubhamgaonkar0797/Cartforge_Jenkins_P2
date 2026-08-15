#!/bin/bash

BACKUP_DIR="/backup/jenkins"
DATE=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_FILE="$BACKUP_DIR/jenkins-backup-$DATE.tar.gz"

echo "Creating Jenkins backup directory..."
sudo mkdir -p "$BACKUP_DIR"

echo "Starting Jenkins backup..."

sudo tar -czf "$BACKUP_FILE" /var/lib/jenkins

if [ $? -eq 0 ]; then
    echo "Jenkins backup completed successfully."
    echo "Backup file: $BACKUP_FILE"
else
    echo "Jenkins backup failed."
    exit 1
fi

echo "Backup details:"
sudo ls -lh "$BACKUP_FILE"
