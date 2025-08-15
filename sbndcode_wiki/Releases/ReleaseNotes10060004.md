---
layout: page
title: ReleaseNotes10060004
toc: true
---

-----------------------------------------------------------------------------
| v10.06.00.04 | 15 Aug 2025 | [ReleaseNotes](ReleaseNotes10060004.html) |
| --- | --- | --- |



sbndcode v10_06_00_04 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v10_06_00_04](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v10_06_00_04/sbndcode-v10_06_00_04.html)

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
### Release Notes for [sbndcode] from v10_06_00_03 to v10_06_00_04
- PR #777: yz norm feature
  - **Description**: Please provide a detailed description of the changes this pull request introduces.  This PR is to normalize the charge response for the non-uniformity along the YZ plane. More details can be found in PR  773. It is prepared as a patch for the v10_06_00 branch, which corresponds to the CURRENT production campaign started in Spring 2025.
  - **Labels**: reco1/reco2
  - **Reviewers**: mrmooney
  - **Assignees**: sxy1439
- PR #781: Add pmt detvar fcls
  - **Description**: Production PR corresponding to develop PR 767
  - **Labels**: detsim
  - **Reviewers**: jzennamo
  - **Assignees**: linyan-w, asanchezcastillo
- PR #784: updatig c_cal for both data and MC using results from fixed dev sampl…
  - **Description**: Updating TPC gain calibration constants for MC and data using result from fixed dev samples. YZ uniformiaty and SCE corrections (only spatial) are applied.
  - **Labels**: reco1/reco2
  - **Reviewers**:
  - **Assignees**: sungbinoh


sbndcode
---------------------------------------------------

* 2025-08-14  Nathaniel : Update to sbncode v10_06_00_04
* 2025-08-14  nathanielerowe : Merge pull request #784 from SBNSoftware/feature/v10_06_00_c_cal_update
* 2025-08-14  nathanielerowe : Merge branch 'production/v10_06_00' into feature/v10_06_00_c_cal_update
* 2025-08-14  nathanielerowe : Merge pull request #781 from SBNSoftware/feature/acastill_detvar_prod
* 2025-08-14  nathanielerowe : Merge pull request #777 from SBNSoftware/feature/syadav_yznorm_v10_06_00_prod
* 2025-08-14  nathanielerowe : Merge branch 'production/v10_06_00' into feature/v10_06_00_c_cal_update
* 2025-08-14  nathanielerowe : Merge branch 'production/v10_06_00' into feature/acastill_detvar_prod
* 2025-08-14  nathanielerowe : Merge branch 'production/v10_06_00' into feature/syadav_yznorm_v10_06_00_prod
* 2025-08-14  nathanielerowe : Update product_deps
* 2025-08-14  nathanielerowe : Merge branch 'production/v10_06_00' into feature/v10_06_00_c_cal_update
* 2025-08-14  nathanielerowe : Merge branch 'production/v10_06_00' into feature/acastill_detvar_prod
* 2025-08-14  nathanielerowe : Merge branch 'production/v10_06_00' into feature/syadav_yznorm_v10_06_00_prod
* 2025-08-14  nathanielerowe : Merge pull request #786 from SBNSoftware/bugfix/reversion
* 2025-08-14  NathanielERowe : revert more develop PRs merged during pmt variation issues
* 2025-08-14  nathanielerowe : Merge branch 'production/v10_06_00' into feature/v10_06_00_c_cal_update
* 2025-08-14  nathanielerowe : Merge branch 'production/v10_06_00' into feature/syadav_yznorm_v10_06_00_prod
* 2025-08-13  Linyan Wan : Scrub update
* 2025-08-13  Linyan Wan : Moving pmt detvar configures to include detsim_detvar_PDSonly
* 2025-08-13  Linyan Wan : Add PDSonly detsim
* 2025-08-13  Linyan Wan : Keep SimEnergyDeposits_ionandscint & SimPhotonsLites for detvar
* 2025-08-12  sungbinoh : updatig c_cal for both data and MC using results from fixed dev samples with v10_06_00_02
* 2025-08-08  Linyan Wan : Change detvar detsim process names in PDS variations
* 2025-08-08  Linyan Wan : Add detsim with different process name
* 2025-08-08  Linyan Wan : Add scrub file for only dropping PDS in detsim
* 2025-08-08  Alejandro Sánchez Castillo : Add pmt detvar fcls
* 2025-08-01  Shweta Yadav : yz norm feature
* 2025-07-28  Alejandro Sánchez Castillo : Add pmt variations fcls
