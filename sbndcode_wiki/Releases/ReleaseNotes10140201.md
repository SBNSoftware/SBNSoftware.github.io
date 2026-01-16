---
layout: page
title: ReleaseNotes10140201
toc: true
---

-----------------------------------------------------------------------------
| v10.14.02.01 | 16 Jan 2026 | [ReleaseNotes](ReleaseNotes10140201.html) |
| --- | --- | --- |



sbndcode v10_14_02_01 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v10_14_02_01](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v10_14_02_01/sbndcode-v10_14_02_01.html)

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
### Release Notes for [sbndcode] from v10_14_02 to v10_14_02_01
- PR #897: feature/pandora_electron_merge
  - **Description**: 
  - **Labels**: reco1/reco2
  - **Reviewers**:
  - **Assignees**: AndyChappell
- PR #894: build changes for spack package
  - **Description**:
  - **Labels**: bug
  - **Reviewers**:
  - **Assignees**:
- PR #895: Drop MonPulses and MonPulseSizes starting at reco1 level
  - **Description**: These changes just drop the MonPulse products from the reco1 files to make them lighter.  
  - **Labels**: bug
  - **Reviewers**:
  - **Assignees**: npallat
- PR #892: New CAF stage fcl for MeVPrtl generator
  - **Description**: Please provide a detailed description of the changes this pull request introduces.  
  - **Labels**: caf
  - **Reviewers**:
  - **Assignees**: VCLanNguyen, jorge-romeo

sbndcode sbndcode
---------------------------------------------------

* 2026-01-16  Nathaniel : Merge branch 'release/v10_14_02_01'
* 2026-01-16  Nathaniel : Update to larsoft v10_14_02_01
* 2026-01-16  nathanielerowe : Merge pull request #892 from SBNSoftware/feature/CAF_fcl_for_MeVPRTL
* 2026-01-16  nathanielerowe : Merge branch 'develop' into feature/CAF_fcl_for_MeVPRTL
* 2026-01-16  nathanielerowe : Merge pull request #895 from SBNSoftware/feature/TriggerWorkNikki-PR
* 2026-01-16  nathanielerowe : Merge branch 'develop' into feature/CAF_fcl_for_MeVPRTL
* 2026-01-16  nathanielerowe : Merge branch 'develop' into feature/TriggerWorkNikki-PR
* 2026-01-16  nathanielerowe : Merge pull request #894 from SBNSoftware/bugfix/spack_patch
* 2026-01-16  nathanielerowe : Merge branch 'develop' into bugfix/spack_patch
* 2026-01-16  nathanielerowe : Merge pull request #897 from AndyChappell/feature/pandora_electron_merge
* 2026-01-13  nathanielerowe : Merge branch 'develop' into feature/CAF_fcl_for_MeVPRTL
* 2026-01-13  nathanielerowe : Merge branch 'develop' into feature/TriggerWorkNikki-PR
* 2026-01-12  AndyChappell : Update track and shower characterisation following potential electron merges
* 2026-01-12  AndyChappell : Add algorithm to merge MIP-like stub and shower cascade of split primary electrons
* 2026-01-07  Nikki Pallat : Drop MonPulses and MonPulseSizes starting at reco1 level
* 2026-01-02  nathanielerowe : Add include directory for OnlineEvd module
* 2026-01-02  nathanielerowe : Add HDF5 and hep_hpc package requirements
* 2025-12-17  Nathaniel : Merge tag 'v10_14_02' into develop
* 2025-12-12  jorge-romeo : New fcl for CAF stage without systtools to use it on files generated with MeVPrtl generator.
