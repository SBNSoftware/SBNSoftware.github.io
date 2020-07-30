---
layout: page
title: Issues with CRT
---



Issues with CRT
==================================================



`ssh: connect to host sbnd-daq32-priv.fnal.gov port 22: No route to host`
----------------------------------------------------------------------------------------------------------------------------------------------------------------

The private subnetwork of sbnd-daq32 doesn\'t always come back online,
bring it up with\

    ksu
    ifconfig eno2 up
    ifconfig eno2 192.168.230.32

note that higher permissions are required.



Error: Received no reply from febdrv after waiting for 5 seconds.
----------------------------------------------------------------------------------------------------------------------------------------------------

Most probably febdrv is not running. See the instructions at:
<https://cdcvs.fnal.gov/redmine/projects/sbndaq/wiki/Running_CAEN_DT5702_readout_of_CRT#febdrv>
