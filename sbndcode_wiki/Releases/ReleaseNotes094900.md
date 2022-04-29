---
layout: page
title: ReleaseNotes094900
toc: true
---

-----------------------------------------------------------------------------
| v09.49.00 | 29 abr 2022 | [ReleaseNotes](ReleaseNotes094900.html) |
| --- | --- | --- |



sbndcode v09_49_00 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_49_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_49_00/sbndcode-v09_49_00.html)

Purpose
---------------------------------------------------
* Weekly release

New features
---------------------------------------------------
* Reverted CRUMBS merge:
  * Incorrect branch was merged
  * To be replaced with SBNSoftware/sbncode#278
  
* sbndcode PR #278:
  * CRUMBS develop
  * adapted version of PR #264 for SBN2022A, changes to be compatible with develop
  
* sbndcode PR #279:
  * Reduce n-universes for weights in the CI
  * Since the extra flux weights were added to CAFMaker the nucosmics CAF test has been taking a very long time to complete. As was decided when this test was originally added we opted to reduce the number of universes to 5 for the CI so it tests the functionality without spending a huge amount of time setting up the job.

Bug fixes
---------------------------------------------------

Updated dependencies
---------------------------------------------------
* sbncode v09_49_00
* larsoft v09_49_00

Change List
==========================================

sbndcode
---------------------------------------------------

* 2022-04-29  fran-nicar : Merge branch 'release/v09_49_00'
* 2022-04-29  fran-nicar : Update to LArSoft version v09_49_00
* 2022-04-29  Patrick Green : Merge pull request #278 from SBNSoftware/feature/hlay_CRUMBS_develop
* 2022-04-28  Patrick Green : Update ci_tests.cfg
* 2022-04-26  Patrick Green : Merge pull request #279 from SBNSoftware/feature/hlay_ci_less_universes
* 2022-04-25  Henry Lay : Reduce n-universes for weights in the CI
* 2022-03-18  Henry Lay : Correct CRT match labels for SCE CRUMBS
* 2022-03-16  Henry Lay : Rename fcl
* 2022-03-16  Henry Lay : Run SCE versions of crt matching
* 2022-02-23  Henry Lay : Run CRUMBS in cafmaker
* 2022-04-15  Patrick Green : Revert "Merge remote-tracking branch 'remotes/origin/feature/hlay_crumbs' into release/v09_48_01"
* 2022-04-15  Patrick Green : Merge tag 'v09_48_01' into develop

sbndutil
---------------------------------------------------

* 2022-04-29  fran-nicar : Merge tag 'v09_49_00' into develop
* 2022-04-29  fran-nicar : Merge branch 'release/v09_49_00'
* 2022-04-29  fran-nicar : Update to larsoft version v09_49_00
* 2022-04-15  Patrick Green : Merge tag 'v09_48_01' into develop
