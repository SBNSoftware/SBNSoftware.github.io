---
layout: page
title: ReleaseNotes093702
toc: true
---

-----------------------------------------------------------------------------
| v09.37.02 | 24 Mar 2022 | [ReleaseNotes](ReleaseNotes093702.html) |
| --- | --- | --- |



sbndcode v09_37_02 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_37_02](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_37_02/sbndcode-v09_37_02.html)

Purpose
---------------------------------------------------

* Production release, base release for SBN-2022A

New features
---------------------------------------------------

* sbndcode PR 253:
  * light sim+reco updates for SBN2022A release
  * This PR contains the light simulation and reconstruction updates for the SBN2022A release, cherry-picking the required commits to allow compatibility with the SBN2021C branch. Commits taken from:
    * Add photon propagation times to hybrid model and re-enable by default #235 (Hybrid model)
    * Change voxelization scheme for hybrid model #245 (Hybrid model)
    * OpT0Finder with new LArG4 #247 (OpT0Finder)
  * Requires SBNSoftware/sbncode#230 and LArSoft/larsim#84.
  * Requires sbnd_data v01_11_00

* sbndcode PR 255:
  * update pandora settings to persist neutrino id features
  * this PR makes the required change to the pandora settings file to use the functionality in PandoraPFA/LArContent#189.
  
* sbndcode PR 264:
  * The functionality in sbndcode to run the new CRUMBS tool which lives in sbncode.
  * CRUMBS is added as a producer to the standard and standard+sce caf workflows
  * SCE versions of the crt hit and track matching are added as they are needed as inputs
  * sbndcode is pointed to a new version of sbnd_data (v1_12_00) containing the weights file for CRUMBS's BDT
  * Links to main PR SBNSoftware/sbncode#250
  
* sbndcode PR 271:
  * Add lite versions of various fcl files, dropping unused data products.

* sbnd_data v01_11_00:
  * Adds updated optical library for external argon (hybrid model)

* sbnd_data v01_12_00:
  * Adds CRUMBS' BDT weights

Bug fixes
---------------------------------------------------

* sbndcode PR 256: 
  * CRT Geometry Mapping BugFix 
  * When we adopted geometry v02_00 we inverted how the x & y dimensions are defined for CRT strips and modules. This caused some issues with the CRT reconstruction which made assumptions about the directions of quantities like width and height.
  * This makes the changes to fix the reconstruction. I have also taken the time to check all other uses of CRTGeoAlg to ensure it is correct in other places, in doing this I found lots of unused functions have removed them.

* sbndcode PR 258:
  * update for ifdhc that previously was merged into develop
  * fix required for fcl_tests to complete successfully (find reference files) 

* sbndcode PR 263: 
  * Change EnergyCut from 1e-5 to 1e-2
  * Geant understands the energy cut value in MeV, so this should be 1e-2 MeV = 10 keV, and not 1e-5 MeV, as shown in issue: #261.

* sbndcode PR 266:
  * Update CAF tests
  * Adding some CAF test updates to the production branch that were approved and merged to develop in #244

* sbndcode PR 267:
  * Fix typo, not dropping SimEnergyDeposits as intended.

* sbndcode PR 268:
  * Set RootOutput parameter saveMemoryObjectThreshold=0 in several standard fcl files.

Updated dependencies
---------------------------------------------------

* sbncode v09_37_02
* larsoft v09_37_01_02
* sbnd_data v01_12_00

Change List
==========================================

sbndcode
---------------------------------------------------

