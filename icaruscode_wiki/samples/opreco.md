Optical reconstruction samples
===============================

This is meant to be a list of the samples that are used for optical detector reconstruction.
This kind of lists has the remarkable ability of falling out of date in days, so in case of doubt throw a line to [SBN Slack channel #icarus-light-analysis (private)](https://shortbaseline.slack.com/archives/C02JK6ZUTLL) or ask the working group conveners.

Sample list:
* [data runs `11813` and `11816` (`v09_87_00`)](#runs-11813-and-11816-v09_87_00)

## Runs `11813` and `11816` (`v09_87_00`)

#### Sample description

Run                    | `11813`                | `11816`
---------------------- | ---------------------- | ---------------------
Link to datasheet      |  [`11813`](https://docs.google.com/spreadsheets/d/1dQk0L4VjpuArQqWBkbO334lJVZJd0Ldn0wQkMS9pEH8/edit?pli=1#gid=1592536638&range=A17) | [`11816`](https://docs.google.com/spreadsheets/d/1dQk0L4VjpuArQqWBkbO334lJVZJd0Ldn0wQkMS9pEH8/edit?pli=1#gid=1592536638&range=A20)
Run period             | Run3
Date                   | `2024-03-18 17:00`     | `2024-03-20 14:17`
Duration               | `17:42:18`             | `20:24:33`
NuMI repetition rate   | 14/15 (0.933 Hz)
BNB repetition rate    | 4× NuMI (3.733 Hz)
NuMI PoT/spill         | 3.3·10¹³ (mode)        | 3.7·10¹³ (mode)
BNB  PoT/spill         | 4.16·10¹² (mode)       | 3.20·10¹² (mode) 
Events                 | ≥`45840`               | ≥`55534`
Trigger configuration  | physics, majority only | physics standard
Notes                  | extended NuMI beam gate: 15 µs

(when values in the table are the same as the previous column they are not repeated)


#### Processing information

Processing by SBN Production:

Item               | Item information
------------------ | ----------------------------------------------------------------------------------
Submission date    | `2024-03-26`
Submitted by       | Gianluca Petrillo
Submission ID      | `ICARUSrun11813full`, `ICARUSrun11816full`
Description        | ICARUS reference standard Run3 run 11813/11816 with all PMT waveforms
Software version   | `icaruscode` `v09_87_00`
Output formats     | _art_/ROOT `Stage1`, CAF (all), calibration tuples
Job configurations | `Stage0`: `stage0_run2_wc_icarus.fcl`
"                  | `Stage1`: `stage1_run2_larcv_icarus.fcl`
"                  | CAF: `cafmakerjob_icarus_data.fcl`
Input definitions  | run `11813`: `petrillo_ICARUS_data_run11813_raw` (`979` files)
"                  | run `11816`: `petrillo_ICARUS_data_run11816_raw` (`1176` files)
Special requests   | Stage1, calibration tuples and CAF files need to be persistently cached on disk
Production steward | Promita Roy

This is a production performed with the official **`icaruscode` release `v09_87_00`**.

Statistics:

Run                        | `11813`     | `11816`
-------------------------- | ----------- | -----------
expected events            | ≥`45840`    | ≥`55534`
expected files             | `967`       | `1163`
events from SAM (`Stage1`) | `39683`     | `39109`
duplicate files (`Stage1`) | `20`        | `39`

**Current issues**:
1. duplicate files declared to SAM (checked only `Stage1`)
2. samples for run 11816 BNB offbeam minimum bias stream are nowhere to be found (only that run and that stream)
3. we have 13% and 30% of events missing from the two samples (yikes!!)


#### Data retrieval

The following sets are defined:
 * format: `stage1`, `calibtuples`, `[flat]caf_(blind|unblind|prescaled)` (in Bash: `{stage1,calibtuples,{flat,}caf_{blind,unblind,prescaled}}`)
 * stream: `[offbeam](bnb|numi)(minbias|majority)` (in Bash: `{,offbeam}{bnb,numi}{minbias,majority}`)
 * RunNo: the run number (not padded)

Data can be addressed by SAM definitions, and current data paths are reported here.
Persistent data paths are not available yet.

##### SAM definitions

Single pattern: `Icaruspro_2024_Run3_Run<RunNo>_OpRecWG_<stream>_production_Data_OpticalReconstructionWG_Run3_<RunNo>_<stream>_v09_87_00_<stream>_<format>`

Test:
```bash
declare -a Runs=( 11813 11816 )
declare -a Streams=( {,offbeam}{bnb,numi}{minbias,majority} )
declare -a Formats=( {stage1,calibtuples,{flat,}caf_{blind,unblind,prescaled}} )
declare -i nDefinitions=0
for RunNo in "${Runs[@]}" ; do
  for Stream in "${Streams[@]}" ; do
    for Format in "${Formats[@]}" ; do
      SAMdefName="Icaruspro_2024_Run3_Run${RunNo}_OpRecWG_${Stream}_production_Data_OpticalReconstructionWG_Run3_${RunNo}_${Stream}_v09_87_00_${Stream}_${Format}"
      samweb describe-definition "$SAMdefName" > /dev/null || continue
      let ++nDefinitions
    done
  done
done
echo "${nDefinitions} definitions found (${#Runs[@]} runs x ${#Streams[@]} streams x ${#Formats[@]} formats = $(( ${#Runs[@]} * ${#Streams[@]} * ${#Formats[@]} )) expected)."
```

##### Data paths

##### _art_/ROOT files

Only available for `Stage1`.

Pattern: `/pnfs/sbn/data_add/sbn_fd/poms_production/data/Data_OpticalReconstructionWG_Run3_<RunNo>_<stream>/reconstructed/icaruscode_v09_87_00/Icaruspro_2024_Run3_Run<RunNo>_OpRecWG_<stream>/<stream>/<Format>/`

Test:
```bash
declare -a Runs=( 11813 11816 )
declare -a Streams=( {,offbeam}{bnb,numi}{minbias,majority} )
declare -a Formats=( 'stage1' )
declare -i nSamples=0
for RunNo in "${Runs[@]}" ; do
  for Stream in "${Streams[@]}" ; do
    for Format in "${Formats[@]}" ; do
      DataPath="/pnfs/sbn/data_add/sbn_fd/poms_production/data/Data_OpticalReconstructionWG_Run3_${RunNo}_${Stream}/reconstructed/icaruscode_v09_87_00/Icaruspro_2024_Run3_Run${RunNo}_OpRecWG_${Stream}/${Stream}/${Format}/"
      NFiles="$(find "$DataPath" -name "*.root" | wc -l)"
      [[ $NFiles -gt 0 ]] || continue
      printf 'Run %5d data stream %-20s %-15s: %5d\n' "$RunNo" "$Stream" "$Format" "$NFiles"
      let ++nSamples
    done
  done
done
echo "${nDefinitions} data paths (${#Runs[@]} runs x ${#Streams[@]} streams x ${#Formats[@]} formats = $(( ${#Runs[@]} * ${#Streams[@]} * ${#Formats[@]} )) expected)."
```

##### Simple trees (calibration tuple and CAF files)

Pattern: `/pnfs/sbn/data/sbn_fd/poms_production/data/Data_OpticalReconstructionWG_Run3_<RunNo>_<stream>/reconstructed/icaruscode_v09_87_00/<stream>/<format>/`

Test:
```bash
declare -a Runs=( 11813 11816 )
declare -a Streams=( {,offbeam}{bnb,numi}{minbias,majority} )
declare -a Formats=( {calibtuples,{flat,}caf_{blind,unblind,prescaled}} )
declare -i nSamples=0
for RunNo in "${Runs[@]}" ; do
  for Stream in "${Streams[@]}" ; do
    for Format in "${Formats[@]}" ; do
      DataPath="/pnfs/sbn/data/sbn_fd/poms_production/data/Data_OpticalReconstructionWG_Run3_${RunNo}_${Stream}/reconstructed/icaruscode_v09_87_00/${Stream}/${Format}/"
      NFiles="$(find "$DataPath" -name "*.root" | wc -l)"
      [[ $NFiles -gt 0 ]] || continue
      printf 'Run %5d data stream %-20s %-15s: %5d\n' "$RunNo" "$Stream" "$Format" "$NFiles"
      let ++nSamples
    done
  done
done
echo "${nDefinitions} data paths (${#Runs[@]} runs x ${#Streams[@]} streams x ${#Formats[@]} formats = $(( ${#Runs[@]} * ${#Streams[@]} * ${#Formats[@]} )) expected)."
```

