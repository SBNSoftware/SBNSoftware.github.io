---
layout: page
title: ReleaseNotes094200
toc: true
---

-----------------------------------------------------------------------------
| v09.42.00 | 14 Jan 2022 | [ReleaseNotes](ReleaseNotes094200.html) |
| --- | --- | --- |



sbndcode v09_42_00 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_42_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_42_00/sbndcode-v09_42_00.html)

Purpose
---------------------------------------------------

* Weekly release

New features
---------------------------------------------------

Bug fixes
---------------------------------------------------

* sbndcode PR 246:
  * Fix More CRT Segfaults
  * This further patches CRT segfaults related to those addressed in #240. These segfaults originated in the introduction of the refactored larg4 for the CRT (#207). These are "rare" segfaults, hence they were discovered in production where the volume of events was high enough to see this occur regularly.

Updated dependencies
---------------------------------------------------

* sbncode v09_42_00
* larsoft v09_42_00

Change List
==========================================

sbndcode
---------------------------------------------------

* 2022-01-14  Patrick Green : Merge branch 'release/v09_42_00'
* 2022-01-14  Patrick Green : Update to v09_42_00
* 2022-01-14  Patrick Green : resolving conflicts
* 2022-01-10  Henry Lay : Protect upstream
* 2022-01-07  Henry Lay : Further fix to channel map functions
* 2021-12-23  Patrick Green : Merge tag 'v09_41_00' into develop
* 2021-12-15  Patrick Green : Update to v09_37_01_02
* 2021-12-15  Patrick Green : Merge pull request #240 from SBNSoftware/bugfix/hlay_crt_channels
* 2021-12-09  Patrick Green : Merge pull request #237 from SBNSoftware/feature/hlay_caf_module_name

sbndutil
---------------------------------------------------

* 2022-01-14  Patrick Green : Merge tag 'v09_42_00' into develop
* 2022-01-14  Patrick Green : Merge branch 'release/v09_42_00'
* 2022-01-14  Patrick Green : Update to v09_42_00
* 2021-12-23  Patrick Green : Merge tag 'v09_41_00' into develop
