#!/bin/bash

# -----------------------------
# TCP Port Scanner using nc (netcat)
# Author: Tanmay Teckchandani
# Description:
#   Scans a range of TCP ports on a host, with color-coded output
#   and progress percentage.
# -----------------------------

# ANSI color codes
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'  # No Color

# ---------- Usage Check ----------
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <host> <start_port> <end_port>"
    exit 1
fi

# ---------- Input Parameters ----------
HOST=$1
START_PORT=$2
END_PORT=$3
TOTAL_PORTS=$((END_PORT - START_PORT + 1))
COUNT=0

# ---------- Info ----------
echo "Scanning host: $HOST from port $START_PORT to $END_PORT"
echo "-----------------------------------------------"

# ---------- Port Scanning Loop ----------
for port in $(seq $START_PORT $END_PORT); do
    # Run netcat to check port status
    nc -z -w1 $HOST $port &>/dev/null

    if [ $? -eq 0 ]; then
        echo -e "Port $port is ${GREEN}OPEN${NC}"
    else
        echo -e "Port $port is ${RED}CLOSED${NC}"
    fi

    # Progress display
    COUNT=$((COUNT + 1))
    PERCENT=$((COUNT * 100 / TOTAL_PORTS))
    echo -ne "[Progress: $PERCENT%]\r"
done

# Done
echo -e "\n${GREEN}Scan complete.${NC}"
