---
layout: page
title: ReleaseNotes09880002
toc: true
---

-----------------------------------------------------------------------------
| v09.88.00.02 | 04 Apr 2024 | [ReleaseNotes](ReleaseNotes09880002.html) |
| --- | --- | --- |



sbndcode v09_88_00_02 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_88_00_02](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_88_00_02/sbndcode-v09_88_00_02.html)

Purpose
---------------------------------------------------
SBN2024A production release

New features
---------------------------------------------------
* PRs regarding the TPC channel mapping:
  * SBNSoftware/sbndcode#426: TPC channel map inverting the order of FEMCh numbers in groups of 8
  * SBNSoftware/sbndcode#431: TPC Channel map fixes for three FEMBs on the Souteast side, and invert ordering of wires on the top FEMBs
  * SBNSoftware/sbndcode#432: Accommodate fiber swapped March 17 to enable half of the shorted FEM to be read out#432
  * SBNSoftware/sbndcode#433: Fix unintended mirroring of extra U and V channels
* New/updated fhicl-files:
  * SBNSoftware/sbndcode#440: evd_sbnd_data.fcl with drawing options for raw data drawing
  * SBNSoftware/sbndcode#449: Detector Variation Fcls For Calibration Production
  * SBNSoftware/sbndcode#450: G4 fcl using Ellipsoidal Modified Box Recombination Model for 2024A Calibration Production
  * SBNSoftware/sbndcode#429: Add Signal Processing only fcl + configuration
* SBNSoftware/sbndcode#443: Online monitoring event display
* SBNSoftware/sbndcode#441: Add new functions in geometry helper
* SBNSoftware/sbndcode#446: Updated flux for dirt simulation
* SBNSoftware/sbndcode#423: Offline PMT Decoder
* SBNSoftware/sbndcode#422: Adding CRT and PDS info in calib ntuple 
* SBNSoftware/sbndcode#435: Include APA mesh atteenuation factor in the PMT efficiencies
* SBNSoftware/sbndcode#421: Machine learning reco workflow for SBND
* Others:
  * SBNSoftware/sbndcode#439: TPC Decoder invalid fragments -> warning instead of exception
  * SBNSoftware/sbndcode#425: Rename Calibration directory to TPC1DSignalProcessing

Bug fixes
---------------------------------------------------
* SBNSoftware/sbndcode#442: Patch to Trigger Metrics Object

Updated dependencies
---------------------------------------------------
* sbncode v09_88_00_02
* larsoft v09_88_00
* art v3_14_04
* cetmodules v3_24_01	

Supported qualifiers
---------------------------------------------------
* e26:prof
* e26:debug

Change List
==========================================

sbndcode sbndcode
---------------------------------------------------

