---
layout: page
title: ReleaseNotes10040601
toc: true
---

-----------------------------------------------------------------------------
| v10.04.06.01 | 20 Mar 2025 | [ReleaseNotes](ReleaseNotes10040601.html) |
| --- | --- | --- |



sbndcode v10_04_06_01 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v10_04_06_01](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v10_04_06_01/sbndcode-v10_04_06_01.html)

Purpose
---------------------------------------------------

New features
---------------------------------------------------

Bug fixes
---------------------------------------------------

Updated dependencies
---------------------------------------------------

Supported qualifiers
---------------------------------------------------

Change List
==========================================
### Release Notes for [sbndcode] from v10_04_05 to v10_04_06_01
- PR #663: Major Update to SBND FHiCL Files
  - **Description**: This PR tries to clean up the simulation fhicls used in SBND. It does the following: - Simplifies the naming, eg, for the central value, `prodgenie_corsika_proton_rockbox_sbnd.fcl`. - Restores `standard_g4_[...]_sbnd.fcl` as the main g4 fhicl - Restores `standard_detsim_sbnd.fcl` as the main detsim fhicl - Standard fhicls now use SCE, so the `_sce` fhicls have been removed or renamed (this applies to both sim and reco configuration files) - Removes outdated detsim variation fcls - Updates the list of fhicls which are not being tested with the cmake tests (old fhicls have been removed, other have been fixed to pass the test) - Most of the `_lite` files have been removed, and the dropped products have been absorbed in the `standard` files, since in the end this is what we are running, and having `_lite` files duplicates the fhicls we need to maintain.    New Standard Workflows  Central value (BNB + Cosmics) `prodgenie_corsika_proton_rockbox_sbnd.fcl` `standard_g4_rockbox_sbnd.fcl` `standard_detsim_sbnd.fcl`  Intrinsic NuE + Cosmics `prodgenie_corsika_proton_intrnue_spill_tpc_sbnd.fcl` `standard_g4_sbnd.fcl` `standard_detsim_sbnd.fcl`  Cosmic Intime: `prodcorsika_proton_intime_sbnd.fcl` `standard_g4_intime_sbnd.fcl` `standard_detsim_sbnd.fcl`   Validation  "Checked" means that `fhicl-dump` produces the same output.  BNB + Cosmics | Old Name | New Name | Checked | | ------------- | ------------- |------------- | | `prodoverlay_corsika_cosmics_proton_genie_rockbox_sce.fcl` | `prodgenie_corsika_proton_rockbox_sbnd.fcl` | :heavy_check_mark: | | `g4_sce_dirt_filter_lite.fcl` | `standard_g4_rockbox_sbnd.fcl` | :heavy_check_mark: | | `detsim_sbnd_lite.fcl` | `standard_detsim_sbnd.fcl` | :heavy_check_mark: |  Intrinsic NuE + Cosmics | Old Name | New Name | Checked | | ------------- | ------------- |------------- | | `prodoverlay_corsika_cosmics_proton_genie_intrnue_spill_tpc_sbnd.fcl` | `prodgenie_corsika_proton_intrnue_spill_tpc_sbnd.fcl` | :heavy_check_mark: | | `g4_sce_lite.fcl` | `standard_g4_sbnd.fcl` | :heavy_check_mark: |  In-time Cosmics | Old Name | New Name | Checked | | ------------- | ------------- |------------- | | `prodcorsika_proton_intime_filter_sce.fcl` | `prodcorsika_proton_intime_sbnd.fcl` | :heavy_check_mark: (SCE is now ON, expected) | | `g4_sce_simphotontime_filter_lite.fcl` | `standard_g4_intime_sbnd.fcl` | :heavy_check_mark: |  Others | Old Name | New Name | Checked | | ------------- | ------------- |------------- | | `prodoverlay_corsika_cosmics_proton_genie_rockbox_fullosc_sce.fcl` | `prodgenie_corsika_proton_rockbox_fullosc_sbnd.fcl` | - | | `prodoverlay_corsika_cosmics_proton_genie_rockbox_intrnue_sbnd.fcl` | `prodgenie_corsika_proton_rockbox_intrnue_sbnd.fcl` | - | | `prodoverlay_corsika_cosmics_proton_genie_rockbox_sce_keep_corsika_trajectories.fcl` | `prodgenie_corsika_proton_rockbox_keep_corsika_trajectories_sbnd.fcl` | - | | `prodoverlay_corsika_cosmics_proton_genie_rockbox_sce_no_shower_rollup.fcl` | `prodgenie_corsika_proton_rockbox_no_shower_rollup_sbnd.fcl` | - | | `prodoverlay_corsika_cosmics_cmc_genie_nu_spill_cryostat_sbnd.fcl` | `prodgenie_corsika_cmc_nu_spill_cryostat_sbnd.fcl` | - | | `prodoverlay_corsika_cosmics_proton_genie_nu_spill_cryostat_sbnd.fcl` | `prodgenie_corsika_proton_nu_spill_cryostat_sbnd.fcl` | - | | `prodoverlay_corsika_cosmics_cmc_genie_nu_spill_tpc_sbnd.fcl` | `prodgenie_corsika_cmc_nu_spill_tpc_sbnd.fcl` | - | | `prodoverlay_corsika_cosmics_proton_dirtpropagation_sbnd.fcl` | `prodgibuu_corsika_proton_dirtpropagation_sbnd.fcl` | - | | `prodoverlay_corsika_cosmics_proton_genie_nu_spill_tpc_sbnd.fcl` | `prodgenie_corsika_proton_nu_spill_tpc_sbnd.fcl` | - | | `prodcorsika_proton_intime_filter.fcl` | `prodcorsika_proton_intime_sbnd.fcl` | - | | `prodcorsika_proton_intime_filter_sce_no_shower_rollup.fcl` | `prodcorsika_proton_intime_sce_no_shower_rollup_sbnd.fcl` | - | | `g4_sce_simphotontime_filter_no_shower_rollup.fcl` | `g4_intime_no_shower_rollup_sbnd.fcl` | - | | `g4_sce_simphotontime_filter_no_shower_rollup_no_mcreco.fcl` | `g4_intime_no_shower_rollup_no_mcreco_sbnd.fcl` | -| | `g4_sce_SaveCosmicMCReco.fcl` | `g4_SaveCosmicMCReco_sbnd.fcl` | - | | `g4_sce_SaveCosmicMCReco_no_shower_rollup.fcl` | `g4_SaveCosmicMCReco_no_shower_rollup_sbnd.fcl` | - | | `g4_sce_dirt_filter_no_shower_rollup.fcl` | `g4_rockbox_no_shower_rollup_sbnd.fcl` | - | | `detsim_sce.fcl` | `standard_detsim_sbnd.fcl` |  | | `prodcorsika_cosmics_cmc_eastwestcrt_mu_filter.fcl` | `prodcorsika_cosmics_cmc_eastwestcrt_mu_filter_sbnd.fcl` | | | `prodcorsika_cosmics_cmc.fcl` | `prodcorsika_cosmics_cmc_sbnd.fcl` | | | `prodcorsika_cosmics_cmc_filter.fcl` | `prodcorsika_cosmics_cmc_filter_sbnd.fcl` | | | `prodcorsika_cosmics_cmc_frontbackcrt_mu_filter.fcl` | `prodcorsika_cosmics_cmc_frontbackcrt_mu_filter_sbnd.fcl` | | | `prodcorsika_cosmics_proton_eastwestcrt_mu_filter.fcl` | `prodcorsika_cosmics_proton_eastwestcrt_mu_filter_sbnd.fcl` | | | `prodcorsika_cosmics_proton.fcl` | `prodcorsika_cosmics_proton_sbnd.fcl` | | | `prodcorsika_cosmics_proton_filter.fcl` | `prodcorsika_cosmics_proton_filter_sbnd.fcl` | | | `prodcorsika_cosmics_proton_frontbackcrt_mu_filter.fcl` | `prodcorsika_cosmics_proton_frontbackcrt_mu_filter_sbnd.fcl` | | | `prodcorsika_proton_intime_filter_sce_no_shower_rollup.fcl` | `prodcorsika_proton_intime_filter_no_shower_rollup_sbnd.fcl` | | | `prodcorsika_proton_intime_sbnd.fcl` | `prodcorsika_proton_intime_sbnd_sbnd.fcl` | | Other "minor" fhicls are not shown.  Fixes 201, fixes 649, fixes 374, fixes 287.
  - **Labels**: simulation
  - **Reviewers**: lynnt20
  - **Assignees**: marcodeltutto


