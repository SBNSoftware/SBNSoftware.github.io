---
layout: page
title: ReleaseNotes10060003
toc: true
---

-----------------------------------------------------------------------------
| v10.06.00.03 | 17 Jul 2025 | [ReleaseNotes](ReleaseNotes10060003.html) |
| --- | --- | --- |



sbndcode v10_06_00_03 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v10_06_00_03](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v10_06_00_03/sbndcode-v10_06_00_03.html)

Purpose
---------------------------------------------------

New features
----------------------------------------------------

Bug fixes
---------------------------------------------------

Updated dependencies
---------------------------------------------------

Supported qualifiers
---------------------------------------------------

Change List
==========================================
PR #750: CCNueFilter (v10_06_00 production PR)
  - **Description**: - Adds a new fcl block inside `Filters/filters.fcl` for a charged-current electron-neutrino interaction inside the TPC active volume. - Adds a new gen fcl that runs rockbox + the ccnue filter. Events with an AV CC nue interaction will be passed, as well dirt activity in the same event.  Partially resolves issue 655. Some validation and discussion in the develop PR 748.
  - **Labels**: enhancement, simulation
  - **Reviewers**: jzennamo, lyates17
  - **Assignees**: lynnt20
- PR #758: Bump versioning for production patch release
  - **Description**:
  - **Labels**:
  - **Reviewers**:
  - **Assignees**:

sbndcode
---------------------------------------------------

* 2025-07-17  nathanielerowe : Merge pull request #758 from SBNSoftware/release/v10_06_00_03
* 2025-07-17  Nathaniel : Bump versioning for production patch release
* 2025-07-17  nathanielerowe : Merge pull request #750 from SBNSoftware/feature/lynnt_ccnuefilter_prod
* 2025-07-08  lynnt20 : fix to ensure that events with only numu dirt do not pass
* 2025-07-02  lynnt20 : add new `ccnuefilter` filter block, remove deprecated fcl block
* 2025-07-02  lynnt20 : create new rockbox fcl that includes ccnue filter
* 2025-07-02  lynnt20 : make comment syntax uniform
* 2025-06-18  Nathaniel : Merge tag 'v10_06_00_02' into develop

sbndutil
---------------------------------------------------

