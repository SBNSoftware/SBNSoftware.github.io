---
layout: page
title: If you need to copy run history records from artdaq_database into UconDB, you may follow the procedure, as described below.
hero_height: is-small
---

_Note: ```copyRunHistory2UconDB.sh``` copies run history records that exist in artdaq_database but have not yet been copied into UconDB. It is safe to run ```copyRunHistory2UconDB.sh``` repeatedly._

* Check out the latest sbndaq project code into your [MRB](https://sbnsoftware.github.io/sbn_online_wiki/Installation) area, run a build, followed by the ```mrb -i; mrbslp``` command that installs database tools into the ```$SBNDAQ_DIR/configDB_tools``` directory.

* Review [$HOME/.artdaq_database_tools.env](https://github.com/SBNSoftware/sbndaq/blob/feature/dbtools/configDB_tools/config/artdaq_database_tools.env.example) or create a new one if required. _Ask Wes or Gennadiy to send you a working copy of ```.artdaq_database_tools.env```._

* Setup the sbndaq product from the ```$MRB_TOP/localProducts_*``` directory and confirm that the ```copyRunHistory2UconDB.sh``` script will execute from ```$MRB_TOP/localProducts_*```  by running the ```which copyRunHistory2UconDB.sh``` command.

```bash
ups list -aK+ sbndaq -z $MRB_TOP/localProducts_*
#$ "sbndaq" "v1_00_01" "Linux64bit+3.10-2.17" "e20:prof:s112" ""
setup "sbndaq" "v1_00_01" -q "e20:prof:s112"
which copyRunHistory2UconDB.sh
#$ ~/DAQ_DevAreas/DAQ_23Nov2021GAL/localProducts_sbndaq_v1_00_01_e20_prof_s112/sbndaq/v1_00_01/configDB_tools/copyRunHistory2UconDB.sh
```

* Run copyRunHistory2UconDB.sh.

```bash
$ copyRunHistory2UconDB.sh
```

* Check the output for errors.

```bash
$ copyRunHistory2UconDB.sh
Copying run 826
Getting a list of archived run configurations...
Creating the run directory...
Exporting run configuration files from database...
b'BULKDOWNLOADER is running on sbnd-gateway02 and ARTDAQ_DATABASE_URI=mongodb://sbnd-db01.fnal.gov:28058,sbnd-db02.fnal.gov:28058,mongodb-p02.fnal.gov:27018/sbnd_db_archive?replicaSet=sbnddaqprd\nDownloaded 12 files with 8 threads in 231 msecs.\nAvarage file load time is 154 msecs.'
True
Writing blob file...
Copying blob file to ucondb...
826Success loading 826 to ucondb.
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 23562    0 23562    0     0   133k      0 --:--:-- --:--:-- --:--:--  134k
Copying run 827
Getting a list of archived run configurations...
Creating the run directory...
Exporting run configuration files from database...
b'BULKDOWNLOADER is running on sbnd-gateway02 and ARTDAQ_DATABASE_URI=mongodb://sbnd-db01.fnal.gov:28058,sbnd-db02.fnal.gov:28058,mongodb-p02.fnal.gov:27018/sbnd_db_archive?replicaSet=sbnddaqprd\nDownloaded 10 files with 8 threads in 203 msecs.\nAvarage file load time is 162 msecs.'
True
Writing blob file...
Copying blob file to ucondb...
827Success loading 827 to ucondb.
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 13843    0 13843    0     0  82934      0 --:--:-- --:--:-- --:--:-- 83391
Copying run 828
Getting a list of archived run configurations...
Creating the run directory...
Exporting run configuration files from database...
b'BULKDOWNLOADER is running on sbnd-gateway02 and ARTDAQ_DATABASE_URI=mongodb://sbnd-db01.fnal.gov:28058,sbnd-db02.fnal.gov:28058,mongodb-p02.fnal.gov:27018/sbnd_db_archive?replicaSet=sbnddaqprd\nDownloaded 12 files with 8 threads in 237 msecs.\nAvarage file load time is 158 msecs.'
True
Writing blob file...
Copying blob file to ucondb...
828Success loading 828 to ucondb.
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 13755    0 13755    0     0  19605      0 --:--:-- --:--:-- --:--:-- 19594
```

```
$ copyRunHistory2UconDB.sh
```

_Note: Runs 826-828 were copied to UconDB with the first execution of ```copyRunHistory2UconDB.sh```, and the second execution did nothing since UconDB was up to date. It is safe to run ```copyRunHistory2UconDB.sh``` repeatedly._
