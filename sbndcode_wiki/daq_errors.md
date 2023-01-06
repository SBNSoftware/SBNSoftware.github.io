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
