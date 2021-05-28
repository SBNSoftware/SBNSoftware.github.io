---
layout: page
title: ReleaseNotes092204
toc: true
---

-----------------------------------------------------------------------------
| v09.22.04 | 28 May 2021 | [ReleaseNotes](ReleaseNotes092204.html) |
| --- | --- | --- |



sbndcode v09_22_04 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_22_04](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_22_04/sbndcode-v09_22_04.html)

Purpose
---------------------------------------------------

* Weekly release

New features
---------------------------------------------------

* sbndcode PR 108:
  * Filters for commissioning studies
  * Gen and LArG4 filters to select cosmics crossing certain CRT planes,
  * adds fcls to filter front/back and east/west CRT muons
  * adds a detsim fcl for commissioning studies
  * cleans up the HitDumper module and add POT information into the output tree for neutrino studies

* sbndcode PR 109:
  * Adding new FlashMatch object for simple flash matching. 
  * corresponds to SBNSoftware/sbncode#118, SBNSoftware/sbnobj#15, SBNSoftware/sbnanaobj#15


Bug fixes
---------------------------------------------------

Updated dependencies
---------------------------------------------------

* sbncode v09_24_00
* larsoft v09_24_00

Change List
==========================================

sbndcode v09_24_00
---------------------------------------------------

* 2021-05-28  Patrick Green : Merge tag 'v09_24_00' into develop
* 2021-05-28  Patrick Green : Merge branch 'release/v09_24_00'
* 2021-05-28  Patrick Green : Update to v09_24_00
* 2021-05-27  Patrick Green : Merge pull request #108 from SBNSoftware/mdeltutt_commissioning
* 2021-05-26  Patrick Green : Merge pull request #109 from SBNSoftware/feature/jzettleNewFMObject
* 2021-05-26  Marco Del Tutto : Forgot to reserve some vectors
* 2021-05-26  Marco Del Tutto : Remove push_back where possible and resize first
* 2021-05-24  Marco Del Tutto : Increasing max hits for wire and optical to 100k
* 2021-05-24  Marco Del Tutto : Merge branch 'develop' into mdeltutt_commissioning
* 2021-05-24  Marco Del Tutto : Switch from arrays to vectors and max number of hits is now configurabe via fcls
* 2021-05-24  Marco Del Tutto : Change total number of savable hits and ophits to 50k, and 5k for the CRT
* 2021-05-24  Marco Del Tutto : Increase total number of savable hits and ophits to 100k
* 2021-05-24  Marco Del Tutto : Save all ophits from all opdets, and save the opdet type to the tree
* 2021-05-24  Marco Del Tutto : Better file output name
* 2021-05-21  Patrick Green : Merge tag 'v09_23_01_00' into develop
* 2021-05-20  Marco Del Tutto : Adds newlines at the end of files
* 2021-05-20  Marco Del Tutto : Clean up fcls
* 2021-05-19  Iker de Icaza Astiz : Add threshold fcl parameters, useful to filter out noise
* 2021-05-11  Marco Del Tutto : typo fix
* 2021-05-11  Iker de Icaza Astiz : Ups, I meant to keep it true
* 2021-05-11  Marco Del Tutto : Clean up g4 crt filtes and add eastwestcrt ones
* 2021-05-11  Marco Del Tutto : Clean up corsika crt filtes and add eastwestcrt ones
* 2021-05-11  Marco Del Tutto : Adding UseTightReadoutWindow fcl params and fixing readoutWindow time calculation
* 2021-05-11  Marco Del Tutto : Adding a detsim driver fcl for commissioning studies
* 2021-05-11  Marco Del Tutto : Merge branch 'develop' into mdeltutt_commissioning
* 2021-05-11  Iker de Icaza Astiz : Add new fcl switches, rename some others, remove others

sbndutil v09_24_00
---------------------------------------------------

* 2021-05-28  Patrick Green : Merge branch 'release/v09_24_00'
* 2021-05-28  Patrick Green : Update to v09_24_00
* 2021-05-21  Patrick Green : Merge tag 'v09_23_01_00' into develop
