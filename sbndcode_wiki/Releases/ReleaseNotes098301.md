---
layout: page
title: ReleaseNotes098301
toc: true
---

-----------------------------------------------------------------------------
| v09.83.01 | 21 Feb 2024 | [ReleaseNotes](ReleaseNotes098301.html) |
| --- | --- | --- |



sbndcode v09_83_01 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_83_01](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_83_01/sbndcode-v09_83_01.html)

Purpose
---------------------------------------------------
Weekly release

New features
---------------------------------------------------
* SBNSoftware/sbndcode#397: Added PTB decoder module and data product
  * This decoder is based on the ProtoDUNE-SP one, but has fixes and enhancements.
    * It separates out the HLTs from the LLTs, and provides structs for CHStatus, Feedback, and Misc. in SBNSoftware/sbndcode/JobConfigurations:
    * The WordIndex struct is there to keep track of the ordering of words in the input fragments after they have been divided up by type.
    * People on ProtoDUNE-SP requested a function that provides the CHStatus word that comes immediately before any given HLT. This function
    is provided in PDSPCTBRawUtils.cxx.

* SBNSoftware/sbndcode#409: SimChannel Module Label
  * This changes the module label used by the back tracker for SimChannels from simdrift (1D simulation) to simtpc2d:simpleSC (WireCell 2D simulation).
  * Details are in docDB #33131. 
* SBNSoftware/sbndcode#408: InterPlane Drift Effect
  * Turns off the detector properties service adding a correction for the drift time between the readout planes. This is because WireCell 2D simulation applies this to the recob::Wires whereas the old 1D simulation did not.
  * Pandora then uses this service to set the times for its input hits used for the pattern recognition. Hence for samples from the 2D simulation the correction would be applied twice.
  * Details are in docDB #33916. 
* SBNSoftware/sbndcode#414: Update unit tests to use WireCell workflow
  * Updates unit test matching PRs 408 and 409 

Bug fixes
---------------------------------------------------
* SBNSoftware/sbndcode#413:  Quick fix to the hitfinder module to work with the Raw XARAPUCA waveforms

Updated dependencies
---------------------------------------------------
* sbncode v09_83_01
* larsoft v09_83_01

Supported qualifiers
---------------------------------------------------
* e26:prof
* e26:debug

Additional (ALERT) comments
---------------------------------------------------
Please be aware of the breaking changes introduced by PRs 408 and 409, specially if you are still using the 1D TPC simulation or plan to run fhicls from this tag on old 1D simulated files. The 1D simulation fcls will not work out of the box as WireCell drift simulation and signal processing is now the default working workflow and the one planned in the future production. 
An updated working fhicl configuration can be found in this [README](https://github.com/SBNSoftware/sbndcode/blob/develop/sbndcode/JobConfigurations/README):
- prodoverlay_corsika_cosmics_proton_genie_rockbox_sce.fcl
- g4_sce_dirt_filter_lite_wc.fcl
- wirecell_sim_sp_sbnd.fcl
- detsim_sce_lite_wc.fcl
- reco1_sce_lite_wc2d.fcl
- reco2_sce.fcl

Change List
==========================================

sbndcode sbndcode
---------------------------------------------------

* 2024-02-21  Fran Nicolas : Merge branch 'release/v09_83_01'
* 2024-02-21  Fran Nicolas : Update to larsoft v09_83_01
* 2024-02-19  Francisco Javier Nicolás-Arnaldos : Merge pull request #413 from SBNSoftware/feature/rodrigoa_HitDumper_fix
* 2024-02-19  Francisco Javier Nicolás-Arnaldos : Merge pull request #414 from SBNSoftware/feature/fnicolas_fix_unit_tests
* 2024-02-17  lynnt20 : remove mcreco from g4_dirt_filter.fcl
* 2024-02-16  Rodrigo Alvarez Garrote : corrected area + polarity included
* 2024-02-16  Francisco Javier Nicolás-Arnaldos : Merge branch 'develop' into feature/fnicolas_fix_unit_tests
* 2024-02-16  Francisco Javier Nicolás-Arnaldos : Merge pull request #408 from SBNSoftware/feature/hlay_interplane_drift
* 2024-02-16  Francisco Javier Nicolás-Arnaldos : Merge pull request #409 from SBNSoftware/feature/hlay_sim_channel_label
* 2024-02-16  Francisco Javier Nicolás-Arnaldos : Missing include
* 2024-02-16  Fran Nicolas : set WC env var for fast_electrons.sh
* 2024-02-16  Fran Nicolas : add mcreco to all WC sim fhicls
* 2024-02-16  Fran Nicolas : set WC env var
* 2024-02-16  Fran Nicolas : Unit tests config for wire cell workflow
* 2024-02-16  Francisco Javier Nicolás-Arnaldos : Merge pull request #397 from tomjunk/trj_triggerdecoder_nov2023
* 2024-02-15  Henry Lay : Update README
* 2024-02-12  Rodrigo Alvarez Garrote : 1st try to fix raw wvfs parameters (deconvolved config is different)
* 2024-02-01  Henry Lay : Change or remove other instances of simdrift
* 2024-02-01  Henry Lay : Change SimChannel label to reflect use of wirecell 2D simulation
* 2024-02-01  Henry Lay : Set inter plane drift correction to false at table level
* 2024-01-31  Francisco Javier Nicolás-Arnaldos : Merge pull request #406 from yangtj207/feature/tjyang_geohelper
* 2024-01-30  Fran Nicolas : Merge tag 'v09_82_02_01' into develop
* 2024-01-26  Tingjun Yang : Merge remote-tracking branch 'upstream/develop' into feature/tjyang_geohelper
* 2024-01-26  Tingjun Yang : Update CMakeLists.txt.
* 2024-01-26  Tingjun Yang : Add a module to convert tpc/plane/wire numbers to offline channel number and electronic numbers. Useful for commissioning.
* 2023-12-20  Francisco Javier Nicolás-Arnaldos : Merge branch 'develop' into trj_triggerdecoder_nov2023
* 2023-12-05  tomjunk : Update runptbdecoder.fcl
* 2023-11-21  tomjunk : Merge branch 'SBNSoftware:develop' into trj_triggerdecoder_nov2023
* 2023-11-21  Thomas Junk : label the fragments separatley and add a const to the function that gets the status word before the HLT
* 2023-11-21  Thomas Junk : add some debug info
* 2023-11-21  Thomas Junk : PTB Raw Decoder
* 2023-11-17  Thomas Junk : change output label name to instance name and make the default the empty string
* 2023-11-17  Thomas Junk : configs for PTB decoder
* 2023-11-17  Thomas Junk : PTB Decoder and data product

sbndutil
---------------------------------------------------

* 2024-02-21  Fran Nicolas : Merge tag 'v09_83_01' into develop
* 2024-02-21  Fran Nicolas : Merge branch 'release/v09_83_01'
* 2024-02-21  Fran Nicolas : Update to larsoft v09_83_01
* 2024-01-30  Fran Nicolas : Merge tag 'v09_82_02_01' into develop
