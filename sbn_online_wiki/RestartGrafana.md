---
layout: page
title: Instructions for restarting the Grafana monitoring system.
hero_height: is-small
---

_Note: Grafana is running in a singularity container, which is managed by SystemD._
 
* ssh into grafana server as root

* stop grafana container with "systemctl stop grafana.service; systemctl reset-failed grafana.service"

_Note: Sometimes it may be necessary to delete old pid or authdigest_shm files._

```bash
rm /data/grafana/data/container/pids/*.pid
rm /data/grafana/data/container/httpd/data/authdigest_shm.*
```
or if you are using sbnd-evb04 the grafana directories are in 
```bash 
/scratch_local/grafana
```
Often the log that is the most trouble and needs to be removed (as root) is 
```bash 
rm -f /scratch_local/grafana/logs/graphite/exception.log
```

* start grafana container with  session with  "systemctl start  grafana.service; systemctl status grafana.service".

_An output example from the status check is given below._
   
```bash
bash-4.2# systemctl status grafana.service
● grafana.service - Grafana service
   Loaded: loaded (/etc/systemd/system/grafana.service; enabled; vendor preset: disabled)
   Active: active (running) since Tue 2021-09-07 07:39:48 CDT; 2 weeks 2 days ago
 Main PID: 2165 (grafana-ctrl.sh)
    Tasks: 65
   CGroup: /system.slice/grafana.service
           ├─  2165 /bin/bash /data/grafana/grafana-ctrl.sh
           ├─  2190 Singularity runtime parent
           ├─  2994 sinit
           ├─  3041 /bin/bash /run.sh /mnt/work/container
           ├─  3423 /usr/bin/python2 -s /usr/bin/carbon-cache --config=/mnt/work/container/carbon/config/carbon.conf --pidfile=/mnt/work/container/pids/carbon.pid --logdir=/mnt/work/container/logs/ca...
           ├─  3436 /usr/sbin/grafana-server --config=/mnt/work/container/grafana/config/grafana.ini --pidfile=/mnt/work/container/pids/grafana.pid --packaging=rpm --homepath=/usr/share/grafana cfg:d...
           ├─  3439 httpd -f /mnt/work/container/httpd/config/conf/httpd.conf
           ├─121718 httpd -f /mnt/work/container/httpd/config/conf/httpd.conf
           ├─154520 httpd -f /mnt/work/container/httpd/config/conf/httpd.conf
           ├─167132 httpd -f /mnt/work/container/httpd/config/conf/httpd.conf
           ├─167142 httpd -f /mnt/work/container/httpd/config/conf/httpd.conf
           ├─167151 httpd -f /mnt/work/container/httpd/config/conf/httpd.conf
           ├─168054 httpd -f /mnt/work/container/httpd/config/conf/httpd.conf
           ├─173909 httpd -f /mnt/work/container/httpd/config/conf/httpd.conf
           ├─173913 httpd -f /mnt/work/container/httpd/config/conf/httpd.conf
           ├─173940 httpd -f /mnt/work/container/httpd/config/conf/httpd.conf
           ├─173952 httpd -f /mnt/work/container/httpd/config/conf/httpd.conf
           ├─174003 httpd -f /mnt/work/container/httpd/config/conf/httpd.conf
           ├─177174 httpd -f /mnt/work/container/httpd/config/conf/httpd.conf
           ├─179878 httpd -f /mnt/work/container/httpd/config/conf/httpd.conf
           ├─212623 httpd -f /mnt/work/container/httpd/config/conf/httpd.conf
           ├─214930 httpd -f /mnt/work/container/httpd/config/conf/httpd.conf
           ├─218665 httpd -f /mnt/work/container/httpd/config/conf/httpd.conf
           ├─232726 httpd -f /mnt/work/container/httpd/config/conf/httpd.conf
           └─233594 sleep 2

Sep 23 11:23:26 grafana.example.com grafana-ctrl.sh[2165]: + '[' -f /mnt/work/container/terminate-grafana.sh ']'
Sep 23 11:23:26 grafana.example.com grafana-ctrl.sh[2165]: + sleep 2
Sep 23 11:23:28 grafana.example.com grafana-ctrl.sh[2165]: + '[' -f /mnt/work/container/terminate-grafana.sh ']'
Sep 23 11:23:28 grafana.example.com grafana-ctrl.sh[2165]: + sleep 2
Sep 23 11:23:30 grafana.example.com grafana-ctrl.sh[2165]: + '[' -f /mnt/work/container/terminate-grafana.sh ']'
Sep 23 11:23:30 grafana.example.com grafana-ctrl.sh[2165]: + sleep 2
Sep 23 11:23:32 grafana.example.com grafana-ctrl.sh[2165]: + '[' -f /mnt/work/container/terminate-grafana.sh ']'
Sep 23 11:23:32 grafana.example.com grafana-ctrl.sh[2165]: + sleep 2
Sep 23 11:23:34 grafana.example.com grafana-ctrl.sh[2165]: + '[' -f /mnt/work/container/terminate-grafana.sh ']'
Sep 23 11:23:34 grafana.example.com grafana-ctrl.sh[2165]: + sleep 2
```

* if the reported status is not _active (running)_ check all logs for errors in "/data/grafana/data/container/logs" directory.

```bash
bash-4.2# find /data/grafana/data/container/logs
/data/grafana/data/container/logs
/data/grafana/data/container/logs/carbon
/data/grafana/data/container/logs/carbon/console.log
/data/grafana/data/container/logs/carbon/listener.log
/data/grafana/data/container/logs/carbon/creates.log
/data/grafana/data/container/logs/grafana
/data/grafana/data/container/logs/grafana/startup.log
/data/grafana/data/container/logs/grafana/grafana.log
/data/grafana/data/container/logs/graphite
/data/grafana/data/container/logs/graphite/info.log
/data/grafana/data/container/logs/graphite/exception.log
/data/grafana/data/container/logs/httpd
/data/grafana/data/container/logs/httpd/error_log
/data/grafana/data/container/logs/httpd/graphite-web-error.log
/data/grafana/data/container/logs/httpd/access_log
/data/grafana/data/container/logs/httpd/graphite-web-access.log
```
