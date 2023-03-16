---
layout: page
title: ReleaseNotes096900
toc: true
---

-----------------------------------------------------------------------------
| v09.69.00 | 16 mar 2023 | [ReleaseNotes](ReleaseNotes096900.html) |
| --- | --- | --- |



sbndcode v09_69_00 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_69_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_69_00/sbndcode-v09_69_00.html)

Purpose
---------------------------------------------------
Weekly release

New features
---------------------------------------------------
- SBNSoftware/sbndcode#321:
  - Update the namespace of the SemiAnalyticalMode1
- SBNSoftware/sbndcode#320:
  - Update default flux from config H to config J.
  - Flux config J contains a new variable vtxt that stores kaon and neutrino time of flight from production to flux window.


Bug fixes
---------------------------------------------------
- SBNSoftware/sbndcode#323:
  - Solves issue SBNSoftware/sbndcode#322

Updated dependencies
---------------------------------------------------
* sbncode v09_69_00
* larsoft v09_69_00

Change List
==========================================

sbndcode sbndcode
---------------------------------------------------

* 2023-03-16  Fran Nicolas : Merge branch 'release/v09_69_00'
* 2023-03-16  Fran Nicolas : Update to larsoft v09_69_00
* 2023-03-16  Francisco Javier Nicolás-Arnaldos : Merge pull request #320 from SBNSoftware/feature/lnguyen-flux-update-wvtxt
* 2023-03-16  Francisco Javier Nicolás-Arnaldos : Merge pull request #321 from ikatza/feature/icaza_PhPropagation
* 2023-03-16  Francisco Javier Nicolás-Arnaldos : Merge pull request #323 from SBNSoftware/feature/fnicolas_issue322
* 2023-03-09  VCLanNguyen : Update genie_sbnd.fcl
* 2023-03-07  Fran Nicolas : properly reset static vectors
* 2023-02-28  Fran Nicolas : Merge tag 'v09_67_00' into develop
* 2023-02-22  Vu Chi Lan Nguyen : Update to flux config H and enable neutrino time of flight in genie
* 2023-02-16  Iker de Icaza Astiz :   Update the namespace of the SemiAnalyticalModel

sbndutil
---------------------------------------------------

* 2023-03-16  Fran Nicolas : Merge tag 'v09_69_00' into develop
* 2023-03-16  Fran Nicolas : Merge branch 'release/v09_69_00'
* 2023-03-16  Fran Nicolas : Update to larsoft v09_69_00
* 2023-02-28  Fran Nicolas : Merge tag 'v09_67_00' into develop
