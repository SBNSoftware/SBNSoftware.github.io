---
layout: page
title: Running CAEN DT5702 readout of CRT
---



[Running CAEN DT5702 readout of CRT]{.ul}
===============================================================================================

-   **Table of contents**
-   [Running CAEN DT5702 readout of
    CRT]
-   [Introduction]
-   [Hardware connections]
-   [febdrv]
    -   [Introduction]
    -   [Usage]
    -   [Running as system service]
        -   [Check if febdrv is running]
        -   [Configuration]
-   [FHiCL configuration]
    -   [Overview]
    -   [Fragment ID]
-   [Code]
    -   [Where is the code?]
    -   [Status]
-   [DAQ server configuration]



Introduction
============================================

ICARUS side and top CRT is read using CAEN DT5702 front end boards
(FEB), developed at University of Bern.



Hardware connections
============================================================

-   T0 -- normally should have PPS (1 pulse per second) signal connected
-   T1 -- optional additional source of trigger
-   Tin/Tout -- coincidence gating (not triggering!)
-   SiPM inputs -- SiPMs, triggering the readout as well

FEBs are connected to computer with Ethernet cable. They can be chained
using another Ethernet port (doesn\'t matter which one).



febdrv
================================



Introduction
----------------------------------------------

febdrv is a program reading out data from FEBs via Ethernet. It uses
zeromq to send data and metrics to artdaq and receive commands and
configuration from artdaq.

The code was originally written at U.Bern, then modified at CERN, then
finally modified for SBN experiments. The code can be found in
`sbndaq-artdaq/Generators/Common/Bern/` .



Usage
------------------------------

As febdrv needs to access Ethernet port it requires root access.

-   **Preferred solution: run febdrv as a system service -- see below**
-   sudo
-   Set minimum permissions to the executable:
    `setcap cap_net_admin,cap_net_raw=eip febdrv` (doesn\'t work on nfs)
-   Give root permissions to the executable:
    `chown root:root febdrv && chmod u+s febdrv`

Syntax:\

    febdrv <ethernet port> <polling time ms> [first zmq port]

for example:\

    # ./febdrv enp101s0f3 300 5530
    WARNING!! The poll duration is set to minimum 300 ms.
    Fri Oct  4 16:47:12 2019 febdrv: initialized enp101s0f3 with MAC  68:05:ca:91:9c:27
    Fri Oct  4 16:47:12 2019 febdrv: listening at tcp://*:5530
    Fri Oct  4 16:47:12 2019 febdrv: data publisher at tcp://*:5531
    Fri Oct  4 16:47:12 2019 febdrv: stats publisher at tcp://*:5532
    Fri Oct  4 16:47:12 2019 febdrv: stats2 publisher at tcp://*:5533
    Fri Oct  4 16:47:12 2019 Newly connected FEB: 00:60:37:12:34:55 FEB_rev3_IAP7.013
    Fri Oct  4 16:47:12 2019 Newly connected FEB: 00:60:37:12:34:57 FEB_rev3_IAP7.013
    Fri Oct  4 16:47:12 2019 Newly connected FEB: 00:60:37:12:34:d7 FEB_rev3_IAP7.013
    Fri Oct  4 16:47:12 2019 In total 3 FEBs connected.

\
Here we run febdrv on Ethernet port enp101s0f3. There are 3 FEBs
connected to that port. Also febdrv opens four zeromq ports with
consecutive numbers.

To **stop** febdrv hit `Ctrl-C`.



Running as system service
----------------------------------------------------------------------



### Check if febdrv is running

Type `systemctl`. If everything is fine you should see something like:\
you see something like\

      febdrv-main.service              loaded active running   Main febdrv demon calling individual febdrv instances
      febdrv@enp101s0f0.service        loaded active running   febdrv on enp101s0f0
      febdrv@enp101s0f1.service        loaded active running   febdrv on enp101s0f1
      febdrv@enp101s0f2.service        loaded active running   febdrv on enp101s0f2
      febdrv@enp101s0f3.service        loaded active running   febdrv on enp101s0f3



### Configuration

In `sbndaq-artdaq/Generators/Common/Bern/service/` one can find files
which allow to run febdrv as system service:

-   `febdrv`@`.service` → copy to `/etc/systemd/system/` and edit path
    to febdrv executable in it
-   `febdrv-main.service` → copy to `/etc/systemd/system/` and edit list
    of Ethernet ports you want to use
-   `febdrv.PORTNAME.conf` → copy to `/etc/`, rename PORTNAME to the
    Ethernet port, and edit the first zeromq port number

Enable services including every Ethernet port you want to use\

    systemctl enable febdrv@enp101s0f0
    systemctl enable febdrv@enp101s0f1
    systemctl enable febdrv@enp101s0f2
    systemctl enable febdrv@enp101s0f3
    systemctl enable febdrv-main

You can start an individual instance\

    systemctl start febdrv@enp101s0f0

Or all of them at once\

    systemctl start febdrv-main

The output of febdrv can be viewed with `journalctl`:\

    journalctl -u <service_name>

\
e.g.\

    journalctl -u febdrv@enp101s0f3



FHiCL configuration
==========================================================



Overview
------------------------------------

A FHiCL file for CRT corresponds to a single febdrv instance, thus to a
single Ethernet port, or a single *chain* of FEBs connected to that
port. Presently (1/17/20) the best maintained version of CRT files is in
`sbndaq/sbn-fd/DAQInterface/configs/standard`. A file should:

-   load `crt_common.fcl`
-   specify first zeromq port number (`zmq_listening_port`)
-   specity list of mac addresses (`FEBIDs`)
-   corresponding list determining if HV on that port should be turned
    on (`TurnOnHV`)
-   load fcl file with *bitstream* configuration and assign it to each
    FEB (`SlowControlBitStream*`)

The FEBs are configured with bitstreams containing many settings,
including:

-   SiPM voltage adjustment (4V range)
-   Enabling individual channel amplifiers and triggers
-   Trigger threshold

Bitstream does **not** determine:

-   Whether to turn on or off the SiPM HV. This is done by commands
    `BIAS_ON` and `BIAS_OF` which are sent to febdrv separately, as
    defined in the main FHiCL file
-   The absolute value of HV. Each FEB has a potentiometer setting the
    common voltage *c*, and the voltage on given SiPM is:

> HV\[ch\] = c -- 4.5V + a\[ch\] ÷ 256 × 4V

where *a*\[ch\] is a value in range \[0, 255\[ specified in the
bitstream. In other words, bitstream allows to fine tune the HV in 4V
range only.

There is an ongoing effort to generate the FHiCL files automatically
based on the database information.



Fragment ID
------------------------------------------

The naming convention for CRT fragments is documented in
<https://sbn-docdb.fnal.gov/cgi-bin/private/ShowDocument?docid=16111>

Fragment generator collects data from several FEBs connected in ethernet
chain. Therefore a single generator produces many different fragment
IDs. As of now, all of them need to be defined in the FHiCL file in a
table `fragment_ids`.



Code
============================



Where is the code?
-------------------------------------------------------

`sbndaq-artdaq/Generators/Common/Bern` -- board reader\
`sbndaq-artdaq-core/Overlays/Common` -- structure definitions



Status
--------------------------------

(1/17/20)

-   Starting and stopping readout works
-   Sending bitstream configuration to FEBs, starting DAQ, turning on HV
-   Data acquisition requires still many tests
-   Absolute time of the events based on nanosecond time measured by FEB
    and server time of the polls

To do:

-   Synchronise with other DAQ components
-   Assign correct fragment ID to fragments, according to the new
    numbering convention
-   Test, test, test
-   Test more (ideas for tests to do welcome)
-   Prepare framework to read hardware configuration from the DB
-   Prepare configuration for all FEB in the experiment



DAQ server configuration
====================================================================

The following actions are needed on each new ICARUS CRT DAQ server:

-   Get artdaq running

-   Configure febdrv to run as system service (see above)

-   In order to ensure the Ethernet ports are up at boot, for each
    Ethernet port to be used for FEB readout modify the following lines
    in the corresponding files in `/etc/sysconfig/network-scripts/`:\

        ONBOOT=yes
        BOOTPROTO=none
