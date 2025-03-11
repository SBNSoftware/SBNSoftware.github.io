---
layout: page
title: ReleaseNotes100405
toc: true
---

-----------------------------------------------------------------------------
| v10.04.05 | 11 Mar 2025 | [ReleaseNotes](ReleaseNotes100405.html) |
| --- | --- | --- |



sbndcode v10_04_05 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v10_04_05](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v10_04_05/sbndcode-v10_04_05.html)

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
### Release Notes for [sbndcode] from v10_04_03 to v10_04_05
- PR #593: Feature/maxd post581 p rfix
  - **Description**: There were minor adjustments to PR 581 that didn't make it in. It requires at least sbndaq_artdaq_core v1_10_03 to run.
  - **Labels**: 
  - **Reviewers**: bear-is-asleep
  - **Assignees**: lyates17
- PR #620: Adding fcls for Production
  - **Description**: This adds the functionality to run full osc and intrinsic nue samples with the space-charge hack.  It also includes `drop` commands *into our standard workflow* to reduce our `reco1` file-size from 130 MB/event to 20 MB/event.  I tested these through the [full workflows](https://docs.google.com/document/d/11Hdo6z2nMWi5fefFN_-TbtyaOFcm7rPL5cDKQ6HoTaA/edit?usp=sharing) and things worked.
  - **Labels**: enhancement
  - **Reviewers**: lynnt20
  - **Assignees**: jzennamo
- PR #626: Add possible HLTs for CRT time referencing
  - **Description**: Following discussion with Tereza & Lynn these trigger types should also be added as legitimate event triggers.  They correspond to NS & EW crossing muon triggers (originally we thought we had covered this with 5). Relevant documentation is here: https://cdcvs.fnal.gov/redmine/projects/sbnd/wiki/Trigger_Type_Definitions
  - **Labels**: crt, reco1/reco2, data
  - **Reviewers**: 
  - **Assignees**: henrylay97
- PR #641: CRT Channel Status
  - **Description**: This adds to the CRT calibration service with a list of bad channels. Like the pedestals and timing offsets these are filled from a text file. The service then denotes the channels (and their paired channel) with the correct labels using the enumeration provided in SBNSoftware/sbnobj119. Only bad channels are specified - the default value is good (0).  The status is then used to skip over bad channels in the first stage of the CRT reconstruction. (It is also used in an Analyzer used for CRT calibrations which will soon be provided in a separate PR).  The PR will remain a draft until after this week's CRT meeting where a decision on the two channels labelled as quiet (3) will be made.
  - **Labels**: crt, data
  - **Reviewers**: 
  - **Assignees**: henrylay97
- PR #643: Change CRT in calib ntuples
  - **Description**: Having discussed with the reviewers offline - the CRT element of the calibration ntuples can be changed from Sungbin's module (which was originally based on the CRT group's CRTAnalysis module) to using the CRTAnalysis module itself. This module has been updated significantly for data so it also allows us to turn them back on for data (which wasn't possible with the old module).  I remove the old fcl & module (happy to retain if people would rather) and link the CRTAnalysis module to the relevant places.  The tree size is very similar to that of the old module. For data this means an increase in the total "hist" file size (although the ntuple tree size doesn't change as they are two separate trees) because previously we were not running any CRT module but in MC it represents ~ no change.
  - **Labels**: crt
  - **Reviewers**: mrmooney, sungbinoh
  - **Assignees**: henrylay97
- PR #644: Add saving picosecond value in decoded TDC
  - **Description**: The fix introduces a new variable `timestampPs` in the decoded TDC object `sbnd::timing::DAQTimestamp` located in sbnobj repo.  It also enables the TDC decoder to save the new variable in the decoding process.  If analyser want to access the new variable `timestampPs` in an older version of  sbnd::timing::DAQTimestamp, it is defaulted to be 0 to prevent breaking in backward compatability.
  - **Labels**: enhancement, data
  - **Reviewers**: 
  - **Assignees**: VCLanNguyen