* 2024-04-04  Fran Nicolas : Merge branch 'release/v09_88_00_02'
* 2024-04-04  Fran Nicolas : Update to larsoft v09_88_00
* 2024-04-04  Francisco Javier Nicolás-Arnaldos : Merge pull request #446 from SBNSoftware/feature/lnguyen_update_neutrino_dirt_path
* 2024-04-04  Francisco Javier Nicolás-Arnaldos : Merge pull request #450 from SBNSoftware/feature/munjung-recomb_ellipsmodbox_fcl
* 2024-04-02  Francisco Javier Nicolás-Arnaldos : Merge pull request #449 from SBNSoftware/lnguyen/detvar_fcl_production
* 2024-03-29  Mun Jung Jung : ellips mod box recomb model fcl
* 2024-03-28  Vu Chi Lan Nguyen : keep simplemerge products after reco1
* 2024-03-28  Vu Chi Lan Nguyen : keep simple merge product for scrubbing
* 2024-03-28  Vu Chi Lan Nguyen : add missing fcl
* 2024-03-28  Vu Chi Lan Nguyen : detector variation fcl
* 2024-03-26  VCLanNguyen : Merge branch 'develop' into feature/lnguyen_update_neutrino_dirt_path
* 2024-03-26  Vu Chi Lan Nguyen : update dirt flux path
* 2024-03-26  Francisco Javier Nicolás-Arnaldos : Merge pull request #443 from yangtj207/feature/tjyang_omevd
* 2024-03-26  Francisco Javier Nicolás-Arnaldos : Merge branch 'develop' into feature/tjyang_omevd
* 2024-03-26  Francisco Javier Nicolás-Arnaldos : Merge pull request #445 from SBNSoftware/bugfix/bearc_reco_fcl_order
* 2024-03-26  Francisco Javier Nicolás-Arnaldos : Add missing BEGIN_PROLOG
* 2024-03-26  Francisco Javier Nicolás-Arnaldos : Merge pull request #444 from SBNSoftware/bugfix/bearc_mpvmpr
* 2024-03-26  Francisco Javier Nicolás-Arnaldos : Merge pull request #441 from yangtj207/feature/tjyang_geohelper
* 2024-03-25  Bear Carlson : Reorder reco1 fcls
* 2024-03-25  Bear Carlson : Create CMakeLists.txt
* 2024-03-25  Bear Carlson : Update CMakeLists.txt
* 2024-03-24  Tingjun Yang : Merge remote-tracking branch 'upstream/develop' into feature/tjyang_omevd
* 2024-03-24  Tingjun Yang : Add a module to make event displays for OM.
* 2024-03-24  Francisco Javier Nicolás-Arnaldos : Merge pull request #421 from SBNSoftware/feature/bearc_mlreco_wc_cfg
* 2024-03-24  Francisco Javier Nicolás-Arnaldos : Merge pull request #442 from SBNSoftware/feature/lynnt_pmtsofttrig_MCP2024A
* 2024-03-24  Francisco Javier Nicolás-Arnaldos : Merge pull request #440 from SBNSoftware/trj_evd_sbnd_data_mar20_2024
* 2024-03-24  Francisco Javier Nicolás-Arnaldos : Merge pull request #439 from SBNSoftware/trj_tpcdecoder_exceptiontowarning_mar20_2024
* 2024-03-23  lynnt20 : add trigger object from sbndaq-artdaq-core in to cmakeslist
* 2024-03-23  Tingjun Yang : Merge remote-tracking branch 'upstream/develop' into feature/tjyang_geohelper
* 2024-03-23  Tingjun Yang : Add a function to calculate the intersection point of two wires.
* 2024-03-23  Tingjun Yang : Add an analyzer module to analyze channel ID data.
* 2024-03-22  Francisco Javier Nicolás-Arnaldos : Update product_deps for larsoft v09_87_00
* 2024-03-22  Francisco Javier Nicolás-Arnaldos : Update to larsoft v09_87_00
* 2024-03-22  Francisco Javier Nicolás-Arnaldos : Merge pull request #430 from SBNSoftware/feature/lynnt_pmtsofttrig_MCP2024A
* 2024-03-22  Francisco Javier Nicolás-Arnaldos : Merge branch 'develop' into feature/bearc_mlreco_wc_cfg
* 2024-03-22  Francisco Javier Nicolás-Arnaldos : Merge pull request #435 from SBNSoftware/feature/pmteff_withapamesh
* 2024-03-22  Francisco Javier Nicolás-Arnaldos : Merge pull request #422 from SBNSoftware/feature/sungbinoh_crt_pds_for_calib
* 2024-03-20  Thomas Junk : drawing options for raw data drawing
* 2024-03-20  Thomas Junk : change exception throw to a warning and skip the decoding on Tingjun's request
* 2024-03-20  Fran Nicolas : typo
* 2024-03-20  Fran Nicolas : include attenuation due to APA mesh in the PMT efficiencies
* 2024-03-20  Francisco Javier Nicolás-Arnaldos : Merge pull request #433 from SBNSoftware/trj_tpcchannelmap_19mar2024
* 2024-03-19  Tom Junk : fix an over-zealous flipping of too many U and V channel assignements -- only 26 FEMBs on top per side
* 2024-03-18  Francisco Javier Nicolás-Arnaldos : Merge pull request #432 from SBNSoftware/trj_tpcchannelmap_17mar2024
* 2024-03-17  Tom Junk : Accommodate fiber swapped March 17 to enable half of the shorted FEMB to be read out
* 2024-03-17  Francisco Javier Nicolás-Arnaldos : Merge pull request #431 from SBNSoftware/trj_tpcchanmap_mar15_2024
* 2024-03-16  Francisco Javier Nicolás-Arnaldos : Merge pull request #429 from SBNSoftware/feature/lynnt_wirecell_cfgs
* 2024-03-15  Tom Junk : fix three FEMB locations on SE V and invert ordering of wires in top FEMBs
* 2024-03-15  lynnt20 : remove sbnobj trigger metrics objects and replace with objects in sbndaq-artdaq-core
* 2024-03-14  lynnt20 : add documentation block to sp fcl
* 2024-03-14  lynnt20 : change prolog fcl to have standard structure, which is inherited simsp + sp-only configs
* 2024-03-14  lynnt20 : remove sp-specific config fcl
* 2024-03-14  lynnt20 : move wc jsonnet configs around to be consistent/readable
* 2024-03-14  lynnt20 : Merge branch 'develop' into feature/lynnt_wirecell_cfgs
* 2024-03-14  lynnt20 : remove extra detsim fcls
* 2024-03-14  lynnt20 : first commit to add signal-processing only fcl
* 2024-03-13  Fran Nicolas : fhicl-dump is not happy with these includes, and we don't need them
* 2024-03-13  Francisco Javier Nicolás-Arnaldos : Merge pull request #424 from SBNSoftware/fjnicolas-patch-1
* 2024-03-13  Francisco Javier Nicolás-Arnaldos : Merge branch 'feature/fnicolas_art3.14.04' into fjnicolas-patch-1
* 2024-03-13  Fran Nicolas : Update to art 3.14
* 2024-03-13  Francisco Javier Nicolás-Arnaldos : Merge pull request #426 from SBNSoftware/trj_tpcchanmap_mar11_2024
* 2024-03-12  linyan-w : Update sbndcode/JobConfigurations/standard/reco/reco2_sce.fcl
* 2024-03-12  linyan-w : Update sbndcode/JobConfigurations/standard/reco/reco2_sce.fcl
* 2024-03-12  Linyan Wan : Clock etc
* 2024-03-12  Linyan Wan : Move crt config out of reco_sbnd
* 2024-03-12  Linyan Wan : Re-organize CRT fcl
* 2024-03-12  Linyan Wan : Re-organize CRT fcl
* 2024-03-12  Linyan Wan : Move PDS (calibration) to Calibration
* 2024-03-12  Brinden Carlson : Update to using cluster3dsbn which runs only spacepoint producer and reduces verbosity
* 2024-03-12  Brinden Carlson : Update to using cluster3dsbn which runs only spacepoint producer and reduces verbosity
* 2024-03-12  linyan-w : Merge branch 'develop' into feature/sungbinoh_crt_pds_for_calib
* 2024-03-12  Linyan Wan : Remove some comments to tidy up
* 2024-03-12  Francisco Javier Nicolás-Arnaldos : Merge pull request #425 from SBNSoftware/feature/fnicolas_tpc1d
* 2024-03-12  Francisco Javier Nicolás-Arnaldos : Merge pull request #423 from SBNSoftware/feature/lynnt_pmt_decoder
* 2024-03-11  Linyan Wan : Add comments to explain the CRT variables
* 2024-03-11  Linyan Wan : Merge branch 'feature/sungbinoh_crt_pds_for_calib' of https://github.com/SBNSoftware/sbndcode into feature/sungbinoh_crt_pds_for_calib
* 2024-03-11  Linyan Wan : Bug fix for the last commit...
* 2024-03-11  Thomas Junk : TPC channel map inverting the order of FEMCh numbers in groups of 8 -- as seen with Channel ID mode data
* 2024-03-11  Linyan Wan : Re-organize the calibration skimmer fcls
* 2024-03-11  Linyan Wan : Re-organize the fcl files for calibration skimmers
* 2024-03-11  Fran Nicolas : leave Calibration directory empty for future code developments
* 2024-03-11  Fran Nicolas : Rename Calibration directory to TPC1DSignalProcessing
* 2024-03-11  lynnt20 : create new timing variable so the default configured one does not get overwritten
* 2024-03-11  lynnt20 : updated channel map from docdb33668-v6
* 2024-03-07  Francisco Javier Nicolás-Arnaldos : Merge branch 'develop' into feature/bearc_mlreco_wc_cfg
* 2024-03-06  Francisco Javier Nicolás-Arnaldos : Merge pull request #412 from SBNSoftware/feature/rodrigoa_newPDEs
* 2024-03-04  Bear Carlson : Update g4_sce_simphotontime_filter.fcl
* 2024-03-04  Bear Carlson : Update reco_drops.fcl
* 2024-03-03  Fran Nicolas : Merge tag 'v09_84_00_01' into develop
* 2024-03-01  Bear Carlson : Create reco1_sce_mpvmpr_lite.fcl
* 2024-03-01  Bear Carlson : Update README.md
* 2024-03-01  Francisco Javier Nicolás-Arnaldos : Merge branch 'develop' into feature/sungbinoh_crt_pds_for_calib
* 2024-03-01  Bear Carlson : Update prodgenie_rockbox_sbnd.fcl
* 2024-03-01  Bear Carlson : Delete sbndcode/JobConfigurations/standard/reco/reco1_sce_no_overlay_lite.fcl
* 2024-03-01  Bear Carlson : Update prodoverlay_corsika_cosmics_proton_genie_rockbox_sbnd.fcl
* 2024-03-01  Bear Carlson : Update g4_sce_simphotontime_filter.fcl
* 2024-03-01  Bear Carlson : Update g4_simphotontime_filter.fcl
* 2024-03-01  Bear Carlson : Update g4_sce_simphotontime_filter.fcl
* 2024-03-01  Francisco Javier Nicolás-Arnaldos : Update sbnd_data for new CNN weights (sbncode PR440)
* 2024-03-01  Bear Carlson : Update g4_no_opticalsim_michel_filter.fcl
* 2024-03-01  Bear Carlson : Update reco_sbnd.fcl
* 2024-03-01  Bear Carlson : Updated to include sbnd simple merge
* 2024-03-01  Bear Carlson : Update standard_g4_sbnd.fcl
* 2024-03-01  Bear Carlson : No need for reco1 changes
* 2024-03-01  Bear Carlson : No need for a separate reco1 file
* 2024-03-01  Bear Carlson : No need for a separate reco1 file
* 2024-03-01  Bear Carlson : No need for a separate reco1 file
* 2024-03-01  Bear Carlson : No need for a separate reco1 file
* 2024-03-01  Bear Carlson : No need for a separate reco1 file
* 2024-03-01  Francisco Javier Nicolás-Arnaldos : Merge branch 'develop' into feature/rodrigoa_newPDEs
* 2024-03-01  Francisco Javier Nicolás-Arnaldos : Merge branch 'develop' into feature/bearc_mlreco_wc_cfg
* 2024-02-29  Bear Carlson : Fix track ID offsets to be compatible with all samples
* 2024-02-29  lynnt20 : add fcl to specify not saving the FTRIG in an output waveform
* 2024-02-29  lynnt20 : fix cmakelists
* 2024-02-29  lynnt20 : revert unneeded changes
* 2024-02-29  lynnt20 : Merge tag 'v09_83_01' into feature/lynnt_pmt_decoder
* 2024-02-29  lynnt20 : configure which timing system, fragment ID, overall cleanup - fcl parameter `timing_type` to choose which timing subsystem to use for the event trigger time - add fcl configs for PTB inputs - remove unused variables - add debug verbosity levels - add the fragID offset as a fcl config - add check for # of channels in the fragment, should be protected if ch15 is missing
* 2024-02-29  Bear Carlson : Not going to change these
* 2024-02-29  Bear Carlson : Update g4_sce_simphotontime_filter_no_shower_rollup_no_mcreco.fcl
* 2024-02-29  Bear Carlson : Update g4_sce_simphotontime_filter_no_shower_rollup_no_mcreco.fcl
* 2024-02-29  Bear Carlson : Not going to update these
* 2024-02-29  Bear Carlson : Not going to update these
* 2024-02-29  Bear Carlson : Not going to update these
* 2024-02-29  Bear Carlson : Not going to update these
* 2024-02-29  Bear Carlson : Not going to update these
* 2024-02-29  Bear Carlson : Not going to update these
* 2024-02-29  Bear Carlson : Delete sbndcode/JobConfigurations/standard/detsim/detsim_sce_overlay_lite.fcl
* 2024-02-29  Bear Carlson : Check all possible trackID offsets
* 2024-02-29  Bear Carlson : Detsim now works with all sources
* 2024-02-28  sungbinoh : A commit to add CRT and PDS info in calib ntuple using updated reco2_sce.fcl and additional modules.
* 2024-02-28  Brinden Carlson : update reco1 stage
* 2024-02-28  Brinden Carlson : update reco1 stage
* 2024-02-28  Rodrigo Alvarez Garrote : reference docdb entry with measures summary
* 2024-02-28  Rodrigo Alvarez Garrote : Updated wrong comments
* 2024-02-27  Brinden Carlson : update fcls to support mlreco workflow
* 2024-02-27  Brinden Carlson : update fcls to support mlreco workflow
* 2024-02-27  Brinden Carlson : update fcls to support mlreco workflow
* 2024-02-27  Brinden Carlson : updates
* 2024-02-27  Brinden Carlson : updated fcls to be compatible with mlreco
* 2024-02-27  Rodrigo Alvarez Garrote : not 2.18 but 2.19
* 2024-02-19  Rodrigo Alvarez Garrote : updated CT value for SensL (ARARA) arapucas
* 2024-02-19  Rodrigo Alvarez Garrote : Updated efficiencies taking into account APA  mesh transparency and CPA area factor (vis light only)
* 2024-02-11  Rodrigo Alvarez Garrote : New Coated XAs PDEs to VUV and visible light
* 2024-01-25  lynnt20 : add fcl parameter for hardcoded ch mapping, use fragID instead of boardID
* 2024-01-25  lynnt20 : add PTB decoder, new helper functions, output correct waveforms, new configs
* 2024-01-04  lynnt20 : Merge remote-tracking branch 'tom_fork/trj_triggerdecoder_nov2023' into feature/lynnt_pmt_decoder
* 2024-01-04  lynnt20 : Merge tag 'v09_79_00' into feature/lynnt_pmt_decoder
* 2024-01-04  lynnt20 : read spectdc, configure inputs, stdout tick info - add fcl for specifying boards to ignore - specify nominal waveform length - specify spectdc input, add to pmt decoder chain
* 2023-11-15  lynnt20 : make build happy
* 2023-11-15  lynnt20 : Merge tag 'tags/v09_78_04' into feature/lynnt_pmt_decoder
* 2023-08-21  Henry Lay : Add TDC decoder from commit b15091e
* 2023-11-15  Lynn Tung : change from config table to fhicl parameter set
* 2023-11-15  Lynn Tung : add saving histograms  for combined waveforms
* 2023-11-09  Lynn Tung : working version of extended trigger feature
* 2023-08-27  lynnt-uchicago : first commit

sbndutil
---------------------------------------------------

* 2024-04-04  Fran Nicolas : Merge tag 'v09_88_00_02' into develop
* 2024-04-04  Fran Nicolas : Merge branch 'release/v09_88_00_02'
* 2024-04-04  Fran Nicolas : Update to larsoft v09_88_00
* 2024-03-22  Francisco Javier Nicolás-Arnaldos : Merge pull request #13 from SBNSoftware/feature/fnicolas_art3.14.04
* 2024-03-22  Francisco Javier Nicolás-Arnaldos : Update CMakeLists.txt
* 2024-03-13  Fran Nicolas : Update to art 3.14
* 2024-03-03  Fran Nicolas : Merge tag 'v09_84_00_01' into develop
