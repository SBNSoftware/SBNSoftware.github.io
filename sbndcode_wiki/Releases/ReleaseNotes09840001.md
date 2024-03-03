---
layout: page
title: ReleaseNotes09840001
toc: true
---

-----------------------------------------------------------------------------
| v09.84.00.01 | 03 Mar 2024 | [ReleaseNotes](ReleaseNotes09840001.html) |
| --- | --- | --- |



sbndcode v09_84_00_01 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_84_00_01](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_84_00_01/sbndcode-v09_84_00_01.html)

Purpose
---------------------------------------------------
Weekly release

New features
---------------------------------------------------
* SBNSoftware/sbndcode#416: Using WireCell in standard fcl workflow by default
  * This PR will fully integrate the WireCell 2D TPC Simulation/Signal Processing chain into SBND's "standard" fcl workflow. With this updated workflow, there is no longer a separate WireCell fcl/stage; the WireCell stage is merged into the standard detsim stage.
  * Note that the drift simulation, TPC electronics simulation, and deconvolution all happen within the detsim stage now. Previously the 1d drift sim (simdrift) was run in g4, the electronics sim (daq) was run in detsim, and 1d deconvolution (caldata) was run in reco1. 
* SBNSoftware/sbndcode#419: Update the bunch spacing in GENIE and MeVPrtl using number measured by MicroBooNE#419
* SBNSoftware/sbndcode#415: Move bnb_common config fcl to sbndcode
  * Following the update of BNB flux files for HNL and other BSM models generation used in MeVPrtl, I'm moving the common config file for the BNB flux to sbncode where ICARUS people can also use it.
* SBNSoftware/sbndcode#417: Systtools Implementation for SBND
  * Implementation of systtools in the sbnd workflow
  * Replaces instances of genieweight (the old implementation of GENIE ReWeight using SBNEventWeight) with systtools.

Bug fixes
---------------------------------------------------
* SBNSoftware/sbndcode#416 and SBNSoftware/sbndcode#411: SCE bug fix for the 2d drift simulation

Updated dependencies
---------------------------------------------------
* sbncode v09_84_00_01
* larsoft v09_84_00
* art v3_12_01

Supported qualifiers
---------------------------------------------------
* e26:prof
* e26:debug

Additional comments
---------------------------------------------------
With SBNSoftware/sbndcode#416, the WireCell 2D simulation and reconstruction is adopted as the default SBND workflow. The core fhicl workflow (for BNB + Dirt + Cosmics) is the following:
* prodoverlay_corsika_cosmics_proton_genie_rockbox_sce.fcl
* g4_sce_dirt_filter_lite.fcl (does not include TPC electron drift simulation)
* detsim_sce_lite.fcl (includes TPC drift simulation, TPC electronics simulation, and signal processing)
* reco1_sce_lite.fcl
* reco2_sce.fcl

Change List
==========================================

sbndcode sbndcode
---------------------------------------------------

