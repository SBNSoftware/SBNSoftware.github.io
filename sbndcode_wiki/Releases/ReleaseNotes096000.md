---
layout: page
title: ReleaseNotes096000
toc: true
---

-----------------------------------------------------------------------------
| v09.60.00 | 04 oct 2022 | [ReleaseNotes](ReleaseNotes096000.html) |
| --- | --- | --- |



sbndcode v09_60_00 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_60_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_60_00/sbndcode-v09_60_00.html)

Purpose
---------------------------------------------------
Weekly release

New features
---------------------------------------------------
* sbndcode PR302: CRUMBS Multi Signal
  * Contains fcl updates to run the updated version of CRUMBS with different versions per signal.
  * Adds fcls for producing the training trees from different samples.

Bug fixes
---------------------------------------------------

Updated dependencies
---------------------------------------------------
* larsoft v09_60_00
* sbncode v09_60_00
* sbnd_data v09_15_00

Change List
==========================================

sbndcode
---------------------------------------------------

* 2022-10-04  Fran Nicolas : Merge branch 'release/v09_60_00'
* 2022-10-04  Fran Nicolas : Update to larsoft v09_60_00
* 2022-09-30  Francisco Javier Nicolás-Arnaldos : Merge pull request #302 from SBNSoftware/feature/hlay_CRUMBS_multi_signal
* 2022-09-29  Henry Lay : Update product_deps
* 2022-09-29  Henry Lay : Merge branch 'develop' into feature/hlay_CRUMBS_multi_signal
* 2022-09-27  Fran Nicolas : Merge tag 'v09_59_00' into develop
* 2022-09-26  Henry Lay : Point at new weights in sbnd_data v01_15_00
* 2022-09-21  Henry Lay : Add fhicls for producing training trees
* 2022-09-19  Henry Lay : Include backtracking services

sbndutil
---------------------------------------------------

* 2022-10-04  Fran Nicolas : Merge tag 'v09_60_00' into develop
* 2022-10-04  Fran Nicolas : Merge branch 'release/v09_60_00'
* 2022-10-04  Fran Nicolas : Update to larsoft v09_60_00
* 2022-09-27  Fran Nicolas : Merge tag 'v09_59_00' into develop
