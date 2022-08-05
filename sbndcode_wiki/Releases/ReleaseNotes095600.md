---
layout: page
title: ReleaseNotes095600
toc: true
---

-----------------------------------------------------------------------------
| v09.56.00 | 05 ago 2022 | [ReleaseNotes](ReleaseNotes095600.html) |
| --- | --- | --- |



sbndcode v09_56_00 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_56_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_56_00/sbndcode-v09_56_00.html)

Purpose
---------------------------------------------------
Weekly release

New features
---------------------------------------------------
* sbndcode PR289
  * Adds new features to the OpFlash t0 estimation.
    * Update OpHit producer to fill StartTime and RiseTime attributes
    *  Add option in OpFlash producer to use the OpHit StartTime/RiseTime
    *   Add tool for drift coordinate estimation and light propagation time correction
    *   Add tools for better estimate the OpFlash t0
    *   Flash barycenter is now calculated by a configurable external tool

Bug fixes
---------------------------------------------------

Updated dependencies
---------------------------------------------------
* sbncode v09_56_00
* larsoft v09_56_00
* sbnd_data v01_14_00 

Change List
==========================================

sbndcode
---------------------------------------------------

* 2022-08-05  Fran Nicolas : Merge branch 'release/v09_56_00'
* 2022-08-05  Fran Nicolas : Update to larsoft v09_56_00
* 2022-08-05  Francisco Javier Nicolás-Arnaldos : Merge pull request #289 from SBNSoftware/feature/fnicolas_flasht0
* 2022-08-05  Fran Nicolas : Solve bug in if statement
* 2022-08-05  Fran Nicolas : Add risetime fhicl configuration
* 2022-07-26  Fran Nicolas : Add description
* 2022-07-26  Fran Nicolas : Merge tag 'v09_55_01' into develop
* 2022-07-22  Fran Nicolas : update algo initialization
* 2022-07-21  Fran Nicolas : Update flash fcl
* 2022-07-21  Fran Nicolas : Flash barycenter calculated by external tool and redefinition of rise time
* 2022-07-21  Fran Nicolas : Rise time calculator tool now created in producer
* 2022-07-21  Fran Nicolas : Move flash barycenter function to a configurable tool
* 2022-06-22  Fran Nicolas : Add tpc member to LiteOpFlash type
* 2022-06-22  Fran Nicolas : Update cmake file
* 2022-06-22  Fran Nicolas : Update fash producer module
* 2022-06-22  Fran Nicolas : Add conf fhicls
* 2022-06-22  Fran Nicolas : Add tool for t0 estimation
* 2022-06-22  Fran Nicolas : Add tool for OpFlash t0 unbias
* 2022-06-22  Fran Nicolas : Fill StartTime and RiseTime attributes in OpHit module

sbndutil
---------------------------------------------------

* 2022-08-05  Fran Nicolas : Merge tag 'v09_56_00' into develop
* 2022-08-05  Fran Nicolas : Merge branch 'release/v09_56_00'
* 2022-08-05  Fran Nicolas : Update to larsoft v09_56_00
* 2022-07-26  Fran Nicolas : Merge tag 'v09_55_01' into develop
