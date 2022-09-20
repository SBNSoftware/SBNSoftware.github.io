---
layout: page
title: ReleaseNotes09580201
toc: true
---

-----------------------------------------------------------------------------
| v09.58.02.01 | 20 sep 2022 | [ReleaseNotes](ReleaseNotes09580201.html) |
| --- | --- | --- |



sbndcode v09_58_02_01 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_58_02_01](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_58_02_01/sbndcode-v09_58_02_01.html)

Purpose
---------------------------------------------------
Weekly release

New features
---------------------------------------------------
* sbndcode PR296
  * Made some modules to combine CRT and PMT simulated fragments into one event.
* sbndcode PR298
  * Update Pandora cheating config for refactored larg4
* sbndcode PR299
  * Update CI reference values

Bug fixes
---------------------------------------------------

Updated dependencies
---------------------------------------------------
* sbncode v09_58_02_01

Change List
==========================================

sbndcode
---------------------------------------------------

* 2022-09-20  Fran Nicolas : Merge branch 'release/v09_58_02_01'
* 2022-09-20  Fran Nicolas : Update to version v09_58_02_01
* 2022-09-20  Francisco Javier Nicolás-Arnaldos : Merge pull request #298 from SBNSoftware/feature/etyley_pandoraCheat
* 2022-09-20  Francisco Javier Nicolás-Arnaldos : Merge pull request #296 from SBNSoftware/feature/eyandel_trigger
* 2022-09-20  Francisco Javier Nicolás-Arnaldos : Merge pull request #299 from SBNSoftware/henrylay97-patch-1
* 2022-09-19  Henry Lay : Update ci_tests.cfg
* 2022-09-15  Edward Tyley : Update Pandora cheating config for refactored larg4
* 2022-09-14  Henry Lay : Correct eventSize
* 2022-09-13  eyandel : fix run, subrun, event variables unused
* 2022-09-12  Fran Nicolas : Merge tag 'v09_58_02' into develop
* 2022-09-09  eyandel : adding in eventSize in 1730 header and changing waveform length to a fcl parameter
* 2022-09-08  eyandel : delete fhicldump file
* 2022-09-07  eyandel : delete out of date, unused pmtTriggerAna module
* 2022-09-07  eyandel : make T1 reset fragments for modules with no hits, add in fcl parameter to set lowest mac5 of boards
* 2022-09-07  eyandel : make T1 reset fragments for modules with no hits, add in fcl parameter to set lowest mac5 of boards
* 2022-08-11  eyandel : combine crt and pmt fragments producer modules, add pmt metrics into software metric producer
* 2022-08-11  eyandel : add crt software metrics to hitdumper
* 2022-08-10  eyandel : combine crt and pmt metrics into one metric producer
* 2022-08-09  eyandel : fix process name overlap in fragmenyt producers, add plane number bitwise shift to crt metric producer
* 2022-08-09  eyandel : add CRT metrics module from Michelle
* 2022-08-09  eyandel : fix missing PMT pairs

sbndutil
---------------------------------------------------

* 2022-09-20  Fran Nicolas : Merge tag 'v09_58_02_01' into develop
* 2022-09-20  Fran Nicolas : Merge branch 'release/v09_58_02_01'
* 2022-09-20  Fran Nicolas : Update to larsoft v09_58_02_01
* 2022-09-12  Fran Nicolas : Merge tag 'v09_58_02' into develop
