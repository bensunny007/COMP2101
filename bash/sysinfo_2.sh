#!/bin/bash
# sysinfo.sh - a script to display the report about the computer

#hostname of the device.
HOSTNAME=$(hostname)


#domain name of the device.
FQDN=$(domainname)


#The name and verson of operating system.
OS_NAME=$(lsb_release -d -s)


# ip address of the device.
IP_ADDRESS=$(ip a s ens33 | grep -w inet | awk '{print $2}')


#the amount of free space available in root filesystem.
FREE_DISK_SPACE=$(df -h /dev/sda3 | tail -1 | awk '{print $4}')


#Calling Variables to display the Output.
cat <<EOF
Report for $HOSTNAME

====================================================================== 
FQDN: $FQDN
Operating System name and version: $OS_NAME 
IP Address: $IP_ADDRESS
Root Filesystem Free Space: $FREE_DISK_SPACE

====================================================================== 
EOF
