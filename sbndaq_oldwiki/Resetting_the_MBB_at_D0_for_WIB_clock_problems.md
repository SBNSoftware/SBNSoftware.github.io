---
layout: page
title: Resetting the MBB at D0 for WIB clock problems
---



Resetting the MBB at D0 for WIB clock problems
================================================================================================================

When you are configuring WIB, if you see errors like \"Failed to lock
PLL\" (PLL=phase locked loop) this most likely means the WIB is not
getting a clock signal from the MBB. Resetting the MBB puts it in a
known, default configuration and has a good chance of clearing the
problem with the WIB. To reset the MBB, follow this:

    ssh sbnd-daq00
    source /daq/software/products/setup
    setup wib v0_00_11 -q e17
    wib -m 192.168.230.51
    wr 0 1
    exit

If the **wr 0 1** command hangs up, just **ctrl-c**. Next try to
configure the WIB again
