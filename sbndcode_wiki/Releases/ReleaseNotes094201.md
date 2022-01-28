--
layout: page
title: ReleaseNotes094201
toc: true
---

-----------------------------------------------------------------------------
| v09.42.01 | 28 Jan 2022 | [ReleaseNotes](ReleaseNotes094201.html) |
| --- | --- | --- |



sbndcode v09_42_01 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_42_01](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_42_01/sbndcode-v09_42_01.html)

Purpose
---------------------------------------------------

* Weekly release

New features
---------------------------------------------------

* sbndcode PR 247:
  * OpT0Finder with new LArG4
  * Depends on OpT0Finder with new LArG4 sbncode#227.
  * Enables running the OpT0Finder flash matching with the new larg4.
  * Adds the opt0finder process back in the default reco chain.
  * Fixes issue #163.

* sbndcode PR 250:
  * CRT Plane Index and Commissioning Samples
  * adds a GetPlaneIndex function in CRTCommonUtils to retrieve the CRT plane index. This is also saved in the CRT Hit dataproduct.
  * fixes the CRT plane names: Front, Back, Left, Right -> South, North, West, East
  * makes sure that the commissioning detsim fhicl saves the full optical waveforms

* sbndcode PR 251:
  * adding fcl to drop mcreco for intime cosmics
  * running MCReco for in-time cosmics isn't needed by physics groups and it is very very slow to run without shower-rollup.

Bug fixes
---------------------------------------------------

* sbndcode PR 248:
  * Amend ifdh usage in CI test
  * Change required to be compatible with the new ifdh_config.
  * Should be the only change required in sbndcode for the integration tests. The validation suite might need further amendments to lar_ci and sbnci.
  * This will fix the current failure mode in the fcl checks test.

Updated dependencies
---------------------------------------------------

* sbncode v09_42_01
* larsoft v09_42_01

Change List
==========================================

sbndcode
---------------------------------------------------

* 2022-01-28  Patrick Green : Merge branch 'release/v09_42_01'
* 2022-01-28  Patrick Green : Update to v09_42_01
* 2022-01-28  Patrick Green : Merge remote-tracking branch 'remotes/origin/feature/zennamo_dropmcreco_intime' into release/v09_42_01
* 2022-01-28  Patrick Green : Merge remote-tracking branch 'remotes/origin/mdeltutt_commissioning_patches_sbn2021c' into release/v09_42_01
* 2022-01-25  Joseph Zennamo : adding fcl to drop mcreco for intime cosmics
* 2022-01-24  Patrick Green : Merge pull request #250 from SBNSoftware/mdeltutt_commissioning_patches_sbn2021c
* 2022-01-21  Marco Del Tutto : Save CRT strips in hit dumper tree
* 2022-01-21  Marco Del Tutto : Remove spurious lines
* 2022-01-21  Marco Del Tutto : Fix CRT panels names
* 2022-01-21  Marco Del Tutto : Fix CRT panels names
* 2022-01-21  Marco Del Tutto : Save the full PMT waveform for commissioning samples
* 2022-01-21  Marco Del Tutto : Use the GetPlaneIndex from CRTCommonUtils to get the CRT plane index
* 2022-01-21  Marco Del Tutto : Fill CRT plane number in sbn::crt::CRTHit
* 2022-01-21  Marco Del Tutto : Add function GetPlaneIndex to retrieve CRT plane index
* 2022-01-18  Patrick Green : Merge pull request #248 from SBNSoftware/feature/ci_new_ifdh
* 2022-01-18  Patrick Green : Merge pull request #247 from SBNSoftware/mdeltutt_issue_163
* 2022-01-17  Henry Lay : Amend ifdh usage
* 2022-01-17  Marco Del Tutto : Add VUVHits and VISHits to opt0finder config
* 2022-01-17  Marco Del Tutto : Re-add opt0finder to standard reco chain
* 2022-01-17  Marco Del Tutto : Improve messages
* 2022-01-17  Marco Del Tutto : Pass the SemiAnalyticalModel class to the FlashMatchManager
* 2022-01-14  Patrick Green : Merge tag 'v09_42_00' into develop
* 2022-01-14  Patrick Green : Update to v09_37_01_03
* 2022-01-14  Patrick Green : Merge pull request #246 from SBNSoftware/bugfix/hlay_more_crt_segfaults

sbndutil
---------------------------------------------------

* 2022-01-28  Patrick Green : Merge tag 'v09_42_01' into develop
* 2022-01-28  Patrick Green : Merge branch 'release/v09_42_01'
* 2022-01-28  Patrick Green : Update to v09_42_01
* 2022-01-14  Patrick Green : Merge tag 'v09_42_00' into develop
