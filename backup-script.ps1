#!/bin/sh

BACKUP_DIR="/backups"
PROJECT_DIR="/ue5project"
BACKUP_NAME="growth_battles_backup_$(date +%Y%m%d_%H%M%S).tar.gz"

tar -czf "${BACKUP_DIR}/${BACKUP_NAME}" -C "${PROJECT_DIR}" .

# Keep only the last 5 backups
ls -t "${BACKUP_DIR}"/*.tar.gz | tail -n +6 | xargs rm -f