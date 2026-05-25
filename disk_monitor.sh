#!/bin/bash

# Author: Ghiridhar
# Project: Linux Disk Usage Monitor

# Threshold value
THRESHOLD=80

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

echo "Checking Disk Usage..."

# Get disk usage percentage
USAGE=$(df -h / | awk 'NR==2 {gsub("%",""); print $5}')

echo "Current Disk Usage: $USAGE%"

# Condition check
if [ "$USAGE" -ge "$THRESHOLD" ]; then
    echo -e "${RED}WARNING: Disk usage exceeded ${THRESHOLD}%${NC}"
else
    echo -e "${GREEN}Disk usage is normal${NC}"
fi

# Save output to log file
echo "$(date) : Disk Usage = $USAGE%" >> disk_usage.log
