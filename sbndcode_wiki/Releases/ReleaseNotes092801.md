---
layout: page
title: ReleaseNotes092801
toc: true
---

-----------------------------------------------------------------------------
| v09.28.01 | 17 Aug 2021 | [ReleaseNotes](ReleaseNotes092801.html) |
| --- | --- | --- |



sbndcode v09_28_01 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_28_01](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_28_01/sbndcode-v09_28_01.html)

Purpose
---------------------------------------------------

* Production release for SBN-2021B

New features
---------------------------------------------------

* sbndcode PR 133:
  * XArapuca Updates in the OpDetSim Module related to issues #78, #80
  * Added new sampling field to the sbnd_pds_mapping.json file.
  * Modified digitizer, op hit finder, wvf analyzer and trigger modules to differentiate daphne xarapuca channels with their own frequency.
  * Updated test bench XArapuca single electron response.
  * sbnd_data v01_08_00 updated with data-driven xarapuca response

* sbndcode PR 134:
  * Migration to the Refactored LArG4
  * This PR contains all the necessary fcls and code to migrate to the new LArG4.
  * Changes are presented on docdb 22944.
  * Note that with this PR, the standard_g4_sbnd.fcl will run the new LArG4. To run the legacy larg4, fcl legacy_g4_sbnd.fcl should be used. All the g4_*.fcl files run the new LArG4. To run the legacy LArG4, replace g4_*.fcl with legacy_g4_*.fcl.
  * Full details available at: https://github.com/SBNSoftware/sbndcode/pull/134

Bug fixes
---------------------------------------------------

* sbndcode PR 138:
  * Flash matching does not work for XArapucas, disabled until fix available
  * Use PMTs only for flash matching

* sbndcode PR 141:
  * Temporary fix for LArSoft View not correctly set
  * In the way the planes are currently implemented in the geometry v02_00, LArSoft cannot interpret the View correctly. Having the View set incorrectly causes problems down the road because many modules (inside and outside of sbndcode) use PlaneID and View interchangeably. This commit swaps plane 0 and plane 1 in TPC 0 only, so that View will be set correctly, but of course ordering of the planes does not match the one in the real detector. Further investigation in LArSoft is needed to fix the View problem, and once fixed, we will revert the planes again to match reality.
  * Issue #142 has been opened to keep track of this problem. This "fixes" issue #139.

* sbndcode PR 148:
  * Turn previously disabled geometry unit tests back on
  * these were deactivated due to previous issues with the geometry causing them to fail


Updated dependencies
---------------------------------------------------

* sbncode v09_28_01
* larsoft v09_28_01
* sbnd_data v01_08_00

Change List
==========================================

sbndcode v09_28_01
---------------------------------------------------

