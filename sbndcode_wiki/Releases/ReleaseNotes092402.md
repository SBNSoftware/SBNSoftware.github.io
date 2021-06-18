---
layout: page
title: ReleaseNotes092402
toc: true
---

-----------------------------------------------------------------------------
| v09.24.02 | 18 Jun 2021 | [ReleaseNotes](ReleaseNotes092402.html) |
| --- | --- | --- |



sbndcode v09_24_02 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_24_02](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_24_02/sbndcode-v09_24_02.html)

Purpose
---------------------------------------------------

* Weekly release

New features
---------------------------------------------------

* sbndcode PR 111:
  * HitDumper Updates
  * Turns off SkipInd in the fast hit finder so that hits are created also for induction planes
  * Adds settable fcl config to the HitDumper module that allows not saving the induction plane wire hits
  * Switches to the optical hit finder in sbncode (PMT only)

* sbndcode PR 113:
  * Removed deprecated T1053-version modules

* sbndcode PR 114:
  * Restoring ability to toggle noise generation
  * Restored the function of the "GenNoise" boolean in the simwire configuration, so users can turn on/off noise for tests. Also skipping the pedestal RMS routine if this is set to 0 in the fcl.

* sbndcode PR 115:
  * HitDumper Updates
  * Allows saving multiple ophit collections to the output tree
  * Switches to saving both PMT and Arapucas ophits to the tree
 

Bug fixes
---------------------------------------------------

Updated dependencies
---------------------------------------------------

* sbncode v09_24_02_00
* larsoft v09_24_02


Change List
==========================================

sbndcode v09_24_02
---------------------------------------------------

* 2021-06-18  Patrick Green : Merge branch 'release/v09_24_02'
* 2021-06-18  Patrick Green : Update to v09_24_02
* 2021-06-16  Patrick Green : Merge pull request #114 from wforeman/feature/wforeman_detsim_fix
* 2021-06-16  Will Foreman : Removed unused variable
* 2021-06-16  Patrick Green : Merge pull request #115 from SBNSoftware/mdeltutt_commissioning
* 2021-06-15  Will Foreman : Reverted ADC saturation back to hard-coded const
* 2021-06-15  Will Foreman : Removed all unused noise-related configurations from SimWire, and made ADC saturation fcl-configurable
* 2021-06-15  Patrick Green : Merge pull request #113 from wforeman/develop
* 2021-06-14  Marco Del Tutto : Adding both PMT and Arapucas ophits to the tree
* 2021-06-14  Will Foreman : Added comments to fcl
* 2021-06-14  Will Foreman : Revert "Added comments to fcl, and commented out unused functions in module"
* 2021-06-14  Will Foreman : Added comments to fcl, and commented out unused functions in module
* 2021-06-14  Will Foreman : Restoring ability to toggle noise generation, and skipping pedestal RMS routine if this isn't set in fcl
* 2021-06-14  Will Foreman : Removed deprecated T1053-version modules
* 2021-06-14  Patrick Green : Merge pull request #111 from SBNSoftware/mdeltutt_commissioning
* 2021-06-09  Marco Del Tutto : Fixed wire hit index
* 2021-06-09  Marco Del Tutto : Fix typo in module name
* 2021-06-09  Marco Del Tutto : Turns off SkipInd in the fast hit finder
* 2021-06-09  Marco Del Tutto : Removes trailing whitespaces
* 2021-06-09  Marco Del Tutto : Removes trailing whitespaces
* 2021-06-09  Marco Del Tutto : Switches to ophit finder in sbncode
* 2021-06-09  Marco Del Tutto : Adds settable fcl config that allows not saving the induction plane wire hits
* 2021-06-07  Patrick Green : Update ci_tests.cfg
* 2021-06-07  Patrick Green : Merge tag 'v09_24_01' into develop

sbndutil v09_24_02
---------------------------------------------------

* 2021-06-18  Patrick Green : Merge branch 'release/v09_24_02'
* 2021-06-18  Patrick Green : Update to v09_24_02
* 2021-06-07  Patrick Green : Merge tag 'v09_24_01' into develop
