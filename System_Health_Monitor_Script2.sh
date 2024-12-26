#!/bin/bash

LOGFILE="/var/log/system_health.log"
THRESHOLD_CPU=75
THRESHOLD_MEM=75
THRESHOLD_DISK=90


GREEN="\033[0;32m"
YELLOW="\033[1;33m"
RED="\033[0;31m"
NC="\033[0m" # No Color

send_notification() {
    MESSAGE=$1
    LEVEL=$2
    notify-send -u $LEVEL "System Health Alert" "$MESSAGE"
}

check_cpu() {
    CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
    echo "CPU Usage: $CPU_USAGE%" >> $LOGFILE
    CPU_USAGE_INT=$(printf "%.0f" $CPU_USAGE)
    if (( CPU_USAGE_INT > THRESHOLD_CPU )); then
        echo -e "${RED}Warning: High CPU Usage (${CPU_USAGE}%)${NC}"
        echo "Warning: High CPU Usage" >> $LOGFILE
        send_notification "High CPU usage detected: ${CPU_USAGE}%" "critical"
        return 1
    fi
    echo -e "${GREEN}CPU Usage is Normal (${CPU_USAGE}%)${NC}"
    return 0
}

check_memory() {
    MEM_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
    echo "Memory Usage: $MEM_USAGE%" >> $LOGFILE
    MEM_USAGE_INT=$(printf "%.0f" $MEM_USAGE)
    if (( MEM_USAGE_INT > THRESHOLD_MEM )); then
        echo -e "${RED}Warning: High Memory Usage (${MEM_USAGE}%)${NC}"
        echo "Warning: High Memory Usage" >> $LOGFILE
        send_notification "High memory usage detected: ${MEM_USAGE}%" "critical"
        return 2
    fi
    echo -e "${GREEN}Memory Usage is Normal (${MEM_USAGE}%)${NC}"
    return 0
}

check_disk() {
    DISK_USAGE=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')
    echo "Disk Usage: $DISK_USAGE%" >> $LOGFILE
    if (( DISK_USAGE > THRESHOLD_DISK )); then
        echo -e "${RED}Warning: High Disk Usage (${DISK_USAGE}%)${NC}"
        echo "Warning: High Disk Usage" >> $LOGFILE
        send_notification "High disk usage detected: ${DISK_USAGE}%" "critical"
        return 3
    fi
    echo -e "${GREEN}Disk Usage is Normal (${DISK_USAGE}%)${NC}"
    return 0
}


echo "System Health Monitor - $(date)" >> $LOGFILE
echo -e "${YELLOW}Checking System Health...${NC}"

check_cpu
check_memory
check_disk

echo -e "${GREEN}System Health Check Completed.${NC}"
echo "Check completed at $(date)" >> $LOGFILE
echo "------------------------------------" >> $LOGFILE

