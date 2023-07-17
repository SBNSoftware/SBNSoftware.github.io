---
layout: page
title: List of DAQ Errors
---


This page lists various previously encountered DAQ errors and their possible solutions. Errors are sorted by subsystem.


PTB
==========================================================

#### 1. Unable to get lock while trying to report the current state
```Error / ptb01PUSH_BoardReaderCore
  06-Jan-2023 07:46:01 CST
  sbnd-ptb01.fnal.gov (131.225.250.158)
  UDPMessage 0 / PID 211609 / BoardReaderCore.cc:345
  boardreader / Starting / Booted
  Timeout (60 s) while waiting for Start after receive_fragments thread started!
  Unable to get lock while trying to report the current state, returning busy
```

This error appeared after the PTB network was accidentally unplugged. A full reboot of the Microzed Linux solved the problem. Also tried restarting the ptb service which did not solve the problem.


WR TDC
==========================================================

#### 1. Unable to get lock while trying to report the current state
```
  Warning / TDCChan
  Wrong TDC sample time, check the NTP and WhiteRabbit timing system; host_time-sample_time=1seconds.
```

This error apears when the TDC timestamp is wrong. Sometimes you get 1 of these at the very beggining of a run as systems are setting up/configuring. If it's happening frequently and _exactly_ 1 second then it is most likely that the leap second parameters in the TDC configuration fcl are incorrect - check the current number of leap seconds and change the date to be the next possible one.



#### 2. Timeout of SPECTDC
``` Error/spectdc_BoardReaderCore
14-Jul-2023 15:29:37 CDT
sbnd-clk01.fnal.gov (131.225.250.162)
UDPMessage / PID 34451 / BoardReaderCore.cc:348 boardreader/ Early / pre-events
Timeout (60 s) while waiting for Start after receive fragments thread started!
Error/spectdc_BoardReaderCore
14-Jul-2023 15:29:37 CDT
sbnd-clk01.fnal.gov (131.225.250.162)
UDPMessage / PID 34451 / BoardReaderCore.cc:450 boardreader / Early / pre-events
Timeout (60 s) while waiting for Start after send fragments thread started!
Error/spectdc_xmlrpc_commander 14-Jul-2023 15:29:39 CDT
sbnd-clk01.fnal.gov (131.225.250.162) UDPMessage / PID 34451/xmlrpc_commander.cc:792
boardreader / Early / pre-events
Unable to get lock while trying to report the current state, returning busy
```

This error appeared after running spectdc, ptb, and all 8 caen baords. During this run the board in slot 18 crashed (temperature issue we believe) and then we started to get the timeout error when trying to rerun without board 18.

Will reboot to see if that fixes the error.
