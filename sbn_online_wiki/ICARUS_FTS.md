---
layout: page
title: Online Data Management in ICARUS
hero_height: is-medium
toc: true
---

## Online Data Management
The File Transfer System (FTS) is managed by the Online Data Managment processes. 
The Online Data Management:
- manages the files created by the DAQ
- creates metadata for files that will later be processed by the offline 
- transfers those files off of the DAQ cluster.
The Online Data Management script are in the following repository:
[https://github.com/SBNSoftware/sbndaq-xporter](https://github.com/SBNSoftware/sbndaq-xporter)

### Flow of fully-built events in DAQ

![flow-event-builds-icarus](https://user-images.githubusercontent.com/97683442/203762937-d0f7a3c9-6cb8-4817-9ecc-85bb83b5ea7c.JPG)

About Event Builders:
- Output modules is a specialized RootOutput module that clears disk cache --> improve write performance
- CompressionLevel: 501 → LZ4, compression level 1
  - Reduces file size factor of ~3-4; final size ~82 MB per event (with TPC compression)
- 50 events per file → 4.1 GB files
  - In the 1-10 GB range preferred for tape storage 
- Number and location of EventBuilders specified in `boot.txt` configuration file
- EventBuilders get events ‘round-robin → if n EventBuilders, event j goes to (j%n )th EventBuilder
- Each icarus-evb server has 23 TB of RAID-backed disk

### File names
For example:
data_run13474_EventBuilder9_art9_4_fstrmOffBeamMINBIASCALIB_20250816T012911.root, where:
- run13474 --> run number
- EventBuilder9_art9 --> application name
- 4 --> nth file from this EVB for this run
- fstrmOffBeamMINBIASCALIB --> file stream name
- 20250816T012911 --> file open timestamp

### What happens to files
- EventBuilder writes file to /data/daq area
- When closed, file is renamed according to the naming convention described above
- Xporter.py process kicks in (icarus user):
  - Looks for completed files (by name) in /data/daq
  - Moves file from /data/daq to /data/fts_dropbox
  - Generates JSON metadata file in /data/fts_dropbox
- FTS process process kicks in (icarusraw user):
  - Looks for files (by name) and matching JSON file
  - Declares file to SAM (Serial Access to Metadata)
  - Copies file to tape-backed dCache area
- Files are removed from Online cluster when verified tape location


## Xporter
Repository: [https://github.com/SBNSoftware/sbndaq-xporter/tree/develop/Xporter](https://github.com/SBNSoftware/sbndaq-xporter/tree/develop/Xporter)

- There is a cron job [xporter_crontab.ctab](https://github.com/SBNSoftware/sbndaq-xporter/blob/develop/Xporter/xporter_crontab.ctab) that runs the xporter process [runXporter.sh](https://github.com/SBNSoftware/sbndaq-xporter/blob/develop/Xporter/runXporter.sh). That cron job starts a new one job every minute.
- The job should check to see if there is a lock file to see if another one is running. If so, it should say so in the log file, and exit. There are actually two checks for this: one in the runXporter.sh script directly run by cron, and another in the python code itself. Which means ... you can get 'in progress/do not run' messages in the log file while there still is an xporter process running. That's by design.
- Xporter needs to communicate with both UconDB DB (postgres) and MongoDB to run
- What Xporter does:
  - First moves the files
  - Then tries to make metadata and write to JSON file: 
    - [offline_run_history.py](https://github.com/SBNSoftware/sbndaq-xporter/blob/develop/Xporter/offline_run_history.py) queries RunHistory DB to grab configuration name/information
    - [X_SAM_metadata.py](https://github.com/SBNSoftware/sbndaq-xporter/blob/develop/Xporter/X_SAM_metadata.py) looks into root file for number of events, parses the file name for run number, what data stream (used for file families) and calculates a checksum used for transfers
  
- Example of metadata file:
  {
  "file_size": 5850482,
  "file_name": "data_dl7_fstrmOffBeamBNBMAJORITY_run9093_1_20221109T204532.root",
  "file_type": "data", "file_format": "artroot",
  "data_tier": "raw",
  "sbn_dm.detector": "sbn_fd",
  "data_stream": "offbeambnbmajority",
  "runs": [[9093, "physics"]],
  "sbn_dm.file_year": 2022, "sbn_dm.file_month": 11, "sbn_dm.file_day": 10, "checksum":
  ["enstore:3856015800"],
  "icarus_project.version": "v1_04_00",
  "icarus_project.name": "icarus_daq_v1_04_00",
  "configuration.name":
  "Calibration_MINBIAS_BNB_Thr400_Majority10_FixedWindow_4Hz_00002",
  "icarus_project.stage": "daq", "sbn_dm.beam_type": "BNB", "sbn_dm.event_count":0
  }
  
## File Transfer System

- Link: [https://cdcvs.fnal.gov/redmine/projects/sam/wiki/File_Transfer_Service_Information](https://cdcvs.fnal.gov/redmine/projects/filetransferservice/wiki)
- FTS is setup to look for files + metadata file in a “dropbox”, and then transfer them according to rules in configuration files. [Configs for ICARUS](https://github.com/SBNSoftware/sbndaq-xporter/blob/develop/FTS_config/icarus-evb_fts_config.ini)
- FTS is old, and can not be run on AL9 without significant complications, if at all. To preserve the application for continued use, Fermilab provides prebuilt FTS container image to work with Podman.
- FTS_config has setup/start/stop/restart [scripts](https://github.com/SBNSoftware/sbndaq-xporter/tree/develop/FTS_config)
- Run as icarusraw user
- Linked to offline production certificates
- Logs for all online DM are located in /daq/logs/fts_logs
- File deletion:
  - Files are safe once they are transferred to dCache (Marked as ‘precious’ so they will not be rejected from Pool if Pool is full)
  - However, for extra safety we wait until we have a confirmed location on tape
    - FTS will do this check, but sometimes lookup to SAM DB can be particularly slow
    - An additional script [runManualFTSFileCleanup.sh](https://github.com/SBNSoftware/sbndaq-xporter/blob/develop/Xporter/runManualFTSFileCleanup.sh) runs in icarus crontab twice a day to try to do this faster. This script can also be called with an option `ManualFTSFileCleanup.py ONLINE`, which will make it delete files which are copied to dCache, without requirement of them to be copied to the tape. This is to be used only when the local disks are overfilling during high data rate tests.
 - Monitoring page:
   [https://fifemon.fnal.gov/monitor/d/000000032/fts?orgId=1&from=now-12h&to=now&refresh=5m&var-experiment=icarus&var-instance=icarus-fts-icarus-evb01&var-instance=icarus-fts-icarus-evb02&var-instance=icarus-fts-icarus-evb03&var-instance=icarus-fts-icarus-evb04&var-instance=icarus-fts-icarus-evb06&var-instance=icarus-fts-icarus-evb12](https://fifemon.fnal.gov/monitor/d/000000032/fts?orgId=1&from=now-12h&to=now&refresh=5m&var-experiment=icarus&var-instance=icarus-fts-icarus-evb01&var-instance=icarus-fts-icarus-evb02&var-instance=icarus-fts-icarus-evb03&var-instance=icarus-fts-icarus-evb04&var-instance=icarus-fts-icarus-evb06&var-instance=icarus-fts-icarus-evb12)
   - Files declared → declared to SAM (not yet transferred)
   - Data transferred → data FTS knows it moved
   - In progress will show new, pending (for transfer), waiting for tape (what it sounds like)
   - “Failures” usually due to waiting for tape for more than 4 days

![FTS-monitor](https://user-images.githubusercontent.com/97683442/203768219-08770cdd-10c4-4ef2-aa1b-4b509261e9ca.JPG)

   
## Troubleshooting
### Evb machines disks overfilling
- Usually we notice problems if /data starts getting full
  - Check if Xporter or FTS logs have errors. For example:
    -  Xporter → usually can’t make metadata, e.g. can’t connect to RunHistory DB or weird file name
    -  FTS → usually has problem with metadata or CRL certificates need refresh: metadata keys and some values, like data_tier and data_stream, must be registered in SAM → talk to offline production! For certificates: systemctl status fetch-crl-cron ... if dead, needs restart (as root). Can also run by hand: fetch-crl
    -  if you need to restart the FTS service, run the following script: `~icarus/FileTransfer/sbndaq-xporter/FTS_config/restart_fts.sh` on one of the eventbuilder machines. This should restart the FTS system. 
   -  Talk to offline!
      -  Maybe some massive problem with tape ... if files don’t get locations on tape, then they won’t be removed from online cluster

### Failed transfers
Occasionally (several times per year), the file transfer fails. This is normally detected by the storage team, who verifies the control sums.

If the corruption is detected soon enough, the file might be still in dropbox on the Evb machine. In such case, it needs to be copied again, manually.

If the original file cannot be found, which is likely to happen during the long calibration periods (e.g. during the beam off season), when the rules to delete local copies are relaxed, the corrupted file can be deleted. When removing with `rm` one must use the following path
```
/pnfs/icarus/archive/...
```
with `ifdh rm` either of the following paths should work:
```
/pnfs/fnal.gov/usr/icarus/archive/...
/pnfs/icarus/archive/...
```
Then, the file needs to be retired from samweb too:
```
samweb -e icarus remove-file-location <filename> /pnfs/icarus/archive/<...path...>
samweb -e icarus retire-file <filename>
```


## Monitoring
### grafana
The following page provides overview of FTS from all Event Builder Machines:
[https://fifemon.fnal.gov/monitor/d/000000032/fts?orgId=1&from=now-12h&to=now&refresh=5m&var-experiment=icarus&var-instance=icarus-fts-icarus-evb01&var-instance=icarus-fts-icarus-evb02&var-instance=icarus-fts-icarus-evb03&var-instance=icarus-fts-icarus-evb04&var-instance=icarus-fts-icarus-evb06&var-instance=icarus-fts-icarus-evb12](https://fifemon.fnal.gov/monitor/d/000000032/fts?orgId=1&from=now-12h&to=now&refresh=5m&var-experiment=icarus&var-instance=icarus-fts-icarus-evb01&var-instance=icarus-fts-icarus-evb02&var-instance=icarus-fts-icarus-evb03&var-instance=icarus-fts-icarus-evb04&var-instance=icarus-fts-icarus-evb06&var-instance=icarus-fts-icarus-evb12)

### FTS status
Tunnel required:

```ssh -KL 8787:localhost:8787 icarus@icarus-evb12.fnal.gov -J icarus@icarus-gateway04.fnal.gov```

[http://localhost:8787/fts/status](http://localhost:8787/fts/status)

Provides more details for a single EVB, in particular status of individual files. It also allows to attempt to clear errors with "retry" buttons.

### Pool Manager

Requires VPN, or web browser certificate

[https://fndca.fnal.gov:22880/pools/list/PoolManager](https://fndca.fnal.gov:22880/pools/list/PoolManager)

Provides information on status of the usage of the IcarusReadWritePools space.

## References
SBN docdb 27829 (ICARUS data handling observations, Sep 12, 2022)
