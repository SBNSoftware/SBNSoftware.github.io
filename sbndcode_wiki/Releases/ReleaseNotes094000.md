---
layout: page
title: ReleaseNotes094000
toc: true
---

-----------------------------------------------------------------------------
| v09.40.00 | 17 Dec 2021 | [ReleaseNotes](ReleaseNotes094000.html) |
| --- | --- | --- |



sbndcode v09_40_00 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_40_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_40_00/sbndcode-v09_40_00.html)

Purpose
---------------------------------------------------

* Weekly release

New features
---------------------------------------------------

* sbndcode PR 235:
  * Add photon propagation times to hybrid model and re-enable by default 
  * Requires LArSoft/larsim#84
  * Resolves issue #219

* sbndcode PR 240:
   * Patch / workaround for CRT error where AuxDets can't be found
   * Instead of throwing an exception the same error message is now outputted as a debugging message and the function returns UINT_MAX as the channel ID.
   * A catch is added at the detsim stage and in a detsim analysis module to skip channels with the ID UINT_MAX.
   * Underlying issue is still present, and requires fix in LArSoft

Bug fixes
---------------------------------------------------

Updated dependencies
---------------------------------------------------

* sbncode v09_40_00
* larsoft v09_40_00

Change List
==========================================

sbndcode
---------------------------------------------------

* 2021-12-17  Patrick Green : Merge branch 'release/v09_40_00'
* 2021-12-17  Patrick Green : Update to v09_40_00
* 2021-12-17  Patrick Green : Merge remote-tracking branch 'remotes/origin/bugfix/hlay_crt_channels' into release/v09_40_00
* 2021-12-17  Patrick Green : Merge pull request #235 from SBNSoftware/feature/pgreen_hybrid_model_propagation_times
* 2021-12-14  Henry Lay : Add warning messages to prompt a future fix of the root cause
* 2021-12-14  Henry Lay : Remove another exception
* 2021-12-10  Henry Lay : Add similar catch to ana module
* 2021-12-10  Henry Lay : Ensure CRT detsim skips non-physical channels
* 2021-12-10  Henry Lay : Override nearest aux det functions
* 2021-12-10  Patrick Green : Merge tag 'v09_39_01' into develop
* 2021-12-06  Patrick Green : Re-enable hybrid light simulation
* 2021-11-29  Patrick Green : Added configuration for photon propagation time simulation in external argon (hybrid model)

sbndutil
---------------------------------------------------

* 2021-12-17  Patrick Green : Merge tag 'v09_40_00' into develop
* 2021-12-17  Patrick Green : Merge branch 'release/v09_40_00'
* 2021-12-17  Patrick Green : Update to v09_40_00
* 2021-12-10  Patrick Green : Merge tag 'v09_39_01' into develop
