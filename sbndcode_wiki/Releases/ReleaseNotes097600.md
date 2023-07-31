---
layout: page
title: ReleaseNotes097600
toc: true
---

-----------------------------------------------------------------------------
| v09.76.00 | 31 Jul 2023 | [ReleaseNotes](ReleaseNotes097600.html) |
| --- | --- | --- |



sbndcode v09_76_00 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_76_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_76_00/sbndcode-v09_76_00.html)

Purpose
---------------------------------------------------
Weekly release

New features
---------------------------------------------------
- SBNSoftware/sbndcode#377
  - Edited hitdumper fcl files so muon tracks can be read into them. 
- SBNSoftware/sbndcode#380
  - Keep develop up to date with production branch (`sbndcode v09_75_03_03`)
  - Includes:
    - SBNSoftware/sbndcode#375
    - SBNSoftware/sbndcode#376
    - SBNSoftware/sbndcode#378

Bug fixes
---------------------------------------------------

Updated dependencies
---------------------------------------------------
- larsoft v09_76_00
- sbncode v09_76_00

Change List
==========================================

sbndcode sbndcode
---------------------------------------------------

* 2023-07-31  Fran Nicolas : Merge branch 'release/v09_76_00'
* 2023-07-31  Fran Nicolas : Update to larsoft v09_76_00
* 2023-07-31  Francisco Javier Nicolás-Arnaldos : Merge pull request #380 from SBNSoftware/release/SBN2023_AnaWs
* 2023-07-31  Francisco Javier Nicolás-Arnaldos : Merge pull request #377 from SBNSoftware/feature/brindenc
* 2023-07-27  Brinden Carlson : fixed fcl syntax error
* 2023-07-26  miquelnebot : update version for PR
* 2023-07-26  Brinden Carlson : fixed hitdumper defaults
* 2023-07-26  miquelnebot : update version for PR
* 2023-07-25  Brinden Carlson : Fixed CI error by defaulting to not running the muon producer
* 2023-07-24  Brinden Carlson : commented muon track filter from reco2 path
* 2023-07-24  Henry Lay : Correct naming error
* 2023-07-20  Brinden Carlson : Merge branch 'feature/brindenc' of github.com:SBNSoftware/sbndcode into feature/brindenc
* 2023-07-20  Brinden Carlson : Modified hitdumper fcl to read in muon tracks
* 2023-07-20  miquelnebot : update version for PR
* 2023-07-20  Henry Lay : Ewerton's fcl for truth matchable wirecell
* 2023-07-20  Henry Lay : Add fcls with edited process names for scrub worklow
* 2023-07-19  Henry Lay : Add scrubs file for diffusion workflow (keeps g4)
* 2023-07-19  Henry Lay : Rename process for detector variations DetSim
* 2023-07-19  Henry Lay : Rename process for detector variations G4
* 2023-07-18  Henry Lay : Add process name for scrub fcl
* 2023-07-18  miquelnebot : update version for patch
* 2023-07-18  miquelnebot : Merge remote-tracking branch 'origin/hlay_silly_bugs' into release/SBN2023_AnaWs
* 2023-07-18  miquelnebot : update version fir a patch
* 2023-07-17  Henry Lay : well this isn't at all annoying
* 2023-07-13  Fran Nicolas : Merge tag 'v09_75_03' into develop

sbndutil
---------------------------------------------------

* 2023-07-31  Fran Nicolas : Merge tag 'v09_76_00' into develop
* 2023-07-31  Fran Nicolas : Merge branch 'release/v09_76_00'
* 2023-07-31  Fran Nicolas : Update to larsoft v09_76_00
* 2023-07-13  Fran Nicolas : Merge tag 'v09_75_03' into develop
