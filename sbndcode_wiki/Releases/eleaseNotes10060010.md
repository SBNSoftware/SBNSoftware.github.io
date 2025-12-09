---
layout: page
title: ReleaseNotes10060010
toc: true
---

-----------------------------------------------------------------------------
| v10.06.00.10 | 09 Dec 2025 | [ReleaseNotes](ReleaseNotes10060010.html) |
| --- | --- | --- |



sbndcode v10_06_00_10 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v10_06_00_10](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v10_06_00_10/sbndcode-v10_06_00_10.html)

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
### Release Notes for [sbndcode] from v10_06_00_09 to v10_06_00_10
- PR #874: Update to sbncode v10_06_00_09
  - **Description**: 
  - **Labels**:
  - **Reviewers**:
  - **Assignees**:
- PR #884: WireMod module for SBND
  - **Description**: Add WireMod module and workflow fcls for SBND spring production. Module supports rescaling recob::Wires by Gaussian modifications calculated via 2D Y-Z and X-Theta_XW splines (stored as TGraph2Ds). The workflow fcls run the WireMod module, then reco2 & CAF stages based on WireMod products.  **Note**: Module uses sim::IDEs instead of the usual SimEnergyDeposits to support SBND spring production. A switch to SimEnergyDeposits will be updated in a future PR targeting the develop branch.
  - **Labels**: enhancement
  - **Reviewers**:
  - **Assignees**: tbwester, aantonakis

sbndcode sbndcode
---------------------------------------------------
* 2025-12-09  Nathaniel : Merge branch 'release/v10_06_00_10' into production/v10_06_00
* 2025-12-09  Nathaniel : Update to larsoft < version tag >
* 2025-12-08  nathanielerowe : Merge pull request #884 from SBNSoftware/feature/twester_wiremod
* 2025-12-04  nathanielerowe : Merge branch 'production/v10_06_00' into feature/twester_wiremod
* 2025-12-04  nathanielerowe : Update sbnd_data version to v01_35_01
* 2025-12-04  Thomas Wester : add new fcls to support independently applying wiremod splines
* 2025-11-25  Thomas Wester : fix module typo
* 2025-11-25  Thomas Wester : fix fcl typo
* 2025-11-24  Thomas Wester : rename fcl _sbnd
* 2025-11-24  Thomas Wester : print spline info for splines separately
* 2025-11-24  Thomas Wester : workflow fcls
* 2025-11-23  Thomas Wester : test build
* 2025-11-23  Thomas Wester : Merge branch 'production/v10_06_00' into feature/twester_wiremod
* 2025-11-23  Thomas Wester : initial commit
* 2025-11-17  nathanielerowe : Merge pull request #874 from SBNSoftware/release/v10_06_00_09
