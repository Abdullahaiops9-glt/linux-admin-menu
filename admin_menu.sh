#!/bin/bash

LOGFILE="/var/log/admin_menu.log"
DATE=$(date "+%Y-%m-%d %H:%M:%S")

# Root check
if [[ $EUID -ne 0 ]]; then
    echo "ERROR: Run as root or with sudo."
    exit 1
fi

log_action() {
    echo "$DATE ACTION: $1" >> "$LOGFILE"
}

while true; do
    echo "=============================="
    echo " Linux Operations Admin Console"
    echo "=============================="
    echo "1) Disk Usage (Top Mounts)"
    echo "2) Memory Status"
    echo "3) Top Running Processes"
    echo "4) System Summary"
    echo "5) Exit"
    echo "=============================="

    read -p "Choose an option: " choice

    case $choice in
        1)
            echo "--- Disk Usage ---"
            df -h | sort -hr -k5 | head
            log_action "Checked disk usage"
            ;;
        2)
            echo "--- Memory Status ---"
            free -m
            log_action "Checked memory status"
            ;;
        3)
            echo "--- Top Processes by CPU ---"
            ps aux --sort=-%cpu | head
            log_action "Viewed top processes"
            ;;
        4)
            echo "--- System Summary ---"
            uptime
            uname -a
            log_action "Viewed system summary"
            ;;
        5)
            log_action "Exited admin console"
            echo "Exiting..."
            break
            ;;
        *)
            echo "Invalid option"
            ;;
    esac
done

