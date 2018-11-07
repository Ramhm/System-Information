#!/bin/bash
## R.Hakimi
##
# Hostname information
echo -e "\e[31;43m*** HOST INFORMATION ***\e[0m"
hostnamectl
echo ""
# System Resource 
echo -e "\e[31;43m*** SYSTEM RESOURCE ***\e[0m"
CPUCORE=$(cat /proc/cpuinfo | grep "processor"| wc -l)
echo CPU Core: $CPUCORE
MEMORY=$(free -m | grep "Mem" | awk '{print $2}')
echo "Memory:" $MEMORY "MB"
SWAP=$(free -m | grep "Swap" | awk '{print $2}')
echo "Swap:" $SWAP "MB"
echo ""
# OS disk space usage
echo -e "\e[31;43m*** OS DISK SPACE USAGE ***\e[0m"
df -hT /
DATA=$(mount | awk '{print $7}' | grep "/srv" ; echo $?)
	if [ "$DATA" == "0" ];then
df -hT /srv
	else
echo "Dir /SRV not exist"
	fi
echo ""
# System interface
echo -e "\e[31;43m*** SYSTEM INTERFACE ***\e[0m"
ip addr | grep ": " | awk '{print $2}' | cut -d ":" -f1
echo ""
# Interface IPs
echo -e "\e[31;43m*** INTERFACE IPs ***\e[0m"
ifconfig | grep "inet " | awk '{print $2,$3,$4,$5}'
echo ""
# System Resource
echo -e "\e[31;43m*** SYSTEM RESOURSE ***\e[0m"
CPUCORE=$(cat /proc/cpuinfo | grep "processor"| wc -l)
echo CPU Core: $CPUCORE
MEMORY=$(free -m | grep "Mem" | awk '{print $2}')
echo "Memory:" $MEMORY "MB"
SWAP=$(free -m | grep "Swap" | awk '{print $2}')
echo "Swap:" $SWAP "MB"
echo ""
# Public Service (TCP)
echo -e "\e[31;43m*** PUBLIC SERVICE (TCP) ***\e[0m"
netstat -npl | grep "0.0.0.0:" | grep "tcp" | awk -v OFS='\t' '{print $4,$5,$6,$7}'
