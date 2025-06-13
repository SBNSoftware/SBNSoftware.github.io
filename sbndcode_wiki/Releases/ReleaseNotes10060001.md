---
layout: page
title: ReleaseNotes10060001
toc: true
---

-----------------------------------------------------------------------------
| v10.06.00.01 | 13 Jun 2025 | [ReleaseNotes](ReleaseNotes10060001.html) |
| --- | --- | --- |



sbndcode v10_06_00_01 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v10_06_00_01](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v10_06_00_01/sbndcode-v10_06_00_01.html)

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
### Release Notes for [sbndcode] from v10_06_00 to v10_06_00_01
- PR #744: Add Data-motivated pandoraShower modules that make use of the data calo alg
  - **Description**: pandoraShower uses the calo alg in a few places.  Thus there needs to be data versions of the fcl blocks that point to the correct calo alg
  - **Labels**: reco1/reco2
  - **Reviewers**: jzennamo
  - **Assignees**: absolution1
- PR #746: Bugfix/acastill barycenterfm label
  - **Description**: This PR fixed the barycenterFM label to use pandoraSCE instead of pandora products. I have also included a fix for a small bug when saving the information after the matching. The bug did not affect the matching per se, just the information that was being stored.
  - **Labels**: bug
  - **Reviewers**: jzennamo
  - **Assignees**: asanchezcastillo

sbndcode sbndcode
---------------------------------------------------

* 2025-06-13  Nathaniel : Merge branch 'release/v10_06_00_01'
* 2025-06-13  Nathaniel : Update versioning
* 2025-06-13  nathanielerowe : Merge pull request #746 from SBNSoftware/bugfix/acastill_barycenterfm_label
* 2025-06-13  nathanielerowe : Merge branch 'develop' into bugfix/acastill_barycenterfm_label
* 2025-06-13  nathanielerowe : Merge pull request #744 from SBNSoftware/dbrailsf_datcalpansho
* 2025-06-12  Alejandro Sánchez Castillo : Fix typo
* 2025-06-12  Alejandro Sánchez Castillo : Add separated SCE/nonSCE workflows
* 2025-06-10  Alejandro Sánchez Castillo : Fix saved radius information when using 3D matching
* 2025-06-10  Alejandro Sánchez Castillo : Modify barycenterFM to read pandoraSCE
* 2025-06-05  Dom Brailsford : Add Data-motivated pandoraShower modules that make use of the data calo alg
* 2025-06-04  nathanielerowe : Update product_deps
* 2025-05-09  nathanielerowe : Merge tag 'v10_06_00' into develop

sbndutil
---------------------------------------------------

* 2025-06-13  Nathaniel : Merge tag 'v10_06_00_01' into develop
* 2025-06-13  Nathaniel : Merge branch 'release/v10_06_00_01'
* 2025-06-13  Nathaniel : Update versioning
* 2025-05-09  nathanielerowe : Merge tag 'v10_06_00' into develop
