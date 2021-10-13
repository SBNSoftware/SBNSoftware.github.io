---
layout: page
title: Instructions for migrating configurations in artdaq_database.
hero_height: is-small
---

If you need to change one or more parameters in fhicl files for multiple sbndaq configurations, you may follow the procedure as described below.

* Check out the latest sbndaq project code into your [MRB](https://sbnsoftware.github.io/sbn_online_wiki/Installation) area, run a build, followed by the ```mrb -i; mrbslp``` 
command that installs configuration migration tools into the ```$SBNDAQ_DIR/configDB_tools``` directory.

* Setup the sbndaq product from the ```$MRB_TOP/localProducts_*``` directory and confirm that the ```migrateConfigs.sh``` script will execute from ```$MRB_TOP/localProducts_*```  by running the ```which migrateConfigs.sh``` command.
```bash
ups list -aK+ sbndaq -z $MRB_TOP/localProducts_*
#$ "sbndaq" "v1_00_00" "Linux64bit+3.10-2.17" "e20:prof:s112" ""
setup "sbndaq" "v1_00_00" -q "e20:prof:s112"
which migrateConfigs.sh
#$ ~/DAQ_DevAreas/DAQ_12Oct2021/localProducts_sbndaq_v1_00_00_e20_prof_s112/sbndaq/v1_00_00/configDB_tools/migrateConfigs.sh

```
