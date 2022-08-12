---
layout: page
title: Running CAEN DT5702 readout of CRT
toc: true
---

## Introduction

ICARUS side and top CRT is read using CAEN DT5702 front end boards
(FEB), developed at University of Bern.



## Hardware connections

-   T0 - normally should have PPS (1 pulse per second) signal connected
-   T1 - optional additional source of trigger
-   Tin/Tout - coincidence gating (not triggering!)
-   SiPM inputs - SiPMs, triggering the readout as well

FEBs are connected to computer with Ethernet cable. They can be chained
using another Ethernet port (doesn\'t matter which one).



## febdrv

### Introduction


febdrv communicates with FEBs via Ethernet. Originally written as
standalone program, it has been adopted to the needs of SBN DAQ
and finally integrated with the fragment generator.

Directory `sbndaq-artdaq/Generators/Common/Bern/` contains old,
standalone febdrv which is no longer in use.

### Permissions


As febdrv needs to access Ethernet port, the boardreader process requires
special permissions.

Bad solutions we have explored:
-   Run boardreader as a root user (security risk)
-   Give root permissions to the executable:
    `chown root:root febdrv && chmod u+s febdrv` (inconvenient, permissions reset on recompiling, security risk)
-   Set minimum permissions to the executable:
    `setcap cap_net_admin,cap_net_raw=eip febdrv` (doesn't work on nfs)

Good solution:
- Run board reader in a special environment granting it permissions.

Syntax for standalone operation (e.g. artdaqDriver) is: `/usr/libexec/ambient_cap_net_raw /bin/bash`

For DAQInterface `known_boardreaders_list` needs to contain the following line:
`boardereader_name server_name -1 1 0-15 "/usr/libexec/ambient_cap_net_raw /bin/env LD_LIBRARY_PATH=$LD_LIBRARY_PATH "`


## FHiCL configuration

### Overview

A FHiCL file for CRT corresponds to a single Ethernet port, or a
single *chain* of FEBs connected to that port.

#### Parameters to be specified for each boardreader:
-  `generator` – set to: BernCRTData
-  `fragment_type` – value used since 2021: BERNCRTV2
-  `ethernet_port` – name of port used to connect to chain of FEBs
-  `generated_fragments_per_event` – must equal to number of FEB in the chain
-  `firmware_flag` – can be ICARUS or SBND, to allow for differences in readout procedure and data format
-  `feb_poll_ms` – time between consecutive FEB polls. 
-  `FEBBufferCapacity` – number of _fragments_ that can be stored for each FEB
-  `fragment_period_ms` – time period covered by a single fragment
-  `max_time_with_no_data_ms` – if a FEB registers no hits within the specified time, the boardreader prints a warning message. Default value: 1000
-  `max_tolerable_t0_` – if value of ts0 counter exceeds the specified value, the boardreader prints a warning message. Default value: 1'000'100'000 ns. Normally if PPS is received, ts0 restarts after reaching ~1e9, thus much higher value suggests issue with PPS

Size of each of the following lists must equal to `generated_fragments_per_event`. The order does not need to correspond to physical order in the chain, but must be consistent between the lists:
-  `fragment_ids` – list of FEBs connected in the chain. See fragment ID format documentation in SBN docdb 16111 (ICARUS) _(SBND draft: docdb 27088)_
-  `TurnOnHV` – set to true to allow bias voltage to be turned on on the corresponding FEB
-  `PPS_offset_ns` – allows to input PPS delay due to signal propagation in cables, to allow boardreader to compute corrected timestamps. It is not critical to have this value correct, as the timestamp is recalculated from scratch later by the decoder

Unused/historical parameters:
-  `feb_restart_period_s` – if set to a value different than 0, boardeader will restart FEB readout each given number of seconds. Obsolete workaround for data corruption issue, eventually fixed in firmware
-  `initial_delay_s` – if set to a value different than 0, boardreader will discard all fragments for the specified number of seconds at the beginning of the run.

FEB configuration (see DT5702 documentation for details, SBN docdb 24843):
-   `ProbeBitStream` – normally should be a string with 224 `0`s
-   `FEBConfigurationMACxxx` – replace `xxx` with last 8 bits of FEB MAC address, without padding zero. The parameters are explained in DT5702 documentation, and interpreted by `BernCRTFEBConfiguration`. Note, for consistency `true` value always enables a setting and `false` disables it. The most important parameters are:
    -   `channel_configuration` – an array of 32 arrays with settings for each input SiPM channel. The columns in each array correspond to following parameters:
        -   time threshold ajustment 0–15
        -   charge threshold adjustment 0–15
        -   activate discriminator 0–1 (boolean)
        -   HV adjustment 0–255
        -   high-high bias 0–1 (boolean)
        -   HG gain 0–63
        -   LG gain 0–63
        -   test HG 0–1 (boolean)
        -   test LG 0–1 (boolean)
        -   enable preamp 0–1 (boolean)
    -   `charge_threshold` and `time_threshold` SiPM input threshold 0–1023
-   `SlowControlBitStreamxxx` – alternative way to provide FEB configuration in original CAEN string format

Individual FEB configuration, are included from separate files, individual for each FEB.
These settings include:

-   SiPM voltage adjustment (4V range)
-   Enabling individual channel amplifiers and triggers
-   Trigger threshold

Configuration files do **not** determine the absolute value of HV. Each FEB has a potentiometer setting the
    common voltage *c*, and the voltage on given SiPM is:

> HV\[ch\] = c - 4.5V + a\[ch\] ÷ 256 × 4V

where *a*\[ch\] is a value in range \[0, 255\[ specified in the
bitstream. In other words, bitstream allows to fine tune the HV in 4V
range only.

There is an ongoing effort to generate the FHiCL files automatically
based on the database information.



## Data format and readout procedure overview

A boardreader reads out all FEBs connected to given Ethernet port. Each FEB is distinguished by different fragment ID.

- Each time an FEB receives signal on SiPM input exceeding the threshold, or a signal on either T0 or T1 inputs, it triggers and reads out all SiPM inputs, and writes the data into an internal buffer. To avoid confusion with ICARUS trigger we call each readout a _hit_
- periodically the boardreader _polls_ all data from the buffer into the server memory
- Data from a single hit is saved in `BernCRTHitV2` structure
- All hits from a poll are grouped in shorter periods of time. Hits in each period is saved in an _art fragment_
- All fragments within the specified time window are saved in _fragment containers_, for each FEB. Note, this applies to `DAQInterface` only – `artdaqDriver` (a test utility) saves fragments individually.

`BernCRTTranslator` method `icarus::crt::BernCRTTranslator::getCRTData(std::vector<artdaq::Fragment> const & frags)` recognizes whether a fragment is a fragment or fragment container, recognizes data format (for older formats used before 2021), and outputs it in a flat vector, convenient for analysis.


## Code

### Where is the code?


- `sbndaq-artdaq/Generators/Common/Bern` -- board reader
- `sbndaq-artdaq-core/Overlays/Common` -- structure definitions



### Status

(8/1/22)

-   Board reader fully functional
-   CRT measures absolute time of each hit based on nanosecond time measured by FEB
    and server time of the polls; see:  https://sbn-docdb.fnal.gov/cgi-bin/private/ShowDocument?docid=16108 for details    

To do:

-   Ongoing cross checks timestamps between CRT and other DAQ components
-   Ongoing works on further improvements of FEB firmware



## DAQ server configuration


The following actions are needed on each new ICARUS CRT DAQ server:

-   Get artdaq running

-   Configure febdrv to run as system service (see above)

-   In order to ensure the Ethernet ports are up at boot, for each
    Ethernet port to be used for FEB readout modify the following lines
    in the corresponding files in `/etc/sysconfig/network-scripts/`:

        ONBOOT=yes
        BOOTPROTO=none
        
-   Install `/usr/libexec/ambient_cap_net_raw` tool. The program code is in service-now ticket RITM0946313 https://fermi.servicenowservices.com/wp?id=evg-ticket&sys_id=ccc9a992dbaf0810991e76708c961996&table=sc_req_item
