---
layout: page
title: ReleaseNotes100603
toc: true
---

-----------------------------------------------------------------------------
| v10.06.03 | 07 Aug 2025 | [ReleaseNotes](ReleaseNotes100603.html) |
| --- | --- | --- |



sbndcode v10_06_03 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v10_06_03](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v10_06_03/sbndcode-v10_06_03.html)

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
- PR #773: Feature to normalize for YZ non-uniformity
  - **Description**: Please provide a detailed description of the changes this pull request introduces.  This PR is to normalize the charge response for the non-uniformity along the YZ plane. This feature takes the input YZ map and normalizes the dQ/dx of each hit using the correction factor from the corresponding YZ bin where the hit is located. Some printed value of dqdx before and after normalization:  [NormalizeYZ] Plane: 1, TPC: 0, Y: -196.216, Z: 169.939, Scale: 0.957026, dQdx (raw): 1319.81, dQdx (corrected): 1379.07 [NormalizeYZ] Plane: 2, TPC: 1, Y: 169.547, Z: 286.94, Scale: 1.01907, dQdx (raw): 1108.2, dQdx (corrected): 1087.47  This pull and push the dQ/dx depending on whether we are in the high or low charge response region to normalize the charge response throughout the plane.  Attached is also the YZ map from collection plane along the east and west TPCs in the bins of 1x1cm2. Note that this map has been produced with officially processed data sample (1e20 data sample `data_MCP2025B_02_DevSample_1e20_bnblight_v10_06_00_02_histreco2_sbnd`), which still have non-uniformity due to coherent noise removal issue  772  Additionally, below is the dQ/dx distribution with (red) and without (blue) normalization, which shows narrowing around the peak region after normalization.   
  - **Labels**: reco1/reco2
  - **Reviewers**: mrmooney, linyan-w
  - **Assignees**: sxy1439
- PR #772: Coherent Noise Removal Nonuniformity Mitigation
  - **Description**: Adjusts the "signal contamination in correction waveform" threshold during coherent noise removal (`decon_lim`), and adds increased front and back padding to the signal protection ROI. Also turns off `scaling` calculation for CNR removal coefficient, and sets all scaling = 1.0.  Additionally adds bugfix for truth matching (SimChannel etc.) in DepoFluxWriter configuration.
  - **Labels**: bug, tpc, detsim, data, calibration
  - **Reviewers**: mrmooney
  - **Assignees**: lynnt20
- PR #767: Add pmt variations fcls
  - **Description**: This PR adds the corresponding pmt detvar fcls. The variations are the following: - Large PMT gain variation - High PMT baseline noise - Low PMT detection efficiency - Combinations of the previous variations  
  - **Labels**: detsim
  - **Reviewers**: mrmooney
  - **Assignees**: asanchezcastillo

sbndcode
---------------------------------------------------

* 2025-08-07  Nathaniel : Merge branch 'release/v10_06_03'
* 2025-08-07  Nathaniel : Update CMake version
* 2025-08-07  nathanielerowe : Merge pull request #767 from SBNSoftware/feature/acastill_pmt_detvar
* 2025-08-07  nathanielerowe : Merge branch 'develop' into feature/acastill_pmt_detvar
* 2025-08-07  nathanielerowe : Merge pull request #772 from SBNSoftware/bugfix/wirecellgrouped
* 2025-08-07  nathanielerowe : Merge branch 'develop' into bugfix/wirecellgrouped
* 2025-08-07  nathanielerowe : Merge pull request #773 from SBNSoftware/feature/syadav_yz_norm
* 2025-07-28  Alejandro Sánchez Castillo : Add pmt variations fcls
* 2025-08-07  nathanielerowe : Merge branch 'develop' into bugfix/wirecellgrouped
* 2025-08-07  nathanielerowe : Merge branch 'develop' into feature/syadav_yz_norm
* 2025-08-07  nathanielerowe : Update product_deps
* 2025-08-07  Alejandro Sánchez Castillo : Fix CMakeList issue
* 2025-08-07  nathanielerowe : Merge branch 'develop' into feature/syadav_yz_norm
* 2025-08-05  Lynn Tung : Merge branch 'develop' into bugfix/wirecellgrouped
* 2025-08-04  lynnt20 : further lower signal contamination threshold
* 2025-08-01  nathanielerowe : Merge branch 'develop' into feature/acastill_pmt_detvar
* 2025-08-01  nathanielerowe : Update pull_request_template.md
* 2025-07-31  Shweta Yadav : path update for yz map
* 2025-07-29  HaiwangYu : Fix an issue from Andy
* 2025-07-28  lynnt20 : Merge tag 'v10_06_02' into bugfix/wirecellgrouped
* 2025-07-28  lynnt20 : Merge branch 'bugfix/wirecellgrouped' of https://github.com/SBNSoftware/sbndcode into bugfix/wirecellgrouped
* 2025-07-28  lynnt20 : updating cnr signal protection configs
* 2025-07-28  Alejandro Sánchez Castillo : Add pmt variations fcls
* 2025-07-26  Shweta Yadav : yz normalization feature
* 2025-07-26  Nathaniel : Merge tag 'v10_06_02' into develop
