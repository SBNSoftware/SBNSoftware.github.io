---
layout: page
title: ReleaseNotes092202
toc: true
---

-----------------------------------------------------------------------------
| v09.22.02 | 30 Apr 2021 | [ReleaseNotes](ReleaseNotes092202.html) |
| --- | --- | --- |



sbndcode v09_22_02 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_22_02](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_22_02/sbndcode-v09_22_02.html)

Purpose
---------------------------------------------------

* Weekly release

New features
---------------------------------------------------

* sbndcode PR 100: 
  * This PR contains several updates and fixes to optical trigger alg, based on conversations with Gray Putnam and Michelle Stancari.
  * Changed name of TriggerEnableWindowIsTPCReadoutWindow to TriggerEnableWindowOneDriftBeforeTPCReadout to better reflect the actual behavior of the alg
  * Added drift period as a fcl parameter
  * Beam trigger is now implemented in the FindTriggers function along with the usual threshold-based triggers, instead of in ApplyTriggers (which consumes the triggers found from FindTriggers)
  * Added option to toggle on/off trigger overlap, partially undoing some misguided changes I made previously where all waveforms were made with uniform size. A uniform readout size is now achieved only when AllowTriggerOverlap = false.
  * Restored distinction between beam vs non-beam readout window sizes
  * Implemented the trigger holdoff functionality. This parameter existed before, but wasn't yet being used. Default behavior is unchanged (TriggerHoldoff = 0)
  * ReadoutWindowPreTriggerBeam is now assigned the right value
 
* sbndcode PR 102:
  * Add 1-drift services file for backwards compatibility
  * can be used used for processing older MC made prior to the default drift window and readout length changes

Bug fixes
---------------------------------------------------

Updated dependencies
---------------------------------------------------

* sbncode v09_22_02_00
* larsoft v09_22_02
* larbatch v01_56_01 

Change List
==========================================

sbndcode v09_22_02
---------------------------------------------------

* 2021-04-30  Patrick Green : Merge branch 'release/v09_22_02'
* 2021-04-30  Patrick Green : Update to larsoft v09_22_02
* 2021-04-29  Patrick Green : Merge pull request #100 from wforeman/feature/wforeman_optrig
* 2021-04-29  Patrick Green : Merge pull request #102 from wforeman/feature/wforeman_20percent_porch
* 2021-04-28  Patrick Green : Update ci_tests.cfg
* 2021-04-28  Will Foreman : Merge branch 'develop' of github.com:SBNSoftware/sbndcode into feature/wforeman_20percent_porch
* 2021-04-28  Will Foreman : Add services file which sets frame period and readout window length used prior to v09_22_00, to be used when processing older MC that was generated using default settings
* 2021-04-26  Will Foreman : Merge branch 'develop' of github.com:SBNSoftware/sbndcode into feature/wforeman_optrig
* 2021-04-26  Will Foreman : Use fcl-configurable beam trigger time when setting enable window bounds
* 2021-04-26  Patrick Green : Merge pull request #101 from vitodb/feature/update_ci_cfg
* 2021-04-23  Vito Di Benedetto : update cpu_usage_range lower limit for nucosmics_detsim_quick_test_sbndcode regression test
* 2021-04-23  Patrick Green : Merge tag 'v09_22_01_01' into develop
* 2021-04-22  Will Foreman : Remove tab
* 2021-04-22  Will Foreman : Merge branch 'develop' of github.com:SBNSoftware/sbndcode into feature/wforeman_optrig
* 2021-04-22  Will Foreman : Implemented trigger holdoff
* 2021-04-21  Will Foreman : Optical trigger updates: add option for trigger overlap, renamed parameter for clarity, + bug fixes

sbndutil v09_22_02
---------------------------------------------------

* 2021-04-30  Patrick Green : Merge branch 'release/v09_22_02'
* 2021-04-30  Patrick Green : Update to larsoft v09_22_02
* 2021-04-23  Patrick Green : Merge tag 'v09_22_01_01' into develop
