---
layout: page
title: ReleaseNotes09930101
toc: true
---

-----------------------------------------------------------------------------
| v09.93.01.01 | 14 Nov 2024 | [ReleaseNotes](ReleaseNotes09930101.html) |
| --- | --- | --- |



sbndcode v09_93_01_01 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_93_01_01](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_93_01_01/sbndcode-v09_93_01_01.html)

Purpose
---------------------------------------------------
Update to depend on `sbncode v09_93_01_01`, which includes an updated `sbndaq-artdaq-core` package.

New features
---------------------------------------------------
#553 from SBNSoftware/dbrailsf_fclreorgbugfix
#536 from SBNSoftware/dbrailsf_datafilter

Bug fixes
---------------------------------------------------
#551 from SBNSoftware/absolution1-patch-1

Updated dependencies
---------------------------------------------------

Supported qualifiers
---------------------------------------------------

Change List
==========================================

sbndcode sbndcode
---------------------------------------------------

* 2024-11-14  Brinden Carlson : Merge branch 'release/v09_93_01_01'
* 2024-11-14  Brinden Carlson : Update to sbncode v09_93_01_01
* 2024-11-06  Bear Carlson : Merge pull request #553 from SBNSoftware/dbrailsf_fclreorgbugfix
* 2024-11-06  Bear Carlson : Merge branch 'develop' into dbrailsf_fclreorgbugfix
* 2024-11-05  Bear Carlson : Merge pull request #536 from SBNSoftware/dbrailsf_datafilter
* 2024-11-05  Bear Carlson : Merge branch 'develop' into dbrailsf_datafilter
* 2024-11-05  Dom Brailsford : missed _sce
* 2024-11-04  Bear Carlson : Merge pull request #551 from SBNSoftware/absolution1-patch-1
* 2024-11-04  Dom Brailsford : Update README
* 2024-11-01  Dom Brailsford : Merge branch 'develop' into dbrailsf_datafilter
* 2024-10-31  Brinden Carlson : Merge tag 'v09_93_01' into develop
* 2024-10-17  Dom Brailsford : Add fcl to keep the filtered events (but in a separate file)
* 2024-10-16  Dom Brailsford : Up number of hits to 50000
* 2024-10-16  Dom Brailsford : Remove ana addition as that happens in the standard fcl
* 2024-10-16  Dom Brailsford : Enable filtering
* 2024-10-16  Dom Brailsford : Remove the predefined filter sequence as it would never be useful (filters would always need to be slotted into the middle of a workflow)
* 2024-10-16  Dom Brailsford : Add filter to job fcl
* 2024-10-16  Dom Brailsford : add a sequence to the workflow fcl too
* 2024-10-16  Dom Brailsford : Add it to the workflow
* 2024-10-16  Dom Brailsford : Rename to have sbnd in the name
* 2024-10-16  Dom Brailsford : Remove typo that appeared
* 2024-10-16  Dom Brailsford : Port ProtoDUNE's hit filter to sbnd

sbndutil 
---------------------------------------------------

* 2024-11-14  Brinden Carlson : Merge tag 'v09_93_01_01' into develop
* 2024-11-14  Brinden Carlson : Merge branch 'release/v09_93_01_01'
* 2024-11-14  Brinden Carlson : Update to sbncode v09_93_01_01
* 2024-10-31  Brinden Carlson : Merge tag 'v09_93_01' into develop
