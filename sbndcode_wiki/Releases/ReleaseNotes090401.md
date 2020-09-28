---
layout: page
title: ReleaseNotes090401
toc: true
---

-----------------------------------------------------------------------------
| v09.04.01 | 28 Sep 2020 | [ReleaseNotes](ReleaseNotes090401.html) |
| --- | --- | --- |



sbndcode v09_04_01 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_04_01](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_04_01/sbndcode-v09_04_01.html)

Purpose
---------------------------------------------------

* Weekly release + bug fix.

New features
---------------------------------------------------

Bug fixes(Bug-fixes)
---------------------------------------------------

* Fixes issues in v09_04_00 (no matching sbndcode release).

Updated dependencies
---------------------------------------------------

* [larsoft v09_04_00](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/ReleaseNotes090400)
* [larsoft v09_04_01](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/ReleaseNotes090401)


Change List
==========================================

sbndcode v09_04_01
---------------------------------------------------

* 2020-09-28  Andrew Scarff : Merge branch 'release/v09_04_01'
* 2020-09-28  Andrew Scarff : Update to larsoft v09_04_01
* 2020-09-28  Andrew Scarff : Merge pull request #31 from pgreen135/feature/pgreen_semianalytic_update
* 2020-09-28  Andrew Scarff : Merge pull request #33 from SBNSoftware/ggamezdiego-patch-1
* 2020-09-25  Marco Del Tutto : Merge pull request #32 from SBNSoftware/mdeltutt_optical
* 2020-09-25  ggamezdiego : Updating the Optical library information
* 2020-09-24  Patrick Green : updated vuv transport time landau width parameters to fix issue with extrapolation of parameters at very large distances
* 2020-09-23  Marco Del Tutto : Adding new ophit and opflash reco to base reco fcl file.
* 2020-09-23  Marco Del Tutto : Merge branch 'develop' into mdeltutt_optical
* 2020-09-23  Marco Del Tutto : ophit reco is now divided in ophitpmt and ophitarapuca
* 2020-09-23  Marco Del Tutto : Flash finder plugin can now accept multiple ophit producs
* 2020-09-23  Dom Brailsford : Separate out the reconstruction stages into reco1 and reco2, but still provide a convenience fcl for running both stages tog\
ether. This has required a bit of a hack in a base fcl to ensure reco1->reco2 running order is maintained.  There should be a more long term fix to tidy ev\
erything up
* 2020-09-23  Dom Brailsford : Reorganise all of the job fcls in the JobConfigurations folder.  This includes moving all of the production gen fcls from th\
e top level 'fcl' directory into subdirectories of JobConfigurations
* 2020-09-21  Andrew Scarff : Merge tag 'v09_03_00' into develop
* 2020-09-21  Patrick Green : updated semi-analytic visible flat optical detector parameterisation
* 2020-09-17  Patrick Green : updated semi-analytic hits parameterisations, vuv and visible light
* 2020-09-16  Patrick Green : updated photon transport time parameterisations, VUV and visible

sbndutil v09_04_01
---------------------------------------------------

* 2020-09-28  Andrew Scarff : Merge branch 'release/v09_04_01'
* 2020-09-28  Andrew Scarff : Update to larsoft v09_04_01
* 2020-09-21  Andrew Scarff : Merge tag 'v09_03_00' into develop
