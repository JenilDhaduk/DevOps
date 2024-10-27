# **System Health Check**

## **Project Overview**
This **System Health Check** script is a Bash-based tool designed to monitor and log the health of a Linux system. It checks CPU, memory, and disk usage, as well as network connectivity. The results are logged in a file, providing an easy way to monitor resource utilization and spot potential performance issues.

## **Files in the project**
- system_health_check.sh: The main script that performs CPU, memory, disk usage, and network checks.
- system_health_log.txt: The log file that stores each check's output.

## **Features**
- **CPU Usage Monitoring**: Logs the percentage of CPU usage and alerts if usage exceeds a set threshold.
- **Memory Usage Monitoring**: Logs the percentage of memory usage and alerts if usage exceeds a set threshold.
- **Disk Usage Monitoring**: Logs disk space usage and alerts when space usage reaches a critical level.
- **Network Connectivity Check**: Verifies internet connectivity and logs the connection status.

## **Prerequisites**
- Linux operating system (Ubuntu)
- Basic bash environment

## **Project Structure**
- Devops
   ----> ShellScripting
               |--------> system_health_check.sh, system_health_check.txt
## **Usage**
1. Clone the repository to your local machine:
   - git clone https://github.com/JenilDhaduk/DevOps.git
2. Navigate to the directory containing the system_health_check.sh script:
   - cd DevOps/ShellScripting
3. Make the script executable:
   - chmod +x system_health_check.sh
4. Run the script:
   - ./system_health_check.sh
5. View the log file to check system health status:
   - cat system_health_log.txt

## **Customization**
**Thresholds:** The script allows customization of CPU, memory, and disk usage thresholds. These can be modified at the top of the script:
CPU_THRESHOLD=80 
MEMORY_THRESHOLD=80
DISK_THRESHOLD=80

**Log File:** By default, logs are saved in system_health_log.txt. You can change this file name in the script.

## **Contributions**
Feel free to submit issues or fork the project to contribute additional features or improvements. All contributions are welcome!
