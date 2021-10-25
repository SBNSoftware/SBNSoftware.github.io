---
layout: page
title: ReleaseNotes093400
toc: true
---

-----------------------------------------------------------------------------
| v09.34.00 | 25 Oct 2021 | [ReleaseNotes](ReleaseNotes093400.html) |
| --- | --- | --- |



sbndcode v09_34_00 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_34_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_34_00/sbndcode-v09_34_00.html)

Purpose
---------------------------------------------------

* Weekly release

New features
---------------------------------------------------

* sbndcode PR 188:
  * Consolidate SBND filters
  * All SBND filters are now in the same Filters/ directory, and all configuration fcl files are in Filters/fcls/. Fixes issue #7.
  * A wiki page was made, with description of these filters: https://sbnsoftware.github.io/sbndcode_wiki/simulation/sbnd_filters

* sbndcode PR 190:
  * Add caloskimmer to reco2_sce.fcl
  * This commit enables the end_paths to include the caloskimana analyzer, similarly to the standard_reco2_sbnd.fcl.

* sbndcode PR 193:
  * New Dirt Flux Files Config I
  * Zarko produced new gSimple flux files for dirt event generation. These new files are produced with the same configuration as config H (added with PR #95) but with a larger window.
  * The files are installed in /cvmfs/sbnd.osgstorage.org/pnfs/fnal.gov/usr/sbnd/persistent/stash/fluxFiles/bnb/BooNEtoGSimple/configI-v1/october2021/neutrinoMode/, and this PR sets them as the default flux files to use for dirt generation.
  * The wiki page has been updated accordingly: https://sbnsoftware.github.io/sbndcode_wiki/The_SBND_flux_files.html.

* sbndcode PR 194:
  * Enable Scintillation By Particle Type and LArQL Model
  * enables the scintillation by particles type, and fixes issue #150. In the Correlated model that we are using now this option only controls the ratio of fast light to the total light.
  * enables the LArQL model, and fixes issue #146.

* sbndcode PR 196:
  * Add fcl for empty file generation
  * Today we needed to remake some "EmptyEvent" files as input for the ci. I reverse engineered this fcl file based on the config dump from the previous incarnations. Thought it was worth committing in case we want to do the same again.

* sbndcode PR 197: 
  * Add truth-level photon analyser
  * Adds analyser to look at photon truth information, as alternative to simphotoncounter, that works with the refactored larg4 and the multiple photon collections in SBND. Useful in development/testing of larg4 light simulation.

Bug fixes
---------------------------------------------------

* sbndcode PR 195:
  * SCE Position Offsets
  * It was pointed out in docdb 23637, "Summary of SBN Calibration Workshop" that the space-charge position offsets were applied twice in the simulation. In fact, they are applied in both the IonAndScint and SimDrift modules. This PR fixes it by feeding to SimDrift a SimEnergyDeposit collection without offsets applied. 
  * Fixes issue #189.

Updated dependencies
---------------------------------------------------

* sbncode v09_34_00
* larsoft v09_34_00

Change List
==========================================

sbndcode
---------------------------------------------------

* 2021-10-25  Patrick Green : Merge branch 'release/v09_34_00'
* 2021-10-25  Patrick Green : Update to v09_34_00
* 2021-10-25  Patrick Green : Merge pull request #195 from SBNSoftware/mdeltutt_issue_189
* 2021-10-25  Patrick Green : Merge pull request #197 from SBNSoftware/feature/pgreen_OpDetAnalyzer
* 2021-10-25  Patrick Green : added analyser to look at photon truth information
* 2021-10-22  Patrick Green : Merge pull request #196 from SBNSoftware/feature/hlay_empty_file_fcl
* 2021-10-22  Henry Lay : Add fcl for empty file generation
* 2021-10-22  Patrick Green : Merge pull request #194 from SBNSoftware/mdeltutt_issue150_146
* 2021-10-21  Marco Del Tutto : Drop the unused SimDriftElectrons collection from IonAndScint which has SCE offsets applied.
* 2021-10-21  Marco Del Tutto : Set SimDriftElectrons to use priorSCE SimEnergyDeposit collection from IonAndScint. SCE offsets are applied in the SimDriftElectrons module itself.
* 2021-10-20  Marco Del Tutto : Enable LArQL model
* 2021-10-20  Marco Del Tutto : Enable scintillation by particle type
* 2021-10-20  Patrick Green : Merge pull request #193 from SBNSoftware/mdelutt_fluxes_config_i
* 2021-10-20  Patrick Green : Merge pull request #188 from SBNSoftware/mdeltutt_issue7
* 2021-10-20  Patrick Green : Merge pull request #190 from SBNSoftware/feature/lnguyen_caloskim_reco2_sce_fcl
* 2021-10-19  Marco Del Tutto : Add new flux file configuration I for dirt
* 2021-10-18  Lan Nguyen : add caloskim to reco2_sce.fcl
* 2021-10-15  Patrick Green : Merge tag 'v09_33_00' into develop
* 2021-10-12  Marco Del Tutto : Add wiki link to readme file
* 2021-10-12  Marco Del Tutto : Remove trailing whitespaces
* 2021-10-12  Marco Del Tutto : Clean up CMakeLists.txt
* 2021-10-12  Marco Del Tutto : All filters in the same directory, and all fcl configuration in fcl subdirectory
* 2021-10-12  Marco Del Tutto : Move SimulationFilters/ inside Filters/

sbndutil
---------------------------------------------------

* 2021-10-25  Patrick Green : Merge tag 'v09_34_00' into develop
* 2021-10-25  Patrick Green : Merge branch 'release/v09_34_00'
* 2021-10-25  Patrick Green : Update to v09_34_00
* 2021-10-15  Patrick Green : Merge tag 'v09_33_00' into develop
