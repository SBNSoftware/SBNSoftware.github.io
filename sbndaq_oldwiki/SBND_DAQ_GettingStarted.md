
------------
layout: page
title: SBND DAQ for the CRT \#\#
-----------------------------

open two terminal windows.  For each 
 - login as sbnd on sbnd-gateway01.fnal.gov
 - source "mstancar_launchdaq.sh" 
 
 In one window, type "DAQInterface"
 
 In the other window, look at the file "run" and find the line with setdaqcomps.sh
 You will find a list of things that will be included in the DAQ run, add or delete what you (don't) need. 
  - pmtx02 is the 1730 digitizer connected to link 1, in the Xarapuca crate on the right
  - crt2x2upstr is just what it sounds like - all 4 modules on the upstream (south) frame
  - crt2x2dwnstr is just what it sounds like - all 4 modules on the downstream (north) frame
  - ptb01 is the trigger board
 
 Type ./run to  start the run and type ./stop to stop the run
 
 The data will magically appear in /daq/scratch/data/.  It is suggested to make a directory for your data here and move it there at the end of the day each day.
 
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
 
 






