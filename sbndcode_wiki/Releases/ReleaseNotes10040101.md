---
layout: page
title: ReleaseNotes10040101
toc: true
---

-----------------------------------------------------------------------------
| v10.04.01.01 | 21 Feb 2025 | [ReleaseNotes](ReleaseNotes10040101.html) |
| --- | --- | --- |



sbndcode v10_04_01_01 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v10_04_01_01](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v10_04_01_01/sbndcode-v10_04_01_01.html)

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
### Release Notes for [sbndcode] from v10_04_01 to v10_04_01_01
- PR #636: Reenable CVN
  - **Description**: Reenable CVN after changes in larsoft  v10_04_01.
  - **Labels**: tpc
  - **Reviewers**: 
  - **Assignees**: yangtj207
- PR #611: PMT Decoder Update: reading PTB HLTs correctly
  - **Description**: Update how the PMT decoder reads PTB HLTs to match recent the PTB decoder/object, follows same logic as CRT decoder. This logic will only be used if the SPEC TDC ETRIG is missing.
  - **Labels**: pds, data
  - **Reviewers**: tomjunk
  - **Assignees**: lynnt20
- PR #614: Add branches for time-walk and propagation delay correction in CRTAnalysis_module.cc
  - **Description**: Please provide a detailed description of the changes this pull request introduces.
  - **Labels**: enhancement, crt
  - **Reviewers**: 
  - **Assignees**: henrylay97, kjplows
- PR #618: Feature/rohanr crtdqm v2
  - **Description**: Updated version of the HitDumper Module in sbndcode/Commissioning to include TDC timing information.
  - **Labels**: crt, data
  - **Reviewers**: 
  - **Assignees**: keplerman417
- PR #619: Create run_mpvmpr_sbnd_intime.fcl
  - **Description**: Run only intime pieces of mpvmpr
  - **Labels**: simulation
  - **Reviewers**: absolution1, francois-drielsma
  - **Assignees**: bear-is-asleep
- PR #624: Adding Monte-Carlo rawdigit reco workflow to sbndcode
  - **Description**: Adding the `reco1_mc_rawdigit.fcl` and `reco2_mc_rawdigit.fcl` files to sbndcode. These files take wirecell products containing rawdigits, runs the trackcaloskimmer module to produce caloskim ntuples to access waveform information of MC samples.
  - **Labels**: tpc, reco1/reco2
  - **Reviewers**: mrmooney
  - **Assignees**: hjscott1
- PR #639: Adds a CAFMaker FCL for cosmics
  - **Description**: Please provide a detailed description of the changes this pull request introduces.
  - **Labels**: bug
  - **Reviewers**: 
  - **Assignees**: jzennamo
- PR #642: Save pedestal and RMS calculation in ChannelInfo object per TPC channel.
  - **Description**: 
  - **Labels**: enhancement
  - **Reviewers**: 
  - **Assignees**: 
- PR #648: Add cvn back to fcl files
  - **Description**: Add cvn back to reco2 fcl files.
  - **Labels**: reco1/reco2
  - **Reviewers**: bear-is-asleep
  - **Assignees**: yangtj207
- PR #650: Add full osc file
  - **Description**: Please provide a detailed description of the changes this pull request introduces. A more simple version of https://github.com/SBNSoftware/sbndcode/pull/620
  - **Labels**: enhancement
  - **Reviewers**: 
  - **Assignees**: jzennamo
- PR #651: Revert "Save pedestal and RMS calculation in ChannelInfo object per TPC channel."
  - **Description**: Reverts SBNSoftware/sbndcode642. Wasn't ready due to missing https://github.com/SBNSoftware/sbnobj/pull/120.
  - **Labels**: 
  - **Reviewers**: 
  - **Assignees**: 


sbndcode sbndcode
---------------------------------------------------

