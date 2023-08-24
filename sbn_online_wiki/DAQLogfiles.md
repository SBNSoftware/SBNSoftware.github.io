# Logfiles in ICARUS

## Run records

`/daq/run_records` holds FHiCL configuration for each run. The files are processed with `fhicl_dump`, so all included files are merged, comments are limited to one line preceding the parameter, and the line of the parameter.

## /daq/log

`/daq/log` is the main partition for the daq logfiles. There are many types of logs, as explained below.

### Event Builders, Board Readers, Dispatcher

EventBuilder logs are stored in `/daq/log` subdirectories with name as:

`EventBuilder11-icarus-evb01-11245`

where the name refers to the EventBuilder number, machine, and the process number. The files in these subdirectories include a timestamp, but not a run number, as they are created before the run number is assigned. 

When the run number is assigned, artdaq creates symlinks in a directory `/daq/log/eventbuilder` which include run number in their names.

Logfiles for Board Readers are written in subdirectories including the specific boardreader name, e.g.

`icaruscrt09ssi-icarus-crt09-11100/`

and all symlinks are created in `/daq/log/boardreader`.

Dispatcher logs are saved in a similar way.

### Process Management Tool

Additional artdaq logfiles from each machine are stored in a directory with a bit confusing name `/daq/log/pmt` including both files marked with timestamps, and symlinks which include the run numbers.

PMT logs include FragmentWatcher messages.

### DAQInterface
A single file with logs from DAQInterface is in: `/daq/log/DAQInterface_partition1.log`. This is a file to check if a run crashes before starts. It also includes timestamps of run start and stop.

The file is backed up daily. In order to access the backup, one should file a ticket. In case of emergency one could request SLAM be paged.

### File Transfer Service

Logs for Xporter, FTS and File Cleanup are stored in `/daq/log/fts_logs`.

### Grafana

Metrics stored in `/daq/log/metrics`, and grafana logs in `/daq/log/grafana/`.

### Logs management

#### Disk space analysis

One can find disk space usage by various components with the following command:

`for x in $(ls /daq/log | sed 's/[0-9].*//' | sed 's/icaruspmt.*/icaruspmt/' | sed 's/icarustpc.*/icarustpc/' | uniq); do echo $(du -csh /daq/log/${x}* |grep total) ${x}; done |sort -h`

And details of the `/daq/log/pmt`:

`for x in $(ls /daq/log/pmt | sed 's/[0-9].*//' | uniq); do echo $(du -csh /daq/log/pmt/${x}* |grep total) ${x}; done |sort -h`

#### Removing old logfiles
Old files are removed automatically with a script:
`~icarus/FileTransfer/sbndaq-xporter/Xporter/removeOldLogFiles.sh` run with a crontab set up on `icarus-evb06`. In case of emergency, old log files can be removed manually. Example commands are listed below.

The following example command removes all TPC boardreader logs older than 30 days:

`find /daq/log/icarustpc* -ctime +30 -type f -exec rm {} \;`

Similarly, TPC logs in pmt directory older than 30 days can be removed with:

`find /daq/log/pmt/launch_attempt_icarus-tpc* -ctime +30 -type f -exec rm {} \;`

After deleting the files, no longer active symlinks can removed:

`find /daq/log/. -xtype l -delete`

And finally, empty directories:

`find /daq/log/. -type d -exec rmdir {} \;`
