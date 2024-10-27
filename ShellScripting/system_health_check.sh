#!/bin/bash

#define thresholad value for CPU, memory, disk

CPU_THRESHOLD=80
MEMORY_THRESHOLD=80
DISK_THRESHOLD=80

LOG_FILE="system_health_check.txt"

calculate_cpu_usage(){
	read -r _ user nice system idle iowait irq softirq steel < /proc/stat

	total=$((user + nice + system + idle + iowait + irq + softirq + steal))
	idle_time=$((idle + iowait))

	CPU_USAGE=$((100 * (total - idle_time) / total))

}

#Check CPU
check_cpu(){
	#CPU_OUTPUT=$(top -bn1 | grep "CPu(s)") #top command take one snapshoot of cpu usage
	#echo "Raw CPU output:$CPU_OUTPUT" >> $LOG_FILE

	#CPU_OUTPUT=$(echo "$CPU_OUTPUT" | awk '{print 100 - $8}')
	
	if [[ -z "$CPU_USAGE" ]]; then
		echo "Error: unable to retrieve CPU usage." >> $LOG_FILE
		return
	fi


	echo "CPU Usage: $CPU_USAGE%" >> $LOG_FILE
	if (( $(echo " $CPU_USAGE > $CPU_THRESHOLD" | bc -l) )); then
		echo "Warming: High CPU usage detected!" >> $LOG_FILE
	fi
}

#Check memory
check_memory(){	
	MEMORY_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')

	if [[ -z "$MEMORY_USAGE" ]]; then
                echo "Error: unable to retrieve CPU usage." >> $LOG_FILE
                return
	fi
	
	echo "Memory Usage: $MEMORY_USAGE%" >> $LOG_FILE
	if (( $(echo "$MEMORY_USAGE > $MEMORY_THRESHOLD" | bc -l) )); then
		echo "Warning: High memory usage detected!" >> $LOG_FILE

	fi

}

#Checj Disk
check_disk(){
	DISK_USAGE=$(df / | grep / | awk '{print $5}' | sed 's/%//g')

	if [[ -z "$DISK_USAGE" ]]; then
                echo "Error: unable to retrieve CPU usage." >> $LOG_FILE
                return
	fi
	
	echo "Disk Usage: $DISK_USAGE%" >> $LOG_FILE
	if (( $DISK_USAGE > $DISK_THRESHOLD )) then
		echo "Warning: Low disk space!" >. $LOG_FILE
	fi
}

#Check network connection
check_network(){
	if ping -c 1 google.com &> /dev/null; then
		echo "Network: connected!" >> $LOG_FILE
	else
		echo "Network: disconnected" >> $LOG_FILE
	fi
}

#Run Check funtion
{
echo "System Health Check - $(date)" >> $LOG_FILE
calculate_cpu_usage
check_cpu
check_memory
check_disk
check_network
echo "Check complete." >> $LOG_FILE

} >> $LOG_FILE



