* 2022-03-24  Patrick Green : Update to v09_37_02, for SBN2022A
* 2022-03-24  Patrick Green : Merge pull request #271 from hgreenlee/greenlee_wf_lite
* 2022-03-24  Patrick Green : Merge pull request #264 from SBNSoftware/feature/hlay_CRUMBS_2021C
* 2022-03-24  Patrick Green : Merge branch 'release/SBN2022A' into feature/hlay_CRUMBS_2021C
* 2022-03-24  Patrick Green : Merge pull request #255 from SBNSoftware/feature/hlay_writeNuIdFeatures_release_SBN2021C
* 2022-03-24  Patrick Green : Merge pull request #253 from SBNSoftware/feature/pgreen_2022A_light_sim_reco
* 2022-03-24  Patrick Green : Merge branch 'release/SBN2022A' into feature/pgreen_2022A_light_sim_reco
* 2022-03-23  Miquel Nebot : update sbncode version for SBN2022A CI test
* 2022-03-22  Herbert Greenlee : Merge remote-tracking branch 'origin/release/SBN2022A' into greenlee_wf_lite
* 2022-03-22  Herbert Greenlee : Don't drop MCParticles in g4 lite fcl files.
* 2022-03-22  Herbert Greenlee : Add detsim lite fcl files.
* 2022-03-22  Herbert Greenlee : Add g4 lite fcl files.
* 2022-03-21  Patrick Green : Merge pull request #267 from hgreenlee/greenlee_fix_drop_typo
* 2022-03-21  Patrick Green : Merge pull request #268 from hgreenlee/greenlee_savemem
* 2022-03-18  Herbert Greenlee : Set RootOutput parameter saveMemoryObjectThreshold=0.
* 2022-03-18  Herbert Greenlee : Fix type, not dropping SimEnergyDeposits as intended.
* 2022-03-18  Herbert Greenlee : G4 lite drop SimEnergyDeposits and truth.
* 2022-03-18  Patrick Green : Merge pull request #263 from SBNSoftware/feature/marcodeltutto-patch-1
* 2022-03-18  Patrick Green : Merge pull request #256 from SBNSoftware/feature/hlay_crt_reco_changes_release_SBN2021C
* 2022-03-18  Henry Lay : Correct CRT match labels for SCE CRUMBS
* 2022-03-17  Patrick Green : Merge pull request #266 from SBNSoftware/feature/hlay_caf_tests
* 2021-12-21  Henry Lay : Update ci_tests.cfg
* 2021-12-21  Henry Lay : Reduce limit on weighting universes
* 2021-12-21  Henry Lay : Due to comparison script change NEVENTS to 5 for CAF tests
* 2021-12-21  Henry Lay : In update builds you also need to ensure that we compare the correct files
* 2021-12-14  Henry Lay : Correct naming structure for CAF ci tests
* 2022-03-16  Henry Lay : Rename fcl
* 2022-03-16  Henry Lay : Point to new sbnd_data
* 2022-03-16  Henry Lay : Run SCE versions of crt matching
* 2022-02-23  Henry Lay : Run CRUMBS in cafmaker
* 2022-03-15  Henry Lay : Merge remote-tracking branch 'origin/feature/hlay_writeNuIdFeatures_release_SBN2021C' into HEAD
* 2022-03-15  Patrick Green : Merge pull request #258 from SBNSoftware/feature/chilgenb_upateForIfdhc
* 2022-03-11  Marco Del Tutto : Change EnergyCut from 1e-5 to 1e-2
* 2022-01-17  Henry Lay : Amend ifdh usage
* 2022-02-14  Chris Hilgenberg : ifdh ll -> ifdh findMatchingFiles
* 2022-02-11  Henry Lay : Add comments
* 2022-02-01  Henry Lay : Update DetSimAna module for new namings
* 2022-02-01  Henry Lay : Return functions
* 2022-01-31  Henry Lay : Remove unused functions
* 2022-01-31  Henry Lay : Improve boolean logic
* 2022-01-31  Henry Lay : Improve boolean logic
* 2022-01-31  Henry Lay : Amend CRTGeoAlg to cope with change of coordinate system
* 2022-01-27  Henry Lay : Delete unused functions
* 2022-02-10  Henry Lay : Update pandora settings to persist neutrino id features
* 2022-02-08  Patrick Green : Update to sbnd_data v01_11_00
* 2022-01-17  Marco Del Tutto : Add VUVHits and VISHits to opt0finder config
* 2022-01-17  Marco Del Tutto : Re-add opt0finder to standard reco chain
* 2022-01-17  Marco Del Tutto : Improve messages
* 2022-01-17  Marco Del Tutto : Pass the SemiAnalyticalModel class to the FlashMatchManager
* 2021-12-21  fran-nicar : Change voxelization scheme for hybrid model
* 2022-02-08  Patrick Green : Merge remote-tracking branch 'remotes/origin/feature/pgreen_hybrid_model_propagation_times' into feature/pgreen_2022A_light_sim_reco
* 2021-12-06  Patrick Green : Re-enable hybrid light simulation
* 2021-11-29  Patrick Green : Added configuration for photon propagation time simulation in external argon (hybrid model)

sbndutil
---------------------------------------------------
