---
layout: page
title: ICARUS TPC Vertical Slice Test
---



ICARUS TPC Vertical Slice Test
================================================================================



Current instructions
------------------------------------------------------------

1\. Log in the gateway machine as the icarus user

    ssh -Y icarus@icarus-gateway01.fnal.gov

2\. You may have to kinit it here, and then log into the vst01 machine,

    ssh -Y icarus-vst01

3\. Set up the environment and the DAQ packages,

    source /software/products/setup
    setup sbndaq v0_01_05_sbnfd_vst -q e15:prof

4\. Run the VST DAQ by doing:

     RUN_ICARUS_TPC_VST.sh <run_number> <events_to_run> <file_descriptor> 

The script takes three arguments:

1.  the run number, which will get included in the file name and in the
    data
2.  the number of events to run for the DAQ stops automatically
3.  a \"file_descriptor\" string which gets added to the name of the
    file. It should be something about what crate is being read out and
    simple test conditions

Data is written to `/home/nfs/icarus/VST_Data`: you can look there to
see what the last run number used was, or check the ECL.

5\. DAQ should stop when the desired number of events are acquired.
Check if there is a remaining art process by

    ps

If there is one, do

    kill -9 <PID>

6\. To analyze the data, go to

    /home/nfs/icarus/VST_Analysis

There are two analysis modules that can be run: one to make the waveform
histograms (most useful with the \"pulsed\" data), and one to do a
waveform analysis.

    art -c MakeWaveforms.fcl -s <input file> 

    art -c AnalyzeWaveforms.fcl -s <input file> 

Note that the output file names and number of events to process have
defaults set, but they can be overridden from the command line with the
`-n` and `-T` options respectively.

There are two sets of macros setup to look at the data.

The first involves just simple ROOT macros that can be run in the usual
way:

Start ROOT and do:

    .L plot_Waveforms.C; plot_Waveforms("wvfm_view_file_name.root")

to make a 2D event display from the first event for all 9 boards (with
the output form the `MakeWaveforms.fcl` analysis).

Or, do\

    .L Events_display.C; Events_display("wvfm_view_file_name.root")

for the same thing with the added feature of double-clicking on the
canvas for moving to the following events. This is available for the
time being for the first 31 events of the output form the
`MakeWaveforms.fcl` analysis.

Or, do\

    .L plot_single_Waveforms.C; plot_single_Waveforms("wvfm_view_file_name.root")

to make a plot of the waveform of wire 21 of the first event for all 9
boards (with the output form the `MakeWaveforms.fcl` analysis).

Or, do\

    .L plot_WaveformAna.C; plot_WaveformAna("wvfm_ana_file_name.root")

to make plots of the pedestal, rms, and max pulse height (above
pedestal) (with the output from the `AnalyzeWaveforms.fcl` analysis).

The second set involves running from a jupyter notebook in an
interactive session. To do this, it\'s recommended to login with port
forwarding setup and from a fresh terminal do some setup:\

    ssh -L 8890:localhost:8890 icarus@icarus-gateway01.fnal.gov
    cd VST_Analysis
    source /software/products/setup
    setup sbndaq v0_01_05_sbnfd_vst -q e15:prof
    source setup_user_python.sh

(you may pick a different port: it\'s recommended to use the same both
locally and on the gateway machine.)

When that is finished, start the jupyter notebook session:

    jupyter notebook --port 8890 --no-browser

Note/copy the link on `localhost` that the notebook is running at, and
open it in your own browser (it should work if the port forwarding is
configured appropriately).

Then, you can open/modify/run the following macros:

-   `Plot_PedestalAndRMS.ipynb`
-   `Plot_MaxMinAmplitude.ipynb`
-   `Plot_Waveforms.ipynb`

Note the input filename should be set/changed near the top of the
notebook. To clear/restart/run the notebook, click on the \"Kernel\"
option in the menu at the top, and then select \"Restart and Run All\".



Older instructions (before April 5 2019)
--------------------------------------------------------------------------------------------------

1\. Log in the gateway machine

    ssh -Y <your account>@icarus-gateway01.fnal.gov

2\. You may have to kinit it here, and then log into the vst01 machine,

    ssh -Y icarus-vst01

3\. Set up the environment and the DAQ packages,

    source /software/products/setup
    setup sbndaq v0_01_05 -q e15:prof

4\. You need the master fcl file to drive DAQ. Copy the fcl file at

    /home/nfs/yuntse/PhysCrate_Data_driver.fcl

and change

    run_number: 1

and

    outputs.rootout.fileName: "run002_%#.root"

according to your run number.

5\. Now start data taking,

    artdaqDriver -c PhysCrate_Data_driver.fcl

6\. DAQ should stop when the desired number of events are acquired.
Check if there is a remaining art process by

    ps

If there is one, do

    kill -9 <PID>

7\. Decode the raw data: The fcl file can be found here

    /home/nfs/yuntse/viewWaveform.fcl

After you have the fcl, run

    art -c viewWaveform.fcl -s <input file> -T <output file>

Now you should see a bunch of 2D histograms in the output ROOT file.
Those are the waveforms!
