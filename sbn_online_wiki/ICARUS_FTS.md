Sep 2022
The document summarizes various discussions during the last weeks. It needs to be turned into a proper documentation.

# Online Data Management
FTS is a process managed by the Online Data Managment processes. The Online Data Management manages the files created by the DAQ, creates metadata for files that will later be processed by the offline and transfers those files off of the DAQ cluster.

# What happens to files
- EventBuilder writes file to /data/daq area
- When closed, file is renamed
- Xporter.py process kicks in (icarus user): 
  a. Looks for completed files (by name) in /data/daq
  b. Moves file from /data/daq to /data/fts_dropbox
  c. Generates JSON metadata file in /data/fts_dropbox
- FTS process process kicks in (icarusraw user):
  a. Looks for files (by name) and matching JSON file
  b. Declares file to SAM
  c. Copies file to tape-backed dCache area
- Files are removed from Online cluster when verified tape location

# Xporter

- There is a cron job that runs the xporter process. That cron job starts a new one job every minute.
- The job should check to see if there is a lock file to see if another one is running. If so, it should say so in the log file, and exit. There are actually two checks for this: one in the runXporter.sh script directly run by cron, and another in the python code itself. Which means ... you can get 'in progress/do not run' messages in the log file while there still is an xporter process running. That's by design.
  - Perhaps it's not wise to have two processes writing to the same log file?
- The ongoing xporter process will drift in and out of D state as it runs. I think this is normal. I think that one should not assume if you see the process in D state that it is dead.
- Xporter needs to communicate with both UconDB DB (postgres) and MongoDB to run
- What Xporter does:
  a. First moves the files
  b. Then tries to make metadata and write to JSON file --> needs RunHistory DB to grab configuration name/information, looks into root file for number of events, parses   the file name for run number, what data stream (used for file families) and calculates a checksum used for transfers
  
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
  
# File Transfer System

- Link:https://cdcvs.fnal.gov/redmine/projects/sam/wiki/File_Transfer_Service_Information
- FTS is setup to look for files + metadata file in a “dropbox”, and then transfer them according to rules in configuration files. Configs for ICARUS --> https://github.com/SBNSoftware/sbndaq-xporter/blob/develop/FTS_config/icarus-evb_fts_config.ini
- It runs as a daemon → don’t need to put in crontab
- FTS_config has setup/start/stop/restart scripts --> https://github.com/SBNSoftware/sbndaq-xporter/tree/develop/FTS_config
- Run as icarusraw user
- Linked to offline production certificates
- Logs for all online DM are located in /daq/logs/fts_logs
- File deletion:
  - Files are safe once they are transferred to dCache (Marked as ‘precious’ so they will not be rejected from Pool if Pool is full)
  - However, for extra safety we wait until we have a confirmed location on tape
    - FTS will do this check, but sometimes lookup to SAM DB can be particularly slow
    - runManualFTSFileCleanup.sh runs in icarus crontab twice a day to try to do this faster --> https://github.com/SBNSoftware/sbndaq-xporter/blob/develop/Xporter/runManualFTSFileCleanup.sh
 - Monitoring page:
   https://fifemon.fnal.gov/monitor/d/000000032/fts?orgId=1&from=now-12h&to=now&refresh=5m&var-experiment=icarus&var-instance=icarus-fts-icarus-evb01&var-instance=icarus-fts-icarus-evb02&var-instance=icarus-fts-icarus-evb03&var-instance=icarus-fts-icarus-evb04&var-instance=icarus-fts-icarus-evb05&var-instance=icarus-fts-icarus-evb06
   
# Troubleshooting

- Usually we notice problems if /data starts getting full
  - Check if Xporter or FTS logs have errors. 
  - For example:
    -  Xporter → usually can’t make metadata, e.g. can’t connect to RunHistory DB or weird file name
    -  FTS → usually has problem with metadata or CRL certificates need refresh: metadata keys and some values, like data_tier and data_stream, must be registered in SAM → talk to offline production! For certificates: systemctl status fetch-crl-cron ... if dead,needs restart (as root). Can also run by hand: fetch-crl
   -  Talk to offline!
      -  Maybe some massive problem with tape ... if files don’t get locations on tape, then they won’t be removed from online cluster

# References
SBN docdb 27829 (ICARUS data handling observations, Sep 12, 2022)
