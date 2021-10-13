---
layout: page
title: Instructions for migrating configurations in artdaq_database.
hero_height: is-small
---

If you need to change one or more parameters in fhicl files for multiple sbndaq configurations, you may follow the procedure as described below.

* Check out the latest sbndaq project code into your [MRB](https://sbnsoftware.github.io/sbn_online_wiki/Installation) area, run a build, followed by the ```mrb -i; mrbslp``` 
command that installs configuration migration tools into the ```$SBNDAQ_DIR/configDB_tools``` directory.

* Review [examples of configuration migration scripts](https://github.com/SBNSoftware/sbndaq/tree/develop/configDB_tools/config-migration-scripts) in 
$MRB_TOP/srcs/sbndaq/configDB_tools/config-migration-scripts/ and create a new one if required. Rerun the ```mrb -i; mrbslp``` command to install your new script into the $MRB_TOP/localProducts_*/sbndaq/version/configDB_tools/config-migration-scripts directory.

* Setup the sbndaq product from the ```$MRB_TOP/localProducts_*``` directory and confirm that the ```migrateConfigs.sh``` script will execute from ```$MRB_TOP/localProducts_*```  by running the ```which migrateConfigs.sh``` command.
```bash
ups list -aK+ sbndaq -z $MRB_TOP/localProducts_*
#$ "sbndaq" "v1_00_00" "Linux64bit+3.10-2.17" "e20:prof:s112" ""
setup "sbndaq" "v1_00_00" -q "e20:prof:s112"
which migrateConfigs.sh
#$ ~/DAQ_DevAreas/DAQ_12Oct2021/localProducts_sbndaq_v1_00_00_e20_prof_s112/sbndaq/v1_00_00/configDB_tools/migrateConfigs.sh
```

* Create a new file with [a list of configuration names](https://github.com/SBNSoftware/sbndaq/blob/develop/configDB_tools/config-migration-scripts/configs-example.list) you need to migrate.

* Run ```migrateConfigs.sh --help``` and review its usage.
```
$ migrateConfigs.sh --help
Info: Running migrateConfigs.sh
Info: Instructions https://sbnsoftware.github.io/sbn_online_wiki/MigrateConfigs

Usage:
  migrateConfigs.sh -c configs.list -s migrate.script [-d tmpdir]
Options:
  -c, --configs  file containing a list of configurations to migrate,
                   default=/home/nfs/icarus/DAQ_DevAreas/DAQ_12Oct2021/localProducts_sbndaq_v1_00_00_e20_prof_s112/sbndaq/v1_00_00/configDB_tools/config-migration-scripts/configs-example.list
  -s, --script   migration script,
                   default=/home/nfs/icarus/DAQ_DevAreas/DAQ_12Oct2021/localProducts_sbndaq_v1_00_00_e20_prof_s112/sbndaq/v1_00_00/configDB_tools/config-migration-scripts/migrate-example.script
  -d, --tmpdir   temporary working directory name,
                   default=migrateconfigs_13Oct2021
Examples:
  migrateConfigs.sh \
    -c /home/nfs/icarus/DAQ_DevAreas/DAQ_12Oct2021/localProducts_sbndaq_v1_00_00_e20_prof_s112/sbndaq/v1_00_00/configDB_tools/config-migration-scripts/configs-example.list \
    -s /home/nfs/icarus/DAQ_DevAreas/DAQ_12Oct2021/localProducts_sbndaq_v1_00_00_e20_prof_s112/sbndaq/v1_00_00/configDB_tools/config-migration-scripts/migrate-example.script

  migrateConfigs.sh \
    -c /home/nfs/icarus/DAQ_DevAreas/DAQ_12Oct2021/localProducts_sbndaq_v1_00_00_e20_prof_s112/sbndaq/v1_00_00/configDB_tools/config-migration-scripts/configs-example.list \
    -s /home/nfs/icarus/DAQ_DevAreas/DAQ_12Oct2021/localProducts_sbndaq_v1_00_00_e20_prof_s112/sbndaq/v1_00_00/configDB_tools/config-migration-scripts/migrate-example.script  \
    -d migrateconfigs_13Oct2021
```

* Migrate sbndaq configurations.
```
migrateConfigs.sh -c ./my-configs.list -s ./my-working-migrate.script
```

* Check the output for errors.
```
Info: Running migrateConfigs.sh
Info: Instructions https://sbnsoftware.github.io/sbn_online_wiki/MigrateConfigs
Info: Running migrateConfigs.sh with options:
	configs=/home/nfs/icarus/DAQ_DevAreas/DAQ_12Oct2021/localProducts_sbndaq_v1_00_00_e20_prof_s112/sbndaq/v1_00_00/configDB_tools/config-migration-scripts/configs-example.list
	script=/home/nfs/icarus/DAQ_DevAreas/DAQ_12Oct2021/localProducts_sbndaq_v1_00_00_e20_prof_s112/sbndaq/v1_00_00/configDB_tools/config-migration-scripts/migrate-example.script
	tmpdir=migrateconfigs_13Oct2021

Info: The default schema.fcl is located in /home/nfs/icarus/DAQ_DevAreas/DAQ_12Oct2021/localProducts_sbndaq_v1_00_00_e20_prof_s112/sbndaq/v1_00_00/configDB_tools/config.
Info: Working directory is /home/nfs/icarus/CONFIG_MigrationArea/migrateconfigs_13Oct2021.
Info: Migrating myTest-00001.
Last configuration myTest-00001
Exported ('SystemLayout', 'schema', 'schema.fcl')
Exported ('Hashes', 'hashes', 'hashes.fcl')
Exported ('PMTs', 'icaruspmteebot01', 'myTest-/icaruspmteebot01.fcl')
.....
Exported ('CRTs', 'icaruscrt_feb97', 'myTest-/icaruscrt_feb97.fcl')
True
**************************************************************************************
Info: Running /home/nfs/icarus/DAQ_DevAreas/DAQ_12Oct2021/localProducts_sbndaq_v1_00_00_e20_prof_s112/sbndaq/v1_00_00/configDB_tools/config-migration-scripts/migrate-example.script.
Info: Current working directory is /home/nfs/icarus/CONFIG_MigrationArea/migrateconfigs_13Oct2021/configs/exportmyTest-00001/myTest-.
Info: This script (migrate-example.script) runs in the ./exportmyTest-00001/myTest- directory where connftool.py exported fhicl files.
      The counter variable should be incremented for each error and returned to the caller of this script.
      If this script exits with a zero return code, then the caller will import fhicl files in ./exportmyTest-00001/myTest- as a new configuration.

Info: Migrating DataLogger_standard.fcl.
Info: Migrating Dispatcher_standard.fcl.
Info: Migrating EventBuilder_standard.fcl.
Info: Migrating icarustpc_standard.fcl.
Info: Migrating pmt_standard.fcl.
**************************************************************************************
New configuration myTest-00017
Imported ('SystemLayout', 'schema', './schema.fcl')
Imported ('Hashes', 'hashes', './hashes.fcl')
Imported ('PMTs', 'icaruspmteebot01', './myTest-/icaruspmteebot01.fcl')
.....
Imported ('CRTs', 'icaruscrt_feb97', './myTest-/icaruscrt_feb97.fcl')
New configuration myTest-00017
None
Info: Migrated myTest-00001.
```
