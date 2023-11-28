---
layout: page
title: Status of ongoing development and debugging
description: List of issues and details of work
hero_height: is-small
toc: true
toc_title: 
---

## TPC trigger skew
  - debugging started
  - possibly we need more debug messages
  - possibly the race condition does not occur in the debug mode


### Debugging session on Nov 15, 2022
Actions:
  - re-enabled debug trace messages
  - added trace messages to monitor the occupancy of the Circular Buffer
  - added relevant grafana metrics to `Artdaq_TPC_fragments` page
 
Observations:
  - the buffer never does seem to be linearized


## Lost boardreaders on TPC corner crates due to segfaults

 - possibly other boardreaders too, but less often – not sure if it's the same issue!

## Loss of PMT boardreaders
 - Seems to occur at higher trigger rates (e.g. out of spill), e.g. 5_5 configuration crashes each several hours
 - Failures connected with kernel a3818 messages in `/var/log/messages` and general protection failures
 - New CAEN libraries and updated code in use since May 11, 2023

## Shared memory problems resulting in OM interruptions with run crashes
  - less issues recently
  - what is the reason for run crashing? There should be no interference between OM and the main DAQ
  - Dispatcher stopping causes the run to stop. Is dispatcher in critical_process_list? Is it wanted? Maybe we can settle of just having an error message and shifter restarting the shifter manually → more uptime


## Exceptions related to checksum
  - Filippo will look for details
  - What version of sbndaq, which development area was used?
  - What happens? Is data lost or corrupted? Debugging needed


## Trigger
  - issue with starting trigger improved by changing version of trigger vi
  - Unclear reason why run 9093 has some files with no stream in their name. More information needed. Is there anything different about Event Builders 21 and 26? The boot file name is saved in run_records. --> The reason could be that in configuration "Calibration_MINBIAS_BNB_Thr400_Majority10_FixedWindow_4Hz_00002" the line "physics.my_output_modules: [ testOutput, rootNetOutput ]" in EventBuilder21.fcl and EventBuilder26.fcl is not commented
  - Automatic starting trigger when the run starts? → development started

## Very long time to start and to stop the DAQ
  - A potential reason might be that the boardreaders start to produce fragments before the run starts, and don't necessarily stop to produce fragments when the run stops.

## Managing the logfiles
  - during the summer/fall of 2022 the size of the logfiles was greatly reduced
  - we decided the only file we really need to preserve is /daq/log/DAQInterface_partition1.log . The SLAM group is helping us to arrange it [done early 2023]
  - still needed: increasing debug level of some of the trigger messages

## Automatic e-mail/slack notifications in case of DAQ issues requireing prompt attention
- https://github.com/art-daq/artdaq_mfextensions/blob/develop/mfextensions/Destinations/SMTP_mfPlugin.cc

## Automatic sending of an e-log message when the run starts and stops
- C++ ELOG code for reference: https://github.com/art-daq/otsdaq_utilities/tree/develop/otsdaq-utilities/ECLWriter 

## FTS
- setup necessary FTS and CRL services start automatically at boot
- setup an alarm if the service stops

## Server monitoring
- setup system resources monitoring with Prometheus, at least on icarus-evb06, and perhaps on other machines too

## Cleanup old git branches

## Remove old, unused metrics from grafana
- Completed Autumn 2023