- PR #647: Add fcls to run OpT0Finder on data
  - **Description**: Adds new fcl blocks to including running OpT0Finder in data reco2 stage. This is meant to be a first-pass inclusion of flash-matching for data; more validation and testing to come!  This may increase the number of OpT0Finder matches in simulation; a requirement on the neutrino-likeness of a `recob::Slice` has been loosened (we now accept anything that is not a clear cosmic, rather than requiring that the reco chain has identified a specific neutrino type within a given slice).   Data configurations to note: - global scaling from 1.0 -> 0.25 to match approximate light yield seen in data. - The allowed time range for in-beam light is currently -1 to 5 us; the reference time for BNB+Light streams is the SPEC TDC ETRIG, which may move with light arrival time (t=0 is not aligned with the beam acceptance), so I increase the time range available. - should have interfacing with the calibration database in the near future to grab TPC gain calibration constants and PMT channel numbers to mask.
  - **Labels**: data
  - **Reviewers**: absolution1, yangtj207
  - **Assignees**: lynnt20
- PR #657: Add fcl configuration TwoBodyAnisotropyIncludeInterference to match s…
  - **Description**: 
  - **Labels**: enhancement
  - **Reviewers**: jicrespo, jberger7
  - **Assignees**: LuisPelegrina
- PR #661: Use doublets in Cluster3D
  - **Description**: Use doublets instead of triplets. 4-5x larcv file size, increases RAM useage.   Space 2.4 GB -> 12 GB for 1k MPVMPR events   RAM Doublets: - Peak virtual memory usage (VmPeak)  : 5729.37 MB - Peak resident set size usage (VmHWM): 4295.55 MB Triplets: - Peak virtual memory usage (VmPeak)  : 3292.9 MB - Peak resident set size usage (VmHWM): 1934.36 MB
  - **Labels**: reco1/reco2
  - **Reviewers**: yangtj207, ggamezdiego
  - **Assignees**: bear-is-asleep
