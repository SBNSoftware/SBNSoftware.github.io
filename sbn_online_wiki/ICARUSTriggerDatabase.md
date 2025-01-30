---
layout: page
title: Online Trigger Database in ICARUS
hero_height: is-medium
toc: true
---

## Event-by-event trigger database

The ICARUS trigger database stores all the event-by-event information saved in the trigger fragments.
It lives on the ICARUS online cluster alongside the other PostgreSQL DCS and slow controls databases.
They primary host is currently `icarus-db02` (with a backup on `icarus-db03`), but it is also replicated offline in read-only format on `ifdbdaqrep01`.

POT accounting requires matching ICARUS events with IFBEAM events.
While LArSoft events store the same trigger information, events are not saved sequentially in the DAQ output files.
This is both due to the different data streams and the number of EventBuilder processes (given `n` EventBuilders, event `j` is packaged by the `(j%n)th` one).
As a result, POT accounting would require accessing all the files in a run just to sort the triggers by time.
The trigger database was developed to simplify these operations in the offline, providing a easy way to query and sort the collected triggers.

The scripts supporting and automatically filling the trigger database are in the following repository:
https://github.com/SBNSoftware/icarus-trigger-database.
The initial implementation was developed by [Justin Mueller](https://github.com/justinjmueller) at [https://github.com/justinjmueller/icarus_runinfo_database](https://github.com/justinjmueller/icarus_runinfo_database).

### Data flow

The database is currently filled by reading the trigger boardreader logfiles.
This happens daily via cronjobs running on `icarus-evb06`.
A more robust implementation is being planned by having the database filled directly by an analyzer module in the main DAQ code.

- Trigger logfiles are created for every run in `/daq/log/boardreader/run*-icarustrigger.log`
- Every day `backupTriggerLogs.sh` creates a compressed copy of any new logfile in `/home/nfs/icarus/TriggerLogBackup`.
  - Only logs older than 1 day are considered to avoid ongoing runs.
- Every day `runFillTriggerDatabase.sh` checks that backup directory and fills the trigger database accordingly.
  - File names already processed are skipped, unless the file size has changed.
  - Stub files are skipped.
  - The log is parsed for trigger data strings. Information missing in older trigger packet versions is defaulted to `-1`.
  - Logs and errors are saved to `/daq/log/triggerdb/`.

### Tables

## Trigger Data

The `triggerdata` table encapsulates all information that exists at the per-trigger level. It corresponds to the contents of the trigger TCP/IP packet.
The primary key is the pair (`run_number`,`event_no`).

| Column                 | Type    | Description                                                                                                                  | Default |
| ---------------------- | ------- | ---------------------------------------------------------------------------------------------------------------------------- | ------- |
| `run_number`           | integer | DAQ run number                                                                                                               |         |
| `version`              | integer | Version numbering for the trigger string data                                                                                |         |
| `event_no`             | integer | Event number                                                                                                                 |         |
| `seconds`              | integer | Local time stamp of the global trigger (seconds)                                                                             |         |
| `nanoseconds`          | integer | Local time stamp of the global trigger (nanoseconds)                                                                         |         |
| `wr_event_no`          | integer | Event number from the White Rabbit                                                                                           |         |
| `wr_seconds`           | integer | Time stamp of the global trigger (seconds)                                                                                   |         |
| `wr_nanoseconds`       | integer | Time stamp of the global trigger (nanoseconds)                                                                               |         |
| `enable_type`          | integer | Enable gate type                                                                                                             |         |
| `enable_seconds`       | integer | Time stamp of the enable gate (seconds)                                                                                      |         |
| `enable_nanoseconds`   | integer | Time stamp of the enable gate (nanoseconds)                                                                                  |         |
| `gate_id`              | integer | Number of the current gate                                                                                                   |         |
| `gate_type`            | integer | Number encoding the type of gate (1: BNB, 2: NuMI, 3: BNBOffbeam, 4: NuMIOffbeam, 5: Calibration)                            |         |
| `gate_id_bnb`          | integer | Gate ID (BNB)                                                                                                                |         |
| `gate_id_numi`         | integer | Gate ID (NuMI)                                                                                                               |         |
| `gate_id_bnboff`       | integer | Gate ID (offbeam BNB)                                                                                                        |         |
| `gate_id_numioff`      | integer | Gate ID (offbeam NuMI)                                                                                                       |         |
| `beam_seconds`         | integer | Time stamp of the beam gate (seconds)                                                                                        |         |
| `beam_nanoseconds`     | integer | Time stamp of the beam gate (nanoseconds)                                                                                    |         |
| `trigger_type`         | integer | Type of trigger logic (0: Majority, 1: MinBias)                                                                              |         |
| `trigger_source`       | integer | Originating cryostat of the trigger (0: Undecided, 1: East, 2: West, 7: Both)                                                |         |
| `cryo1_e_conn_0`       | text    | 64-bit word with the status of the pairs of PMT discriminated signals (LVDS) for the EE wall                                 |         |
| `cryo1_e_conn_2`       | text    | 64-bit word with the status of the pairs of PMT discriminated signals (LVDS) for the EW wall                                 |         |
| `cryo2_w_conn_0`       | text    | 64-bit word with the status of the pairs of PMT discriminated signals (LVDS) for the WE wall                                 |         |
| `cryo2_w_conn_2`       | text    | 64-bit word with the status of the pairs of PMT discriminated signals (LVDS) for the WW wall                                 |         |
| `cryo1_east_counts`    | integer | Counters of other activity in coincidence with the gate (other potential global triggers in the event) for the East cryostat |         |
| `cryo2_west_count`     | integer | Counters of other activity in coincidence with the gate (other potential global triggers in the event) for the Wast cryostat |         |
| `mj_adder_source_east` | integer | Enumeration of trigger source in the East cryostat, specifically adder vs. majority (1: adders, 2: majority, 7: both)        | `-1`    |
| `mj_adder_source_west` | integer | Enumeration of trigger source in the West cryostat, specifically adder vs. majority (1: adders, 2: majority, 7: both)        | `-1`    |
| `flag_east`            | integer | Flags true if a trigger was detected in the East cryostat                                                                    | `-1`    |
| `delay_east`           | integer | Delay of the East trigger from the start of the beam gate in FPGA ticks (default: 90)                                        | `-1`    |
| `flag_west`            | integer | Flags true if a trigger was detected in the West cryostat                                                                    | `-1`    |
| `delay_west`           | integer | Delay of the West trigger from the start of the beam gate in FPGA ticks (default: 90)                                        | `-1`    |

## Trigger log

The `triggerlog` table contains metadata associated with each trigger log file.
It is used internally to keep track of log files that have been processed already.
The primary key is `log_name`.

| Column       | Type    | Description                                                   |
| ------------ | ------- | ------------------------------------------------------------- |
| `log_name`   | text    | The name of the log file                                      |
| `stub`       | bool    | Boolean tagging the log file as containing no actual triggers |
| `file_size`  | integer | Size of the file on disk                                      |
| `run_number` | integer | Run number corresponding to the log file                      |
| `processed`  | bool    | Boolean tagging the log file as processed/not processed       |

### How to access

#### Online version

Direct access to the database in the online cluster is reserved for filling operations through the shared `triggerdb_writer` user.
This is handled through the script configuration in https://github.com/SBNSoftware/icarus-trigger-database/blob/main/config.json.

For interactive access from `icarus-gateway03`, type:
```
psql -W -U triggerdb_writer -h icarus-db02 -p 5434 -d icarus_trigger_prd
```
You will be prompted for a password.

Please contact [Donatella Torretta](mailto:torretta@fnal.gov) or [Matteo Vicenzi](mailto:mvicenzi@bnl.gov) for the password.

#### Offline standby replica

Access for querying and analyzing trigger data should be performed via the offline read-only replica on `ifdbdaqrep01`.
This is handled through the shared `triggerdb_reader` user.

For interactive access from any `icarusgpvm` host, type:
```
psql -W -U triggerdb_reader -h ifdbdaqrep01 -p 5455 -d icarus_trigger_prd
```
You will be prompted for a password.

Connection details to be used for Python/C++ connection libraries are:
```
db_params = {
  'dbname': 'icarus_trigger_prd',
  'user': 'triggerdb_reader',
  'password': '******',
  'host': 'ifdbdaqrep01.fnal.gov',
  'port': '5455'
}
```

Please contact [Donatella Torretta](mailto:torretta@fnal.gov) or [Matteo Vicenzi](mailto:mvicenzi@bnl.gov) for the password.