* 2021-08-17  Patrick Green : Merge branch 'release/v09_28_01'
* 2021-08-17  Patrick Green : Update to v09_28_01
* 2021-08-17  Patrick Green : Merge pull request #134 from SBNSoftware/mdeltutt_larg4_migration
* 2021-08-16  Patrick Green : Merge pull request #148 from SBNSoftware/feature/hlay_geom_tests
* 2021-08-16  Patrick Green : Merge pull request #141 from SBNSoftware/mdeltutt_geo_plane_swap
* 2021-08-13  Henry Lay : Turn previously disabled geometry tests back on
* 2021-08-12  Marco Del Tutto : Move g4_QLcorrelated.fcl and g4_QLseparate.fcl to legacy folder.
* 2021-08-12  Marco Del Tutto : Fix simulate path in g4 fcl files that have filters in them, so that mcreco is run at the end
* 2021-08-12  Marco Del Tutto : Removing old configs that run the optical hybrid mode, which is now run by default in standard_g4_sbnd.fcl
* 2021-08-12  Marco Del Tutto : Fix g4 configurations with filters
* 2021-08-12  Marco Del Tutto : Fix mistake in fcl config: @table to @sequence
* 2021-08-12  Marco Del Tutto : Enable new LArG4 in prodsingle configurations too
* 2021-08-11  Marco Del Tutto : Merge branch 'mdeltutt_geo_plane_swap' into mdeltutt_larg4_migration
* 2021-08-11  Marco Del Tutto : Re-enable geometry tests, except the WireIntersection one
* 2021-08-11  Henry Lay : Temporarily disable geometry tests
* 2021-08-10  Marco Del Tutto : To match commit 863c8c181fa8a8c3b84ec071662552fbf5c9b5de
* 2021-08-10  Marco Del Tutto : Merge branch 'mdeltutt_geo_plane_swap' into mdeltutt_larg4_migration
* 2021-08-10  Marco Del Tutto : Swap plane 0 and plane 1 in TPC 0 only
* 2021-08-10  Patrick Green : Merge pull request #138 from SBNSoftware/feature/fm_noxarapuca
* 2021-08-10  Patrick Green : Merge pull request #133 from SBNSoftware/feature/rodrigoa_XArapucasUpdates
* 2021-08-09  Marco Del Tutto : Removed old gdml files and fix indentation
* 2021-08-09  Marco Del Tutto : Adding g4_noophybrid_sbnd.fcl to run g4 without the optical hybrid mode
* 2021-08-09  Marco Del Tutto : Adopting the optical hybrid mode in the default geant4 configuration
* 2021-08-09  Marco Del Tutto : Enable gdml for optical hybrid mode by default
* 2021-08-09  Marco Del Tutto : Enable gdml for optical hybrid mode by default
* 2021-08-09  Iker de Icaza : Do not use xarapucas for fm
* 2021-08-09  Patrick Green : sbnd_data v01_08_00
* 2021-08-09  Rodrigo Alvarez Garrote : Indentation and minor fixes proposed in icaza review
* 2021-08-09  Rodrigo Alvarez Garrote : Mugfix and refactoring, removing depreciated Arapuca code
* 2021-08-06  Marco Del Tutto : Merge branch 'develop' into mdeltutt_larg4_migration
* 2021-08-06  Marco Del Tutto : Enable QL-anticorrelation by default in ionandscint
* 2021-08-06  Patrick Green : Update ci_tests.cfg
* 2021-08-06  Patrick Green : Merge tag 'v09_28_00' into develop
* 2021-08-06  Rodrigo Alvarez Garrote : Merge of Pulse1PE
* 2021-08-06  Rodrigo Alvarez Garrote : Removing old code, sampling bugfix in DigiArapucaSBNDAlg
* 2021-08-05  Rodrigo Alvarez Garrote : Merge of AddSPE functions
* 2021-08-05  Rodrigo Alvarez Garrote : sampling field of JSON map rebranded to electronics
* 2021-08-04  Marco Del Tutto : Clean up ionandscint_sbnd.fcl fcl
* 2021-08-04  Marco Del Tutto : Improve comments
* 2021-08-04  Marco Del Tutto : Revert sbnd_v02_00_withshielding gdml files to previous configuration
* 2021-08-04  Marco Del Tutto : Sparsify LArG4 trajectories, and set correct gdml for op hybrid model
* 2021-08-04  Marco Del Tutto : Separate the gdml for the optical hybrid model
* 2021-08-04  Rodrigo Alvarez Garrote : Load vector response from sbnd_data
* 2021-08-04  Rodrigo Alvarez Garrote : Branch Update
* 2021-08-03  Marco Del Tutto : Clean up standard_detsim_sbnd.fcl
* 2021-08-03  Marco Del Tutto : Remove refactored folder
* 2021-08-03  Marco Del Tutto : Add LArG4 to CMakeLists.txt
* 2021-08-03  Marco Del Tutto : Disable largeant and daq from prodsingle_sbnd.fcl
* 2021-08-03  Marco Del Tutto : Fix g4_mu_crt_filter_base.fcl to use new simulate path
* 2021-08-03  Marco Del Tutto : Create LArG4 directory in sbndcode
* 2021-08-03  Marco Del Tutto : Add configuration to run g4 with hybrid optical mode
* 2021-08-03  Marco Del Tutto : Move PDFastSim_sbnd.fcl back to LArSoftConfigurations
* 2021-08-02  Marco Del Tutto : Detsim fcls for legacy larg4 to their own legacy/ folder
* 2021-08-02  Marco Del Tutto : Add units to SensDet auxiliary to avoid warnings
* 2021-08-02  Marco Del Tutto : Adds SensDet tags to volCryostat, volFieldCage, volXArapuca, volPMT, volPDSstructure, and volTPCPlaneVert
* 2021-08-01  Marco Del Tutto : Move g4-related fcls to a g4 folder
* 2021-08-01  Marco Del Tutto : Add the hybrid model to standard_g4_sbnd.fcl (commented out for now)
* 2021-08-01  Marco Del Tutto : Add the legacy folder to cmakelists
* 2021-08-01  Marco Del Tutto : Legacy G4 files in their own folder
* 2021-07-30  Marco Del Tutto : Fix gdml file name, improve comments
* 2021-07-30  Marco Del Tutto : Changes input simulation label for optical fast simulation to ionandscint:priorSCE
* 2021-07-30  Marco Del Tutto : Adds SavePriorSCE: true, so SimEnergyDeposits are saved also before SCE
* 2021-07-30  Marco Del Tutto : Fix GDML name and clean up file
* 2021-07-30  Marco Del Tutto : Adds line with gdml file with no wires
* 2021-07-30  Marco Del Tutto : Adds new, refactored, LArG4 fcls as standard
* 2021-07-30  Marco Del Tutto : Current detsim fcl to legacy_*.fcl
* 2021-07-30  Marco Del Tutto : Current g4 fcl to legacy_*.fcl

sbndutil v09_28_01
---------------------------------------------------

* 2021-08-17  Patrick Green : Merge branch 'release/v09_28_01'
* 2021-08-17  Patrick Green : Update to v09_28_01
* 2021-08-06  Patrick Green : Merge tag 'v09_28_00' into develop
