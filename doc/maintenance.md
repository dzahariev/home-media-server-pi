# Maintenance script

The script `maintenance.sh` can be used to regularly update the PRi, services stack and finally to reboot the host if it is needed.

The  script can be executed manually or to be scheduled for automated execution with cron follwoing the steps:

```
# crontab -e
```
Add the following line:
```
0 4 * * * /home/ubuntu/home-media-server-pi/scripts/maintenance.sh 2>&1 | /home/ubuntu/home-media-server-pi/scripts/timestamp.sh >> /home/ubuntu/logs/maintenance.log
```

The script wil be executed [daily at 4:00 in the morning](https://crontab.guru/#0_4_*_*_*). Logs from result can be found in file `/home/ubuntu/logs/maintenance.log`.

To cleanup old log file contend configure the logrotate by creating the file `/etc/logrotate.d/pi.maintenance` with content:
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