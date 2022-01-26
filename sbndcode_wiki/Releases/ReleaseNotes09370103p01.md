---
layout: page
title: ReleaseNotes09370103p01
toc: true
---

-----------------------------------------------------------------------------
| v09.37.01.03p01 | 26 Jan 2022 | [ReleaseNotes](ReleaseNotes09370103p01.html) |
| --- | --- | --- |



sbndcode v09_37_01_03p01 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_37_01_03p01](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_37_01_03p01/sbndcode-v09_37_01_03p01.html)

Purpose
---------------------------------------------------

* Patch release for SBN-2021C

New features
---------------------------------------------------

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

Updated dependencies
---------------------------------------------------

Change List
==========================================

sbndcode
---------------------------------------------------

* 2022-01-26  Patrick Green : Update to v09_37_01_03p01
* 2022-01-26  Patrick Green : Merge pull request #251 from SBNSoftware/feature/zennamo_dropmcreco_intime
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
