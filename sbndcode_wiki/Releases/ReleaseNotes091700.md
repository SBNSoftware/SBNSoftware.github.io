---
layout: page
title: ReleaseNotes091700
toc: true
---

-----------------------------------------------------------------------------
| v09.17.00 | 19 Feb 2021 | [ReleaseNotes](ReleaseNotes091700.html) |
| --- | --- | --- |



sbndcode v09_17_00 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_17_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_17_00/sbndcode-v09_17_00.html)

Purpose
---------------------------------------------------

* Weekly Release

New features
---------------------------------------------------

* sbndcode PR 81:
	* add utility function to the pds map, along with commented examples
	* provides a way to get a container that have the subset of the PDS Map that satisfy custom conditions.

* sbndcode PR 83:
	* tidy gen stage fcls
	* fixed misleadingly named gen fcls responsible for issues in #82 and tidied fcls to simplify / reduce code duplication to hopefully avoid a similar issue occurring again in the future.

* sbndutil PR 2:
	* Updating production scripts for including CAFs in production

Bug fixes
---------------------------------------------------

Updated dependencies
---------------------------------------------------

* sbncode v09_17_00
* larsoft v09_17_00

Change List
==========================================

sbndcode v09_17_00
---------------------------------------------------

* 2021-02-19  Patrick Green : Merge branch 'release/v09_17_00'
* 2021-02-19  Patrick Green : Update to larsoft v09_17_00
* 2021-02-18  Patrick Green : Merge pull request #83 from SBNSoftware/feature/etyley_gen_fcl
* 2021-02-18  Patrick Green : Merge pull request #81 from ikatza/feature/icaza_pdsmap_utility
* 2021-02-17  Edward Tyley : Tidy overlay fcls to reduce code duplication
* 2021-02-17  Edward Tyley : Reorganise the genie gen fcls to remove hardcoding with includes
* 2021-02-10  Iker de Icaza Astiz : Add utility function to the pds map, along with commented examples
* 2021-02-05  Patrick Green : Update ci_tests.cfg
* 2021-02-05  Patrick Green : Merge tag 'v09_16_00' into develop

sbndutil v09_17_00
---------------------------------------------------

* 2021-02-19  Patrick Green : Merge branch 'release/v09_17_00'
* 2021-02-19  Patrick Green : Update to larsoft v09_17_00
* 2021-02-18  Patrick Green : Merge pull request #2 from SBNSoftware/feature/etyley_cafmetadata
* 2021-02-15  Edward Tyley : Updated metadata injector script to set caf name
* 2021-02-15  Edward Tyley : Update metadata injector scripts to add group
* 2021-02-08  Edward Tyley : Adding in MCP2020A POMS cfgs
* 2021-02-05  Patrick Green : Merge tag 'v09_16_00' into develop