sbndcode sbndcode
---------------------------------------------------

* 2025-03-20  Brinden Carlson : Merge branch 'release/v10_04_06_01'
* 2025-03-20  Brinden Carlson : Update to sbncode v10_04_06_01
* 2025-03-19  Bear Carlson : Merge pull request #663 from SBNSoftware/feature/mdeltutt_fhicl_updates
* 2025-03-17  Marco Del Tutto : Remove fcl with sce
* 2025-03-14  Marco Del Tutto : Set space charge is2DdriftSimHack to false by default, expect for the simulation services
* 2025-03-14  Marco Del Tutto : Remove spurious space
* 2025-03-06  Marco Del Tutto : Update ci fcl list
* 2025-03-05  Marco Del Tutto : Fix mistake in file name
* 2025-03-05  Marco Del Tutto : Add _sbnd to corsika only gen fcls
* 2025-03-05  Marco Del Tutto : Fix local->sequence
* 2025-03-03  Marco Del Tutto : Remove inclusion of enable_spacecharge_services_sbnd.fcl as they are now turned on by default
* 2025-03-03  Marco Del Tutto : Remove EnableSimEfield as it is not a possible conguration parameter of the SpaceCharge service
* 2025-03-03  Marco Del Tutto : Enable sbnd_spacecharge.EnableCalSpatialSCE and sbnd_spacecharge.EnableCalEfieldSCE in main spacecharge fcl.
* 2025-02-27  Marco Del Tutto : Append _sbnd to file name and fix mistakes
* 2025-02-27  Marco Del Tutto : Use @local::detsim_drops
* 2025-02-27  Marco Del Tutto : Append _sbnd to file name
* 2025-02-27  Marco Del Tutto : Append _sbnd to file name
* 2025-02-27  Marco Del Tutto : Remove sce files, sce is now on by default
* 2025-02-27  Marco Del Tutto : Append _sbnd to file name
* 2025-02-27  Marco Del Tutto : Remove sce files, sce is now on by default
* 2025-02-25  Marco Del Tutto : Tests with new fhicls
* 2025-02-25  Marco Del Tutto : Re-add trackfinderalgorithms_sbnd.fcl, deleted by mistake
* 2025-02-25  Marco Del Tutto : Reviewed and updated list of fhicls to be skipped from testing
* 2025-02-25  Marco Del Tutto : Updated fhicls used in cmake tests
* 2025-02-25  Marco Del Tutto : Update fcls used in ci testing
* 2025-02-25  Marco Del Tutto : Make fhicls dumpable
* 2025-02-25  Marco Del Tutto : Remove outdated fhicls
* 2025-02-25  Marco Del Tutto : Remove outdated fhicls
* 2025-02-25  Marco Del Tutto : Fix larg4 include
* 2025-02-25  Marco Del Tutto : Remove outdate include
* 2025-02-25  Marco Del Tutto : Fix spelling mistake
* 2025-02-25  Marco Del Tutto : Fix wrong include
* 2025-02-25  Marco Del Tutto : Remove outdated detsim variation fcls
* 2025-02-25  Marco Del Tutto : Update fcl README file
* 2025-02-25  Marco Del Tutto : Better organize optical g4 fcls
* 2025-02-25  Marco Del Tutto : Better organization
* 2025-02-25  Marco Del Tutto : Reorganized fcl files in subdirectories, also updated all rhl the recomb fcls
* 2025-02-25  Marco Del Tutto : Reorganized fcl files in subdirectories, also updated all rhl the recomb fcls
* 2025-02-25  Marco Del Tutto : Rename overlay folder to genie_corsika
* 2025-02-25  Marco Del Tutto : Rename overlay folder to genie_corsika
* 2025-02-25  Marco Del Tutto : Update readme
* 2025-02-25  Marco Del Tutto : Forgot one drop
* 2025-02-25  Marco Del Tutto : Reinstate standard_detsim_sbnd.fcl as the detsim fhicl
* 2025-02-25  Marco Del Tutto : Update corsika intime fhicls
* 2025-02-25  Marco Del Tutto : Move standard_g4_intime_sbnd.fcl one directory up
* 2025-02-25  Marco Del Tutto : Update g4 fhicls
* 2025-02-25  Marco Del Tutto : Update intime g4 fhicls
* 2025-02-25  Marco Del Tutto : Use standard_g4_rockbox_sbnd.fcl for rockbox
* 2025-02-25  Marco Del Tutto : Rename bnb plus cosmics fhicls
* 2025-02-25  Marco Del Tutto : Inverte dependecies of bnb cosmic fhicls
* 2025-02-25  Marco Del Tutto : Remove old configs
* 2025-02-25  Marco Del Tutto : Rename rockbox fhicls
* 2025-02-25  Marco Del Tutto : Spacecharge on in main services fhicl
* 2025-03-18  Bear Carlson : Update to sbncode v10_04_06
* 2025-03-11  Brinden Carlson : Merge tag 'v10_04_05' into develop

sbndutil 
---------------------------------------------------

* 2025-03-20  Brinden Carlson : Merge tag 'v10_04_06_01' into develop
* 2025-03-20  Brinden Carlson : Merge branch 'release/v10_04_06_01'
* 2025-03-20  Brinden Carlson : Update to sbncode v10_04_06_01
* 2025-03-11  Brinden Carlson : Merge tag 'v10_04_05' into develop
