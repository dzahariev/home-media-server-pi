# Maintenance script

The script `maintenance.sh` can be used to regularly update the PRi, services stack and finally to reboot the host if it is needed.

The  script can be executed manually or to be scheduled for automated execution with cron:

```
# crontab -e
```
Add the following line:
```
0 4 * * 6 /home/ubuntu/home-media-server-pi/scripts/maintenance.sh 2>&1 | /home/ubuntu/home-media-server-pi/scripts/timestamp.sh >> /home/ubuntu/logs/maintenance.log
```

The script will be executed [At 04:00 on Saturday](https://crontab.guru/#0_4_*_*_6). Logs from result are stored in file `/home/ubuntu/logs/maintenance.log`.

To cleanup old log file content configure the logrotate by creating the file `/etc/logrotate.d/pi.maintenance` with content:
```
/home/ubuntu/logs/maintenance.log {
        monthly
        copytruncate
        missingok
        rotate 12
        compress
        delaycompress
        notifempty
}
```
