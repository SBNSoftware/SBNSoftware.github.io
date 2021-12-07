---
layout: page
title: ReleaseNotes093800
toc: true
---

-----------------------------------------------------------------------------
| v09.38.00 | 07 Dec 2021 | [ReleaseNotes](ReleaseNotes093800.html) |
| --- | --- | --- |



sbndcode v09_38_00 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_38_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_38_00/sbndcode-v09_38_00.html)

Purpose
---------------------------------------------------

* Weekly release

New features
---------------------------------------------------

* sbndcode PR 171:
  * updates to the CRT hit - TPC track matching algorithm
  * details can be found in docdb 22851

* sbndcode PR 231:
  * rollup fcls for SBN-2021C testing 
  * this PR adds the fcls required to test rollup being turned off, and further turning off mcreco as discussed in issue #230.

* sbndcode PR 233:
  * CAF tests for the CI system
  * This PR introduces the CAF stage to the standard regression tests. This PR replaces the anatree stage with a caf stage. 

* sbndutil PR 8:
  * sbndpro 2021 nov organisation
  * re-organised files at local and pushed to the remote repo
  * changes include:
    * cfg templates for stage 1 and stage 2 of production
    * sbndpoms_*.sh files: updates in caf_concat and duplicate_remover
    * new file: duplicate finder and gen fcl

Bug fixes
---------------------------------------------------

Updated dependencies
---------------------------------------------------

* sbncode v09_38_00
* larsoft v09_38_00

Change List
==========================================

sbndcode
---------------------------------------------------

* 2021-12-07  Patrick Green : Merge branch 'release/v09_38_00'
* 2021-12-07  Patrick Green : Version v09_38_00
* 2021-12-07  Patrick Green : Merge remote-tracking branch 'remotes/origin/feature/hlay_caf_tests' into release/v09_38_00
* 2021-12-01  Henry Lay : Update test/ci/sbnd_ci_nucosmics_caf_quick_test_sbndcode.fcl
* 2021-11-29  Patrick Green : Merge pull request #232 from SBNSoftware/release/SBN2021C
* 2021-11-26  Henry Lay : Replace anatree tests with caf tests and more resource updates
* 2021-11-26  Patrick Green : Update to v09_37_01_01
* 2021-11-26  Henry Lay : Adopt reweighting fcl but with just 1 universe
* 2021-11-26  Henry Lay : Update resource usage
* 2021-11-26  Patrick Green : Merge pull request #231 from SBNSoftware/feature/hlay_production_rollup_fcls
* 2021-11-26  Patrick Green : Merge pull request #171 from SBNSoftware/feature/mstancar_CRT_T0
* 2021-11-26  Henry Lay : Naming
* 2021-11-26  Henry Lay : Add fcl file to turn off mcreco
* 2021-11-26  Henry Lay : Update description
* 2021-11-25  Henry Lay : Add g4 sce fcl file with no rollup
* 2021-11-25  Henry Lay : Add caf CI tests to configuration
* 2021-11-25  Henry Lay : Add fcl files for caf tests in CI
* 2021-11-22  Patrick Green : Merge tag 'v09_37_01' into develop
* 2021-11-04  Patrick Green : Merge branch 'develop' into feature/mstancar_CRT_T0
* 2021-08-31  Michelle Stancari : transfer code from old feature branch

sbndutil
---------------------------------------------------

* 2021-12-07  Patrick Green : Merge tag 'v09_38_00' into develop
* 2021-12-07  Patrick Green : Merge branch 'release/v09_38_00'
* 2021-12-07  Patrick Green : Version v09_38_00
* 2021-11-29  Patrick Green : Merge pull request #9 from SBNSoftware/release/SBN2021C
* 2021-11-26  Patrick Green : Update to v09_37_01_01
* 2021-11-26  Patrick Green : Merge pull request #8 from SBNSoftware/feature/sbndpro_2021Nov_organisation
* 2021-11-24  Sbnd : small changes to be consitent with other scripts.
* 2021-11-24  Sbnd : change details to be consistent with other poms script.
* 2021-11-24  Sbnd : change details to be consistent with other poms script.
* 2021-11-24  Sbnd : Remove the templates from the old folder. Add a new folder for the templates.
* 2021-11-24  Sbnd : add produce_fcl file that calls sbndpoms_genfcl
* 2021-11-24  sbndpro (Henry Lay) : 3 new changes in sbndpoms files: caf_concat, duplicate remover and duplicate finder
* 2021-11-24  sbndpro (Henry Lay) : Add two template files for future reference, modify non-template file with the newest version tag.
* 2021-11-22  Patrick Green : Merge tag 'v09_37_01' into develop
