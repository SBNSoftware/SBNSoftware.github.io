---
layout: page
title: Instructions for configuring a cron job that copies run history records from ArtdaqDB to UconDB.
hero_height: is-small
---

* Check out the latest sbndaq project code into your [MRB](https://sbnsoftware.github.io/sbn_online_wiki/Installation) area, run a build, followed by the ```mrb -i; mrbslp``` command that installs database tools into the ```$SBNDAQ_DIR/configDB_tools``` directory.

* Review [$HOME/.artdaq_database_tools.env](https://raw.githubusercontent.com/SBNSoftware/sbndaq/develop/configDB_tools/config/artdaq_database_tools.env.example) or create a new one if required. _Ask Wes or Gennadiy to send you a working copy of .artdaq_database_tools.env._

* Setup the sbndaq product from the ```$MRB_TOP/localProducts_*``` directory and confirm that the ```copyRunHistory2UconDB-cron.sh``` script will execute from ```$MRB_TOP/localProducts_*```  by running the ```which copyRunHistory2UconDB-cron.sh``` command.

```bash
ups list -aK+ sbndaq -z $MRB_TOP/localProducts_*
#$ "sbndaq" "v1_00_01" "Linux64bit+3.10-2.17" "e20:prof:s112" ""
setup "sbndaq" "v1_00_01" -q "e20:prof:s112"
which copyRunHistory2UconDB-cron.sh
#$ ~/DAQ_DevAreas/DAQ_23Nov2021GAL/localProducts_sbndaq_v1_00_01_e20_prof_s112/sbndaq/v1_00_01/configDB_tools/copyRunHistory2UconDB-cron.sh
```

* Copy ```copyRunHistory2UconDB-cron.sh into``` ```${HOME}/cronjobs/```.

```bash
cp $(which copyRunHistory2UconDB-cron.sh) ${HOME}/cronjobs/ && chmod a+rx ${HOME}/cronjobs/copyRunHistory2UconDB-cron.sh
```

* Add or update the crontab entry for ```copyRunHistory2UconDB-cron.sh``` with the ```crontab -e``` command (_uses vi editor_).
 
```bash
*/3 * * * * ARTDAQ_DATABASE_TOOLS_ENV=~/.artdaq_database_tools.env ~/cronjobs/copyRunHistory2UconDB-cron.sh >> /daq/log/dbtools/database-ucondb.log 2>&1
*/3 * * * * ARTDAQ_DATABASE_TOOLS_ENV=~/.artdaq_database_tools_pending.env ~/cronjobs/copyRunHistory2UconDB-cron.sh >> /daq/log/dbtools/database-ucondb-pending.log  2>&1
```

* Wait 4 mins and verify the cronjob runs by running the ``` ls  /daq/log/dbtools/database-ucondb{,-pending}.log |xargs -n1 tail -20``` command.
