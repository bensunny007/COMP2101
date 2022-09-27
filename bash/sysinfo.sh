#!/bin/bash
# sysinfo.sh - a script to display information about a computer
# Name of the host
FQDN=$(hostname)
# The operating system name and version, identifying the Linux distro in use from a command such as hostnamectl
OS_NAME=$(hostnamectl)
# Any IP addresses the machine has that are not on the 127 network
IP_ADDRESSES=$(hostname -I | grep -v "127.")
# The amount of space available in only the root filesystem, displayed as a human-friendly number
ROOT_SPACE=$(df -h /dev/sda3)

# Output all of the collected information

echo "FQDN: $FQDN"

echo "Operating System: $OS_NAME"

echo "IP Addresses: $IP_ADDRESSES"

echo "Root Filesystem Space: $ROOT_SPACE"

exit 0
