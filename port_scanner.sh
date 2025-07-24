#!/bin/bash

# -----------------------------
# TCP Port Scanner using nc (netcat)
# Author: Tanmay Teckchandani
# Description:
#   This script scans a range of TCP ports on a target host and reports
#   which ports are open using the 'nc' (netcat) tool.
# -----------------------------

# ---------- Usage Check ----------
# The script requires exactly 3 arguments:
#   1. Target host (IP or domain)
#   2. Start port number
#   3. End port number
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <host> <start_port> <end_port>"
    exit 1
fi

# ---------- Input Parameters ----------
HOST=$1
START_PORT=$2
END_PORT=$3

# ---------- Info ----------
echo "Scanning host: $HOST from port $START_PORT to $END_PORT"
echo "-----------------------------------------------"

# ---------- Port Scanning Loop ----------
# Loop through each port in the specified range
for port in $(seq $START_PORT $END_PORT); do
    # Use nc (netcat) to test the port
    # -z: Zero-I/O mode (just check if port is open)
    # -w1: Timeout after 1 second
    nc -z -w1 $HOST $port 2>/dev/null

    # Check the exit code of nc:
    # 0 = port is open
    # non-zero = port is closed or filtered
    if [ $? -eq 0 ]; then
        echo "Port $port is OPEN"
    else
        echo "Port $port is CLOSED"
    fi
done
