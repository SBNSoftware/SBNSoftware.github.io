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

The most important parameters:
-   Number of FEB in the chain (`generated_fragments_per_event`)
-   list of `fragment_ids` (see below).
-   corresponding list of the same size determining if SiPM bias voltage on that FEB should be turned  on (`TurnOnHV`)
-   delay of PPS signal w.r.t. GPS-synchronised source (`PPS_offset_ns`). This allows fragment generator to correct for the delay introduced by cable lengths

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



### Fragment ID

The naming convention for CRT fragments is documented in
<https://sbn-docdb.fnal.gov/cgi-bin/private/ShowDocument?docid=16111>

Fragment generator collects data from several FEBs connected in ethernet
chain. Therefore a single generator produces many different fragment
IDs. As of now, all of them need to be defined in the FHiCL file in a
table `fragment_ids`.



## Code

### Where is the code?


- `sbndaq-artdaq/Generators/Common/Bern` -- board reader
- `sbndaq-artdaq-core/Overlays/Common` -- structure definitions



### Status

(10/08/21)

-   Board reader is fully functional
-   CRT measures absolute time of each hit based on nanosecond time measured by FEB
    and server time of the polls; see:  https://sbn-docdb.fnal.gov/cgi-bin/private/ShowDocument?docid=16108 for details

To do:

-   Cross check timestamps with DAQ components
-   Prepare framework to produce hardware configuration from the DB



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
