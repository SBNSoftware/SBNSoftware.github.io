---
layout: page
title: ReleaseNotes09930102p02
toc: true
---

-----------------------------------------------------------------------------
| v09.93.01.02p02 | 04 Feb 2025 | [ReleaseNotes](ReleaseNotes09930102p02.html) |
| --- | --- | --- |



sbndcode v09_93_01_02p02 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_93_01_02p02](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_93_01_02p02/sbndcode-v09_93_01_02p02.html)

Purpose
---------------------------------------------------

New features
---------------------------------------------------

Bug fixes
---------------------------------------------------

Updated dependencies
---------------------------------------------------

Supported qualifiers
---------------------------------------------------

Change List
==========================================
### Release Notes for [sbndcode] from v09_93_01_02p01 to v09_93_01_02p02
- PR #566: Update reco1 to use channel status service
  - **Description**: Allows Cluster3D to find bad channels through the channel status service.
  - **Labels**: bug, reco1/reco2
  - **Reviewers**: 
  - **Assignees**: bear-is-asleep
- PR #563: Integrate CVN model
  - **Description**: Integrate CVN model.
  - **Labels**: tpc
  - **Reviewers**: bear-is-asleep
  - **Assignees**: yangtj207
- PR #609: CRT Data Timing (Cherry-Picked)
  - **Description**: Replaces PR 582 given that branch has various other PRs merged into it.  I've cherry-picked (hopefully all!) the relevant commits from that branch onto this one.  > As promised at the CM. This PR updates the low-level CRT reconstruction to provide a backup timing reference. Currently the SPEC TDC event trigger is used with the backup being to leave the CRT time in it's raw-est state if the TDC product/channel cannot be found. > > This PR adds a first backup of using the PTB HLT before ultimately falling back to the raw-est state if neither can be found. It also makes use of an object provided by @lynnt20 to document this decision on the event. > > This branch makes use of Lynn's PMT Decoder PR (541) and Max's PTB Decoder PR (581) so the diff includes the updates from those branches too.
  - **Labels**: crt, reco1/reco2, data
  - **Reviewers**: 
  - **Assignees**: henrylay97
- PR #604: No SCE reco2 fcl for Calib workflow
  - **Description**: 
  - **Labels**: 
  - **Reviewers**: 
  - **Assignees**: 


sbndcode sbndcode
---------------------------------------------------

* 2025-02-04  Brinden Carlson : Merge branch 'release/v09_93_01_02p02'
* 2025-02-04  Brinden Carlson : Update to sbndcode v09_93_01_02p02
* 2025-02-04  Bear Carlson : Merge pull request #604 from SBNSoftware/linyan-calib
* 2025-02-04  Bear Carlson : Merge branch 'develop' into linyan-calib
* 2025-02-04  Bear Carlson : Merge pull request #609 from SBNSoftware/feature/hlay_crt_data_timing_cherry_pick
* 2025-02-04  Bear Carlson : Merge branch 'develop' into feature/hlay_crt_data_timing_cherry_pick
* 2025-02-04  Bear Carlson : Merge pull request #563 from yangtj207/feature/tjyang_cvn
* 2025-02-04  Bear Carlson : Merge branch 'develop' into feature/tjyang_cvn
* 2025-02-04  Bear Carlson : Merge pull request #566 from SBNSoftware/feature/bearc_badchannelservice
* 2025-02-04  Bear Carlson : Merge branch 'develop' into feature/bearc_badchannelservice
* 2025-02-04  Bear Carlson : Unique larcv filenames
* 2025-02-04  Henry Lay : Merge remote-tracking branch 'origin/develop' into linyan-calib
* 2025-01-28  Tingjun Yang : Merge branch 'develop' into feature/tjyang_cvn
* 2025-01-28  Bear Carlson : Update CMakeLists.txt to v09_93_01_02p01
* 2025-01-28  Tingjun Yang : Merge remote-tracking branch 'upstream/develop' into feature/tjyang_cvn
* 2025-01-07  Henry Lay : Fix signedness
* 2024-12-19  Henry Lay : Unnecessary
* 2024-12-18  Henry Lay : Turn off produces line if not referencing
* 2024-12-17  Henry Lay : Add timing documentation to ana module
* 2024-12-17  Henry Lay : Correct use of allowed PTBs
* 2024-12-17  Henry Lay : Add bookkeeping object
* 2024-12-17  Henry Lay : Remove debug prints
* 2024-12-17  Henry Lay : Re-add debugging statements
* 2024-12-17  Henry Lay : Improve time referencing - check TDC is closest to event header and add PTB HLT backup option - final fallback is to just remove any PPS rollover in the CRTs but otherwise keep the T0 raw
* 2025-01-27  Brinden Carlson : Merge tag 'v09_93_01_02p01' into develop
* 2025-01-27  Henry Lay : Update file description
* 2025-01-15  Rachel : Merge branch 'develop' into feature/bearc_badchannelservice
* 2024-12-16  Bear Carlson : Move channel service to services fcl
* 2024-12-16  Bear Carlson : Move service map changes to services fcl
* 2024-12-09  Tingjun Yang : Clean up code.
* 2024-12-09  Tingjun Yang : Change lcvn::SBNDPixelMap to lcvn::PixelMap. Use association to get slice information for each pixel map.
* 2024-12-08  Tingjun Yang : Add cvn to reco2_data.fcl.
* 2024-12-08  Tingjun Yang : Loop over all slices.
* 2024-12-08  Tingjun Yang : Add cvn to MC workflow.
* 2024-12-08  Tingjun Yang : Reduce printouts.
* 2024-12-08  Tingjun Yang : Use slice by default.
* 2024-12-08  Tingjun Yang : Add FileCatalogMetadataSBN.
* 2024-12-06  Brinden Carlson : Update reco1 to use channel status service so cluster3d can find bad channels
* 2024-12-01  Tingjun Yang : Add subrun.
* 2024-11-30  Tingjun Yang : Set t0 correction to true.
* 2024-11-29  Tingjun Yang : Add nhits for each plane.
* 2024-11-28  Tingjun Yang : Use new version of sbnd_data.
* 2024-11-28  Tingjun Yang : Add truth variables to ttree.
* 2024-11-28  Tingjun Yang : Use model in sbnd_data.
* 2024-11-26  Tingjun Yang : Add fcl file to evaluation cvn and save a tree.
* 2024-11-26  Tingjun Yang : Specify inputs and outputs names.
* 2024-11-26  Tingjun Yang : Add a new version of tf_graph that takes inputs as an input.
* 2024-11-23  Tingjun Yang : Save cvn scores in a TTree.
* 2024-11-23  Tingjun Yang : Add analyzer module to test CVN performance.
* 2024-11-22  Tingjun Yang : Add a method to make pixel map from slice and evaluate it.
* 2024-11-21  Tingjun Yang : Add association between lcvn::SBNDPixelMap and lcvn::Result.
* 2024-11-21  Tingjun Yang : Reorganize fcl files.
* 2024-11-21  Tingjun Yang : Add association between recob::Slice and lcvn::SBNDPixelMap.
* 2024-11-20  Tingjun Yang : Add new fcl files for cvn training.
* 2024-11-20  Tingjun Yang : Initial commit of Varuna's work on CVN.

sbndutil 
---------------------------------------------------


