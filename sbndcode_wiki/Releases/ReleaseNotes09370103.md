---
layout: page
title: ReleaseNotes09370103
toc: true
---

-----------------------------------------------------------------------------
| v09.37.01.03 | 14 Jan 2022 | [ReleaseNotes](ReleaseNotes09370103.html) |
| --- | --- | --- |



sbndcode v09_37_01_03 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_37_01_03](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_37_01_03/sbndcode-v09_37_01_03.html)

Purpose
---------------------------------------------------

* Patch release for SBN-2021C

New features
---------------------------------------------------

Bug fixes
---------------------------------------------------

* sbndcode PR 246:
  * Fix More CRT Segfaults
  * This further patches CRT segfaults related to those addressed in #240. These segfaults originated in the introduction of the refactored larg4 for the CRT (#207). These are "rare" segfaults, hence they were discovered in production where the volume of events was high enough to see this occur regularly.

Updated dependencies
---------------------------------------------------

* sbncode v09_37_01_03

Change List
==========================================

sbndcode
---------------------------------------------------

* 2022-01-14  Patrick Green : Update to v09_37_01_03
* 2022-01-14  Patrick Green : Merge pull request #246 from SBNSoftware/bugfix/hlay_more_crt_segfaults
* 2022-01-10  Henry Lay : Protect upstream
* 2022-01-07  Henry Lay : Further fix to channel map functions

sbndutil
---------------------------------------------------
