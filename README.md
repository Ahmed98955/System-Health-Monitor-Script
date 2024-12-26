# System Health Monitor Script

This is a shell script that monitors your system's health by checking CPU usage, memory usage, and disk usage. It logs the results and sends notifications when any of the system parameters exceed a predefined threshold.

## Features:
- Checks CPU, memory, and disk usage.
- Sends notifications when thresholds are exceeded.
- Logs the results to `/var/log/system_health.log`.
- Outputs colored feedback in the terminal.

## Usage:
1. Download the script.
2. Make it executable: `chmod +x System_Health_Monitor_Script.sh`.
3. Run it with `sudo` privileges: `sudo ./System_Health_Monitor_Script.sh`.

## 1.1 Script Breakdown:
- LOGFILE: Path to the log file where system health data will be saved.
- THRESHOLD_CPU, THRESHOLD_MEM, THRESHOLD_DISK: Predefined thresholds for CPU, memory, and disk usage.
- If any of these exceed the limit, a warning is triggered.
![Script Breakdown](https://github.com/user-attachments/assets/c03d2028-91b3-44da-98bc-a6fc87382e8b)

## 1.2. Script Breakdown:
- These variables define colors for terminal output to make the results more readable.
![Script Breakdown](https://github.com/user-attachments/assets/e92114d2-69f5-4ddb-82d8-327610aacd1d)

## 2. send_notification Function:
- This function sends a desktop notification with a message and a specified urgency level (`critical`).
![image](https://github.com/user-attachments/assets/1fb2c8f5-c35d-4da1-93b4-1e3f91d87e4a)

## 3. check_cpu Function:
- This function checks the CPU usage using the `top` command, logs the result, and checks if it exceeds the threshold.
- If the CPU usage is high, it sends a notification and prints a red warning message in the terminal.
![check_cpu Function](https://github.com/user-attachments/assets/6b9b870d-3374-4252-84ca-295d5a6e1c55)


## 4. check_memory Function:
- This function checks memory usage using the `free` command and compares it to the threshold.
- It logs and displays warnings in red if memory usage is too high.
  
![image](https://github.com/user-attachments/assets/3ff46276-b665-4f99-8d53-1ecb45ec3bf9)

## 5. check_disk Function:
- This function checks disk usage using the `df` command and logs the usage.
- It also sends a notification if the disk usage exceeds the threshold.
![image](https://github.com/user-attachments/assets/f6f7bccb-e480-424d-887d-de95bde72a65)

## 6. Main Execution Block:
- This is the main section where the script starts by logging the start time.
- It runs the checks for CPU, memory, and disk usage in sequence.
- At the end, it logs the completion time and prints a success message in green.
![image](https://github.com/user-attachments/assets/71bff514-10b9-4f2b-9ddf-011575dce2df)
















