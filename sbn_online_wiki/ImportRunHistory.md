---
layout: page
title: If you need to synchronize run history records in the /daq/run_records/ directory with the Online MongoDB instance, you may follow the procedure, as described below.
hero_height: is-small
---

_Note: This procedure runs incrementally and pushes runs that exist in the /daq/run_records/ directory but are not yet transferred into the Online MongoDB. It is safe to run it multiple times._

* Check out the latest sbndaq project code into your [MRB](https://sbnsoftware.github.io/sbn_online_wiki/Installation) area, run a build, followed by the ```mrb -i; mrbslp``` command that installs configuration migration tools into the ```$SBNDAQ_DIR/configDB_tools``` directory.

* Review [$HOME/.artdaq_database_tools.env](https://github.com/SBNSoftware/sbndaq/blob/feature/dbtools/configDB_tools/config/artdaq_database_tools.env.example) or create a new one if required. _Ask Wes or Gennadiy to send you a working copy of .artdaq_database_tools.env._
 

* Setup the sbndaq product from the ```$MRB_TOP/localProducts_*``` directory and confirm that the ```import_run_history.sh``` script will execute from ```$MRB_TOP/localProducts_*```  by running the ```which import_run_history.sh``` command.

```bash
ups list -aK+ sbndaq -z $MRB_TOP/localProducts_*
#$ "sbndaq" "v1_00_01" "Linux64bit+3.10-2.17" "e20:prof:s112" ""
setup "sbndaq" "v1_00_01" -q "e20:prof:s112"
which import_run_history.sh
#$ ~/DAQ_DevAreas/DAQ_23Nov2021GAL/localProducts_sbndaq_v1_00_01_e20_prof_s112/sbndaq/v1_00_01/configDB_tools/xfer_run_history.sh
```

* Run import_run_history.sh.
```bash
$ import_run_history.sh
```

* Check the output for errors.
_Note: Run 826 was pushed to the Online MongoDB._
```bash
$ import_run_history.sh
runs_file:/daq/log/dbtools/retry-runs-120121142635.txt
failed_runs_file:/daq/log/dbtools/failed_runs-120121142635.kCfWqo40

Wed Dec  1 14:26:36 CST 2021: DAQInterface in partition 999 launched and now in "stopped" state, listening on port 6659
Run 826
Attempting to save config info to the database...b'BULKLOADER is running on sbnd-gateway02 and ARTDAQ_DATABASE_URI=mongodb://sbnd-db01.fnal.gov:28058,sbnd-db02.fnal.gov:28058,mongodb-p02.fnal.gov:27018/sbnd_db_archive?replicaSet=sbnddaqprd\nLoaded 10 files with 8 threads in 162 msecs.\nAvarage file load time is 129 msecs.'
Archived ('SystemLayout', 'schema', './schema.fcl')
Archived ('RunHistory', 'tpc01', './826/tpc01.fcl')
Archived ('RunHistory', 'ptb01', './826/ptb01.fcl')
Archived ('RunHistory', 'EventBuilder1', './826/EventBuilder1.fcl')
Archived ('RunHistory', 'Dispatcher1', './826/Dispatcher1.fcl')
Archived ('RunHistory', 'metadata', './826/metadata.fcl')
Archived ('RunHistory', 'boot', './826/boot.fcl')
Archived ('RunHistory', 'known_boardreaders_list', './826/known_boardreaders_list.fcl')
Archived ('RunHistory', 'DataflowConfiguration', './826/DataflowConfiguration.fcl')
Archived ('RunHistory', 'RunHistory', './826/RunHistory.fcl')
done (0.4 seconds).
Attempting to save config info to the database...done (0.2 seconds).
```

```bash
$ import_run_history.sh
runs_file:/daq/log/dbtools/retry-runs-120121142947.txt
failed_runs_file:/daq/log/dbtools/failed_runs-120121142947.KruBM0vi

Wed Dec  1 14:29:48 CST 2021: DAQInterface in partition 999 launched and now in "stopped" state, listening on port 6659
```
