---
layout: page
title: Scintillation photon visibility map for ICARUS
subtitle: 
description: Scintillation photon visibility map for ICARUS
toc: true
toc_title: Contents
---


Scintillation photon visibility map for ICARUS
===============================================

The simulation of argon scintillation includes a step where scintillation photons are propagated
from where they are produced, with the goal of reaching one of the optical detectors.
This simulation includes effects like reflections, absorption, Rayleigh scattering,
and in general all photons undergo when in the "optical" regime.
The number of photons produced per megaelectronvolt of deposited energy is in the ballpark of 24000.
A typical BNB neutrino interaction would cause million of scintillation photons to be emitted,
and the figure for a real event including cosmic ray activity is at least one order of magnitude larger.
The simulation of that many individual photons is not affordable, and shortcuts are taken.

One standard solution is to precompute the efficiency of detecting a scintillation photon
from anywhere in the active part of the detector, to any of the optical detectors.
The resulting map is queried each time a group of photons needs to be propagated.

This page describes a procedure to generate such a map, commonly called "photon library", for ICARUS detector.


Content of the map
-------------------

The map is in the form of a lookup table. Each row of the table refers to a specific detector location
and a specific optical detector channel.
The location is represented as a voxel index: the full active volume of the detector is diced
into small boxes ("voxels") and each voxel is assigned an index for identification.
ICARUS map currently contains only one piece of information: the average visibility of photons 
scintillating from within the voxel to a optical detector channel.
The format of the table shows one entry per (voxel, optical detector) pair,
therefore there are potentially 180 entries per voxel.

The current map covers a single cryostat (in particular, the reference is for `C:0`).
All cryostats are considered identical, and software mapping is used
to cover the other cryostat with the same mapping.

Currently, the storage format is a ROOT `TTree` with as branches the voxel index, the channel number
and the visibility pertaining them. Entries with visibility `0` are omitted.

The visibility is defined as follows: _N_ scintillation photons are generated in one voxel _V_,
distributed uniformly in only the part of its volume which is occupied by liquid argon
(this distinction is relevant for regions at the border, which may contain a piece of cathode,
a portion of the PMT, part of the cryostat vessel etc.).
For each optical detector channel _C_, the number of those photons which reach _C_ is
divided by _N_, and that ratio is the visibility assigned to voxel _V_ for channel _C_.


Procedure for the creation of the visibility map
-------------------------------------------------

After I finish the preparation for some ragout I will document it.

