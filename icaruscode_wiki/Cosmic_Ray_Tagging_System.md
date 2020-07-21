---
layout: page
title: Cosmic Ray Tagging System
---



Cosmic Ray Tagging System ![schematic showing CRT surrounding the cryostat](/redmine/attachments/download/53137/icarus_crt.png "schematic showing CRT surrounding the cryostat")
=============================================================================================================================================================================================================================

Welcome to the ICARUS Cosmic Ray Tagging System (CRT)
simulation/reconstruction wiki! This page is brand new and under
construction! The information provided here will assume you have some
familiarity with LArSoft. Before discussing the software, some details
on the hardware side will be provided.

The ICARUS CRT\'s principle objective is to tag crossing muons, which
pass in close proximity to the argon volume, with high (\~95%)
efficiency. This is achived by surrounding the cryostat with two layers
of plastic scintillator. Yielding to spatial constraints in the detector
hall, the CRT must cover a large (\~1200 m\^2) surface area. To cope
with this fact, the CRT consists of three subsystems made up of
different type of scintillator modules. The modules are denoted by their
origin, CERN, MINOS, and Double Chooz(D) types.

LArSoft does not currently provide support for CRT code, though some
people are working to change this. All code related to the CRT with the
exception of the geometry generation script lives in
[/icaruscode/CRT](https://cdcvs.fnal.gov/redmine/projects/icaruscode/repository/revisions/master/show/icaruscode/CRT){.external}.
This directory contains some subdirectories. CRT/CRTProducts contains
the classes and dictionary necessary to introduce CRT data products to
LArSoft. CRT/CRTUtils contains algorithms and utilities for use with
modules living in CRT.



Detector Simulation
----------------------------------------------------------

All code related to the CRT detector simulation is contained in
CRTDetSim\_module.cc

-   Light output/attenuation
-   Front-end electronic



Reconstruction
------------------------------------------------

-   CRT hits
-   CRT tracks



Work in progress
----------------------------------------------------

-   Update geometry (e.g. sloped CERN modules -\> rim (vertical))
-   (Sim) tune energy and time resolution, light yield, attenuation
    models as test stand data becomes available
-   (Reco) apply dual ended readout to (uncut) MINOS modules to hit reco
-   (Sim) detector response, readout electronics for Double Chooz
    modules not understood
