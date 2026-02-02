---
layout: page
title: ReleaseNotes10140202
toc: true
---

-----------------------------------------------------------------------------
| v10.14.02.02 | 02 Feb 2026 | [ReleaseNotes](ReleaseNotes10140202.html) |
| --- | --- | --- |



sbndcode v10_14_02_02 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v10_14_02_02](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v10_14_02_02/sbndcode-v10_14_02_02.html)

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
### Release Notes for [sbndcode] from v10_14_02_01 to v10_14_02_02
- PR #902: updating TPC calibration tag to v4r1
  - **Description**: Updating SBND TPC calibration tag for electron lifetime to v4r1. [PR10](https://github.com/SBNSoftware/sbnd_data/pull/10) in sbnd_data should be merged first for this PR.
  - **Labels**: reco1/reco2
  - **Reviewers**:
  - **Assignees**: sungbinoh
- PR #900: updated YZ maps
  - **Description**: Please provide a detailed description of the changes this pull request introduces.  This is a PR to update YZ non-uniformity map using the gen2 samples. Below are the samples used to generate maps for this PR -  [Data] data_MCP2025C_Fall25-Run1_BNB_Dev_bnblight_v10_14_02_histreco2_sbnd [MC] mc_MCP2025C_FallProduction_prodgenie_corsika_proton_rockbox0p1_sbnd_CV_v10_14_02_histreco2_sbnd
  - **Labels**: reco1/reco2
  - **Reviewers**: mrmooney
  - **Assignees**: sxy1439
- PR #899: Remove skip channel list and move to calibration database
  - **Description**: This PR avoids using a non-reconstructed channel list for BFM and moves to using the calibration database.
  - **Labels**: enhancement
  - **Reviewers**: linyan-w
  - **Assignees**: asanchezcastillo
- PR #898: Fix bug for opdettype in light propagation time
  - **Labels**: bug
  - **Reviewers**:
  - **Assignees**: asanchezcastillo
- PR #896: Update beam-dump configuration to G4BNB v1.1.1
  - **Description**: Update beam-dump configuration to G4BNB v1.1.1
  - **Labels**: simulation
  - **Reviewers**:
  - **Assignees**: marcodeltutto
- PR #905: Revert "feature/pandora_electron_merge"
  - **Description**:
  - **Labels**:
  - **Reviewers**:
  - **Assignees**:
- PR #901: Bugfix/blips on empty events
  - **Description**:
  - **Labels**: bug, reco1/reco2
  - **Reviewers**:
  - **Assignees**: Jjm321814

sbndcode sbndcode
---------------------------------------------------

* 2026-02-02  Nathaniel : Merge branch 'release/v10_14_02_02'
* 2026-02-02  Nathaniel : Update to sbncode v10_14_02_02
* 2026-02-02  nathanielerowe : Merge pull request #901 from SBNSoftware/bugfix/BlipsOnEmptyEvents
* 2026-02-02  nathanielerowe : Merge branch 'develop' into bugfix/BlipsOnEmptyEvents
* 2026-02-02  nathanielerowe : Merge pull request #905 from SBNSoftware/revert-897-feature/pandora_electron_merge
* 2026-02-02  nathanielerowe : Merge branch 'develop' into revert-897-feature/pandora_electron_merge
* 2026-02-02  nathanielerowe : Merge pull request #896 from SBNSoftware/marcodeltutto-patch-2
* 2026-02-02  nathanielerowe : Merge branch 'develop' into marcodeltutto-patch-2
* 2026-02-02  nathanielerowe : Merge pull request #898 from SBNSoftware/feature/acastill_lightprop_bugfix
* 2026-02-02  nathanielerowe : Merge branch 'develop' into feature/acastill_lightprop_bugfix
* 2026-02-02  nathanielerowe : Merge pull request #899 from SBNSoftware/feature/acastill_bfm_cleanup
* 2026-02-02  nathanielerowe : Merge branch 'develop' into feature/acastill_bfm_cleanup
* 2026-02-02  nathanielerowe : Merge pull request #900 from SBNSoftware/yz_map_update_fall25
* 2026-02-02  nathanielerowe : Merge branch 'develop' into yz_map_update_fall25
* 2026-02-02  nathanielerowe : Merge pull request #902 from sungbinoh/feature/sungino_etau_db_tag
* 2026-02-02  nathanielerowe : Revert "feature/pandora_electron_merge"
* 2026-01-29  nathanielerowe : Merge branch 'develop' into yz_map_update_fall25
* 2026-01-29  nathanielerowe : Merge branch 'develop' into feature/sungino_etau_db_tag* 2026-01-29  nathanielerowe : Update sbnd_data version to v01_42_00
* 2026-01-29  Jacob McLaughlin : Updated fcl config with default param
* 2026-01-28  Alejandro Sánchez Castillo : Fix naming
* 2026-01-28  Jacob McLaughlin : fixed general hardcoding of the producer labels. Minor refactoring of some branches to assume the hitHandle the user provided was run through truthmatching and pandoraTrack
* 2026-01-28  Jacob McLaughlin : generally cleaning up indentation
* 2026-01-27  sungbinoh : updating tpc_elifetime_data to v4r1 from v3r1
* 2026-01-26  Jacob McLaughlin : Merge branch 'develop' into bugfix/BlipsOnEmptyEvents
* 2026-01-26  Jacob McLaughlin : cleanup all my debug
* 2026-01-26  Alejandro Sánchez Castillo : Remove vector and use XAs
* 2026-01-23  Jacob McLaughlin : back to original
* 2026-01-23  Jacob McLaughlin : Final guess
* 2026-01-23  Jacob McLaughlin : A guess2
* 2026-01-23  Jacob McLaughlin : A guess
* 2026-01-23  Jacob McLaughlin : additional special debug
* 2026-01-23  Jacob McLaughlin : additional special debug
* 2026-01-23  Jacob McLaughlin : remove old debug
* 2026-01-23  Jacob McLaughlin : special debug
* 2026-01-23  Marco Del Tutto : FIix flux table version in genie_sbnd.fcl for test
* 2026-01-23  Jacob McLaughlin : Hiding away branch that shouldn't be accessed
* 2026-01-22  Jacob McLaughlin : debug tracking
* 2026-01-22  Jacob McLaughlin : debug tracking
* 2026-01-22  Jacob McLaughlin : debug tracking
* 2026-01-22  Jacob McLaughlin : debug tracking
* 2026-01-22  Jacob McLaughlin : debug tracking
* 2026-01-22  Jacob McLaughlin : debug tracking
* 2026-01-22  Jacob McLaughlin : debug tracking
* 2026-01-22  Jacob McLaughlin : did not work
* 2026-01-22  Jacob McLaughlin : Restore oldest logic
* 2026-01-22  Jacob McLaughlin : debug
* 2026-01-22  Jacob McLaughlin : debug
* 2026-01-22  Jacob McLaughlin : debug
* 2026-01-22  Jacob McLaughlin : debug
* 2026-01-22  Jacob McLaughlin : debug
* 2026-01-22  Jacob McLaughlin : debug
* 2026-01-22  Jacob McLaughlin : change grow blip conditions
* 2026-01-22  Jacob McLaughlin : debug
* 2026-01-22  Jacob McLaughlin : debug
* 2026-01-22  Jacob McLaughlin : typo
* 2026-01-22  Jacob McLaughlin : typo
* 2026-01-22  Jacob McLaughlin : typo
* 2026-01-22  Jacob McLaughlin : Noticed sim depEnergy was staying at zero. Trying to fix it
* 2026-01-22  Jacob McLaughlin : Removing special behavior on gamma/neutron outside of CheckAncestry
* 2026-01-21  sungbinoh : updating TPC tag to v3r1
* 2026-01-21  Jacob McLaughlin : Break ancestry at neutron too
* 2026-01-21  Jacob McLaughlin : Minor fix to true blip construction
* 2026-01-20  Jacob McLaughlin : removed debug
* 2026-01-20  Jacob McLaughlin : temp debug
* 2026-01-20  Shweta Yadav : updated YZ maps
* 2026-01-20  Jacob McLaughlin : Removed debug
* 2026-01-20  Jacob McLaughlin : That fixed it. Add a check for filling in blipID on real clusters
* 2026-01-20  Jacob McLaughlin : Try explicitly accessing array
* 2026-01-20  Jacob McLaughlin : Maybe we add it to the vector too fast?
* 2026-01-20  Jacob McLaughlin : Better spot for blip id update
* 2026-01-20  Jacob McLaughlin : fixing blip ID markers? May not update on blip object
* 2026-01-20  Alejandro Sánchez Castillo : Remove skip channel list and move to calibration database
* 2026-01-20  Alejandro Sánchez Castillo : Add continue for non-PMT channels
* 2026-01-20  Alejandro Sánchez Castillo : Fix bug for opdettype in light propagation time
* 2026-01-16  Marco Del Tutto : Update name in genie_sbnd.fcl to  1.1.1
* 2026-01-16  Jacob McLaughlin : change ide performance
* 2026-01-16  Jacob McLaughlin : checking on sim energy deposit patch
* 2026-01-16  Jacob McLaughlin : debug
* 2026-01-16  Jacob McLaughlin : wrong type
* 2026-01-16  Jacob McLaughlin : wrong type
* 2026-01-16  Jacob McLaughlin : Removed default arg
* 2026-01-16  Jacob McLaughlin : Adding back sim energyDeposit interface
* 2026-01-16  Jacob McLaughlin : debug
* 2026-01-16  Jacob McLaughlin : debug
* 2026-01-16  Jacob McLaughlin : change hardcoded label
* 2026-01-16  Nathaniel : Merge tag 'v10_14_02_01' into develop
* 2026-01-16  Jacob McLaughlin : change hardcoded label
* 2026-01-15  Jacob McLaughlin : make special blip gaus hit more prominent
* 2026-01-15  Jacob McLaughlin : debug
* 2026-01-15  Jacob McLaughlin : Checking what branch causes new crash
* 2026-01-15  Jacob McLaughlin : Fixed a hit mapper line to match new inputs
* 2026-01-12  Marco Del Tutto : Update beam-dump configuration to G4BNB v1.1.1
