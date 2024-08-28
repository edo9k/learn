#!/bin/bash

# ---
# checks if we have access to the internet. 
# ---

LOG_FILE="./network_accessibility_check.log"

# ANSI colors
RED='\033[31m'
BLUE='\033[34m'
NC='\033[0m'

print_message() {
  local color=$1
  local message=$2

  echo -e "${color}${message}${NC}" | tee -a $LOG_FILE
}

# main loop 
while true; do
  TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
  PING_OUTPUT=$(ping -c 1 8.8.8.8 2>&1) # Google ipv4 DNS address here

  if echo "$PING_OUTPUT" | grep -q "1 received"; then
    LATENCY=$(echo "$PING_OUTPUT" | grep 'rtt' | awk -F '/' '{print $5}')
    print_message "$BLUE" "$TIMESTAMP - we can access the web now. Latency: ${LATENCY} ms"
  else
    print_message "$RED" "$TIMESTAMP - web access is down."
    echo "Traceroute to 8.8.8.8:"     | tee -a $LOG_FILE
    tracepath -n 8.8.8.8              | tee -a $LOG_FILE
    echo "Network interface status:"  | tee -a $LOG_FILE
    ip link show                      | tee -a $LOG_FILE
  fi

  sleep 60
done

