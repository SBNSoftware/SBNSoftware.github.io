---
layout: page
title: ReleaseNotes09880003
toc: true
---

-----------------------------------------------------------------------------
| v09.88.00.03 | 16 Apr 2024 | [ReleaseNotes](ReleaseNotes09880003.html) |
| --- | --- | --- |



sbndcode v09_88_00_03 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_88_00_03](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_88_00_03/sbndcode-v09_88_00_03.html)

Purpose
---------------------------------------------------
Patch for SBN2024A.

New features
---------------------------------------------------
* SBNSoftware/sbndcode#453: CRT Timing simulation improvement and changes for corresponding CRT timing reconstruction
  * Changed the parameterisations for CRT timing simulation, mainly related to the time walk effect. The corresponding reconstruction for correcting such effect has also been made.
  * Related to Mean deposited charge for mips: changed to 1.53 MeV instead of 1.75 MeV.
* SBNSoftware/sbndcode#448: Offline PMT Decoder Updates
  * Change the internal organization structure of the vector of fragments to store by board instead of by trigger. Because the decoder is not performing jitter correction, there is no need to index by trigger and compare the trigger time between boards for the same trigger. The internal re-structure to store the vector of fragments by board will still allow us to combine waveforms for extended trigger. This restructure also allows us to easily open up CAENV1730 fragments, whereas before we were mainly opening up ContainerCAENV1730.
  * Update channel mapping to version in docdb 33668-v9.
  * Add a fcl parameter to allow a fragment ID mapping to the board ID for old DAQ configurations. This can also be utilized in the future if the fragment ID->board ID mapping changes.
* SBNSoftware/sbndcode#452: Compute asicchan from FEMBCh and fill the field in ChanInfo
* SBNSoftware/sbndcode#455: Add dataTier to runtpcdecoder.fcl
* SBNSoftware/sbndcode#437: Update PMT baseline
  * PMT ADC baselines are now at 14k not 8k, so we need to update the baseline values. 
* SBNSoftware/sbndcode#454: field response gen fcl
  * fcl to make anode cathode crossing muons for field response validation samples. Uses single particle generator 


Bug fixes
---------------------------------------------------

Updated dependencies
---------------------------------------------------
* sbncode v09_88_00_03

Supported qualifiers
---------------------------------------------------
* e26:prof
* e26:debug

Change List
==========================================

sbndcode sbndcode
---------------------------------------------------

* 2024-04-16  Fran Nicolas : Update to version v09_88_00_03
* 2024-04-16  Francisco Javier Nicolás-Arnaldos : Merge pull request #453 from SBNSoftware/feature/jiaoyang_crt_timing_improvements
* 2024-04-16  Francisco Javier Nicolás-Arnaldos : Merge pull request #448 from SBNSoftware/feature/lynnt_pmt_decoder
* 2024-04-16  Francisco Javier Nicolás-Arnaldos : Merge pull request #455 from yangtj207/feature/tjyang_decoder
* 2024-04-16  Francisco Javier Nicolás-Arnaldos : Merge pull request #458 from SBNSoftware/trj_addFEMBAsicChanToMap_Apr4_2024
* 2024-04-15  Francisco Javier Nicolás-Arnaldos : Merge pull request #454 from abhatfnal/develop
* 2024-04-15  Jiaoyang Li : Forgot to update few parameters for delay RMS for CRT timing simulation.
* 2024-04-15  Francisco Javier Nicolás-Arnaldos : Merge pull request #437 from SBNSoftware/feature/bearc_pmt_baseline
* 2024-04-11  Tingjun Yang : Change the data stream name to commissioning since rootout is not on the predefined list.
* 2024-04-10  Tingjun Yang : Add dataTier to the runtpcdecoder.fcl file.
* 2024-04-06  Tingjun Yang : Merge remote-tracking branch 'upstream/develop' into develop
* 2024-04-04  Avinay Bhat : fcl to make anode cathode crossing muons for field response validation
* 2024-04-04  Li Jiaoyang : Merge branch 'develop' into feature/jiaoyang_crt_timing_improvements
* 2024-04-04  Jiaoyang Li : Changed the paramerterisations for CRT timing simulation and corresponding reconstruction.
* 2024-04-04  lynnt20 : remove unused variable
* 2024-04-04  Thomas Junk : Compute asicchan from FEMBCh and fill the field in ChanInfo
* 2024-04-04  lynnt20 : Merge branch 'develop' into feature/lynnt_pmt_decoder
* 2024-04-04  Bear Carlson : Update ADC threshold
* 2024-04-04  Fran Nicolas : Merge tag 'v09_88_00_02' into develop
* 2024-04-02  lynnt20 : - add function to get fragment for normal/container of fragments - add debug message when fragment is dropped - rename "hardcoded" fragid map fcl param to "set"
* 2024-04-02  lynnt20 : change "hardcoded" to "set" for fragid map fcl parameter
* 2024-04-01  lynnt20 : fix pmt wavefrom vs. trigger waveform bug
* 2024-03-30  lynnt20 : fix channel mapping indexing
* 2024-03-29  Tingjun Yang : Merge remote-tracking branch 'upstream/develop' into develop
* 2024-03-29  Tingjun Yang : Merge branch 'develop' of github.com:yangtj207/sbndcode into develop
* 2024-03-28  lynnt20 : trig counter and bug fix
* 2024-03-28  lynnt20 : Merge branch 'develop' into feature/lynnt_pmt_decoder
* 2024-03-26  lynnt20 : remove max number of events
* 2024-03-26  lynnt20 : fix braces
* 2024-03-26  lynnt20 : Merge tag 'v09_84_00_01' into feature/lynnt_pmt_decoder
* 2024-03-26  lynnt20 : clean up
* 2024-03-20  Bear Carlson : Use 14k ADC baseline
* 2024-03-20  Bear Carlson : Use 14k ADC baseline
* 2024-03-18  lynnt20 : code restructure to store fragments and index by board instead of by trigger
* 2024-03-18  lynnt20 : rename "hack" to "hardcoded" for the fragid to digitizer map
* 2024-03-18  lynnt20 : channel map fix, old fragment id fix, non-container fragments fix

sbndutil
---------------------------------------------------

* 2024-04-04  Fran Nicolas : Merge tag 'v09_88_00_02' into develop
