---
layout: page
title: Issues with TPC
---



SBND TPC readout troubleshooting
====================================================================================



Status of TPC readout electronics
--------------------------------------------------------------------------------------

Every 12 seconds, an status report (\"XMIT Counter Info Report \") is
printed.

        crate ID          : # Ignore
        frame number      : # If the Nevis NIM clock is working and the crate is powered, it will increase
        trigger received  : # If 0, triggers are not received (e.g. triggers are not being sent to the Nevis Trigger Board)
        packed event (nu) : # If 0, the NU stream (trigger stream) is not processing events, usually due to an issue with the PCIe card
        packed event (sn) : # If 0, the SN stream (continuous stream) is not processing frames, usually due to an issue with the PCIe card



DAQ crashing because WinDriver is not loaded
------------------------------------------------------------------------------------------------------------

Sometimes the WinDriver doesn\'t load automatically. That causes the run
to crash upon the first call to a Nevis PCIe card. To test if it\'s
loaded:



### Diagnostic

On `sbn-daq01` do:

    ls /dev/windrvr1260
    wholink

Unfortunately it won\'t catch all problems. If you can\'t find it source
it with:

    /daq/software/products/windriver/configureOnBoot-windriver.sh



### Alternative diagnostic: Run the Nevis DAQ code

Set up windriver first:\

    source /software/products/setup
    setup windriver v12_06_00 -q prof

Run\

    /home/nfs/sbnd/jcrespo/BoardTest/linux/lariat_mbtest

If WinDriver is not loaded you will get:\

    NEVISPCI diagnostic utility.
    Application accesses hardware using WinDriver.
    pcie_diag: Failed to initialize the NEVISPCI library: Failed to initialize the WDC library. Error 0x20000001 - Invalid handle

If WinDriver is loaded, you will get:\

    NEVISPCI diagnostic utility.
    Application accesses hardware using WinDriver.

    Found 2 matching devices [ Vendor ID 0x1172, Device ID 0x4 ]:

     1. Vendor ID: 0x1172, Device ID: 0x4
        Location: Bus [0x5], Slot [0x0], Function [0x0]
        Memory range [BAR 0]: base 0xFE900000, size 0x40000
        Memory range [BAR 1]: base 0xFE940000, size 0x40000
        Memory range [BAR 2]: base 0xFE980000, size 0x80000
        Memory range [BAR 3]: base 0xFE8C0000, size 0x40000
        Memory range [BAR 4]: base 0xFE880000, size 0x40000
        Memory range [BAR 5]: base 0xFE840000, size 0x40000
        Interrupt: IRQ 11
        Interrupt Options (supported interrupts):
            Message-Signaled Interrupt (MSI)
            Level-Sensitive Interrupt
        PCI Express Generation: Gen1

     2. Vendor ID: 0x1172, Device ID: 0x4
        Location: Bus [0x9], Slot [0x0], Function [0x0]
        Memory range [BAR 0]: base 0xCFF80000, size 0x40000
        Memory range [BAR 1]: base 0xCFFC0000, size 0x40000
        Memory range [BAR 2]: base 0xD0000000, size 0x10000000
        Memory range [BAR 3]: base 0xCFF40000, size 0x40000
        Memory range [BAR 4]: base 0xCFF00000, size 0x40000
        Memory range [BAR 5]: base 0xCFEC0000, size 0x40000
        Interrupt: IRQ 7
        Interrupt Options (supported interrupts):
            Message-Signaled Interrupt (MSI)
            Level-Sensitive Interrupt
        PCI Express Generation: Gen1

    Select a device (1 - 2):  (to cancel press 'x'):

\
Do not continue running the program, instead exit with CTRL + C



WIB-FEM Issues
------------------------------------------------

**Best it to ask for help to experts.** The only solutions available now
are disconnecting the fibers to isolate the FEMs and confirming data is
taken, or connecting a probe to the optical link to diagnose. Both
should be using only in special cases since it alters the setup. Similar
issues were found in previous BNL-Nevis integration tests and were fixed
by changing the WIB firmware.
