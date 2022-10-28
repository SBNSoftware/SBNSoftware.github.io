---
layout: page
title: SBND CRT## DAQ Getting Started
---

------------------------------
## DAQ instructions for the CRT \#\#
-----------------------------

open two terminal windows.  For each 
 - ssh to sbnd-gateway01.fnal.gov
 - from gateway ssh to sbnd-evb04 (as sbnd)
 - (optional: start a tmux or screen session)
 - source "crt_launchdaq.sh" 
 
 In one window, type "DAQInterface" or "DAQInterface &". This will now have the DAQ interface running. Messages will be displayed here but it can no longer take in commands from this terminal.
 
(NOTE: You can not close the terminal, disconnect it from the internet, close your laptop, etc. when the DAQInterface is open in your terminal or the    DAQ will disconnect. Additionally, when running the DAQ, a Message Viewer window opens from this terminal. Running in a screen or tmux session on evb04 allows to disconnect from the screen/tmux session without crashing the DAQ. The Message Viewer will remain visible until you exit the evb04 ssh session or close the window. There is no way to reopen it again without starting a new run. Using a VNC (instructions to come) can help get around this issue. You must close the Message Viewer before exiting from evb04 or it will not exit.)
 
 In the other window, 
 (1) look at the file "run" and find the line with setdaqcomps.sh
 You will find a list of things that will be included in the DAQ run, add or delete what you (don't) need. 
  - pmtx03 is the 1730 digitizer connected to pds03 link 1, in the Xarapuca crate on the left
  - crt2x2upstr is just what it sounds like - all 4 modules on the upstream (south) frame
  - crt2x2dwnstr is just what it sounds like - all 4 modules on the downstream (north) frame
  - crt_test is the test setup on the A-frame
  - ptb01 is the trigger board
     - the available configurations for the PTB are in /home/nfs/sbnd/ptb_sacred_configs/sbnd_config/. Descriptions of them are in a .txt file in that  directory. If you need a configuration not listed, or the one you want is outdated, talk to the PTB people (currently Jon Sensenig and Tereza Kroupova).
   * if PULL is after any of those names, then the system data is pulled by the DAQ instead of pushed to the DAQ.  Only one system can push data.
   
(2) check the file boot.txt, things work best if the machine where you are running the daq is the one assigned to the eventbuilder and dispatcher here
 
 Type ./run to  start the run and type ./stop to stop the run
 
 The data will magically appear in /daq/scratch/crtdata/ (or possibly /daq/scratch/offbeamdata/ or something else for other specific tests). This directory is set in the event builder fcl. boot.txt is where the event builder fcl being used is set. It is suggested to make a directory for your data here and move it there at the end of the day each day. 
 
 (3) setup - specified in knownboardreaders.txt 
 pmtx03 boardreader is on sbnd-pds02
 crt board readers are on sbnd-pds05
 WR board reader is on sbnd-clk01
 PTB board reader is on sbnd-ptb01
 
 ------------------
 How to debug things when the DAQ crashes. . . in the window where the DAQInterface was running, look through the output to the screen for something like this
 
Unexpected status message from process crt2x2upstr at sbnd-pds05-daq:11100:
"Error initializing crt2x2upstr with ParameterSet =
"FEBConfigurationStandard:{HG_peak_detector_PP:false
HG_shaper_time_constant:6 LG_peak_detector_PP:false LG_preamp_bias:true
LG_shaper_time_constant: // REMAINDER TRUNCATED BY DAQINTERFACE, SEE
/tmp/run_record_attempted_sbnd/1 FOR FULL FHiCL DOCUMENT"
See logfile sbnd-pds05-daq:/daq/log/crt2x2upstr-sbnd-pds05-11100/crt2x2upstr-sbnd-pds05-11100-20220401145716-175029.log for details

And look at the log file specified there, it can be accessed on sbnd-gateway01 as well

-------------------------------------------------
 
 
 --------------------
Specific to the crt:
 - An error of this format usually means that the ethernet cable is not connected to the computer sbnd-pds05 or that the data port needs to be reconfigured

%MSG-e ExceptionHandler:  Initializing 01-Apr-2022 14:57:50 CDT Booted ExceptionHandler.cc:62
cet::exception object caught:---- BernCRTData VerifyMACConfiguration() List of 4 FEBs declared 
in the FHiCL file (dec): 74 85 87 88 doesn't match list of 0 detected FEBs: BEGIN
  
---- BernCRTData VerifyMACConfiguration() List of 4 FEBs declared in the FHiCL file (dec): 74 85 87 88 doesn't match list of 0 detected FEBs: END
 
If you encounter some problem and don't know what caused it please post to the sbnd_crt_2x2 or sbnd_daq slack channels, or contact one of the CRT## or SBND DAQ team directly.

------------------------------
## other CRT \#\# setup info
-----------------------------

1730 digitizer channels:  

even channels have no inputs

ch1: - TRIGGER from PTB to 1730

ch3: - RWM

ch5: - RWM

ch7: - RWM

ch9: - BES

ch11: - RWM

ch13: - RWM

ch15: - TRIGGER from PTB to 1730

WR TDC inputs:

ch1: t0 reset from CRT fanout (32 ns cable)

ch2: t1 reset from CRT fanout (32 ns cable)

ch3: empty

ch4: empty

ch5: empty

CRT T0 reset: PPS

CRT T1 reset: BES from AD's fiber to TTL converter




