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
- Files removed when verified tape location

# Xporter

- There is a cron job that runs the xporter process. That cron job starts a new one job every minute.
- The job should check to see if there is a lock file to see if another one is running. If so, it should say so in the log file, and exit. There are actually two checks for this: one in the runXporter.sh script directly run by cron, and another in the python code itself. Which means ... you can get 'in progress/do not run' messages in the log file while there still is an xporter process running. That's by design.
  - Perhaps it's not wise to have two processes writing to the same log file?
- The ongoing xporter process will drift in and out of D state as it runs. I think this is normal. I think that one should not assume if you see the process in D state that it is dead.
- Xporter needs to communicate with both UconDB DB (postgres) and MongoDB to run

# References
SBN docdb 27829 (ICARUS data handling observations, Sep 12, 2022)
