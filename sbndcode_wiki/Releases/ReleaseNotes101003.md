[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v10_10_03](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v10_10_03/sbndcode-v10_10_03.html)

Purpose
---------------------------------------------------

New features
---------------------------------------------------

Bug fixes
---------------------------------------------------
---
layout: page
title: ReleaseNotes101003
toc: true
---

-----------------------------------------------------------------------------
| v10.10.03 | 19 Sep 2025 | [ReleaseNotes](ReleaseNotes101003.html) |
| --- | --- | --- |



sbndcode v10_10_03 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v10_10_03](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v10_10_03/sbndcode-v10_10_03.html)

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
### Release Notes for [sbndcode] from v10_10_02 to v10_10_03
- PR #817: Fix conflicts with new larsim version
  - **Description**: This PR is a fix for https://github.com/SBNSoftware/sbndcode/pull/807 after including the new optical path tool in https://github.com/SBNSoftware/sbndcode/pull/756 .
  - **Labels**: bug
  - **Reviewers**: linyan-w
  - **Assignees**: asanchezcastillo
- PR #819: Re-add changes from tpcpmtbfm_upgrade
  - **Description**:
  - **Labels**:
  - **Reviewers**:
  - **Assignees**:
- PR #824: adding TrackHitFillRRStartCut: 1000 and TrackHitFillRREndCut: 1000 to cafmakerjob_sbnd_sce.fcl
  - **Description**: Please provide a detailed description of the changes this pull request introduces.  $
  - **Reviewers**:
  - **Assignees**: sungbinoh
- PR #813: Add lightpropagationcorrection module
  - **Description**: This PR implements a new module for applying light propagation corrections to OpFlash timing based on TPC information. It does select the OpFlash matched to every slice and correct the time of the flash based on the space points in the slice. After the correction, a new object `CorrectedOpFlash` is created as well to store the new timing information, namely: - The original time of the flash - The time of the neutrino at the upstream wall obtained using light-only corrections -  The time of the neutrino at the upstream wall obtained using neutrino time of flight correction from the TPC vertex -  The time of the neutrino at the upstream wall obtained using neutrino time of flight correction from the TPC vertex and the light propagation time from the TPC spacepoints. This new object is also associated to its father slice and OpFlash. The module supports the use of the OpT0Finder and BarycenterFM tools for initial charge/light matching though the latter is used by default as it is a model-independent tool. The module is included on `reco2_data.fcl`  to be run as a part of the standard reconstruction workflow.  This PR requires merging of the following PRs: https://github.com/SBNSoftware/sbndcode/pull/807 https://github.com/SBNSoftware/sbnobj/pull/140 https://github.com/SBNSoftware/sbnanaobj/pull/157 https://github.com/SBNSoftware/sbncode/pull/566
  - **Labels**: enhancement
  - **Reviewers**: linyan-w
  - **Assignees**: asanchezcastillo
- PR #826: yz normalization bugfix
  - **Description**: Please provide a detailed description of the changes this pull request introduces.  This PR fixes a bug in correcting for YZ normalization. Since it uses scale from the correction map that is calculated as global median divided by local median (following ProtoDUNE method), then dQ/dx should be multiplied by that factor and not divided. 
  - **Labels**: bug, reco1/reco2
  - **Reviewers**: mrmooney
  - **Assignees**: sxy1439

sbndcode sbndcode
---------------------------------------------------

* 2025-09-19  Nathaniel : Merge branch 'release/v10_10_03'
* 2025-09-19  Nathaniel : Update to larsoft v10_10_03
* 2025-09-19  nathanielerowe : Merge pull request #826 from SBNSoftware/bugfix/yz_nonuniformity
* 2025-09-19  nathanielerowe : Merge branch 'develop' into bugfix/yz_nonuniformity
* 2025-09-19  nathanielerowe : Merge pull request #813 from SBNSoftware/feature/acastill_correctedOpFlash
* 2025-09-19  nathanielerowe : Merge branch 'develop' into feature/acastill_correctedOpFlash
* 2025-09-19  Alejandro Sánchez Castillo : check nuscore exists before accessing and not produce output file by default
* 2025-09-18  nathanielerowe : Merge branch 'develop' into bugfix/yz_nonuniformity
* 2025-09-18  nathanielerowe : Merge pull request #824 from sungbinoh/feature/sungbino_caf_hit_rr
* 2025-09-18  nathanielerowe : Merge branch 'develop' into feature/sungbino_caf_hit_rr
* 2025-09-18  nathanielerowe : swap reco2_data.fcl module for possible ci fix
* 2025-09-18  Shweta Yadav : yz scale bugfix
* 2025-09-18  nathanielerowe : Merge branch 'develop' into feature/acastill_correctedOpFlash
* 2025-09-18  nathanielerowe : Merge pull request #819 from SBNSoftware/bugfix/tpcpmtbfm_upgrade
* 2025-09-18  nathanielerowe : Merge branch 'develop' into bugfix/tpcpmtbfm_upgrade
* 2025-09-18  nathanielerowe : Merge branch 'develop' into feature/acastill_correctedOpFlash
* 2025-09-16  sungbinoh : adding TrackHitFillRRStartCut: 1000 and TrackHitFillRREndCut: 1000 to cafmakerjob_sbnd_sce.fcl
* 2025-09-16  Alejandro Sánchez Castillo : Merge pull request #817 from SBNSoftware/bugfix/acastill_bfm_larsim
* 2025-09-16  Nathaniel : Merge tag 'v10_10_02' into develop
* 2025-09-16  nathanielerowe : Re-add changes from tpcpmtbfm_upgrade
* 2025-09-16  Alejandro Sánchez Castillo : Merge branch 'develop' into bugfix/acastill_bfm_larsim
* 2025-09-16  Alejandro Sánchez Castillo : Fix conflicts with new larsim version
* 2025-09-15  nathanielerowe : Merge branch 'develop' into feature/acastill_correctedOpFlash
* 2025-09-11  Alejandro Sánchez Castillo : Cleanup and remove unused functions/variables
* 2025-09-11  Alejandro Sánchez Castillo : Update sbndcode/LightPropagationCorrection/LightPropagationCorrection_module.cc
* 2025-09-08  Alejandro Sánchez Castillo : Fix bugs and cleanup
* 2025-09-08  Alejandro Sánchez Castillo : Add lightpropagationcorrection to cafmaker
* 2025-09-08  Alejandro Sánchez Castillo : Add lightpropagationcorrection module
