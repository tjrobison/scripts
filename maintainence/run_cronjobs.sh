#!/bin/bash

echo  "==> Logrotate"
sudo sh /etc/cron.daily/logrotate
echo  "==> Man DB"
sudo sh /etc/cron.daily/man-db
echo  "==> UpdateDB"
sudo sh /etc/cron.daily/updatedb
echo  "==> 0Anacron"
sudo sh /etc/cron.hourly/0anacron
echo  "==> Get Ip"
getip
