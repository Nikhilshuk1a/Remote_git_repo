#!/bin/bash

# Function to display CPU usage
show_cpu() {
    echo "CPU Usage:"
    top -bn1 | grep "Cpu(s)" | sed "s/Cpu(s):  *//" | awk '{print "  Usage: " $1 "%"}'
}

# Function to display memory usage
show_memory() {
    echo "Memory Usage:"
    free -h | awk '/^Mem:/ {print "  Total: " $2 "  Used: " $3 "  Free: " $4}'
}

# Function to display disk usage
show_disk() {
    echo "Disk Usage:"
    df -h | awk '$NF=="/"{printf "  Total: %s  Used: %s  Available: %s\n", $2, $3, $4}'
}

# Function to display network activity
show_network() {
    echo "Network Activity:"
    ifstat -i enp0s3 1 1 | awk '/^[0-9]/ {print "  RX: " $1 " KB/s  TX: " $2 " KB/s"}'
}

# Function to clear the screen and display the dashboard
refresh_dashboard() {
    clear
    echo "System Dashboard - $(date)"
    echo "-------------------------------"
    show_cpu
    show_memory
    show_disk
    show_network
}

# Main logic to handle command line switches and refresh interval
if [[ $# -eq 0 ]]; then
    # No arguments; run the dashboard in a loop
    while true; do
        refresh_dashboard
        sleep 5
    done
else
    # Command line arguments
    case "$1" in
        --cpu)
            show_cpu
            ;;
        --memory)
            show_memory
            ;;
        --disk)
            show_disk
            ;;
        --network)
            show_network
            ;;
        *)
            echo "Usage: $0 [--cpu | --memory | --disk | --network]"
            ;;
    esac
fi

