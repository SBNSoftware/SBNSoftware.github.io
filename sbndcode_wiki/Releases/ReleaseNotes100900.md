---
layout: page
title: ReleaseNotes100900
toc: true
---

-----------------------------------------------------------------------------
| v10.09.00 | 25 Aug 2025 | [ReleaseNotes](ReleaseNotes100900.html) |
| --- | --- | --- |



sbndcode v10_09_00 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v10_09_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v10_09_00/sbndcode-v10_09_00.html)

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
### Release Notes for [sbndcode] from v10_06_03 to v10_09_00
- PR #787: Add detvar fcls to avoid the error for same process being run twice
  - **Description**: Adding detvar fcls to avoid the error of "The process name ABC was previously used on these products." when producing detvar samples. In our setup, ABC can be G4 (recombination & SCE), detsim (PDS, etc), reco1. Reco2 is not relevant since we save reco1 files to run detvar samples on.  This PR is preventive and meant to merge only into develop (not production). Production has a different separate PR.
  - **Labels**: maintenance, simulation, detsim, reco1/reco2
  - **Reviewers**: jzennamo
  - **Assignees**: linyan-w
- PR #762: Adding low threshold settings to reco1
  - **Description**:
  - **Labels**:
  - **Reviewers**: absolution1, wforeman, weihythu, nathanielerowe, wjdanswjddl
  - **Assignees**: Jjm321814
- PR #782: new dead channel -- died August 5, 2025, starting with run 18837
  - **Description**: Please provide a detailed description of the changes this pull request introduces.
  - **Labels**: tpc, detsim, data
  - **Reviewers**:
  - **Assignees**: tomjunk, Li-Jiaoyang97
- PR #785: CRT File Size Cut
  - **Description**: We collect a large chunk of data before and after the event trigger (50ms) most of which we don't need. This PR adds the functionality to the first CRT reconstruction producer to drop data outside of a window. This is turned on only for data where it is necessary.  This has a significant impact on the size of our files: - reco1 & reco2 artroot files reduce by 11% and 5.5% respectively - CAF & FlatCAF by about 35% - Calib NTuples (via the CRTAnalysis tree) by about 50% again, this is only for data workflows.  ~~This hasn't yet been presented so will convert to full PR when it has. Draft slides can be found here: https://docs.google.com/presentation/d/1E2rItFS-dis8DV_TPqzlXUOAadtHawEky4pevQq8RWg/edit?usp=sharing~~  Presented at CRT meeting now: https://sbn-docdb.fnal.gov/cgi-bin/sso/ShowDocument?docid=42993
  - **Labels**: enhancement, crt, reco1/reco2
  - **Reviewers**: jzennamo, absolution1
  - **Assignees**: henrylay97
- PR #793: Fix CRT T0 Matching for Cathode Crossing Tracks
  - **Description**: The check on minimum and maximum timing fails for cathode crossing tracks which have already been T0 tagged. This prevents >99% of possible CRT tags to these tracks. It is important to also tag them with the CRT as a cross check of both systems' performances.  The actual fix is the one line change in each of the CRTTPCMatching algs. In the process of making this fix I added more TPC visualisation to the CRT event display that may as well be merged as well.  Presenting today at the calibration meeting - will link slides after. Note, the two PRs relating to the calibration ntuples in sbncode and sbnobj come from the same study but are totally independent of this PR from a release management point of view - this PR can be merged before / after / at the same time as them.
  - **Labels**: bug, crt, tpc, reco1/reco2
  - **Reviewers**: mrmooney, mstancar
  - **Assignees**: henrylay97

sbndcode sbndcode
---------------------------------------------------

