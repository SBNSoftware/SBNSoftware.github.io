---
layout: page
title: Steps to configure a cronjob for synchronizing run history records in the /daq/run_records/ directory with the Online MongoDB instance.
hero_height: is-small
---

_Note: This cron job imports the most recent run history records that, for various reasons, did not get imported by daqinterface._

* Check out the latest sbndaq project code into your [MRB](https://sbnsoftware.github.io/sbn_online_wiki/Installation) area, run a build, followed by the ```mrb -i; mrbslp``` command that installs configuration migration tools into the ```$SBNDAQ_DIR/configDB_tools``` directory.

* Review [$HOME/.artdaq_database_tools.env](https://github.com/SBNSoftware/sbndaq/blob/feature/dbtools/configDB_tools/config/artdaq_database_tools.env.example) or create a new one if required. _Ask Wes or Gennadiy to send you a working copy of .artdaq_database_tools.env._

* Setup the sbndaq product from the ```$MRB_TOP/localProducts_*``` directory and confirm that the ```import_run_history_cronjob.sh``` script will execute from ```$MRB_TOP/localProducts_*```  by running the ```which import_run_history_cronjob.sh``` command.

```bash
ups list -aK+ sbndaq -z $MRB_TOP/localProducts_*
#$ "sbndaq" "v1_00_01" "Linux64bit+3.10-2.17" "e20:prof:s112" ""
setup "sbndaq" "v1_00_01" -q "e20:prof:s112"
which import_run_history_cronjob.sh
#$ ~/DAQ_DevAreas/DAQ_23Nov2021GAL/localProducts_sbndaq_v1_00_01_e20_prof_s112/sbndaq/v1_00_01/configDB_tools/import_run_history_cronjob.sh
```

* Copy ```import_run_history_cronjob.sh into``` ```${HOME}/cronjobs/```.

```bash
cp $(which import_run_history_cronjob.sh) ${HOME}/cronjobs/ && chmod a+rx ${HOME}/cronjobs/import_run_history_cronjob.sh
```

* Add or update the crontab entry for ```import_run_history_cronjob.sh``` with the ```crontab -e``` command (_uses vi editor_).
 
```bash
*/5 * * * * /home/nfs/sbnd/cronjobs/import_run_history_cronjob.sh >> /daq/log/dbtools/database-history-icarus_v4x_db.log 2>&1
```

* Wait 6 mins and verify the cronjob runs by running the ```tail -100 /daq/log/dbtools/database-history-icarus_v4x_db.log``` command.

```bash
$ crontab -l
*/5 * * * * /home/nfs/sbnd/cronjobs/import_run_history_cronjob.sh >> /daq/log/dbtools/database-history-icarus_v4x_db.log 2>&1
```

```bash
$ tail -100 /daq/log/dbtools/database-history-icarus_v4x_db.log
runs_file:/daq/log/dbtools/runs-829-828.txt
failed_runs_file:/daq/log/dbtools/failed_runs-829-828.gOUQMKoA
Wed Dec  1 16:00:03 CST 2021: DAQInterface in partition 999 launched and now in "stopped" state, listening on port 6659
```
