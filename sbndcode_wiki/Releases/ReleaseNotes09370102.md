---
layout: page
title: ReleaseNotes09370102
toc: true
---

-----------------------------------------------------------------------------
| v09.37.01.02 | 15 Dec 2021 | [ReleaseNotes](ReleaseNotes09370102.html) |
| --- | --- | --- |



sbndcode v09_37_01_02 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_37_01_02](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_37_01_02/sbndcode-v09_37_01_02.html)

Purpose
---------------------------------------------------

* Patch release for SBN-2021C

New features
---------------------------------------------------

* sbndcode PR 233:
  * CAF tests for the CI system
  * This PR introduces the CAF stage to the standard regression tests. This PR replaces the anatree stage with a caf stage. 

* sbndcode PR 234:
  * Add further rollup-less fcls
  * As requested by @jzennamo in yesterday's RM meeting. A further 5 fcls for running g4 without rollup.

* sbndcode PR 237:
  * Change caf module label to cafmaker not mycafmaker
  * Production team are moving towards using a common set of scripts in sbnutil. One issue I came across during this migration is that ICARUS use the module name cafmaker whilst we use mycafmaker for CAFMaker. This PR moves us to use the same as ICARUS such that the scripts don't need extra logic for sbnd files.

* sbndcode PR 240:
   * Patch / workaround for CRT error where AuxDets can't be found
   * Instead of throwing an exception the same error message is now outputted as a debugging message and the function returns UINT_MAX as the channel ID.
   * A catch is added at the detsim stage and in a detsim analysis module to skip channels with the ID UINT_MAX.
   * Underlying issue is still present, and requires fix in LArSoft

Bug fixes
---------------------------------------------------

Updated dependencies
---------------------------------------------------

* sbncode v09_37_01_02
* larsoft v09_37_01_01

Change List
==========================================

sbndcode
---------------------------------------------------

* 2021-12-15  Patrick Green : Update to v09_37_01_02
* 2021-12-15  Patrick Green : Merge pull request #240 from SBNSoftware/bugfix/hlay_crt_channels
* 2021-12-14  Henry Lay : Add warning messages to prompt a future fix of the root cause
* 2021-12-14  Henry Lay : Remove another exception
* 2021-12-10  Henry Lay : Add similar catch to ana module
* 2021-12-10  Henry Lay : Ensure CRT detsim skips non-physical channels
* 2021-12-10  Henry Lay : Override nearest aux det functions
* 2021-12-09  Patrick Green : Merge pull request #237 from SBNSoftware/feature/hlay_caf_module_name
* 2021-12-08  Henry Lay : Change caf module label to cafmaker not mycafmaker
* 2021-12-07  Patrick Green : Merge pull request #234 from SBNSoftware/feature/hlay_production_rollup_fcls
* 2021-12-06  Henry Lay : Make sure we use the sce type fcls
* 2021-12-03  Patrick Green : Merge pull request #233 from SBNSoftware/feature/hlay_caf_tests
* 2021-12-03  Henry Lay : Have fcls inherit properly
* 2021-12-02  Henry Lay : Add further rollup-less fcls
* 2021-12-01  Henry Lay : Update test/ci/sbnd_ci_nucosmics_caf_quick_test_sbndcode.fcl
* 2021-11-29  Patrick Green : Merge pull request #232 from SBNSoftware/release/SBN2021C
* 2021-11-26  Henry Lay : Replace anatree tests with caf tests and more resource updates
* 2021-11-26  Henry Lay : Adopt reweighting fcl but with just 1 universe
* 2021-11-26  Henry Lay : Update resource usage
* 2021-11-25  Henry Lay : Add caf CI tests to configuration
* 2021-11-25  Henry Lay : Add fcl files for caf tests in CI
