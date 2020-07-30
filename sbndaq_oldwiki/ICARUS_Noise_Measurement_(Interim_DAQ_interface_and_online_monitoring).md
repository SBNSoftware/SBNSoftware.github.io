---
lang: en
title: ICARUS Noise Measurement (Interim DAQ interface and online
  monitoring)
---

[]{#ICARUS-Noise-Measurement-Interim-DAQ-interface-and-online-monitoring}

ICARUS Noise Measurement (Interim DAQ interface and online monitoring)[¶](#ICARUS-Noise-Measurement-Interim-DAQ-interface-and-online-monitoring){.wiki-anchor}
==============================================================================================================================================================

[]{#DAQ-and-online-monitoring}

DAQ and online monitoring[¶](#DAQ-and-online-monitoring){.wiki-anchor}
----------------------------------------------------------------------

The DAQ and online monitor environment have been set up in two tmux
sessions. All you have to do is to access to the tmux sessions. If the
tmux session is lost, you can find how to set it up at [DAQ
setup](#Set-up-DAQ-from-scratch){.wiki-page} and [Online monitor
setup](#Set-up-the-online-monitor-from-scratch){.wiki-page}.

1\. Open two terminals, and for each log in the icarus-gateway01
machine, and then the icarus-vst01 machine, with the **icarus**
account.\

    ssh -KY icarus@icarus-gateway01.fnal.gov
    ssh -KY icarus-vst01.fnal.gov

2\. At one terminal, attach the tmux session,\

    tmux a -t daq

\
This is for data taking.

3\. At the other terminal, attach the tmux session for online monitor,\

    tmux a -t om

4\. At the DAQ session, start data taking:\

    ./run

\
It will take a while to boot all the processes and to configure the
readout boards. When everything is ready and a run starts, it will show
\"running.\"\
You will see the output file location,\

    Info: DataLogger1 writes data files into /scratch/data

\
and the run number\

    Fri Jul 19 17:16:56 CDT 2019: START transition complete for run 27

\
on the screen. You can thereby find the output data files at\

    ls /scratch/data/data_dl1_run27_*

There should be 100 events in each file.

5\. When a DAQ run starts, run the online monitoring process at the
online monitor session,\

    lar -c dispatcher.fcl

\
Once the process starts, you can find the metrics at\
<https://sbn-online.fnal.gov/cgi-bin/icarus-minargon/icarus-minargon.wsgi/online_group/tpc_channel>\
Note that it takes a while to process the metrics. You can choose the
metric from the list in **Display Options**.

6\. The waveform displays can be found in the \"Waveform\" tab, or\
<https://sbn-online.fnal.gov/cgi-bin/icarus-minargon/icarus-minargon.wsgi/channel_snapshot>

7\. Stop a run\

    ./stop

\
It will also take a while to end a run. Also, the online monitor process
should be stopped automatically. If it doesn\'t, you can do ctrl+c.

8\. Detach the tmux session: ctrl+b then d

[]{#Run-online-monitoring-analysis-on-the-files-on-disk}

Run online monitoring analysis on the files on disk[¶](#Run-online-monitoring-analysis-on-the-files-on-disk){.wiki-anchor}
--------------------------------------------------------------------------------------------------------------------------

1\. Open a terminal, and log in the icarus-gateway01 machine, and then
the icarus-vst01 machine, with the **icarus** account.\

    ssh -KY icarus@icarus-gateway01.fnal.gov
    ssh -KY icarus-vst01.fnal.gov

2\. Attach the tmux session for online monitor,\

    tmux a -t om

3\. Run the offline analysis,\

    lar -c decoder_and_analysisIcarus.fcl -s <your input file>

\
The metrics and waveforms are shown in the same url as the online
monitoring,\
<https://sbn-online.fnal.gov/cgi-bin/icarus-minargon/icarus-minargon.wsgi/online_group/tpc_channel>\
<https://sbn-online.fnal.gov/cgi-bin/icarus-minargon/icarus-minargon.wsgi/channel_snapshot>

4\. When you finish, detach the tmux session: ctrl+b then d

[]{#Set-up-DAQ-from-scratch}

Set up DAQ from scratch[¶](#Set-up-DAQ-from-scratch){.wiki-anchor}
------------------------------------------------------------------

Normally you should use the **daq** tmux session, in which the
environment has been set up. You only have to look at this instruction
when you lose your **daq** tmux session and have to set it back.

1\. Open a tmux session\

    tmux new -s daq

2\. Go to the DAQ interface directory\

    cd DAQ_Running_VST/srcs/sbndaq/sbn-fd/DAQInterface

3\. Set up the environment\

    source ./setup_daqinterface.sh

4\. Check whether a DAQInterface instance already exists,\

    listdaqinterfaces.sh

5\. If so, kill it\

    kill_daqinterface_on_partition.sh <number you saw from the list>

6\. Launch a DAQInterface\

    DAQInterface &

7\. You can start taking data as what you do normally.

[]{#Set-up-the-online-monitor-from-scratch}

Set up the online monitor from scratch[¶](#Set-up-the-online-monitor-from-scratch){.wiki-anchor}
------------------------------------------------------------------------------------------------

Normally you should use the **om** tmux session, in which the
environment has been set up. You only have to look at this instruction
when you lose your **om** tmux session and have to set it back.

1\. Open a tmux session\

    tmux new -s om

2\. Go to the OM directory\

    cd /home/nfs/icarus/Online_monitoring/sbndqm_VST_Nov2019

3\. Set up the environment\

    source /software/products/setup
    setup mrb
    source localProducts_sbndqm_v0_03_01_e17_prof_s83/setup
    mrbslp
    export FHICL_FILE_PATH=./:$FHICL_FILE_PATH

4\. You can start taking data and running online monitor as what you do
normally.
