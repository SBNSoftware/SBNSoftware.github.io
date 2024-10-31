---
layout: page
title: ReleaseNotes099301
toc: true
---

-----------------------------------------------------------------------------
| v09.93.01 | 31 Oct 2024 | [ReleaseNotes](ReleaseNotes099301.html) |
| --- | --- | --- |



sbndcode v09_93_01 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_93_01](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_93_01/sbndcode-v09_93_01.html)

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

sbndcode sbndcode
---------------------------------------------------

* 2024-10-31  Brinden Carlson : Merge branch 'release/v09_93_01'
* 2024-10-31  Brinden Carlson : Update to larsoft v09_93_01
* 2024-10-31  Bear Carlson : Merge pull request #542 from SBNSoftware/feature/twester_prod_fcls
* 2024-10-31  Bear Carlson : Merge branch 'develop' into feature/twester_prod_fcls
* 2024-10-31  Bear Carlson : Merge pull request #535 from SBNSoftware/trj_update_timesize_oct14_2024
* 2024-10-31  Bear Carlson : Merge branch 'develop' into trj_update_timesize_oct14_2024
* 2024-10-31  Bear Carlson : Merge pull request #533 from SBNSoftware/bugfix/pgreen_hitdumper_fix
* 2024-10-31  Bear Carlson : Merge branch 'develop' into bugfix/pgreen_hitdumper_fix
* 2024-10-31  Bear Carlson : Merge pull request #531 from SBNSoftware/feature/bearc_cluster3dfix
* 2024-10-31  Bear Carlson : Merge branch 'develop' into feature/bearc_cluster3dfix
* 2024-10-31  Bear Carlson : Merge pull request #528 from SBNSoftware/dbrailsf_reco2fclorg_rebased
* 2024-10-31  Bear Carlson : Merge branch 'develop' into dbrailsf_reco2fclorg_rebased
* 2024-10-31  Bear Carlson : Merge pull request #522 from SBNSoftware/feature/munjung-data_caf
* 2024-10-31  Bear Carlson : Merge branch 'develop' into feature/munjung-data_caf
* 2024-10-30  Bear Carlson : Merge branch 'develop' into dbrailsf_reco2fclorg_rebased
* 2024-10-30  Bear Carlson : Merge branch 'develop' into feature/twester_prod_fcls
* 2024-10-30  Bear Carlson : Merge branch 'develop' into trj_update_timesize_oct14_2024
* 2024-10-30  Bear Carlson : Merge branch 'develop' into bugfix/pgreen_hitdumper_fix
* 2024-10-30  Bear Carlson : Update fast_simulation_reconstruction_test_muons.sh
* 2024-10-30  Bear Carlson : Update fast_simulation_reconstruction_test_electrons.sh
* 2024-10-30  Bear Carlson : Merge pull request #516 from knoepfel/summed-adc-interface
* 2024-10-30  Dom Brailsford : Merge branch 'develop' into dbrailsf_reco2fclorg_rebased
* 2024-10-30  Dom Brailsford : Rename comm fcl to drop 'sce' as its now assumed standard
* 2024-10-30  Dom Brailsford : Mention SCE being enabled as part of the standard reco2 workflow
* 2024-10-23  Bear Carlson : Merge branch 'feature/bearc_cluster3d_hitfix_combine' into feature/bearc_cluster3dfix
* 2024-10-23  Bear Carlson : Merge branch 'develop' into summed-adc-interface
* 2024-10-22  Thomas Wester : fcl to run all the decoders
* 2024-10-22  Bear Carlson : Update ci_tests.cfg
* 2024-10-21  Bear Carlson : Merge pull request #530 from SBNSoftware/feature/bearc_cilimitfix
* 2024-10-21  Bear Carlson : Merge branch 'develop' into feature/bearc_cilimitfix
* 2024-10-21  Bear Carlson : Update HitAnalysisAlg.cpp
* 2024-10-17  Bear Carlson : Update drops_reco1.fcl
* 2024-10-17  Bear Carlson : Merge pull request #526 from SBNSoftware/feature/hlay_crt_offline_pr
* 2024-10-17  Bear Carlson : Merge branch 'develop' into feature/hlay_crt_offline_pr
* 2024-10-17  Bear Carlson : Merge pull request #525 from SBNSoftware/feature/acastill_ophitfinder_raw_data
* 2024-10-17  Bear Carlson : Merge branch 'develop' into feature/acastill_ophitfinder_raw_data
* 2024-10-17  Bear Carlson : Merge pull request #523 from SBNSoftware/feature/bearc_pgunT0
* 2024-10-17  Bear Carlson : Merge branch 'develop' into feature/bearc_pgunT0
* 2024-10-17  Bear Carlson : Merge pull request #490 from SBNSoftware/feature/trj_ntb_decoder
* 2024-10-15  Mun Jung Jung : filename tag to caf ttree
* 2024-10-14  Thomas Junk : update timesize (the size of the frame in samples minus one) to 1143 per communication with Georgia and Seokju
* 2024-10-14  Patrick Green : fix for running without crt strip hits present
* 2024-10-11  Bear Carlson : Save only space points
* 2024-10-10  Brinden Carlson : Updated CI cpu and memory ranges
* 2024-10-10  Brinden Carlson : Update CI cpu and memory limits
* 2024-10-10  Bear Carlson : Merge branch 'develop' into feature/trj_ntb_decoder
* 2024-10-10  Henry Lay : Merge pull request #527 from SBNSoftware/feature/hlay_crt_offline_quick_fix
* 2024-10-04  Dom Brailsford : Remove reco2_sce.fcl
* 2024-10-04  Dom Brailsford : Update the readme
* 2024-10-04  Dom Brailsford : Update all fcls to use standard_reco2_sbnd.fcl again
* 2024-10-04  Dom Brailsford : Update reco2_data.fcl to use standard_reco2_sbnd.fcl
* 2024-10-04  Dom Brailsford : Convert reco2 to the new format
* 2024-10-04  Dom Brailsford : Add a nominal reco2 drops. No additional drops are currently needed for reco2, but add the infrastructure now anyway...
* 2024-10-04  Dom Brailsford : Create a workflow fcl for reco2, mirroring the setup for reco1
* 2024-10-01  Brinden Carlson : Merge tag 'v09_91_02_02p01' into develop
* 2024-10-01  Henry Lay : Fix for function used in visualisation of channel 0
* 2024-09-30  Henry Lay : Correct upper south wall vertical modules channel inversion - thanks Rachel & Andy
* 2024-09-30  Henry Lay : Add copy of channel map v6
* 2024-09-30  Henry Lay : Remove debug statement
* 2024-09-30  Henry Lay : Fix 'top of module' discrepancy - thanks Andy & Rachel
* 2024-10-01  asanchezcastillo : Merge branch 'develop' into feature/acastill_ophitfinder_raw_data
* 2024-09-27  Alejandro Sánchez Castillo : Update PMT trigger values to run on raw waveforms
* 2024-09-26  Henry Lay : Add CRT reconstruction to standard workflow
* 2024-09-26  Henry Lay : Mistake from the conflict resolution
* 2024-09-26  Henry Lay : Required HitDumper changes to keep both CRT times
* 2024-09-26  Henry Lay : Merge branch 'develop' into feature/hlay_crt_offline_pr
* 2024-09-26  Bear Carlson : Merge pull request #500 from SBNSoftware/feature/hlay_crt_offline_misc
* 2024-09-26  Bear Carlson : Merge pull request #501 from SBNSoftware/feature/hlay_crt_offline_ana
* 2024-09-26  Bear Carlson : Merge pull request #503 from SBNSoftware/feature/hlay_crt_offline_reco
* 2024-09-26  Henry Lay : Merge branch 'feature/hlay_crt_offline_pr' into feature/hlay_crt_offline_misc
* 2024-09-26  Henry Lay : Merge branch 'feature/hlay_crt_offline_pr' into feature/hlay_crt_offline_ana
* 2024-09-26  Henry Lay : Merge branch 'feature/hlay_crt_offline_pr' into feature/hlay_crt_offline_reco
* 2024-09-26  Bear Carlson : Merge pull request #502 from SBNSoftware/feature/hlay_crt_offline_calib
* 2024-09-26  Bear Carlson : Merge pull request #504 from SBNSoftware/feature/hlay_crt_offline_geo
* 2024-09-25  Alejandro Sánchez Castillo : Update ophitfinder parameters to run on raw waveforms
* 2024-09-25  Henry Lay : Make necessary changes to cope with always needing a fcl configuration
* 2024-09-25  Henry Lay : Make necessary changes to cope with always needing a fcl configuration
* 2024-09-25  Henry Lay : Make necessary changes to cope with always needing a fcl configuration
* 2024-09-25  Henry Lay : Make necessary changes to cope with always needing a fcl configuration
* 2024-09-25  Mun Jung Jung : cafmaker data calo labels
* 2024-09-24  Moon Jung : Update sbndcode/JobConfigurations/standard/caf/cafmakerjob_sbnd_data.fcl
* 2024-09-24  Moon Jung : Update sbndcode/JobConfigurations/standard/caf/cafmakerjob_sbnd_data.fcl
* 2024-09-24  Thomas Junk : sbncode version to v09_91_02_02 to pick up headers in sbndaq_artdaq_core so the NTB decoder will work
* 2024-09-24  Thomas Junk : Update this PR so it can be merged cleanly Merge branch 'develop' into feature/trj_ntb_decoder
* 2024-09-24  Ibrahim Safa : Merge branch 'develop' into summed-adc-interface
* 2024-09-24  Henry Lay : Remove old fcl
* 2024-09-24  Henry Lay : Silly Henry - we need that fhicl
* 2024-09-24  Henry Lay : Correct order
* 2024-09-24  Henry Lay : Attempt to add it everywhere it would be needed
* 2024-09-24  Henry Lay : Add base fcl for CRTGeoAlg
* 2024-09-23  Brinden Carlson : Update T0 default to be in configuration fcl
* 2024-09-20  Mun Jung Jung : caf fcl for data
* 2024-09-12  Kyle Knoepfel : Accommodate changes to recob::Hit
* 2024-09-10  Henry Lay : Remove default gain assignment within alg
* 2024-09-09  Henry Lay : Tidy up
* 2024-09-09  Henry Lay : Prevent implicit casting
* 2024-08-26  Henry Lay : Ensure ToF modules compile - and that their behaviour is unaffected for MC
* 2024-08-26  Henry Lay : Update GeoAlg to receive some parameters from the CalibService rather than fcl - and change how we handle inversion to reflect what the decoder does
* 2024-08-26  Henry Lay : Add temporary calibration service for supplying pedestals & timing offsets
* 2024-08-26  Henry Lay : Ensure default behaviour is retained for MC
* 2024-08-26  Henry Lay : Ensure TPC matching algorithms compile
* 2024-08-26  Henry Lay : Create fcl for running standalone CRT reconstruction on data
* 2024-08-26  Henry Lay : Updates to Tracks for data - Save both timings, use T0 for clustering & account for ToF when chosing candidates
* 2024-08-26  Henry Lay : Updates to SpacePoints for data - Save both timings
* 2024-08-26  Henry Lay : Updates to Clusters for data - Allow use of T0 for clustering decisions
* 2024-08-26  Henry Lay : Updates to Strip Hits for data - Reference to ETrig, allow flag 1, correct for second rollover
* 2024-08-26  Henry Lay : Make event display usable on data
* 2024-08-26  Henry Lay : Move declaration of particle inventory so as not to cause issues when running on data
* 2024-08-26  Henry Lay : Ensure CalibAna module still compiles
* 2024-08-26  Henry Lay : Update CRTAnalysis module to work on data
* 2024-08-06  Thomas Junk : also build the NTB decoder module
* 2024-08-06  Thomas Junk : NTB Decoder and data product

sbndutil 
---------------------------------------------------

* 2024-10-31  Brinden Carlson : Merge tag 'v09_93_01' into develop
* 2024-10-31  Brinden Carlson : Merge branch 'release/v09_93_01'
* 2024-10-31  Brinden Carlson : Update to larsoft v09_93_01
* 2024-10-01  Brinden Carlson : Merge tag 'v09_91_02_02p01' into develop
