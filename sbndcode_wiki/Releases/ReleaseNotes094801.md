---
layout: page
title: ReleaseNotes094801
toc: true
---

-----------------------------------------------------------------------------
| v09.48.01 | 15 Apr 2022 | [ReleaseNotes](ReleaseNotes094801.html) |
| --- | --- | --- |



sbndcode v09_48_01 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_48_01](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_48_01/sbndcode-v09_48_01.html)

Purpose
---------------------------------------------------

* Weekly release

New features
---------------------------------------------------

* sbndcode PR 255:
  * update pandora settings to persist neutrino id features
  * this PR makes the required change to the pandora settings file to use the functionality in PandoraPFA/LArContent#189.
  
* sbndcode PR 264:
  * The functionality in sbndcode to run the new CRUMBS tool which lives in sbncode.
  * CRUMBS is added as a producer to the standard and standard+sce caf workflows
  * SCE versions of the crt hit and track matching are added as they are needed as inputs
  * sbndcode is pointed to a new version of sbnd_data (v1_12_00) containing the weights file for CRUMBS's BDT
  * Links to main PR SBNSoftware/sbncode#250

* sbndcode PR 275:
  * Add fcl testing framework based on icarus fcl testing framework  

* sbnd_data:
  * Adds CRUMBS' BDT weights

Bug fixes
---------------------------------------------------

Updated dependencies
---------------------------------------------------

* sbncode v09_48_01
* larsoft v09_48_01
* sbnd_data v01_12_00

Change List
==========================================

sbndcode
---------------------------------------------------

* 2022-04-15  Patrick Green : Merge branch 'release/v09_48_01'
* 2022-04-15  Patrick Green : Update to v09_48_01
* 2022-04-15  Patrick Green : Merge remote-tracking branch 'remotes/origin/feature/hlay_crumbs' into release/v09_48_01
* 2022-04-15  Patrick Green : Merge remote-tracking branch 'remotes/origin/feature/hlay_writeNuIdFeatures_release_SBN2021C' into release/v09_48_01
* 2022-04-15  Patrick Green : Merge pull request #275 from hgreenlee/greenlee_fcl_test_develop
* 2022-04-11  Patrick Green : Merge tag 'v09_48_00' into develop
* 2022-03-29  Herbert Greenlee : Add fcl testing framework based on icarus fcl testing framework.
* 2022-02-21  Henry Lay : Ensure persistency of MVA features
* 2022-02-21  Henry Lay : Variety of improvements to CRUMBS
* 2022-02-10  Henry Lay : Update pandora settings to persist neutrino id features
* 2022-02-01  Henry Lay : Merge remote-tracking branch 'origin/develop' into feature/hlay_crumbs
* 2022-02-01  Henry Lay : Merge branch 'feature/hlay_crt_reco_changes' into feature/hlay_crumbs
* 2022-02-01  Henry Lay : Update DetSimAna module for new namings
* 2022-02-01  Henry Lay : Return functions
* 2022-01-31  Henry Lay : Remove unused functions
* 2022-01-31  Henry Lay : Improve boolean logic
* 2022-01-31  Henry Lay : Improve boolean logic
* 2022-01-31  Henry Lay : Amend CRTGeoAlg to cope with change of coordinate system
* 2022-01-27  Henry Lay : Delete unused functions
* 2022-01-14  Patrick Green : Update to v09_42_00
* 2022-01-10  Henry Lay : Protect upstream
* 2022-01-07  Henry Lay : Further fix to channel map functions
* 2021-12-23  Patrick Green : Update to v09_41_00
* 2021-12-21  Henry Lay : Update ci_tests.cfg
* 2021-12-21  Henry Lay : Reduce limit on weighting universes
* 2021-12-21  Henry Lay : Due to comparison script change NEVENTS to 5 for CAF tests
* 2021-12-21  Henry Lay : In update builds you also need to ensure that we compare the correct files
* 2021-12-14  Henry Lay : Correct naming structure for CAF ci tests
* 2021-12-21  fran-nicar : Change voxelization scheme for hybrid model
* 2021-12-01  Herbert Greenlee : Update AnalysisTree_module.cc.
* 2022-02-01  Henry Lay : Add CRT matching, POT tracking and separate nu & cosmic workflows
* 2022-02-01  Henry Lay : Merge remote-tracking branch 'origin/bugfix/hlay_more_crt_segfaults' into feature/hlay_crumbs
* 2022-01-12  Henry Lay : Add tree, simplify and add flash match
* 2022-01-07  Henry Lay : Start building crumbs

sbndutil
---------------------------------------------------

* 2022-04-15  Patrick Green : Merge tag 'v09_48_01' into develop
* 2022-04-15  Patrick Green : Merge branch 'release/v09_48_01'
* 2022-04-15  Patrick Green : Update to v09_48_01
* 2022-04-11  Patrick Green : Merge tag 'v09_48_00' into develop
