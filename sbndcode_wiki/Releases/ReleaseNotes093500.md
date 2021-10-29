---
layout: page
title: ReleaseNotes093500
toc: true
---

-----------------------------------------------------------------------------
| v09.35.00 | 29 Oct 2021 | [ReleaseNotes](ReleaseNotes093500.html) |
| --- | --- | --- |



sbndcode v09_35_00 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_35_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_35_00/sbndcode-v09_35_00.html)

Purpose
---------------------------------------------------

* Weekly release

New features
---------------------------------------------------

Bug fixes
---------------------------------------------------

* sbndcode PR 200:
  * Update of evd_sbnd
  * With the new LArG4, the label of the G4 sim::SimChannel has changed to simdrift (instead of largeant).
  * The extra line: services.SimulationDrawingOptions.SimChannelLabel: "simdrift" fixes the problem, and the 3D display works again.

Updated dependencies
---------------------------------------------------

* sbncode v09_35_00
* larsoft v09_35_00

Change List
==========================================

sbndcode
---------------------------------------------------

* 2021-10-29  Patrick Green : Merge branch 'release/v09_35_00'
* 2021-10-29  Patrick Green : Update to v09_35_00
* 2021-10-28  Patrick Green : Merge pull request #200 from SBNSoftware/rodralva/evd_sbnd
* 2021-10-26  Rodrigo Alvarez Garrote : Update of evd_sbnd
* 2021-10-25  Patrick Green : Merge tag 'v09_34_00' into develop

sbndutil
---------------------------------------------------

* 2021-10-29  Patrick Green : Merge tag 'v09_35_00' into develop
* 2021-10-29  Patrick Green : Merge branch 'release/v09_35_00'
* 2021-10-29  Patrick Green : Update to v09_35_00
* 2021-10-25  Patrick Green : Merge tag 'v09_34_00' into develop