* 2025-02-21  Brinden Carlson : Merge branch 'release/v10_04_01_01'
* 2025-02-21  Bear Carlson : Merge pull request #653 from SBNSoftware/develop
* 2025-02-21  Brinden Carlson : Update to sbndcode v10_04_01_01
* 2025-02-21  Brinden Carlson : Update to sbndcode v10_04_01_01
* 2025-02-20  Bear Carlson : Merge pull request #651 from SBNSoftware/revert-642-feature/gputnam-TPCChannelInfo
* 2025-02-20  Bear Carlson : Revert "Save pedestal and RMS calculation in ChannelInfo object per TPC channel."
* 2025-02-20  Bear Carlson : Merge pull request #650 from SBNSoftware/feature/jzennamo_fullosc_fcl
* 2025-02-20  Bear Carlson : Merge branch 'develop' into feature/jzennamo_fullosc_fcl
* 2025-02-20  Bear Carlson : Merge pull request #648 from yangtj207/feature/tjyang_cvnfix
* 2025-02-20  Bear Carlson : Merge branch 'develop' into feature/tjyang_cvnfix
* 2025-02-20  Bear Carlson : Merge pull request #642 from SBNSoftware/feature/gputnam-TPCChannelInfo
* 2025-02-20  Bear Carlson : Merge branch 'develop' into feature/gputnam-TPCChannelInfo
* 2025-02-20  Bear Carlson : Merge pull request #639 from SBNSoftware/feature/jzennamo_caf_for_cosmics
* 2025-02-20  Bear Carlson : Merge branch 'develop' into feature/jzennamo_caf_for_cosmics
* 2025-02-20  Bear Carlson : Merge pull request #624 from SBNSoftware/feature/hjscott1
* 2025-02-20  Bear Carlson : Merge branch 'develop' into feature/hjscott1
* 2025-02-20  Bear Carlson : Merge pull request #619 from SBNSoftware/feature/bearc_mpvmpr
* 2025-02-20  Bear Carlson : Merge branch 'develop' into feature/bearc_mpvmpr
* 2025-02-20  Bear Carlson : Merge pull request #618 from SBNSoftware/feature/rohanr_crtdqm_v2
* 2025-02-20  Bear Carlson : Merge branch 'develop' into feature/rohanr_crtdqm_v2
* 2025-02-20  Bear Carlson : Merge pull request #614 from kjplows/feature/kplows_crt_extra_timing_branches
* 2025-02-20  Bear Carlson : Merge branch 'develop' into feature/kplows_crt_extra_timing_branches
* 2025-02-20  Bear Carlson : Merge pull request #611 from SBNSoftware/feature/lynnt_pmt_decoder
* 2025-02-20  Bear Carlson : Merge branch 'develop' into feature/lynnt_pmt_decoder
* 2025-02-20  jzennamo : add full osc file
* 2025-02-20  jzennamo : adding _sbnd to fcl
* 2025-02-19  Tingjun Yang : Merge branch 'develop' into feature/tjyang_cvnfix
* 2025-02-19  Tingjun Yang : Merge branch 'feature/tjyang_cvnfix' of github.com:yangtj207/sbndcode into feature/tjyang_cvnfix
* 2025-02-07  Bear Carlson : Revert "Exclude CVN in the code and fcl files for now"
* 2025-02-19  Bear Carlson : Merge pull request #636 from yangtj207/feature/tjyang_cvnfix
* 2025-02-19  hjscott1 : Merge branch 'develop' into feature/hjscott1
* 2025-02-18  Tingjun Yang : Merge branch 'develop' into feature/tjyang_cvnfix
* 2025-02-17  Gray Putnam : Add in even and 0xBAD fractions
* 2025-02-17  Gray Putnam : Save pedestal and RMS calculation in ChannelInfo object per TPC channel. This enables retrieval of the two metrics from files where the RawDigit object is dropped. These metrics are necessary for identifying the presense of CE noise per-half-board per-event.
* 2025-02-14  Brinden Carlson : Merge tag 'v10_04_01' into develop
* 2025-02-14  jzennamo : adding a caf maker for cosmics
* 2025-02-13  Tingjun Yang : Merge branch 'develop' into feature/tjyang_cvnfix
* 2025-02-13  hjscott1 : Merge branch 'develop' into feature/hjscott1
* 2025-02-10  Tingjun Yang : Reinclude CVN after larsoft changes.
* 2025-02-06  Linyan Wan : Bug fix
* 2025-02-05  Tingjun Yang : Reapply "Merge remote-tracking branch 'upstream/feature/geom' into feature/tjyang_cvnfix"
* 2025-02-05  Rohan Rajagopalan : Update sbndcode/Commissioning/fcls/hitdumpermodule.fcl
* 2025-02-03  linyan-w : Correct typo
* 2025-02-03  linyan-w : Update reco1_mc_rawdigit.fcl to match standard mc reco1
* 2025-02-03  linyan-w : Update reco2_mc_rawdigit.fcl to match standard MC reco2
* 2025-02-03  Harry Scott : Fixing data rawigit workflow
* 2025-02-03  Harry Scott : Merge branch 'develop' of https://github.com/SBNSoftware/sbndcode into feature/hjscott1
* 2025-02-03  Harry Scott : Adding MC rawdigit reco workflow
* 2025-01-31  Bear Carlson : Add in time only mpvmpr generator
* 2025-01-31  Bear Carlson : Create run_mpvmpr_sbnd_intime.fcl
* 2025-01-29  Rohan Rajagopalan : Update to fcl file in hitdumpermodule.fcl to include CRT Space Points
* 2025-01-29  Rohan Rajagopalan : Update to hitdumpermodule.fcl
* 2025-01-27  Rohan Rajagopalan : Inclusion of TDC timing information to HitDumper module
* 2025-01-30  kjplows : Add explanatory comment
* 2025-01-29  kjplows : Merge branch 'develop' into feature/kplows_crt_extra_timing_branches
* 2025-01-29  lynnt20 : add correct reading of ptb hlts
* 2024-11-13  kjplows : Additions of StripHit timing variables to the analysis tree. Ts0, Ts1, time walk and propagation delay corrections
* 2024-11-08  kjplows : Bring in Henry's GDML changes to develop

sbndutil 
---------------------------------------------------

* 2025-02-14  Brinden Carlson : Merge tag 'v10_04_01' into develop
