---
layout: page
title: ReleaseNotes100403
toc: true
---

-----------------------------------------------------------------------------
| v10.04.03 | 24 Feb 2025 | [ReleaseNotes](ReleaseNotes100403.html) |
| --- | --- | --- |



sbndcode v10_04_03 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v10_04_03](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v10_04_03/sbndcode-v10_04_03.html)

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
### Release Notes for [sbndcode] from v10_04_01_01 to v10_04_03
- PR #645: Updating Clock to the New Porch Size
  - **Description**: The front porch in our drift simulation was changed to be -205 us to match data here: https://github.com/SBNSoftware/sbndcode/blob/6ca9a98ec859cf51bd568f08b0d7b8bb17a3920f/sbndcode/WireCell/cfg/pgrapher/experiment/sbnd/params.jsonnetL126  I have updated our detector clock service to have a matching time. This being out of sync was leading to our "truth matching" in the CAF files to fail.
  - **Labels**: bug
  - **Reviewers**: 
  - **Assignees**: jzennamo
- PR #658: Adding caloskim RawDigitproducers labels
  - **Description**: This is for the workflow with raw digits. In the test production raw digits are saved in reco1 and reco2 files, but not in calib ntuple. It turned out the reco2 fcl miss the RawDigitproducers labels for caloskim. This fcl patches that. This fcl is needed for the 2025 Feb workshop production.
  - **Labels**: bug, reco1/reco2
  - **Reviewers**: 
  - **Assignees**: linyan-w, hjscott1
- PR #659: TEMPORARY CHANGE: Disable vertex refinement in pandora
  - **Description**: This PR disables the vertex refinement in SBND's pandora workflow.  This is a temporary change while an upstream larcontent issue is resolved. This PR will mean vertex positions are less precise, but otherwise should not impact the downstream reco. Thanks @henrylay97 for helping to understand the disabling procedure.
  - **Labels**: reco1/reco2
  - **Reviewers**: bear-is-asleep
  - **Assignees**: absolution1

sbndcode sbndcode
---------------------------------------------------

* 2025-02-24  Brinden Carlson : Merge branch 'release/v10_04_03'
* 2025-02-24  Brinden Carlson : Update to sbncode v10_04_03
* 2025-02-24  Bear Carlson : Merge pull request #659 from SBNSoftware/dbrailfs_pandoradisablevertexrefinement_temporary
* 2025-02-24  Bear Carlson : Merge pull request #658 from SBNSoftware/linyan-calib
* 2025-02-24  Bear Carlson : Merge pull request #645 from SBNSoftware/feature/jzennamo_updateclock
* 2025-02-24  Dom Brailsford : Disable vertex refinement.  This is a temporary change while an upstream issue is fixed.
* 2025-02-21  Linyan Wan : Adding caloskim RawDigitproducers labels
* 2025-02-21  Brinden Carlson : Merge tag 'v10_04_01_01' into develop
* 2025-02-21  Brinden Carlson : Merge branch 'release/v10_04_01_01'
* 2025-02-21  Bear Carlson : Merge pull request #653 from SBNSoftware/develop
* 2025-02-21  Brinden Carlson : Update to sbndcode v10_04_01_01
* 2025-02-21  Brinden Carlson : Update to sbndcode v10_04_01_01
* 2025-02-20  Bear Carlson : Merge pull request #651 from SBNSoftware/revert-642-feature/gputnam-TPCChannelInfo
* 2025-02-20  Bear Carlson : Revert "Save pedestal and RMS calculation in ChannelInfo object per TPC channel."
* 2025-02-20  lynnt20 : update default value to current front porch from data
* 2025-02-20  lynnt20 : declare front porch variable in common params, set default value in exp params, remove from simparams
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
* 2025-02-20  lynnt20 : set tick0_time using detector clocks services in wirecell simulation
* 2025-02-20  jzennamo : adding _sbnd to fcl
* 2025-02-19  Tingjun Yang : Merge branch 'develop' into feature/tjyang_cvnfix
* 2025-02-19  Tingjun Yang : Merge branch 'feature/tjyang_cvnfix' of github.com:yangtj207/sbndcode into feature/tjyang_cvnfix
* 2025-02-07  Bear Carlson : Revert "Exclude CVN in the code and fcl files for now"
* 2025-02-19  Bear Carlson : Merge pull request #636 from yangtj207/feature/tjyang_cvnfix
* 2025-02-19  jzennamo : updating clock to the new porch size
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

* 2025-02-24  Brinden Carlson : Merge tag 'v10_04_03' into develop
* 2025-02-24  Brinden Carlson : Merge branch 'release/v10_04_03'
* 2025-02-24  Brinden Carlson : Update to sbncode v10_04_03
* 2025-02-14  Brinden Carlson : Merge tag 'v10_04_01' into develop
