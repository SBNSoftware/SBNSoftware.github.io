---
layout: page
title: SBND Commissioning Plots 
subtitle: 
image: sbndcode_wiki/sbnd_logo.png
description: pretty plots
hero_height: is-medium
# menubar: sbndcode_menu
toc: true
toc_title: SBND Commissioning Plots
---




SBND Commissioning - plot repository
========================================================================

CRT sharp sharp plots and images
=================================

1. Beam muon peak June 2022
    - The BES is the “Beam Extraction Signal” that is sent to us from the accelerator complex and arrives roughly 333 microseconds before the beam arrives in the SBN-ND building.  We are currently measuring the time of the CRT hits w.r.t. this reference, we will do something slightly different for physics running.
    - The beam spill duration is 1.6 us.
    - The CRT timing resolution is 1-2 ns per hit after all of the timing corrections due to cable length differences and the light propagation time in the fibers.  We have not made any timing corrections in this plot, this is the raw CRT data.
    - The trigger for this data requires a CRT hit in either the upstream or the downstream sharp (#) during the elongated window around the beam spill
    - Plotted are the hits for the upstream # only
    - This is roughly 12 hours of DAQ uptime  
    - We don’t yet have a number for the absolute rate of beam muons in this transverse area (2m x 2m square centered on the beam axis), but it is on the order of 1 per 1000 spills in the upstream only after subtracting the cosmic background. 
  
![muonpeak](files/beampeak.png)
