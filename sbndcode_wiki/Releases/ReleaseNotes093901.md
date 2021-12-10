---
layout: page
title: ReleaseNotes093901
toc: true
---

-----------------------------------------------------------------------------
| v09.39.01 | 10 Dec 2021 | [ReleaseNotes](ReleaseNotes093901.html) |
| --- | --- | --- |



sbndcode v09_39_01 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_39_01](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_39_01/sbndcode-v09_39_01.html)

Purpose
---------------------------------------------------

* Weekly release

New features
---------------------------------------------------

* sbndcode PR 234:
  * Add further rollup-less fcls
  * As requested by @jzennamo in yesterday's RM meeting. A further 5 fcls for running g4 without rollup.

* sbndcode PR 236:
  * Feature/lg nutools v3 12 00
  * update library names for nutools v3_12_01

* sbndcode PR 237:
  * Change caf module label to cafmaker not mycafmaker
  * Production team are moving towards using a common set of scripts in sbnutil. One issue I came across during this migration is that ICARUS use the module name cafmaker whilst we use mycafmaker for CAFMaker. This PR moves us to use the same as ICARUS such that the scripts don't need extra logic for sbnd files.

* sbndcode PR 238:
  * Issue 142 on LArSoft View
  * When we switched to the new geometry v2.0, plane 0 and 1 in TPC 0 were swapped compared to the previous version of the geometry v1.5. This caused problems with the larsoft View being assigned incorrectly (see #139 by @absolution1, @etyley, @henrylay97, and #128 by @wforeman).
  * With PR #141, we swapped the planes back as a temporary fix in order to give us time to work on the View issue in LArSoft. After a re-evaluation of the SBND wire design, it turns out that the wire orientation in geometry v1.5 was correct, and v2.0 was introducing a mistake. The good news is that PR #141 is not a temporary fix anymore, but it gives the right configuration.
  * This PR just removes a comment in the GDML file saying that plane order is wrong, and so resolves issue #142.

* sbndcode PR 239:
  * updates to library names to fix compilation CI test

* sbndutil Feature/lg nutools v3 12 00
   * updates for nutools v3_12_01

Bug fixes
---------------------------------------------------

Updated dependencies
---------------------------------------------------

* sbncode v09_39_01
* larsoft v09_39_01

Change List
==========================================

sbndcode
---------------------------------------------------

* 2021-12-10  Patrick Green : Merge branch 'release/v09_39_01'
* 2021-12-10  Patrick Green : Update to v09_39_01
* 2021-12-10  Patrick Green : Merge remote-tracking branch 'remotes/origin/feature/hlay_caf_module_name' into release/v09_39_01
* 2021-12-10  Patrick Green : Merge remote-tracking branch 'remotes/origin/feature/hlay_production_rollup_fcls' into release/v09_39_01
* 2021-12-10  Patrick Green : Merge pull request #238 from SBNSoftware/mdelutt_issue142
* 2021-12-09  Patrick Green : Merge pull request #239 from SBNSoftware/feature/hlay_compilation_test
* 2021-12-08  Henry Lay : update library names
* 2021-12-08  Marco Del Tutto : Remove warning comment from gdml file. This config is correct.
* 2021-12-08  Henry Lay : Change caf module label to cafmaker not mycafmaker
* 2021-12-07  Patrick Green : Merge pull request #234 from SBNSoftware/feature/hlay_production_rollup_fcls
* 2021-12-07  Patrick Green : Merge pull request #236 from SBNSoftware/feature/lg_nutools_v3_12_00
* 2021-12-07  Patrick Green : Merge tag 'v09_38_00' into develop
* 2021-12-06  Lynn Garren : for nutools v3_12_01
* 2021-12-06  Lynn Garren : fix Geant4 library names
* 2021-12-06  Lynn Garren : update library names
* 2021-12-06  Henry Lay : Make sure we use the sce type fcls
* 2021-12-03  Patrick Green : Merge pull request #233 from SBNSoftware/feature/hlay_caf_tests
* 2021-12-03  Henry Lay : Have fcls inherit properly
* 2021-12-02  Henry Lay : Add further rollup-less fcls

sbndutil
---------------------------------------------------

* 2021-12-10  Patrick Green : Merge tag 'v09_39_01' into develop
* 2021-12-10  Patrick Green : Merge branch 'release/v09_39_01'
* 2021-12-10  Patrick Green : Update to v09_39_01
* 2021-12-10  Patrick Green : Merge remote-tracking branch 'remotes/origin/feature/lg_nutools_v3_12_00' into release/v09_39_01
* 2021-12-07  Patrick Green : Merge tag 'v09_38_00' into develop
* 2021-12-06  Lynn Garren : for nutools v3_12_01
