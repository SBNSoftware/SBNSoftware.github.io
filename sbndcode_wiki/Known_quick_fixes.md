---
layout: page
title: Known quick fixes
---



Known quick fixes
======================================================



Detector Clock Issue.
-------------------------------------------------------------

Around the time of the MCP 1.0 samples the detector clock for the optics
was changes. This produces an exception when reruning over the same\

    Found historical value disagreement for ClockSpeedOptical ... 500 != 64

\
To fix this issue you require the following in your fcl.\

    services.DetectorClocksService.InheritClockConfig: false

Please add further known fixes or Bug Dom Barker if you have an issue
that you do not know the quick fix for.
