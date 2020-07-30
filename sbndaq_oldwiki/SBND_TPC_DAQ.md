---
layout: page
title: SBND TPC DAQ
---



SBND TPC DAQ
============================================

A zoom recording of SBND TPC readout/DAQ training is available here:\
<https://drive.google.com/open?id=1iL-iDeU70LJ22oUOEBjFKqcQXWjntfL_>\
The link to accompanying (collaborative) notes for the training is
here:\
<https://docs.google.com/document/d/12apiaDGhb0JJtlllKJ94UYfVKv1BdJwck4Bh9WPP7IM/edit?usp=sharing>

Installation instructions are available at\
<https://cdcvs.fnal.gov/redmine/projects/sbndaq/wiki/Installation_instructions>

Nevis fragment generators are in
`srcs/sbndaq_artdaq/sbndaq-artdaq/Generators/SBND/NevisTPC`\
<https://cdcvs.fnal.gov/redmine/projects/sbndaq/repository/artdaq/revisions/master/show/sbndaq-artdaq/Generators/SBND/NevisTPC>

Nevis overlays are in
`srcs/sbndaq_artdaq_core/sbndaq-artdaq-core/Overlays/SBND`\
<https://cdcvs.fnal.gov/redmine/projects/sbndaq/repository/artdaq-core/revisions/master/show/sbndaq-artdaq-core/Overlays/SBND>

fcls for running artdaqDriver at DAB are in
`srcs/sbndaq/dab/artdaqDriver`\
<https://cdcvs.fnal.gov/redmine/projects/sbndaq/repository/revisions/master/show/dab/artdaqDriver>

fcls for running DAQInterface at DAB are in
`srcs/sbndaq/dab/DAQInterface/configs/standard`\
<https://cdcvs.fnal.gov/redmine/projects/sbndaq/repository/revisions/master/show/dab/DAQInterface>

fcls for running artdaqDriver at SBN-ND are in
`srcs/sbndaq/sbn-nd/artdaqDriver`\
<https://cdcvs.fnal.gov/redmine/projects/sbndaq/repository/revisions/master/show/sbn-nd/artdaqDriver>

The configuration and interaction with the Nevis electronics are done
through the following utils:\
<https://cdcvs.fnal.gov/redmine/projects/sbndaq/repository/artdaq/revisions/master/show/sbndaq-artdaq/Generators/SBND/NevisTPC/nevishwutils>\
The low-level commands are documented here:\
<https://sbn-docdb.fnal.gov/cgi-bin/private/ShowDocument?docid=17737>

Diagrams showing the hardware connections and signal distribution are
available at:\
<https://sbn-docdb.fnal.gov/cgi-bin/private/ShowDocument?docid=11601>



SBN-ND reception tests
----------------------------------------------------------------

To test at DAB: `ssh` to `sbn-daq01.fnal.gov` (first `ssh` into one of
the `sbndgpvm*.fnal.gov` or connect with Fermilab **VPN**)\
To test at SBN-ND: `ssh` to `sbnd-gateway01.fnal.gov`, then to the TPC
server (Crate) you want to test `sbnd-tpc{01 .. 11}.fnal.gov` (first
`ssh` into one of the `sbndgpvm*.fnal.gov`)

There is a Bash script at\

    /home/nfs/jcrespo/run.sh

to run the Nevis electronics. It gives you 8 run options (6 at DAB):

            (1) WIB data: 2-stream with External triggers _(→ Requires to run Crate01 – Trigger Board –)_
            (2) WIB data: 2-stream with Internal triggers (1 Hz) _(→ Requires to run Crate01 – Trigger Board –)_
            (3) WIB data: 2-stream with Controller triggers (1 Hz)
            (4) Nevis fake data: 2-stream with external triggers _(→ Requires to run Crate01 – Trigger Board –)_
            (5) Nevis fake data: 2-stream with internal triggers (1 Hz) _(→ Requires to run Crate01 – Trigger Board –)_
            (6) Nevis fake data: 2-stream with controller triggers (1 Hz)
            (7) WIB data: NU-stream with External triggers _(currently available just at SBN-ND)_
            (8) WIB data: NU-stream with Internal triggers _(currently available just at SBN-ND)_

The modes with Controller triigers do not show information in the
`XMIT Counter Info Report` so the progress of the run cannot be
monitored in real time.

The Nevis fake data takes \~ 30 seconds/FEM to configure, which
increases significantly the configuration time.

Default Nevis fake data is "channel" number. Edit the fcl file called in
the `run.sh` script to change between the predefined fake data modes.

The `run.sh` script creates a directory with the DAQ log, the art-root
file from the NU stream and binary dumps of the NU and SN streams.

The decoder and analyzers at:\
<https://github.com/NevisSBND/DecoderTools/tree/master>\
can be run on the binary dumps to check the data quality.

The raw binary data format is described at:\
<https://sbn-docdb.fnal.gov/cgi-bin/private/ShowDocument?docid=17726>

For more information, see:\
<https://cdcvs.fnal.gov/redmine/projects/sbn-online/wiki/SBND_Electrical_Installation>



DAQ *Digitization* (conversion to LArSoft `raw::RawDigit`)
--------------------------------------------------------------------------------------------------------------------------------

An area has been set up to run *digitization* on the artROOT fragments
from the DAQ (thanks, Gray Putnam!). To setup the area:\

    source /home/nfs/gputnam/sbndqm/setup.sh

then to digitize a file, run:\

    lar -c daq_digits.fcl -s /path/to/fragments.root -o /path/to/output/digits.root

This will generate an artROOT file with the `raw::RawDigit` data product
(one for every input channel).

To take a look at the waveforms:\

    cd /home/nfs/gputnam/sbndqm/srcs/sbndqm/sbndqm/dqmAnalysis/TPC/fcl
    lar -c daq_digits.fcl -s /path/to/fragments.root -o /path/to/output/digits.root
    lar -c analysis.fcl -s /path/to/digits.root -T /path/to/output/analyze.root
    python waveform_plots.py /path/to/analyze.root



Common issues
----------------------------------------------

-   Run crashed with\

        terminate called after throwing an instance of 'std::future_error'
          what():  std::future_error: No associated state
        DeviceFind: Failed scanning the PCI bus.
        Error: 0xffffffffffffffff - Unrecognized error code

    \
    This is caused by the WinDriver module not being installed (e.g. the
    machine was rebooted). It is solved by running the
    `configureOnBoot-windriver.sh` script as root (using the `ksu`
    command), available under `sbndaq-artdaq/Generators/SBND/NevisTPC`



Nevis hardware inventory at Fermilab
--------------------------------------------------------------------------------------------

<https://docs.google.com/spreadsheets/d/1AQXGrZXeNa0D6rSTsjCj5G_V7EQZgRDxtb_MsUXf5_I/edit?usp=sharing>



Nevis hardware production tests
----------------------------------------------------------------------------------

Spreadsheet with results:

<https://docs.google.com/spreadsheets/d/1ii1FLGL13_uwqlrpzJUMa7GK6FMXc4KhrrrnM_nBx0s/edit?usp=sharing>

Instructions for Nevis test stand:\
<https://docs.google.com/document/d/1FEPsFM0LB9X_Qk528AUC7p9eAtiUBAnd7lbsSa56iS4/edit?usp=sharing>\
<https://docs.google.com/document/d/1G7MZ5pZ2yDd6yqmX4_8zHnY2gTU_rZ3DK__UnKl4X_k/edit?usp=sharing>\
<https://docs.google.com/document/d/1CPOFV3FtPLYabJzmmvByxf7amRxJMWJT8ZhZ8Oib3ZU/edit?usp=sharing>
