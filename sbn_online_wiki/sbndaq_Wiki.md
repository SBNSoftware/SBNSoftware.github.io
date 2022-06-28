---
layout: page
title: SBN DAQ Software Wiki
###subtitle: Specific Wiki for SBNDAQ
description: Wiki documentation for SBNDAQ
hero_height: is-small
toc: true
toc_title: SBNDAQ Contents
---



Developing in sbndaq
----------------------------------------------

* [Setup Instructions](Installation)
* [Development Model](DevModel)


Configuration DB Instructions
----------------------------------------------
* [See here for instructions on working with the configuration database](ConfigDB)
* [See here for instructions on migrating configurations in the configurations database](MigrateConfigs)
* [See here for instructions for restarting MongoDB](https://cdcvs.fnal.gov/redmine/projects/sbndaq/wiki/Mongodb_Instructions)
* [See here for instructions for restoring MongoDB](https://github.com/SBNSoftware/artdaqdatabase)

Copy ```run history``` from /daq/run_records into ArtdaqDB, and into UconDB
----------------------------------------------
* [Import run history from /daq/run_records/ into ArtdaqDB](ImportRunHistory2ArtdaqDB)
  * [Configure importRunHistory2ArtdaqDB-cron.sh](ImportRunHistory2ArtdaqDB_cron)
* [Copy run history from ArtdaqDB into UconDB](CopyRunHistory2UconDB)
  * [Configure copyRunHistory2UconDB-cron.sh](CopyRunHistory2UconDB_cron)

Grafana monitoring Instructions
----------------------------------------------
* [Restart Grafana](RestartGrafana)
* [Configure runrecords_monitor.sh](RunRecordsMonitor)
* [Configure disk_monitor.shh](DiskMonitor)
* [Add a monitoring panel in Grafana](MonitorPanel)


Release Instructions
----------------------------------------------
[See here for release instructions for online-related software](ReleaseInstructions)


Old wiki
----------------------------------------------
Please
see the old wiki for a lot of historical detail.

[Ported Old Redmine Wiki](../sbndaq_oldwiki/Wiki)

[Old redmine wiki](https://cdcvs.fnal.gov/redmine/projects/sbndaq/wiki).

(we are slowly going to work on updating/adding more info here...)


# Useful Links
* artdaq: [Artdaq Demo Wiki](https://cdcvs.fnal.gov/redmine/projects/artdaq-demo/wiki)
* git info: [Github guides](https://guides.github.com/)
* [Older instructions on Github Migration](GithubMigration.md)
* [Run CAENdump](CAENdump_setup.md)

sbndaq detector components
----------------------------------------------
* [List of boardreaders](Boardreaders.md)
* Configuring the [Multi Function Timing Unit (MFTU)](ACnet/MFTU.md) Beam Timing Interface

Troubleshooting
----------------------------------------------



Contributing to this wiki
----------------------------------------------


The content of this wiki is tracked in a GitHub repository [SBNSoftware/SBNSoftware.github.io](https://github.com/SBNSoftware/SBNSoftware.github.io)
under the
[`sbndaq_wiki`](https://github.com/SBNSoftware/SBNSoftware.github.io/tree/master/sbndaq_wiki)
subdirectory. Some details using this particular theme can be found [here](https://github.com/chrisrhymes/bulma-clean-theme).
