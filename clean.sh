#! bin/bash

# Dossier des journaux
LOG_DIR="/var/log"

# Nombre de jours après lesquels les logs seront supprimés
DAYS=7

echo "clean file in $LOG_DIR since $DAYS days"

find "$LOG_DIR" -type f -name "*.log" -mtime +$DAYS -exec rm -f {} \;

echo "finish clean!!"