- PR #668: Feature/sungbin emb4data
  - **Description**: Updating TPC dQ/dx to dE/dx recombination model to EMB from MB for data. (MC is already using EMB.) Updating TPC gain calibration constants for MC and Data.  Used samples - Data: Run 17665 (v09_03_01_01) calibration ntuples `(samweb list-files "production.type polaris and sbnd_project.stage reco2 and file_name like hist%")` - MC: 2025 Feb Workshop MC sample, v10_04_1 + timing offset bug fix  For plots and numbers, please refer to [sbn-docdb-40108](https://sbn-docdb.fnal.gov/cgi-bin/sso/ShowDocument?docid=40108). Calibration constants with inclusive measurements are used.
  - **Labels**: reco1/reco2
  - **Reviewers**: yangtj207
  - **Assignees**: sungbinoh
- PR #670: Revert "TEMPORARY CHANGE: Disable vertex refinement in pandora"
  - **Description**: 
  - **Labels**: 
  - **Reviewers**: 
  - **Assignees**: 
- PR #671: Ensure deposits from all CRT types are retained when merging multiple geant outputs
  - **Description**: Bug found during Analysis Workshop. GDML adopted in December/January introduced a number of new "types" of CRT. These need explicity listing in this fcl otherwise the energy deposits in them get dropped in any MC workflows with multiple geant4 instances (like rockbox or intime samples).  Our MC testing was done with a pure cosmics sample so we didn't encounter this.  For anyone looking at the samples - this impacts the Top & some of the North CRTs.
  - **Labels**: bug, crt, simulation
  - **Reviewers**: 
  - **Assignees**: henrylay97
- PR #672: Stop pretending to simulate the PPS
  - **Description**: We don't need to pretend to simulate the PPS - assigning it to a random value for every piece of activity doesn't replicate what actually happens in data.  In data reconstruction we reference the T0 to the event trigger, thus replicating closely what T1 represents in the simulation. In aid of simplifying concepts and making data / MC comparisons easier I am suggesting we move to make T0 & T1 the same in MC.
  - **Labels**: crt, detsim
  - **Reviewers**: 
  - **Assignees**: henrylay97
- PR #674: Adding data workflow into the CI
  - **Description**: Adding data workflow into the CI. 8 new tests have been created which run on 5 events from run 18266 (off beam zero bias). New tests being added: - data_offBeamZeroBias_decoders_quick_test_sbndcode - data_offBeamZeroBias_decoders_seq_test_sbndcode - data_offBeamZeroBias_reco1_quick_test_sbndcode - data_offBeamZeroBias_reco1_seq_test_sbndcode - data_offBeamZeroBias_reco2_quick_test_sbndcode - data_offBeamZeroBias_reco2_seq_test_sbndcode - data_offBeamZeroBias_caf_quick_test_sbndcode - data_offBeamZeroBias_caf_seq_test_sbndcode  This has been tested for both the normal workflow and the update reference file workflow, both work as expected. The trigger of the update reference file workflow can be seen [here](https://dbweb8.fnal.gov:8443/LarCI/app/ns:SBND/view_builds/index?offset=0&builds=sbnd_ci_test/555&builds=).
  - **Labels**: test
  - **Reviewers**: 
  - **Assignees**: RachelCoackley
- PR #675: Use pandoraSCE for MC by default.
  - **Description**: Use pandoraSCE for MC by default.
  - **Labels**: reco1/reco2
  - **Reviewers**: 
  - **Assignees**: yangtj207


sbndcode sbndcode
---------------------------------------------------

* 2025-03-11  Brinden Carlson : Merge branch 'release/v10_04_05'
* 2025-03-11  Brinden Carlson : Update to sbncode v10_04_05
* 2025-03-10  Bear Carlson : Merge pull request #677 from SBNSoftware/revert-676-feature/bearc_crt_calib_fix
* 2025-03-10  Bear Carlson : Revert "CRT Calib Fix"
* 2025-03-10  Bear Carlson : Merge pull request #676 from SBNSoftware/feature/bearc_crt_calib_fix
* 2025-03-10  Brinden Carlson : Remove crt skim from reco workflow
* 2025-03-10  Brinden Carlson : Remove crt skim from reco workflow
* 2025-03-10  Brinden Carlson : Remove crt skim from reco workflow
* 2025-03-10  Bear Carlson : Merge pull request #675 from yangtj207/feature/tjyang_cvn
* 2025-03-10  Tingjun Yang : Revert change to ups/product_deps.
* 2025-03-10  Tingjun Yang : Merge remote-tracking branch 'upstream/develop' into feature/tjyang_cvn
* 2025-03-10  Bear Carlson : Merge pull request #674 from SBNSoftware/feature/coackley_ciDataWorkflow
* 2025-03-10  Bear Carlson : Merge pull request #672 from SBNSoftware/feature/hlay_crt_sim_times
* 2025-03-10  Bear Carlson : Merge pull request #671 from SBNSoftware/bugfix/hlay_crt_merge_sim_sources
* 2025-03-10  Bear Carlson : Merge pull request #670 from SBNSoftware/revert-659-dbrailfs_pandoradisablevertexrefinement_temporary
* 2025-03-10  Bear Carlson : Merge pull request #668 from SBNSoftware/feature/sungbin_emb4data
* 2025-03-10  Bear Carlson : Merge pull request #661 from SBNSoftware/feature/bearc_cluster3d_doublets
* 2025-03-10  Bear Carlson : Merge pull request #657 from SBNSoftware/feature/lpelegri_HNL2BodyAnisotropies
* 2025-03-10  Bear Carlson : Merge pull request #647 from SBNSoftware/feature/lynnt_opt0finder_data
* 2025-03-10  Bear Carlson : Merge pull request #644 from SBNSoftware/feature/lnguyen_decodedTDC_ps
* 2025-03-10  Bear Carlson : Merge pull request #643 from SBNSoftware/feature/hlay_change_crt_calib_ntuples
* 2025-03-10  Bear Carlson : Merge pull request #641 from SBNSoftware/feature/hlay_crt_channel_status
* 2025-03-10  Bear Carlson : Merge pull request #626 from SBNSoftware/feature/hlay_crt_timing_hlt_types
* 2025-03-10  Bear Carlson : Merge pull request #620 from SBNSoftware/feature/zennamo_addingfcls_forMarch25
* 2025-03-10  Bear Carlson : Merge pull request #593 from SBNSoftware/feature/maxd_Post581PRfix
* 2025-03-10  Tingjun Yang : Add comment about the pandora label.
* 2025-03-10  Rachel : Added in comments
* 2025-03-08  Tingjun Yang : Use pandoraSCE for MC by default.
* 2025-03-06  Rachel Coackley : Changed data quick tests to run 2 events (instead of 5)
* 2025-03-05  Rachel : Adding in comments
* 2025-03-05  Rachel : Adding comments
* 2025-03-04  Henry Lay : Fix running issue for MC
* 2025-03-04  Henry Lay : Merge remote-tracking branch 'origin/develop' into feature/hlay_change_crt_calib_ntuples
* 2025-03-03  L. Yates : Fix typo in PTBAnalysis_module.cc that caused a build error
* 2025-03-03  Rachel : Fix mistake
* 2025-03-03  Rachel : Fix mistakes
* 2025-03-03  lynnt20 : Merge branch 'develop' into feature/lynnt_opt0finder_data
* 2025-03-03  Rachel Coackley : fixed caf seq test
* 2025-02-28  lynnt20 : fix formatting for reco2 data fcl
* 2025-02-28  lynnt20 : update slice selection (ignore clear cosmics), and add scaling factor
* 2025-02-28  Henry Lay : Stop pretending to simulate PPS
* 2025-02-28  Henry Lay : Ensure all CRT types are listed in merge sim sources
* 2025-02-28  Rachel Coackley : fixed sbnd.fcl to sbndcode.fcl
* 2025-02-28  Dom Brailsford : Revert "TEMPORARY CHANGE: Disable vertex refinement in pandora"
* 2025-02-28  Rachel Coackley : adding caf tests back in
* 2025-02-28  Rachel Coackley : Adding caf fcls
* 2025-02-28  Rachel : Delete test/ci/sbnd_ci_data_offBeamZeroBias_caf_quick_test_sbnd.fcl
* 2025-02-28  Rachel : Delete test/ci/sbnd_ci_data_offBeamZeroBias_caf_seq_test_sbnd.fcl
* 2025-02-28  Rachel Coackley : Added in some comments, removed caf test from being ran, changed cpu and mem usage limits
* 2025-02-28  Rachel Coackley : Added in a data caf test
* 2025-02-28  Rachel Coackley : Merge branch 'feature/coackley_ciDataWorkflow' of github.com:SBNSoftware/sbndcode into feature/coackley_ciDataWorkflow
* 2025-02-28  Rachel Coackley : Choppy decoded file is not longer outputted, only filtered decoded file is
* 2025-02-27  sungbinoh : Following Dom's suggestions
* 2025-02-27  Rachel : Removing a typo
* 2025-02-27  Rachel Coackley : Adding the data workflow to the CI - initial
* 2025-02-26  sungbinoh : TPC c_cal updates for both MC and data. Data is based on Run 17665.
* 2025-02-26  sungbinoh : Updating data recombination model for TPC dE/dx to EMB from MB
* 2025-02-25  Max Dubnowski : Update PTBAnalysis_module.cc to read nLLT instead of nHLT
* 2025-02-24  Brinden Carlson : Merge tag 'v10_04_03' into develop
* 2025-02-24  Bear Carlson : Update cluster_sbnd.fcl
* 2025-02-20  Henry Lay : Actually on skip explicitly dead channels
* 2025-02-21  Luis Pelegrina Gutiérrez : Add fcl configuration TwoBodyAnisotropyIncludeInterference to match sbncode release
* 2025-02-19  lynnt20 : first commit of fcls to run opt0finder on data
* 2025-02-19  Vu Chi Lan Nguyen : add saving picosecond value
* 2025-02-19  Henry Lay : Also remove defunct module
* 2025-02-19  Henry Lay : Use crtana in place of old crtskim
* 2025-02-19  Henry Lay : Remove need for crtskim to exist
* 2025-02-19  Henry Lay : Make crtana fcls properly tabled
* 2025-02-18  Henry Lay : Move to c++ strings
* 2025-02-18  Henry Lay : Better use of enums
* 2025-02-17  Henry Lay : Fix typos
* 2024-11-28  Henry Lay : Fix typo
* 2024-11-28  Henry Lay : Point fcl at bad channel file
* 2024-11-28  Henry Lay : Make channel status accessible through GeoAlg
* 2025-02-13  Henry Lay : Skip dead channels
* 2024-11-28  Henry Lay : Add bad channels to calib services
* 2025-02-09  Max Dubnowski : Update PTBAnalysis_module.cc
* 2025-02-09  Max Dubnowski : Update SBNDPTBDecoder_module.cc
* 2025-02-09  Max Dubnowski : Update sbndptb.h
* 2025-02-09  Max Dubnowski : Update sbndcode/Decoders/PTB/SBNDPTBDecoder_module.cc
* 2025-02-05  Henry Lay : Add possible HLTs for CRT time referencing
* 2025-01-31  jzennamo : adding fcls for March production
* 2025-01-24  Bear Carlson : Update ups/product_deps
* 2025-01-13  Max : Correcting versioning
* 2025-01-13  Max : Post 581 PR adjustments

sbndutil 
---------------------------------------------------

* 2025-03-11  Brinden Carlson : Merge tag 'v10_04_05' into develop
* 2025-03-11  Brinden Carlson : Merge branch 'release/v10_04_05'
* 2025-03-11  Brinden Carlson : Update to sbncode v10_04_05
* 2025-02-24  Brinden Carlson : Merge tag 'v10_04_03' into develop