* 2025-08-25  Nathaniel : Merge branch 'release/v10_09_00'
* 2025-08-25  Nathaniel : Update to sbncode v10_09_00
* 2025-08-25  nathanielerowe : Merge pull request #793 from SBNSoftware/feature/hlay_calib_ntuples_crt_t0
* 2025-08-25  nathanielerowe : Merge branch 'develop' into feature/hlay_calib_ntuples_crt_t0
* 2025-08-25  nathanielerowe : Merge pull request #785 from SBNSoftware/feature/hlay_crt_file_size_cut
* 2025-08-25  nathanielerowe : Merge branch 'develop' into feature/hlay_crt_file_size_cut
* 2025-08-25  nathanielerowe : Merge pull request #782 from SBNSoftware/trj_new_dead_channel_aug8_2025
* 2025-08-25  nathanielerowe : Merge branch 'develop' into trj_new_dead_channel_aug8_2025
* 2025-08-25  nathanielerowe : Merge pull request #762 from SBNSoftware/feature/JacobLowThresholdTools
* 2025-08-25  nathanielerowe : Merge branch 'develop' into feature/JacobLowThresholdTools
* 2025-08-25  nathanielerowe : Merge pull request #787 from SBNSoftware/feature/linyan-detvar-fcls
* 2025-08-25  nathanielerowe : Merge branch 'develop' into feature/hlay_calib_ntuples_crt_t0
* 2025-08-22  Linyan Wan : Adding include statement to fix CI error
* 2025-08-21  Henry Lay : Add 10us safety
* 2025-08-15  Linyan Wan : Add detvar fcls to avoid the error for same process being run twice
* 2025-08-14  Henry Lay : Cut away excess CRT data in data workflows
* 2025-08-14  Henry Lay : Add functionality for cutting on Ts0 in the StripHit producer
* 2025-08-12  Henry Lay : Fix matching for cathode crossing tracks
* 2025-08-12  Henry Lay : Develop event display further
* 2025-08-11  linyan-w : Merge branch 'develop' into feature/JacobLowThresholdTools
* 2025-08-08  Thomas Junk : new dead channel -- died August 5, 2025, starting with run 18837
* 2025-08-07  Nathaniel : Merge tag 'v10_06_03' into develop
* 2025-08-04  Jacob McLaughlin : Putting the cathode plane back
* 2025-08-04  Jacob McLaughlin : removed some comments
* 2025-08-04  Jacob McLaughlin : fixed bug from merge
* 2025-08-04  Jacob McLaughlin : fixing dnn running
* 2025-08-01  Jacob McLaughlin : fixed detsim step
* 2025-08-01  Jacob McLaughlin : Merge branch 'develop' into feature/JacobLowThresholdTools
* 2025-08-01  Jacob McLaughlin : sptpc2d needs to be moved to simtpc2d
* 2025-08-01  Jacob McLaughlin : Trying to fix roi threshold input
* 2025-07-31  Jacob McLaughlin : Adjusting standard detsim files
* 2025-07-29  Jacob McLaughlin : only running dnn roi for low threshold searches
* 2025-07-29  Jacob McLaughlin : Pulling files out of pr
* 2025-07-29  Jacob McLaughlin : resolved conflict
* 2025-07-29  Jacob McLaughlin : Mostly complete fcl cleanup
* 2025-07-29  Jacob McLaughlin : simplifying the jsonnet files
* 2025-07-28  Jacob McLaughlin : simplifying sim fcl
* 2025-07-25  Jacob McLaughlin : Some more fcl simplification
* 2025-07-24  Jacob McLaughlin : Simplifying fcl config
* 2025-07-24  Jacob McLaughlin : Merging in some blipreco stuff
* 2025-07-18  Jacob McLaughlin : Threw away classic processing fcl
* 2025-07-16  Jacob McLaughlin : wrong label in dnn lookup
* 2025-07-15  Jacob McLaughlin : Wire cell is detsim
* 2025-07-14  Jacob McLaughlin : Need detsim to use dnn in mc
* 2025-07-14  Jacob McLaughlin : forgot to add
* 2025-07-14  Jacob McLaughlin : try different fcl name
* 2025-07-14  Jacob McLaughlin : MC path updates
* 2025-07-14  Jacob McLaughlin : adding mc tools
* 2025-07-14  Jacob McLaughlin : Minor clean ups and comment additions:
* 2025-07-14  Jacob McLaughlin : Had a flag set wrong
* 2025-07-14  Jacob McLaughlin : fixing classic mode
* 2025-07-14  Jacob McLaughlin : split up reco1 options by use of DNN
* 2025-07-14  Jacob McLaughlin : removed old directory cludge
* 2025-07-14  Jacob McLaughlin : Made low threshold use DNN ROI
* 2025-07-14  Jacob McLaughlin : Didn't assign things correctly
* 2025-07-14  Jacob McLaughlin : Adjusting fcl to be more minamal
* 2025-07-14  Jacob McLaughlin : I don't believe this updated correctly
* 2025-07-14  Jacob McLaughlin : fcl ordering
* 2025-07-14  Jacob McLaughlin : Squashed commit of the following:
* 2025-07-14  Jacob McLaughlin : Adding low threshold settings fcl and jsonnet files. Does not impact any normal setting files
