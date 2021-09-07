---
layout: page
title: ReleaseNotes092600
toc: true
---

-----------------------------------------------------------------------------
| v09.26.00 | 12 Jul 2021 | [ReleaseNotes](ReleaseNotes092600.html) |
| --- | --- | --- |



sbndcode v09_26_00 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_26_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_26_00/sbndcode-v09_26_00.html)

Purpose
---------------------------------------------------

* Weekly release

New features
---------------------------------------------------

* sbndcode PR 122
  * added 3drift_services_sbnd_legacy.fcl for processing the old nu+cosmics MC generated with the previous drift length configuration. 

Bug fixes
---------------------------------------------------

* sbndcode commit af4e468
  * removed extra zero in Visible X-Arapucas efficiency
  * this bug was causing the visible X-Arapucas to see a factor 10 less photons than expected 

* sbndcode PR 124
  * Reworked PDS boxes and X-ARAPUCAS in geometry v02_00 to use rotations in a way to not break the light simulation
  * note: the x-arapuca light simulation in v09_25_00_01 is broken, if using this version you should update to v09_26_00

Updated dependencies
---------------------------------------------------

* sbncode v09_26_00
* larsoft v09_26_00

Change List
==========================================

sbndcode v09_26_00
---------------------------------------------------

* 2021-07-12  Patrick Green : Merge branch 'release/v09_26_00'
* 2021-07-12  Patrick Green : Update to v09_26_00
* 2021-07-10  Patrick Green : Merge pull request #124 from SBNSoftware/feature/NewGeometry_v2
* 2021-07-09  Gustavo Valdiviesso : Testing another configuration since privous commit did not fix the bug
* 2021-07-09  Gustavo Valdiviesso : Reworked PDS boxes and X-ARAPUCAS to use rotations in a wat to NOT confuse the Light Simulation
* 2021-07-09  Patrick Green : Merge pull request #122 from wforeman/develop
* 2021-07-08  Will Foreman : Make in-time cosmic gen use default readout size, not 3drift
* 2021-07-07  Will Foreman : Adding 3drift legacy configuration for anyone wanting to process MC generated using the old 3drift readout
* 2021-07-07  Rodrigo Alvarez Garrote : Extra zero
* 2021-07-05  Patrick Green : Merge tag 'v09_25_00_01' into develop

sbndutil v09_26_00
---------------------------------------------------

* 2021-07-12  Patrick Green : Merge branch 'release/v09_26_00'
* 2021-07-12  Patrick Green : Update to v09_26_00
* 2021-07-05  Patrick Green : Merge tag 'v09_25_00_01' into develop
