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


### Debugging session on Nov 15
Actions:
  - re-enabled debug trace messages
  - added trace messages to monitor the occupancy of the Circular Buffer
  - added relevant grafana metrics to `Artdaq_TPC_fragments` page
 
Observations:
  - the buffer never does seem to be linearized


## Lost boardreaders on TPC corner crates due to segfaults

 - possibly other boardreaders too, but less often – not sure if it's the same issue!


## Shared memory problems resulting in OM interruptions with run crashes
  - less issues recently
  - what is the reason for run crashing? There should be no interference between OM and the main DAQ
  - Dispatcher stopping causes the run to stop. Is dispatcher in critical_process_list? Is it wanted? Maybe we can settle of just having an error message and shifter restarting the shifter manually → more uptime


## Exceptions related to checksum
  - Filippo will look for details
  - What version of sbndaq, which development area was used?
  - What happens? Is data lost or corrupted? Debugging needed


## Trigger:
  - issue with starting trigger improved by changing version of trigger vi
  - Unclear reason why run 9093 has some files with no stream in their name. More information needed. Is there anything different about Event Builders 21 and 26? The boot file name is saved in run_records.

## Very long time to start and to stop the DAQ
  - A potential reason might be that the boardreaders start to produce fragments before the run starts, and don't necessarily stop to produce fragments when the run stops.
