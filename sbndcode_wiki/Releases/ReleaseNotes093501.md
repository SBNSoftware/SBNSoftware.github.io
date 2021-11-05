---
layout: page
title: ReleaseNotes093501
toc: true
---

-----------------------------------------------------------------------------
| v09.35.01 | 05 Nov 2021 | [ReleaseNotes](ReleaseNotes093501.html) |
| --- | --- | --- |



sbndcode v09_35_01 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_35_01](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_35_01/sbndcode-v09_35_01.html)

Purpose
---------------------------------------------------

* Weekly release

New features
---------------------------------------------------

* sbndcode PR #192:
  * Cosmic InTime Workflow with Refactored LArG4
  * This PR adds a workflow for making intime samples with the new larg4 simulation. Fixes issue #147.
  * See https://github.com/SBNSoftware/sbndcode/pull/192 for details.

* sbnd_data v01_10_00:
  * Updated digi_arapuca_sbnd.root with more realistic SER, see DocDb 23877 for details.
  * Added sbnd_rock_maxpathlength_fluxI_gdmlv02_00.xml for dirt simulation workflow, see https://github.com/SBNSoftware/sbndcode/pull/203 for details.

Bug fixes
---------------------------------------------------

Updated dependencies
---------------------------------------------------

* sbnd_data v01_10_00
* sbncode v09_35_01
* larsoft v09_35_01

Change List
==========================================

sbndcode
---------------------------------------------------

* 2021-11-05  Patrick Green : Merge branch 'release/v09_35_01'
* 2021-11-05  Patrick Green : Update to v09_35_01
* 2021-11-02  Patrick Green : Merge pull request #192 from SBNSoftware/mdeltutt_issue147
* 2021-11-01  Marco Del Tutto : TFileService name to start with hists_*
* 2021-10-29  Patrick Green : Merge tag 'v09_35_00' into develop
* 2021-10-23  Marco Del Tutto : SimDrift needs to use priorSCE collection, as in PR #195
* 2021-10-23  Marco Del Tutto : Clean up
* 2021-10-19  Marco Del Tutto : Clean up
* 2021-10-19  Marco Del Tutto : Add g4 configuration for intime samples
* 2021-10-19  Marco Del Tutto : First version of the prodcorsika fcl file for intime cosmics generation with the new larg4
* 2021-10-19  Marco Del Tutto : Add mergesimsources_sbnd.fcl with a basic config for the MergeSimSources module
* 2021-10-17  Marco Del Tutto : Start writing configuration for intime fcls

sbndutil
---------------------------------------------------

* 2021-11-05  Patrick Green : Merge tag 'v09_35_01' into develop
* 2021-11-05  Patrick Green : Merge branch 'release/v09_35_01'
* 2021-11-05  Patrick Green : Update to v09_35_01
* 2021-10-29  Patrick Green : Merge tag 'v09_35_00' into develop
