---
layout: page
title: ReleaseNotes093200
toc: true
---

-----------------------------------------------------------------------------
| v09.32.00 | 01 Oct 2021 | [ReleaseNotes](ReleaseNotes093200.html) |
| --- | --- | --- |



sbndcode v09_32_00 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_32_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_32_00/sbndcode-v09_32_00.html)

Purpose
---------------------------------------------------

* Weekly release

New features
---------------------------------------------------

Bug fixes
---------------------------------------------------

* sbndcode #182:
  * Fix for opDetDigitizerSBND
  * Fixing a bug that was introduced with the update to art v3_09.
  * The SimPhotons Handle was saved to a new variable rather than the exiting class member. This caused no optical waveform to be created.

* sbndcode #183:
  * CMake changes to ensure installation of files required for gallery tests, fixing bug introduced in migration to art v3.09.

* sbndcode #173 was merged in v09_31_00 before the corresponding sbn pull request, resulting in reconstruction stage failures. This issue has been resolved in this release. 

Updated dependencies
---------------------------------------------------

* sbncode v09_32_00
* larsoft v09_32_00

Change List
==========================================

sbndcode
---------------------------------------------------

* 2021-10-01  Patrick Green : Merge branch 'release/v09_32_00'
* 2021-10-01  Patrick Green : Update to v09_32_00
* 2021-09-30  Patrick Green : Merge pull request #184 from SBNSoftware/pgreen135-patch-1
* 2021-09-30  Patrick Green : Update ci_tests.cfg
* 2021-09-29  Patrick Green : Merge pull request #183 from SBNSoftware/bugfix/hlay_cmake_update
* 2021-09-28  Patrick Green : Merge pull request #182 from SBNSoftware/mdeltutt_opticaldigitizer_fix
* 2021-09-28  Henry Lay : Make changes to ensure installation of gallery executables
* 2021-09-28  Marco Del Tutto : Remove commented out lines
* 2021-09-28  Marco Del Tutto : Fix indentation
* 2021-09-28  Marco Del Tutto : Store SimPhotons in memeber variable rather than creating a new one
* 2021-09-27  Patrick Green : Merge tag 'v09_31_00' into develop

sbndutil
---------------------------------------------------

* 2021-10-01  Patrick Green : Merge tag 'v09_32_00' into develop
* 2021-10-01  Patrick Green : Merge branch 'release/v09_32_00'
* 2021-10-01  Patrick Green : Update to v09_32_00
* 2021-09-27  Patrick Green : Merge tag 'v09_31_00' into develop
