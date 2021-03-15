---
layout: page
title: ReleaseNotes091800
toc: true
---

-----------------------------------------------------------------------------
| v09.18.00 | 15 Mar 2021 | [ReleaseNotes](ReleaseNotes091800.html) |
| --- | --- | --- |



sbndcode v09_18_00 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_18_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_18_00/sbndcode-v09_18_00.html)

Purpose
---------------------------------------------------

* Weekly release

New features
---------------------------------------------------

* sbndcode PR 86:
  * added truth information to hitdumper

* sbndcode PR 87:
  * removed some debug lines from AnalysisTree, enclosed a problematic section in try bracket, and cleaned up particle traj length calculation

* sbndutil PR 1:
  * added macro for producing OpDetSim digitiser file

Bug fixes
---------------------------------------------------

Updated dependencies
---------------------------------------------------

* sbncode v09_18_00
* larsoft v09_18_00

Change List
==========================================

sbndcode v09_18_00
---------------------------------------------------

* 2021-03-15  Patrick Green : Merge branch 'release/v09_18_00'
* 2021-03-15  Patrick Green : Update to larsoft v09_18_00
* 2021-03-11  Patrick Green : Merge pull request #87 from wforeman/develop
* 2021-03-10  Will Foreman : Removed some debug lines from AnalysisTree, enclosed a problematic section in try bracket, and cleaned up particle traj length calculation
* 2021-03-10  Patrick Green : Merge pull request #86 from SBNSoftware/feature/eyandel_hitdumper
* 2021-03-09  eyandel : added some truth information to hitdumper
* 2021-03-05  Patrick Green : Merge tag 'v09_17_02' into develop

sbndutil v09_18_00
---------------------------------------------------

* 2021-03-15  Patrick Green : Merge branch 'release/v09_18_00'
* 2021-03-15  Patrick Green : Update to larsoft v09_18_00
* 2021-03-12  Patrick Green : Merge pull request #1 from SBNSoftware/feature/icaza_opdetdigi_seed
* 2021-03-05  Patrick Green : Merge tag 'v09_17_02' into develop
* 2020-08-14  Iker de Icaza Astiz : Change the name for something more meaningful
* 2020-08-11  Iker de Icaza Astiz : Change arrays to vectors to avoid hardcoding ssize of arrays
* 2020-08-06  Iker de Icaza Astiz : Update macro to produce files with the necessary format to use CLHEP::RandGeneral
* 2020-08-06  Iker de Icaza Astiz : Script to create root files with test bench data for the digitisation of PMTs and ARAPUCAs
