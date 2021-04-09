---
layout: page
title: ReleaseNotes092100
toc: true
---

-----------------------------------------------------------------------------
| v09.21.00 | 09 Apr 2021 | [ReleaseNotes](ReleaseNotes092100.html) |
| --- | --- | --- |



sbndcode v09_21_00 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_21_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_21_00/sbndcode-v09_21_00.html)

Purpose
---------------------------------------------------

* Weekly release

New features
---------------------------------------------------

* sbndcode PR 95:
  * New Flux Files Config H, fixes issue #79
  * adds the necessary fhicl configurations to use the newly produced flux files. 
  * previous flux files (config F) have the beam spot at a 45.7 cm offset in detector coordinates. According to the current design this offset should instead be -73.78 cm, as mentioned in #79 and described in docdb 20891. The new files (called config H) were produced by Zarko and have the corrected -73.78 cm offset.

Bug fixes
---------------------------------------------------

Updated dependencies
---------------------------------------------------

* sbncode v09_21_00
* larsoft v09_21_00

Change List
==========================================

sbndcode v09_21_00
---------------------------------------------------

* 2021-04-09  Patrick Green : Merge branch 'release/v09_21_00'
* 2021-04-09  Patrick Green : Update to larsoft v09_21_00
* 2021-04-09  Patrick Green : Merge pull request #96 from SBNSoftware/feature/pgreen_updating_CI_flux_files
* 2021-04-09  Patrick Green : Update FluxSearchPath
* 2021-04-09  Patrick Green : Merge pull request #95 from SBNSoftware/mdeltutt_fluxfiles_configH
* 2021-04-06  Patrick Green : Update ci_tests.cfg
* 2021-04-06  Patrick Green : Update ci_tests.cfg
* 2021-04-05  Patrick Green : Merge tag 'v09_20_00' into develop
* 2021-04-01  Marco Del Tutto : Moving all flux config specific fhicls to a directory called other_flux_config and keeping only the defualt fcl files with the most recent fluxes in the main directory. Also, making better use of override fcl files.
* 2021-04-01  Marco Del Tutto : Moving genie-related fhicl to their own directory, adding new override fcls, and renamind these fcls as set_genie_*.fcl
* 2021-03-31  Marco Del Tutto : Added description to README files.
* 2021-03-29  Marco Del Tutto : Make sure we are using config H be default.
* 2021-03-27  Marco Del Tutto : Merge branch 'develop' into mdeltutt_fluxfiles_configH
* 2021-03-26  Marco Del Tutto : use flux config H for the default overlay fcls
* 2021-03-26  Marco Del Tutto : Add description to default fcl files
* 2021-03-26  Marco Del Tutto : Add description to default fcl files
* 2021-03-26  Marco Del Tutto : Add CMakeLists to the new sub-directories
* 2021-03-26  Marco Del Tutto : Rename G to H
* 2021-03-26  Marco Del Tutto : Adding GENIE+CORSIKA fcl files for flux config H and also a default directory with the fcl files that should be used by default.
* 2021-03-26  Marco Del Tutto : Reorganizing fcl files for GENIE+CORSIKA in the same way as the GENIE gen files, with different sub-directories for each one of the different flux configurations.
* 2021-03-26  Marco Del Tutto : Adding a default directory with GENIE gen fcl files that you should be used by default.
* 2021-03-26  Marco Del Tutto : Adding flux files config H

sbndutil v09_21_00
---------------------------------------------------

* 2021-04-09  Patrick Green : Merge branch 'release/v09_21_00'
* 2021-04-09  Patrick Green : Update to larsoft v09_21_00
* 2021-04-05  Patrick Green : Merge tag 'v09_20_00' into develop
