---
lang: en
title: How to configure WIB and FEMB at D0 using python scripts
---

[]{#How-to-configure-WIB-and-FEMB-at-D0-and-SBN-ND-using-python-scripts}

How to configure WIB and FEMB at D0 and SBN-ND using python scripts[¶](#How-to-configure-WIB-and-FEMB-at-D0-and-SBN-ND-using-python-scripts){.wiki-anchor}
==========================================================================================================================================================

To put the WIB into **[fake waveform mode]{.ul}**, type the following:

    ssh sbnd@sbnd-daq00.fnal.gov or ssh sbnd@sbnd-gateway01.fnal.gov
    cd /home/nfs/sbnd/BNL_CE/SBND_CE/
    source ../venv/bin/activate
    source Local_diagnositc_RUN_WIB_fakedata.sh
     

The initial output should like something like this:

    (venv) -bash-4.2$ source ./Local_diagnositc_RUN_WIB_fakedata.sh 
    /home/nfs/sbnd/BNL_CE/venv/lib/python2.7/site-packages/openpyxl/xml/__init__.py:15: UserWarning: The installed version of lxml is too old to be used with openpyxl
      warnings.warn("The installed version of lxml is too old to be used with openpyxl")
    LArIAT
    WIEC self check
    time cost = 0.013 seconds
    0xe4000119L
    WIB(192.168.230.50) passed self check!
    check PLL status, please wait...
    check PLL status, please wait...
    check PLL status, please wait...
    check PLL status, please wait...
    check PLL status, please wait...
    configurate PLL of WIB (192.168.230.50), please wait...
    (11, 36, 192)
    (11, 37, 0)

Followed by a bunch of numerical printouts, and then:

    (464, 11, 37, 2)
    check PLL status, please wait...
    PLL of WIB(192.168.230.50) is locked
    ['192.168.230.50']
    FEMBs self-check
    COTS ADC in use
    Start FEMBs of WIB(IP=192.168.230.50) self-check
    FEMBs alive: 
    [[], []]
    True
    Turn FEMBs OFF
    time cost = 81.145 seconds
    All FEMBs have been turned off
    Well Done
    BNL_WIB1_IP >> 192.168.230.50
    BNL_check_time >> 2020-03-11 09:22:25
    WIB fake data mode. Power for FEMBs will be turned off!!!
    32
    DONE
