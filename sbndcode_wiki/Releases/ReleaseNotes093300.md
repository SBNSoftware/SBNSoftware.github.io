---
layout: page
title: ReleaseNotes093300
toc: true
---

-----------------------------------------------------------------------------
| v09.33.00 | 15 Oct 2021 | [ReleaseNotes](ReleaseNotes093300.html) |
| --- | --- | --- |



sbndcode v09_33_00 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_33_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_33_00/sbndcode-v09_33_00.html)

Purpose
---------------------------------------------------

* Weekly release

New features
---------------------------------------------------

* sbndcode PR 187:
  * Activate Vertexing Updates
  * This PR activates a series of updates to Pandora's vertex reconstruction that have been presented at TPC Reco & PAC meetings this year.
  * All the functionality has already been included in the larpandoracontent repository so this PR merely updates the SBND Pandora configuration to reflect that.

* sbnd_data v01_09_00:
  * updated Pandora BDTs (PandoraMVAs/PandoraBdt_v09_32_00_SBND.xml), corresponding to the vertexing updates (#187)

Bug fixes
---------------------------------------------------

* sbndcode PR 186:
  * fixes bug in MuonTrackProducer_module.cc
  * producer was ignoring tracks in tpc1 if a track existed in tpc0

Updated dependencies
---------------------------------------------------

* larsoft v09_33_00
* sbncode v09_33_00
* sbnd_data v01_09_00

Change List
==========================================

sbndcode
---------------------------------------------------

* 2021-10-15  Patrick Green : Merge branch 'release/v09_33_00'
* 2021-10-15  Patrick Green : Update to v09_33_00
* 2021-10-15  Patrick Green : Merge pull request #187 from SBNSoftware/feature/hlay_enable_vertex_updates
* 2021-10-15  Patrick Green : Merge branch 'develop' into feature/hlay_enable_vertex_updates
* 2021-10-13  Patrick Green : Merge pull request #186 from SBNSoftware/lynnt-muon_comm-patch-1
* 2021-10-12  Patrick Green : Merge tag 'v09_32_01_01' into develop
* 2021-10-11  lynnt-uchicago : Update MuonTrackProducer_module.cc
* 2021-10-11  Henry Lay : Point to sbnd_data v01_09_00
* 2021-10-11  Henry Lay : Point other BDTs at correct file
* 2021-10-07  Henry Lay : Enable new vertex BDT
* 2021-10-07  Henry Lay : Enable vertex refinement algorithm

sbndutil
---------------------------------------------------

* 2021-10-15  Patrick Green : Merge tag 'v09_33_00' into develop
* 2021-10-15  Patrick Green : Merge branch 'release/v09_33_00'
* 2021-10-15  Patrick Green : Update to v09_33_00
* 2021-10-12  Patrick Green : Merge tag 'v09_32_01_01' into develop
