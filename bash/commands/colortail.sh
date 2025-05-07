#!/bin/bash

colortail() {
    if [ $# -ne 1 ]; then
        echo "Usage: colortail <logfile>"
        return 1
    fi

    local logfile="$1"

    # Define color codes
    local RESET='\033[0m'
    local DEBUG_COLOR='\033[34m'    # Blue
    local TRACE_COLOR='\033[36m'     # Cyan
    local INFO_COLOR='\033[32m'      # Green
    local NOTICE_COLOR='\033[32m'    # Green (same as INFO)
    local WARNING_COLOR='\033[33m'    # Yellow
    local ERROR_COLOR='\033[31m'     # Red
    local CRITICAL_COLOR='\033[41m'  # Red background
    local FATAL_COLOR='\033[41m'     # Red background
    local ALERT_COLOR='\033[35m'     # Magenta
    local EMERGENCY_COLOR='\033[41m' # Red background
    local SUCCESS_COLOR='\033[32m'   # Green
    local SKIP_COLOR='\033[33m'      # Yellow (same as WARNING)

    # Use tail -f and colorize output based on log level
    tail -f "$logfile" | while IFS= read -r line; do
        if [[ "$line" == *"DEBUG"* ]]; then
            echo -e "${DEBUG_COLOR}${line}${RESET}"
        elif [[ "$line" == *"TRACE"* ]]; then
            echo -e "${TRACE_COLOR}${line}${RESET}"
        elif [[ "$line" == *"INFO"* ]]; then
            echo -e "${INFO_COLOR}${line}${RESET}"
        elif [[ "$line" == *"NOTICE"* ]]; then
            echo -e "${NOTICE_COLOR}${line}${RESET}"
        elif [[ "$line" == *"WARNING"* ]]; then
            echo -e "${WARNING_COLOR}${line}${RESET}"
        elif [[ "$line" == *"ERROR"* ]]; then
            echo -e "${ERROR_COLOR}${line}${RESET}"
        elif [[ "$line" == *"CRITICAL"* ]]; then
            echo -e "${CRITICAL_COLOR}${line}${RESET}"
        elif [[ "$line" == *"FATAL"* ]]; then
            echo -e "${FATAL_COLOR}${line}${RESET}"
        elif [[ "$line" == *"ALERT"* ]]; then
            echo -e "${ALERT_COLOR}${line}${RESET}"
        elif [[ "$line" == *"EMERGENCY"* ]]; then
            echo -e "${EMERGENCY_COLOR}${line}${RESET}"
        elif [[ "$line" == *"SUCCESS"* ]]; then
            echo -e "${SUCCESS_COLOR}${line}${RESET}"
        elif [[ "$line" == *"SKIP"* ]]; then
            echo -e "${SKIP_COLOR}${line}${RESET}"
        else
            echo "$line"  # Default case, no color
        fi
    done
}

