---
layout: page
title: Instructions for configuring a cron job that monitors the /data disk space on EventBulders and publishes it to Grafana.
hero_height: is-small
---

* Check out the latest sbndaq project code into your [MRB](https://sbnsoftware.github.io/sbn_online_wiki/Installation) area, run a build, followed by the ```mrb -i; mrbslp``` command that installs database tools into the ```$SBNDAQ_DIR/configDB_tools``` directory.

* Review [$HOME/.artdaq_grafana.env](https://github.com/SBNSoftware/sbndaq/blob/develop/configDB_tools/config/artdaq_grafana.env.example) or create a new one if required. _Ask Wes or Gennadiy to send you a working copy of .artdaq_grafana.env._

* Setup the sbndaq product from the ```$MRB_TOP/localProducts_*``` directory and confirm that the ```disk_monitor.sh``` script will execute from ```$MRB_TOP/localProducts_*```  by running the ```which disk_monitor.sh``` command.

```bash
ups list -aK+ sbndaq -z $MRB_TOP/localProducts_*
#$ "sbndaq" "v1_00_01" "Linux64bit+3.10-2.17" "e20:prof:s112" ""
setup "sbndaq" "v1_00_01" -q "e20:prof:s112"
which disk_monitor.sh
#$ ~/DAQ_DevAreas/DAQ_03Dec2021PRD/localProducts_sbndaq_v1_00_01_e20_prof_s112/sbndaq/v1_00_01/configDB_tools/disk_monitor.sh
```

* Copy ```disk_monitor* into``` ```${HOME}/cronjobs/```.

```bash
cp $(dirname $(which disk_monitor.sh))/disk_monitor* ${HOME}/cronjobs/ && chmod a+rx ${HOME}/cronjobs/disk_monitor.sh
```

* Add or update the crontab entry for ```disk_monitor.sh``` with the ```crontab -e``` command (_uses vi editor_).
 
```bash
*/5 * * * *  ~/cronjobs/disk_monitor.sh >> /daq/log/grafana/disk_monitor.log 2>&1
```

* Wait 6 mins and verify the cronjob runs by running the ```tail -20 /daq/log/grafana/disk_monitor.log``` command.
