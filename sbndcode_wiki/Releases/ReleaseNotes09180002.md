---
layout: page
title: ReleaseNotes09180002
toc: true
---

-----------------------------------------------------------------------------
| v09.18.00.02 | 23 Mar 2021 | [ReleaseNotes](ReleaseNotes09180002.html) |
| --- | --- | --- |



sbndcode v09_18_00_02 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_18_00_02](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_18_00_02/sbndcode-v09_18_00_02.html)

Purpose
---------------------------------------------------

* Weekly Release

New features
---------------------------------------------------

* sbndcode PR 90:
  * Remove TFileMetadataSBND and FileCatalogMetadataSBND
  * They are moving to "SBN" versions in sbncode.

* sbndcode PR 91:
  * HitDumper for Commissioning
  * moves the HitDumper module from the AnalysisTree/ directory to its own directory called Commissioning/
  * incorporates a new feature to the HitDumper module to dump the whole waveform to check for transparency

* sbndutil PR 4:
  * Update to SBN Common Metadata Service

Bug fixes
---------------------------------------------------

* sbndcode PR 89:
  * Fixes to galley python utilities for ROOT 6.22

Updated dependencies
---------------------------------------------------

* sbncode v09_18_00_02

Change List
==========================================

sbndcode v09_18_00_02
---------------------------------------------------

* 2021-03-23  Patrick Green : Merge branch 'release/v09_18_00_02'
* 2021-03-23  Patrick Green : Update to sbndcode v09_18_00_02
* 2021-03-23  Patrick Green : Merge pull request #90 from SBNSoftware/feature/bckhouse_metadata_service
* 2021-03-23  Patrick Green : Merge pull request #91 from SBNSoftware/mdeltutt_commissioning
* 2021-03-22  Marco Del Tutto : Fixing conflicts
* 2021-03-22  Marco Del Tutto : Fixing conflicts
* 2021-03-22  Marco Del Tutto : Trimming trailing whitespaces
* 2021-03-22  Marco Del Tutto : Clean up
* 2021-03-22  Edward Tyley : Update metadata fcl config
* 2021-03-22  Christopher Backhouse : Remove TFileMetadataSBND and FileCatalogMetadataSBND, which are moving to "SBN" versions in sbncode.
* 2021-03-22  Marco Del Tutto : Integrating the modified hit dumber by Gaving into the standard HitDumper
* 2021-03-22  Marco Del Tutto : Moving HitDumper module from AnalysisTree to its own Commissioning directory
* 2021-03-19  Patrick Green : Merge pull request #89 from SBNSoftware/mdeltutt_gallery_python_root6_22
* 2021-03-18  Marco Del Tutto : Fixes for root 6.22
* 2021-03-15  Patrick Green : Merge tag 'v09_18_00' into develop

sbndutil v09_18_00_02
---------------------------------------------------

* 2021-03-23  Patrick Green : Merge branch 'release/v09_18_00_02'
* 2021-03-23  Patrick Green : Update to sbndcode v09_18_00_02
* 2021-03-23  Patrick Green : Merge pull request #4 from SBNSoftware/feature/etyley_metadata
* 2021-03-22  Edward Tyley : Update metadata fcl config
* 2021-03-22  Edward Tyley : Update to use sbn-common metadata
* 2021-03-15  Patrick Green : Merge tag 'v09_18_00' into develop
