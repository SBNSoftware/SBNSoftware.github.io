---
layout: page
title: ReleaseNotes10060006
toc: true
---

-----------------------------------------------------------------------------
| v10.06.00.06 | 08 Nov 2025 | [ReleaseNotes](ReleaseNotes10060006.html) |
| --- | --- | --- |



sbndcode v10_06_00_06 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v10_06_00_06](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v10_06_00_06/sbndcode-v10_06_00_06.html)

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
### Release Notes for [sbndcode] from v10_06_00_05 to v10_06_00_06
- PR #851: Apply the commit from PR #845 to production/v10_06_00
  - **Description**: 
  - **Labels**:
  - **Reviewers**:
  - **Assignees**: tomjunk, seokjuchung
- PR #820: add e-lifetime correction for data in spring production
  - **Description**: Sungbin found that in the recent reco2 respinning data still had 100 ms e-lifetime... This PR patches that...!
  - **Labels**: bug, calibration
  - **Reviewers**:
  - **Assignees**: linyan-w
- PR #825: adding TrackHitFillRRStartCut: 1000 and TrackHitFillRREndCut: 1000 to cafmakerjob_sbnd_sce.fcl
  - **Description**: Please provide a detailed description of the changes this pull request introduces.
  - **Labels**: caf
  - **Reviewers**:
  - **Assignees**: sungbinoh
- PR #827: yz scale bugfix
  - **Description**: Please provide a detailed description of the changes this pull request introduces. This is a copy of PR 826 for the production branch.
  - **Labels**: bug, reco1/reco2
  - **Reviewers**:
  - **Assignees**: sxy1439
- PR #866: Add bug fix to FrameShift module when RWM signal is missing - Spring Production
  - **Description**: Please provide a detailed description of the changes this pull request introduces.
  - **Labels**: bug
  - **Reviewers**:
  - **Assignees**: VCLanNguyen

sbndcode sbndcode
---------------------------------------------------

* 2025-11-08  Nathaniel : Update versioning
* 2025-11-08  nathanielerowe : Merge pull request #866 from SBNSoftware/lnguyen/frame_bugfix_v10_06_00_05
* 2025-11-08  nathanielerowe : Merge branch 'production/v10_06_00' into lnguyen/frame_bugfix_v10_06_00_05
* 2025-11-08  nathanielerowe : Update output commands in sbnd_ci_single_detsim test
* 2025-11-08  nathanielerowe : Update output commands for WireCell simulation
* 2025-11-08  nathanielerowe : Update output commands for WireCell simulation
* 2025-11-08  nathanielerowe : Update output commands in sbnd_ci_nucosmics_detsim_fcl
* 2025-11-08  nathanielerowe : Merge pull request #827 from SBNSoftware/bugfix/yz_norm
* 2025-11-08  nathanielerowe : Merge branch 'production/v10_06_00' into bugfix/yz_norm
* 2025-11-08  nathanielerowe : Merge pull request #825 from sungbinoh/feature/sungbino_caf_hit_rr_2025_spring
* 2025-11-08  nathanielerowe : Merge branch 'production/v10_06_00' into feature/sungbino_caf_hit_rr_2025_spring
* 2025-11-08  nathanielerowe : Merge pull request #820 from SBNSoftware/bugfix_elifetime_springprod
* 2025-11-08  nathanielerowe : Merge branch 'production/v10_06_00' into lnguyen/frame_bugfix_v10_06_00_05
* 2025-11-06  VCLanNguyen : Add bug fix when RWM signal is missing
* 2025-11-05  nathanielerowe : Merge branch 'production/v10_06_00' into bugfix_elifetime_springprod
* 2025-11-05  nathanielerowe : Merge branch 'production/v10_06_00' into feature/sungbino_caf_hit_rr_2025_spring
* 2025-11-05  nathanielerowe : Merge branch 'production/v10_06_00' into bugfix/yz_norm
* 2025-11-05  nathanielerowe : Update sbncode version to v10_06_00_07
* 2025-11-06  Seokju Chung : Merge pull request #851 from SBNSoftware/trj_pr845_to_production_v10_06_00
* 2025-10-17  Thomas Junk : Apply the commit from PR #845 to production/v10_06_00
* 2025-09-18  Shweta Yadav : yz scale bugfix
* 2025-09-16  sungbinoh : adding TrackHitFillRRStartCut: 1000 and TrackHitFillRREndCut: 1000 to cafmakerjob_sbnd_sce.fcl
* 2025-09-16  Linyan Wan : add e-lifetime correction...
* 2025-09-04  nathanielerowe : Update CMakeLists.txt
