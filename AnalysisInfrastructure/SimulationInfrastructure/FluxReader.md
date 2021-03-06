---
layout: page
title: FluxReader
# subtitle: Subtitle
# image: sbndcode_wiki/sbnd_logo.png
# description: All about SBND commissioning code
hero_height: is-medium
# menubar: sbndcode_menu
toc: true
toc_title: FluxReader
---


FluxReader
========================================================================

The `FluxReadwer` code allows reading gSimple or Dk2Nu files direclty into LArSoft. For each neutrino ray, an MCTruth dataproduct is created with associated MCFlux.
The usual LArSoft chain involves starting with a neutrino event generator, which reads in gSimple flux files and saves neutrino interactions in the LArSoft art::Event. In this way though, neutrinos that do not interact are lost and one cannot calculate, for example, the neutrino flux. FluxReader instead reads in gSimple files direclty and saves all the neutrinos to the LArSoft art::Event. There is no neutrino event generator involved in this case.
Note that in this case, each MCTruth product does not represent a neutrino interaction, but just a neutrino ray.

This code is available since `sbndcode v09_25_00`.



How to Run
----------

A fcl driver for SBND is `run_fluxreader_sbnd.fcl`. You need to provide gSimple flux files as input. For example:

```bash
lar -c run_fluxreader_sbnd.fcl -S /pnfs/sbnd/resilient/users/mdeltutt/Filelists/gsimple_flux_configH-v1_10files.list

```
will run FluxReader with 10 input gSimple files listed in `gsimple_flux_configH-v1_10files.list`.

`run_fluxreader_sbnd` runs the following:
- `FluxReader` (art::Source): reads each neutrino in the gSimple file, creates MCTruth, MCFlux (and Dk2Nu and NuChoice) dataproducts and places them in an art::Event
- `FluxGeoFilter` (art::Filter): filters events based on the neutrino position. It moves along the neutrino direction, and only keeps events if the neutrino intersects at least one of the specified volumes. The default volume is `volTPCActive`.



Troubleshoot
---------

My jobs fail with error:
```
---- LogicError BEGIN
  readNext returned true but no RunPrincipal has been set, and no cached RunPrincipal exists.
  This can happen if a new input file has been opened and the RunPrincipal has not been appropriately assigned.
---- LogicError END

```
This is likely because the gsimple files all have the same run number, which is then used in FluxReader to set the RunPrincipal run number. Use the following fcl file instead which sequentially increases the run numbers to avoid this problem: `run_fluxreader_incr_run_sbnd.fcl`.

