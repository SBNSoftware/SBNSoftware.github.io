---
layout: page
title: ReleaseNotes09370101
toc: true
---

-----------------------------------------------------------------------------
| v09.37.01.01 | 26 Nov 2021 | [ReleaseNotes](ReleaseNotes09370101.html) |
| --- | --- | --- |



sbndcode v09_37_01_01 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_37_01_01](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_37_01_01/sbndcode-v09_37_01_01.html)

Purpose
---------------------------------------------------

* Patch release for SBN-2021C

New features
---------------------------------------------------

* sbndcode PR 171:
  * updates to the CRT hit - TPC track matching algorithm
  * details can be found in docdb 22851

* sbndcode PR 231:
  * rollup fcls for SBN-2021C testing 
  * this PR adds the fcls required to test rollup being turned off, and further turning off mcreco as discussed in issue #230.

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

* sbncode v09_37_01_01

Change List
==========================================

sbndcode
---------------------------------------------------

* 2021-11-26  Patrick Green : Update to v09_37_01_01
* 2021-11-26  Patrick Green : Merge pull request #231 from SBNSoftware/feature/hlay_production_rollup_fcls
* 2021-11-26  Patrick Green : Merge pull request #171 from SBNSoftware/feature/mstancar_CRT_T0
* 2021-11-26  Henry Lay : Naming
* 2021-11-26  Henry Lay : Add fcl file to turn off mcreco
* 2021-11-26  Henry Lay : Update description
* 2021-11-25  Henry Lay : Add g4 sce fcl file with no rollup
* 2021-11-22  Patrick Green : Merge tag 'v09_37_01' into develop
* 2021-11-04  Patrick Green : Merge branch 'develop' into feature/mstancar_CRT_T0
* 2021-08-31  Michelle Stancari : transfer code from old feature branch

sbndutil
---------------------------------------------------

* 2021-11-24  SBND : small changes to be consitent with other scripts.
* 2021-11-24  SBND : change details to be consistent with other poms script.
* 2021-11-24  SBND : change details to be consistent with other poms script.
* 2021-11-24  SBND : Remove the templates from the old folder. Add a new folder for the te… …
* 2021-11-24  SBND : add produce_fcl file that calls sbndpoms_genfcl
* 2021-11-24  Henry Lay : 3 new changes in sbndpoms files: caf_concat, duplicate remover and du… …
* 2021-11-24  Henry Lay : Add two template files for future reference, modify non-template file… …
* 2021-11-22  Patrick Green : Merge tag 'v09_37_01' into develop
