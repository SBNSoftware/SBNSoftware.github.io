---
layout: page
title: ReleaseNotes100301
toc: true
---

-----------------------------------------------------------------------------
| v10.03.01 | 11 Feb 2025 | [ReleaseNotes](ReleaseNotes100301.html) |
| --- | --- | --- |



sbndcode v10_03_01 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v10_03_01](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v10_03_01/sbndcode-v10_03_01.html)

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
### Release Notes for [sbndcode] from v09_93_01_02p02 to v10_03_01
- PR #608: Fixing Fcls for the New Geometry Handling
  - **Description**: I have updated three fcls that needed to have their Geometry Service connections updated to address the new LArSoft refactoring for the v10 transition
  - **Labels**: bug
  - **Reviewers**: wjdanswjddl
  - **Assignees**: jzennamo, bear-is-asleep
- PR #610: Removing Gallery From CI
  - **Description**: Please provide a detailed description of the changes this pull request introduces.  With the refactoring of LArSoft's geometry the handling in gallery C++ and python code has been broken. This is causing the CI tests to fail. This PR disables that test until we can fix it by refactoring the code in the long term.
  - **Labels**: bug
  - **Reviewers**: RachelCoackley
  - **Assignees**: jzennamo
- PR #627: Exclude CVN in the code and fcl files for now
  - **Description**: Exclude CVN in the code and fcl files for now.  Changes needed until lardnn issue is resolved - [link](https://cdcvs.fnal.gov/redmine/issues/29376)
  - **Labels**: reco1/reco2
  - **Reviewers**: 
  - **Assignees**: yangtj207
- PR #631: Geometry v10
  - **Description**: Originally based on PR https://github.com/SBNSoftware/sbndcode/pull/393, then PR 590 but opened up as a feature branch so people can contribute to this. Changes pursuant to larsoft v10 geometry refactoring.
  - **Labels**: geometry
  - **Reviewers**: jzennamo, tomjunk, yangtj207
  - **Assignees**: jzennamo, bear-is-asleep, henrylay97


sbndcode sbndcode
---------------------------------------------------

* 2025-02-11  Brinden Carlson : Merge branch 'release/v10_03_01'
* 2025-02-11  Brinden Carlson : Update to sbncode v10_01_03
* 2025-02-11  Bear Carlson : Merge pull request #631 from SBNSoftware/feature/geom_salvage
* 2025-02-10  Bear Carlson : Merge branch 'develop' into feature/geom_salvage
* 2025-02-06  Bear Carlson : Update test/Geometry/test_geometry_sbnd.fcl
* 2025-02-06  Bear Carlson : Update sbndcode/CRT/CRTAuxDetInitializer_tool.cc
* 2025-02-10  Henry Lay : Revert "Merge remote-tracking branch 'origin/feature/hlay_crt_data_fcl_updates' into develop"
* 2025-02-10  Henry Lay : Revert "Merge remote-tracking branch 'origin/bugfix/hlay_crt_nwall_geom_for_reco' into develop"
* 2025-02-10  Henry Lay : Revert "Remove unnecessary libs"
* 2025-02-10  Henry Lay : Revert "Update versioning"
* 2025-02-07  Bear Carlson : Merge pull request #627 from yangtj207/feature/tjyang_cvnfix
* 2025-02-05  Tingjun Yang : Revert "Merge remote-tracking branch 'upstream/feature/geom' into feature/tjyang_cvnfix"
* 2025-02-05  Tingjun Yang : Exclude CVN for now until an issue in larrecodnn is resolved.
* 2025-02-05  Tingjun Yang : Merge remote-tracking branch 'upstream/feature/geom' into feature/tjyang_cvnfix
* 2025-02-05  Henry Lay : Update versioning
* 2025-02-05  Henry Lay : Remove unnecessary libs
* 2025-02-05  Henry Lay : Merge remote-tracking branch 'origin/feature/geom' into develop
* 2025-02-05  Henry Lay : Merge remote-tracking branch 'origin/bugfix/hlay_crt_nwall_geom_for_reco' into develop
* 2025-02-05  Henry Lay : Merge remote-tracking branch 'origin/feature/hlay_crt_data_fcl_updates' into develop
* 2025-02-04  Brinden Carlson : Merge tag 'v09_93_01_02p02' into develop
* 2025-02-03  Bear Carlson : Merge branch 'develop' into feature/geom
* 2025-01-28  Bear Carlson : Merge pull request #610 from SBNSoftware/feature/zennamo_removeGalleryFromCI
* 2025-01-28  Bear Carlson : Merge branch 'feature/geom' into feature/zennamo_removeGalleryFromCI
* 2025-01-28  jzennamo : Update test/ci/ci_tests.cfg
* 2025-01-28  jzennamo : Update test/ci/ci_tests.cfg
* 2025-01-28  Bear Carlson : Update test/ci/ci_tests.cfg
* 2025-01-28  jzennamo : fixing my CI changes
* 2025-01-28  jzennamo : removing gallery from CI
* 2025-01-28  Bear Carlson : Merge pull request #608 from SBNSoftware/feature/zennamo_FclFixesForv10
* 2025-01-27  jzennamo : fixing geo services
* 2025-01-27  Henry Lay : Fix north wall reco problem
* 2025-01-07  Henry Lay : Don't drop raw event headers in CRT-only data reco workflow
* 2025-01-07  Henry Lay : Allow tracks through CRT flat
* 2024-12-12  Kyle Knoepfel : Merge branch 'develop' into geom-separate
* 2024-06-04  Kyle Knoepfel : Accommodate geometry-refactoring changes

sbndutil 
---------------------------------------------------