* 2024-03-03  Fran Nicolas : Merge branch 'release/v09_84_00_01'
* 2024-03-03  Fran Nicolas : Update to larsoft v09_84_00
* 2024-03-01  Francisco Javier Nicolás-Arnaldos : Match current tag of sbncode
* 2024-03-01  Francisco Javier Nicolás-Arnaldos : Merge pull request #417 from SBNSoftware/feature/hlay_updated_systtools_fcls
* 2024-03-01  Francisco Javier Nicolás-Arnaldos : Merge branch 'develop' into feature/hlay_updated_systtools_fcls
* 2024-03-01  Francisco Javier Nicolás-Arnaldos : Merge pull request #416 from SBNSoftware/feature/lynnt_wirecell_cfgs
* 2024-02-28  Francisco Javier Nicolás-Arnaldos : Merge pull request #419 from SBNSoftware/update/BNB_bunch_spacing_GENIE
* 2024-02-27  lynnt20 : add an additional ionandscint merge call to save priorSCE in addition to w/ SCE
* 2024-02-27  VCLanNguyen : Update genie_sbnd.fcl
* 2024-02-27  VCLanNguyen : Update sbndcode/JobConfigurations/standard/gen/MeVPrtl/hnl_config.fcl
* 2024-02-27  lynnt20 : save ionandscint with sce in the in-time g4 fcl
* 2024-02-27  VCLanNguyen : Update hnl_config.fcl with BNB spacing measured by uBooNE
* 2024-02-27  VCLanNguyen : Update the bunch spacing in genie_sbnd.fcl using number measured by uBooNE
* 2024-02-26  lynnt20 : Merge branch 'feature/lynnt_wirecell_cfgs' of https://github.com/SBNSoftware/sbndcode into feature/lynnt_wirecell_cfgs
* 2024-02-26  lynnt20 : update unit tests (now that WireCell 2dsim is in all standard fcls)
* 2024-02-26  lynnt20 : add documentation about hacky fix to SpaceCharge source code
* 2024-02-26  Henry Lay : Update fcl_file_checks.list
* 2024-02-26  lynnt20 : add DepoFluxWriter jsonnet, and change all corresponding fcls to use DepoFluxWriter as default - this is necessary for ML workflow, DepoFluxWriter has a configruable to allow saving orig_track_id from SimEnergyDeposits in SimChannel - DepoFluxWriter validated for SBND in larwirecell PR #41
* 2024-02-26  Francisco Javier Nicolás-Arnaldos : Merge pull request #415 from SBNSoftware/feature/rodrigoa_BNB_HNL_update
* 2024-02-23  lynnt20 : updating downstream detector variation fcls to standard 2d sim workflow
* 2024-02-23  lynnt20 : updating a few overlooked sce fcls
* 2024-02-23  lynnt20 : add note to document sce service for 2d drift sim
* 2024-02-23  lynnt20 : remove duplicate sce g4 fcls
* 2024-02-23  lynnt20 : add 2d sce to g4 fcls
* 2024-02-23  lynnt20 : add 2d sce to gen fcls (with larg4)
* 2024-02-23  lynnt20 : remove simdrift and mcreco from g4 filter fcls
* 2024-02-23  lynnt20 : add 2d sce to detsim fcls
* 2024-02-23  Henry Lay : Update CI fcl to allow use of 'test' systtools cfg with just 5 univs
* 2024-02-23  Henry Lay : Point CI fcl at correct fcl
* 2024-02-23  Henry Lay : Remove pointless instance of genieweight
* 2024-02-23  Henry Lay : Replace usage of geniewgt with systtools and rename files respectively
* 2024-02-23  Henry Lay : Replace geniewgt with systtools in main CAF fcl
* 2024-02-23  jzennamo : Added code and fcl flag to address 2D-drift simulation space charge fix/hack
* 2024-02-21  lynnt20 : update labels in reco (caloskim) and cafmaker for 2dsim
* 2024-02-21  Fran Nicolas : Merge tag 'v09_83_01' into develop
* 2024-02-20  lynnt20 : comment out fashit in reco1
* 2024-02-19  lynnt20 : comment out simdrift from g4 dirt filter fcl
* 2024-02-19  lynnt20 : remove detsim_*_wc.fcl from 2023B production
* 2024-02-19  lynnt20 : correct the README file type to markdown
* 2024-02-19  lynnt20 : updating commissioning fcls to use wirecell raw digits
* 2024-02-19  lynnt20 : update JobConfigurations README
* 2024-02-19  lynnt20 : remove wirecell-specific fcls and update recomb fcls
* 2024-02-19  Rodrigo Alvarez Garrote : dedicated file for bnb_kaon_sbnd and generic one for bnb flux in sbncode
* 2024-02-19  lynnt20 : remove typo in documentation
* 2024-02-19  lynnt20 : adding wirecell 2D sim/sp to the standard fcl workflow
* 2024-02-19  Rodrigo Alvarez Garrote : moved bnb_common fcl to sbncode

sbndutil
---------------------------------------------------

* 2024-03-03  Fran Nicolas : Merge tag 'v09_84_00_01' into develop
* 2024-03-03  Fran Nicolas : Merge branch 'release/v09_84_00_01'
* 2024-03-03  Fran Nicolas : Update to larsoft v09_84_00
* 2024-02-21  Fran Nicolas : Merge tag 'v09_83_01' into develop
