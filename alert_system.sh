#!bin/bash
#!/bin/bash

# Seuils
CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=90

# CPU utilisation (moyenne 1 minute)
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}' | cut -d'.' -f1)

# RAM utilisation
MEM_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}' | cut -d'.' -f1)

# Disque utilisation (sur /)
DISK_USAGE=$(df / | grep / | awk '{ print $5}' | sed 's/%//g')

ALERT_MSG=""

if [ "$CPU_USAGE" -gt "$CPU_THRESHOLD" ]; then
    ALERT_MSG+="CPU: ${CPU_USAGE}% utilisé (seuil ${CPU_THRESHOLD}%)\n"
fi

if [ "$MEM_USAGE" -gt "$MEM_THRESHOLD" ]; then
    ALERT_MSG+="RAM: ${MEM_USAGE}% utilisé (seuil ${MEM_THRESHOLD}%)\n"
fi

if [ "$DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then
    ALERT_MSG+="Disque: ${DISK_USAGE}% utilisé (seuil ${DISK_THRESHOLD}%)\n"
fi

if [ ! -z "$ALERT_MSG" ]; then
    echo -e "$ALERT_MSG" | mail -s "⚠️ Alerte système" ton.email@example.com
fi
