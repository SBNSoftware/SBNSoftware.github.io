---
layout: page
title: ReleaseNotes100407
toc: true
---

-----------------------------------------------------------------------------
| v10.04.07 | 10 Apr 2025 | [ReleaseNotes](ReleaseNotes100407.html) |
| --- | --- | --- |



sbndcode v10_04_07 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v10_04_07](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v10_04_07/sbndcode-v10_04_07.html)

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
### Release Notes for [sbndcode] from v10_04_06_01 to v10_04_07
- PR #640: Python Interface to Services V10 Compatibility
  - **Description**: In `gallery/python` we have Python code that allows interfacing to LArSoft services in Python. The scope of this PR is to update this interface to work with LarSoft v10.  Additionally, a change to `CRTAuxDetInitializer_tool.cc` is needed to be able to call `CRTAuxDetInitializer` from Python. Currenlty, `CRTAuxDetInitializer` is defined in an unnamed namespace. This PR moves the `CRTAuxDetInitializer` declaration to a header file.
  - **Labels**: maintenance
  - **Reviewers**: jzennamo, SFBayLaser
  - **Assignees**: marcodeltutto
- PR #652: Revert "Revert "Save pedestal and RMS calculation in ChannelInfo object per TPC channel.""
  - **Description**: This enables retrieval of the two metrics from files where the RawDigit object is dropped. These metrics are necessary for identifying the presence of CE noise per-half-board per-event.  Depends on https://github.com/SBNSoftware/sbnobj/pull/120.
  - **Labels**: enhancement
  - **Reviewers**: 
  - **Assignees**: tomjunk
- PR #667: Inherit genie config from genie_beam_settings.fcl in sbncode
  - **Description**: `sbncode` PR https://github.com/SBNSoftware/sbncode/pull/492 introduces a common genie settings file to be used across SBN. With this PR, SBND inherits the GENIE configuration from it.  Fixes 588.  Running `fhicl-dump` on `prodgenie_corsika_proton_rockbox_sbnd.fcl` gives the following differences:  |            New | Original | Comment | | ------------ | --------- |--------| |           BeamCenter: [0,0,0] | BeamCenter: [-1400, -350, 0] | Good to change, used if we had a histogram-based flux | |            N/A | BeamRadius: 3 | Good to change, used if we had a histogram-based flux | |          DefinedVtxHistRange: false | DefinedVtxHistRange: true | Good to change, used if we had a histogram-based flux | |          N/A | EventsPerSpill: 0 | Same as 0, OK | |         GHepPrintLevel: -1 | N/A | OK, -1 is no print | |          N/A |MonoEnergy: 2 | OK, we should not set options for FluxType = "mono" | |          SpillTimeConfig: "\n    evgb::EvtTimeFNALBeam booster\n    nperbatch  84\n    nfilled    81\n    intensity  1.0\n    dtbucket  18.936\n    sigma      1.308\n    global     0.0\n    " |  SpillTimeConfig: "evgb::EvtTimeFNALBeam  booster,  dtbucket=18.936, sigma=1.308" | OK, as nperbatch 84 nfilled 81 intensity 1.0 are defaults | |         N/A |RandomTimeOffset: 10000 | OK | |          N/A | SurroundingMass: 0| OK, we shouldn't set this, it's for fluxes that don't know pot normalization | |          VtxPosHistRange: [] | VtxPosHistRange: [-210, 210, -210, 210, 10, 510] | Good to change, used if we had a histogram-based flux |
  - **Labels**: enhancement, simulation
  - **Reviewers**: jzennamo
  - **Assignees**: marcodeltutto
- PR #679: Feature/acastill tpcpmt3dbarycentermatching
  - **Description**: This PR incorporates 3DBarycenter flash matching with SBND data. This flash-matching tool matches slices to OpFlashes by minimizing the 3D distance between the charge and flash barycenter. The a slice has SpacePoints in both TPCs, the matching is performed separately on each of them, with the matching selected being the one with the largest number of PEs. The output of the matching is saved into a `sbn::TPCPMTBarycenterMatch` object that stores the relevant information of the matching.  `reco2_data.fcl` is changed to include this module. `cafmaker_sbnd_data.fcl` is changed to include the `sbn::TPCPMTBarycenterMatch` information.
  - **Labels**: enhancement, data
  - **Reviewers**: absolution1, yangtj207
  - **Assignees**: asanchezcastillo
- PR #685: Typo fix in flashmatch_sbnd.fcl
  - **Description**: Please provide a detailed description of the changes this pull request introduces.
  - **Labels**: bug, caf
  - **Reviewers**: PetrilloAtWork
  - **Assignees**: sxy1439
- PR #686: Fix indexing for LLTs in PTBAna
  - **Description**: Quick fix for indexing in PTBAna.
  - **Labels**: bug, trigger
  - **Reviewers**: 
  - **Assignees**: fjnicolas
- PR #687: Adjust offset to align SimChannel and recob::Wire
  - **Description**: Adjust the (deconvolution output) offset by 1 us (2 TPC ticks) to align truth (SimChannel) and reco (recob::Wire).  Closes Issue 680.
  - **Labels**: bug, tpc
  - **Reviewers**: 
  - **Assignees**: lynnt20
- PR #691: Update GeomScan File and Add check to Ensure is Compatible with current GDML/Flux
  - **Description**: Please provide a detailed description of the changes this pull request introduces.
  - **Labels**: 
  - **Reviewers**: jzennamo
  - **Assignees**: marcodeltutto
- PR #693: save traj points for cosmics
  - **Description**: Save G4 trajectory points for cosmics, to be used as hit truth info for calibration studies.
  - **Labels**: simulation
  - **Reviewers**: 
  - **Assignees**: wjdanswjddl
- PR #702: Drop PDS and CRT DAQ fragments, and Wiener wires
  - **Description**: Drop PDS and CRT DAQ fragments after the decoders have been run. Drop Wiener wires after reco has been run.
  - **Labels**: reco1/reco2, data
  - **Reviewers**: weihythu
  - **Assignees**: lyates17
- PR #704: Change number of events in data caf CI test from 2 to 5
  - **Description**: Changed the number of events ran from 2 to 5 for the data caf CI test. This needs to be changed as we are getting the following warning in the data caf log files:  `378: Files have different numbers of entries: 5 vs 2`  This warning was preventing the ref files from being updated.
  - **Labels**: bug, test
  - **Reviewers**: 
  - **Assignees**: RachelCoackley
- PR #694: CRT-TPC Matching with Data
  - **Description**: This PR makes the relevant updates to include the two CRT-TPC matching algorithms into the data workflow. It includes work from both Alex Moor and myself.  Included is: - Relevant fcl changes to add the modules to the workflow. - Changes to the CRTEventDisplay to visualise the matching. - Addition of fcl controllable (off by default) event display production within the matching producer modules. - Fixes for a bug in the track matching code that didn't account for the fact cathode crossing stitched tracks had already been shifted in x to fit the stitched t0. - Movement of some functions from the spacepoint matching alg to common utils so the event display can use them. - Addition of extra unrelated fcl that runs the decoders fcl disabling the output for the choppy filter path. I keep using this in various projects so it may as well be in the workflow. - Addition of new variables to CRTAnalysis trees to better analyse the matching performance.  Note this PR does _not_ fix known alignment problems between the CRT & TPC. In the interest of keeping PRs smaller I will prepare these GDML changes as a separate PR - the outputs of the matching algorithm are obviously dependent on this alignment fix. The algorithms still work well without this but are less performant.
  - **Labels**: crt, tpc, reco1/reco2, data
  - **Reviewers**: absolution1
  - **Assignees**: afm1g15, henrylay97
- PR #696: GDML v02 04
  - **Description**: Move to GDML v02_04. The difference with respect to GDML v02_03 is the movement of all 7 CRT tagger walls with respect to the TPC to better represent what we see in data.  Commit [ecb8643](https://github.com/SBNSoftware/sbndcode/commit/ecb8643c5dea338b2c576f25726c371fe491194a) shows the actual diff between 03 and 04.  I also add a pair of maps that provide the orientation & topend information for each module (the GDML purely simulates lumps of scintillator). These pieces of information were previously provided via if statements that have become more & more breakable as we have updated the GDML to reflect the more complex real life system. This prevents them from accidentally being broken by a GDML change.
  - **Labels**: crt, geometry
  - **Reviewers**: 
  - **Assignees**: henrylay97
- PR #637: Provide intial space charge effect calibration
  - **Description**: Studies of space charge effect (SCE) using SBND data have shown TPC-dependence, with spatial offsets appearing to be 1.5x larger in the West TPC compared to the East TPC.  ![image](https://github.com/user-attachments/assets/8910a45a-d957-4133-951a-3a035ecf086b)  To account for this in simulation, this PR updates (1) The sim. SCE maps containing spatial and E-field offsets.  Formerly, only one set of TH3s was present in the SCEoffsets_SBND_E500_voxelTH3.root.  A new file titled `SCEoffsets_SBND_E500_dualmap_voxelTH3.root` includes TH3s for each TPC, with the offsets scaled 1.5x in the West TPC.  **The new SCE ROOT file is currently located in /exp/sbnd/app/users/lkashur/sce_dev/sbnd_data/v01_28_00/SCEoffsets/**. but will need to make its way to the official sbnd_data area.  Note: The "1.5x offset map" is created by cloning the original SCE TH3s, and scaling by 1.5x.  For example, the forward dX offsets in the West TPC are determined by: ``` TH3F* hTrueFwdX_W = (TH3F*) hTrueFwdX->Clone(); for(int i=1; i<=hTrueFwdX->GetNbinsX(); ++i){ for(int j=1; j<=hTrueFwdX->GetNbinsY(); ++j){ for(int k=1; k<=hTrueFwdX->GetNbinsZ(); ++k){ Float_t orig = hTrueFwdX->GetBinContent(i, j, k); hTrueFwdX_W->SetBinContent(i,j,k, 1.5*orig); } } } hTrueFwdX_W->SetName("TrueFwd_Displacement_X_W"); ```   (2) The sbndcode scripts used to access the offsets: - LArSoftConfigurations/enable_spacecharge_services_sbnd.fcl - LArSoftConfigurations/enable_spacecharge_services_sbnd_2D_DriftSimOnly.fcl - SpaceCharge/SpaceChargeSBND.h - SpaceCharge/SpaceChargeSBND.cxx   Validation Simulated spatial offsets and local E-field are shown here. ![image](https://github.com/user-attachments/assets/3d921bc4-fdf0-41dd-a4e7-d54c74c94392) ![image](https://github.com/user-attachments/assets/b485222e-31c8-4fc3-806a-ebf8bd07dcff)
  - **Labels**: tpc
  - **Reviewers**: 
  - **Assignees**: lkashur
- PR #682: Move crt space points to reco1 so Supera can consume them
  - **Description**: Moves CRT space point making to reco1 so Supera can use them.  Adds ~0.003 s to reco1 stage processing time and increases the file size at reco1 by less than 0.1%.  Sequential tests were performed [here](https://dbweb8.fnal.gov:8443/LarCI/app/ns:sbnd/build_detail/phase_details?build_id=sbnd_ci/16653&platform=Linux%20slf7&phase=ci_tests&buildtype=slf7%20e26:prof).
  - **Labels**: crt
  - **Reviewers**: 
  - **Assignees**: bear-is-asleep
- PR #689: Python interfaces to LArSoft [5/5]
  - **Description**: Python interface code has been consolidated from `icarusalg`/`sbndcode` into `sbnalg`, and at the same time it has been updated. This pull request conforms the Python interface code after those changes, and it updates its documentation. Several files have been removed as they are now provided with the same name and interfaces in `sbnalg`.  This pull request depends on SBNSoftware/sbnalg1 and must be merged at the same time as that one. Note that the branch in this PR was based not on `develop` but rather on `feature/mdeltutt_python_services`, subject of 640: this PR should be merged after that one too (this one effective contains PR 640).  Suggested reviewers: * @marcodeltutto as expert in Python geometry interface * @absolution1 as SBND software coordinator
  - **Labels**: enhancement
  - **Reviewers**: absolution1
  - **Assignees**: PetrilloAtWork
- PR #690: Fix signedness of cluster timing sets
  - **Description**: This crept through review a month or two ago. These should be signed integers as we can have negative values. Well caught by @Li-Jiaoyang97!
  - **Labels**: bug, crt
  - **Reviewers**: 
  - **Assignees**: henrylay97, Li-Jiaoyang97
- PR #701: Feature/acastill pmt eff
  - **Description**: This PR changes the PMTs detection efficiencies to match the observed light yield in data. The detection efficiencies are changed for each of the TPCs independently to match their light yield. The PTMs that are not currently being reconstructed in data are turned off at the reconstruction stage.  To make sure that the topologies of the cosmic muons that was used is the same for data and MC, the histogram of steps for both samples is plotted here:  ![output](https://github.com/user-attachments/assets/8fd041b5-6b68-4ba2-95fc-f468a2a73ee6)  ![image (2)](https://github.com/user-attachments/assets/1943e00c-4fc2-44cc-b0be-666c5dbb050e)  The same efficiencies were obtained using a sample of muons distributed isotropically on the YZ plane.
  - **Labels**: detsim
  - **Reviewers**: jzennamo, ggamezdiego
  - **Assignees**: asanchezcastillo
- PR #703: Feature/caf pot
  - **Description**: CAFMaker changes for POT Accounting. Add POT data label to options.  Relevant PR in sbncode: https://github.com/SBNSoftware/sbncode/pull/495
  - **Labels**: caf
  - **Reviewers**: 
  - **Assignees**: nathanielerowe
- PR #706: Update OpT0Finder PMT Efficiencies
  - **Description**: Should be merged after PR 701 (which updates the optical simulation). Updates the efficiencies used in OpT0Finder with the latest measurements from data. These efficiencies are applied identically for data and simulation. The efficiencies used are listed in [docdb 40444](https://sbn-docdb.fnal.gov/cgi-bin/sso/ShowDocument?docid=40444).  Also masks out the uncalibrated and OFF PMTs for both MC and data. As of PR 701, the OFF PMTs are masked out in the `detsim` stage.  One other random commit to add `dataTier` entry to the metric filter fcl (so they don't fail on the grid).
  - **Labels**: pds, reco1/reco2, data
  - **Reviewers**: 
  - **Assignees**: lynnt20
- PR #713: Adding nonSCE cosmic MC cafmaker fcl
  - **Description**: Please provide a detailed description of the changes this pull request introduces.  **This is needed to create CAFs without the SCE corrections applied, this will allow us to produce files consistent between data and MC**
  - **Labels**: enhancement
  - **Reviewers**: 
  - **Assignees**: jzennamo
- PR #717: [Bug] Store all MCParticles
  - **Description**: This causes the parentage chain to be broken in MCTrack. Perhaps the upstream sim needs to be checked to ensure proper filtering. This should be put in to fix the attached issue.  Simply adding `volTPCActive` to the existing list does not fix the problem.  Comparing a few events before and after the change. ``` v10_04_06_01 418303      0.005 simb::MCParticles_largeant__GenieGen. v10_04_06_01 with change 462982      0.010 simb::MCParticles_largeant__GenieGen. ``` Adds ~50 kB / event based on this.
  - **Labels**: bug, simulation
  - **Reviewers**: marcodeltutto
  - **Assignees**: bear-is-asleep


sbndcode sbndcode
---------------------------------------------------

* 2025-04-10  Brinden Carlson : Merge branch 'release/v10_04_07'
* 2025-04-10  Brinden Carlson : Update to sbncode v10_04_07
* 2025-04-09  Bear Carlson : Merge pull request #717 from SBNSoftware/feature/bearc_bugfix_mctrack
* 2025-04-09  Bear Carlson : Merge pull request #713 from SBNSoftware/feature/jzennamo_nosce_cosmic
* 2025-04-09  Bear Carlson : Merge pull request #706 from SBNSoftware/feature/lynnt_opt0finder_data
* 2025-04-09  Bear Carlson : Merge pull request #703 from SBNSoftware/feature/caf_pot
* 2025-04-09  Bear Carlson : Merge pull request #701 from SBNSoftware/feature/acastill_pmt_eff
* 2025-04-09  Bear Carlson : Merge pull request #690 from SBNSoftware/bugfix/crt_timing_set_signedness
* 2025-04-09  Bear Carlson : Merge pull request #689 from PetrilloAtWork/feature/gp_v10python
* 2025-04-09  Bear Carlson : Merge pull request #682 from SBNSoftware/feature/bearc_sbnd_crt4supera
* 2025-04-09  Bear Carlson : Merge pull request #637 from SBNSoftware/feature/lkashur_initial_sce_calib
* 2025-04-09  Bear Carlson : Update larg4_services_sbnd.fcl
* 2025-04-09  Bear Carlson : Update larg4_services_sbnd.fcl
* 2025-04-08  jzennamo : adding cvnSCE to workflows
* 2025-04-07  lynnt20 : move the masked channels to main opt0 config, rather than data only fcl
* 2025-04-07  jzennamo : adding non-sce corrected cvn
* 2025-04-04  Gianluca Petrillo : Fixed gallery example build
* 2025-04-04  Gianluca Petrillo : Merge remote-tracking branch 'upstream/develop' into feature/gp_v10python
* 2025-04-04  jzennamo : adding nonsce cosmic mc cafmaker fcl
* 2025-04-03  Alejandro Sánchez Castillo : Add comment to opticalproperties
* 2025-04-02  Bear Carlson : Merge branch 'develop' into feature/bearc_sbnd_crt4supera
* 2025-04-01  NathanielERowe : Move fcls around again
* 2025-04-01  NathanielERowe : Merge branch 'develop' into feature/caf_pot
* 2025-04-01  NathanielERowe : temp cafmaker
* 2025-04-01  Bear Carlson : Merge pull request #696 from SBNSoftware/feature/hlay_gdml_v02_04
* 2025-04-01  Bear Carlson : Merge branch 'develop' into feature/hlay_gdml_v02_04
* 2025-04-01  Bear Carlson : Merge pull request #694 from SBNSoftware/feature/hlay_amoor_crt_tpc_matching_data_pr
* 2025-04-01  Bear Carlson : Merge pull request #704 from SBNSoftware/bugfix/coackley_ciDataWorkflowCafEvents
* 2025-04-01  Henry Lay : Merge branch 'develop' into feature/hlay_amoor_crt_tpc_matching_data_pr
* 2025-04-01  Bear Carlson : Merge pull request #702 from SBNSoftware/feature/yatesla_fileslim_data
* 2025-04-01  Bear Carlson : Merge pull request #693 from SBNSoftware/feature/munjung-larg4
* 2025-04-01  Bear Carlson : Merge pull request #691 from SBNSoftware/feature/mdeltutt_geom_scan_new
* 2025-04-01  Bear Carlson : Merge pull request #687 from SBNSoftware/feature/lynnt_wirecell_data
* 2025-04-01  Bear Carlson : Merge pull request #686 from SBNSoftware/feature/fnicolas_ptbanafix
* 2025-04-01  Bear Carlson : Merge pull request #685 from SBNSoftware/bugfix/syadav_fmfcltypo
* 2025-04-01  Bear Carlson : Merge pull request #679 from SBNSoftware/feature/acastill_tpcpmt3dbarycentermatching
* 2025-04-01  Bear Carlson : Merge pull request #667 from SBNSoftware/feature/mdeltutt_genie_base_settings
* 2025-04-01  Bear Carlson : Merge pull request #652 from SBNSoftware/revert-651-revert-642-feature/gputnam-TPCChannelInfo
* 2025-04-01  Bear Carlson : Merge pull request #640 from SBNSoftware/feature/mdeltutt_python_services
* 2025-03-31  lynnt20 : Merge branch 'develop' into feature/lynnt_opt0finder_data
* 2025-03-31  Henry Lay : Reference to TPC not cryostat
* 2025-03-28  Nathaniel Rowe : Merge branch 'feature/caf_pot' of github.com:SBNSoftware/sbndcode into feature/caf_pot
* 2025-03-28  Nathaniel Rowe : swap out fcl used in ci test
* 2025-03-28  Alejandro Sánchez Castillo : Change scintprescale to match change in pmt eff
* 2025-03-28  Alejandro Sánchez Castillo : Add list of masked channels in data
* 2025-03-27  lynnt20 : add updated PMT efficiencies from data
* 2025-03-27  Marco Del Tutto : Update check_genie_geom_scan.py with new fcl file
* 2025-03-27  Marco Del Tutto : Accidentally removed flux config in previous commit.
* 2025-03-27  Rachel : Merge branch 'develop' into bugfix/coackley_ciDataWorkflowCafEvents
* 2025-03-27  Lane Kashur : Point space charge service to dual SCE maps
* 2025-03-26  lkashur : Merge branch 'develop' into feature/lkashur_initial_sce_calib
* 2025-03-26  nathanielerowe : Merge branch 'develop' into feature/caf_pot
* 2025-03-26  Nathaniel Rowe : Move base fcl, change to offbeam
* 2025-03-26  Lauren Yates : Drop PDS and CRT DAQ fragments after decoder, and Weiner wires after reco
* 2025-03-26  Bear Carlson : Merge branch 'develop' into feature/mdeltutt_geom_scan_new
* 2025-03-26  Bear Carlson : Update sbnd_data
* 2025-03-26  lynnt20 : Merge tag 'v10_04_06_01' into feature/lynnt_opt0finder_data
* 2025-03-26  Rachel : Changed number of data events in caf test from 2 to 5
* 2025-03-26  Marco Del Tutto : Add sbnanaobj
* 2025-03-25  Gianluca Petrillo : Updated C++ gallery example/test build
* 2025-03-26  Alejandro Sánchez Castillo : Add actual pmt detection efficiencies
* 2025-03-26  Alejandro Sánchez Castillo : Tune PMT detection efficiencies to match data
* 2025-03-26  Alejandro Sánchez Castillo : Add PMT detection efficiency per TPC
* 2025-03-25  Gianluca Petrillo : Updated C++ gallery example/test build
* 2025-03-25  Nathaniel Rowe : cafmaker for each stream
* 2025-03-25  Marco Del Tutto : Temporarily disable python test
* 2025-03-25  Henry Lay : Update genie_sbnd.fcl
* 2025-03-24  Marco Del Tutto : Temporarily disable python test
* 2025-03-24  Marco Del Tutto : Re-add rotated bucket config
* 2025-03-24  Marco Del Tutto : Add fcl file to generate GENIE geomscan file
* 2025-03-24  Marco Del Tutto : Add missing )
* 2025-03-20  Brinden Carlson : Update to sbncode v10_04_06_01
* 2025-03-18  Henry Lay : Finally stop using silly breakable if statements for module orientation
* 2025-03-17  Henry Lay : Correct naming
* 2025-03-07  Henry Lay : Update references to gdml
* 2025-03-07  Henry Lay : Parse GDML
* 2025-03-07  Henry Lay : Adjust wall positions
* 2025-03-07  Henry Lay : Add copy of GDML v02_03
* 2025-02-26  Marco Del Tutto : Inherit genie config from genie_beam_settings.fcl in sbncode
* 2025-03-21  Henry Lay : Cleanup
* 2025-03-21  Henry Lay : Remove geometry changes and extra fcls for testing
* 2025-03-07  Henry Lay : Store channel numbers in matching
* 2025-02-28  Henry Lay : Update analysis module to record more matched track info
* 2025-03-04  Henry Lay : Merge remote-tracking branch 'origin/feature/hlay_change_crt_calib_ntuples' into feature/hlay_amoor_crt_tpc_matching_data
* 2025-03-03  Henry Lay : Add CRT-TPC matching to data reco2 workflow
* 2025-02-28  Henry Lay : Finish the job
* 2025-02-28  Henry Lay : Make quicker option for MC with no backtracking
* 2025-02-28  Henry Lay : Change how track directions are visualised
* 2025-02-28  Henry Lay : Move general functions out of specific alg
* 2025-02-27  Henry Lay : Fix unphysical track matching
* 2025-02-27  Henry Lay : Add the possibility to save event displays whilst running matching
* 2025-02-27  Henry Lay : More updates for visualising matching
* 2025-02-26  Henry Lay : Port changes to new fcl to preserve MC behaviour
* 2025-02-26  Henry Lay : Clean up event display for matching
* 2025-02-25  Henry Lay : Move changes to independent fcl to preserve existing behaviour
* 2025-02-25  Alexandra Moor : clean up to basics
* 2025-02-14  Alexandra Moor : Updates to test crttpc matching with data
* 2025-03-20  Mun Jung Jung : save traj points for cosmics
* 2025-03-21  Alejandro Sánchez Castillo : Merge branch 'develop' into feature/acastill_tpcpmt3dbarycentermatching
* 2025-03-20  Bear Carlson : Remove crt producer include
* 2025-03-20  Brinden Carlson : Merge tag 'v10_04_06_01' into develop
* 2025-03-20  Alejandro Sánchez Castillo : Merge branch 'develop' into feature/acastill_tpcpmt3dbarycentermatching
* 2025-02-26  Marco Del Tutto : Resolve conflicts
* 2025-02-26  Marco Del Tutto : Add fhiclpy dependency
* 2025-02-26  Marco Del Tutto : Add check to ensure the GeomScan is compatible with current gdml and flux files.
* 2025-02-26  Marco Del Tutto : Update GeomScan file to flux L and  gdml 02_03
* 2025-03-20  Alejandro Sánchez Castillo : Update sbndcode/TPCPMTBarycenterMatching/job/run_tpcpmt3dbarycentermatching_data.fcl
* 2025-03-20  Alejandro Sánchez Castillo : Fix bug with vector sizes
* 2025-03-20  Alejandro Sánchez Castillo : Modify verbose
* 2025-03-20  Alejandro Sánchez Castillo : Cleanup
* 2025-03-20  Alejandro Sánchez Castillo : Add BEGIN/END PROLOG
* 2025-03-20  Alejandro Sánchez Castillo : Fill ChargeTotal variable
* 2025-03-20  Alejandro Sánchez Castillo : Rename config fcl
* 2025-03-20  Alejandro Sánchez Castillo : Add parameter description, throw exception if missconfigured
* 2025-03-20  Henry Lay : Fix signedness of cluster timing sets
* 2025-03-19  Gianluca Petrillo : Python access to services (and geometry) updated to LArSoft v10
* 2025-03-19  Bear Carlson : Merge branch 'develop' into feature/bearc_sbnd_crt4supera
* 2025-03-18  lynnt20 : Merge branch 'develop' into feature/lynnt_wirecell_data
* 2025-03-18  lynnt20 : adjust offset to align sim channel and recob wire
* 2025-03-18  Brinden Carlson : Update data workflow to move crt spacepoint making to reco1
* 2025-03-18  Alejandro Sánchez Castillo : Merge branch 'develop' into feature/acastill_tpcpmt3dbarycentermatching
* 2025-03-17  Fran Nicolas : Fix indexing for LLTs in PTBAna
* 2025-03-14  Shweta Yadav : Typo fix in flashmatch_sbnd.fcl
* 2025-03-14  Alejandro Sánchez Castillo : Cleanup
* 2025-03-14  Alejandro Sánchez Castillo : Update fcl
* 2025-03-11  Alejandro Sánchez Castillo : Update fcl configuration
* 2025-03-11  Alejandro Sánchez Castillo : Use the matching with the largest flash
* 2025-03-13  Brinden Carlson : Move crt space points to reco1 so Supera can consume them
* 2025-03-11  lynnt20 : Merge branch 'feature/lynnt_opt0finder_data' of github.com:SBNSoftware/sbndcode into feature/lynnt_opt0finder_data
* 2025-03-11  lynnt20 : add datatier to metric filter fcl
* 2025-03-10  lkashur : Merge branch 'develop' into feature/lkashur_initial_sce_calib
* 2025-03-10  Lane Kashur : Set path to updated SCE ROOT file
* 2025-03-10  Marco Del Tutto : Merge branch 'develop' into feature/mdeltutt_python_services
* 2025-03-10  Alejandro Sánchez Castillo : Initial commit
* 2025-03-10  Marco Del Tutto : Re-add gallery tests
* 2025-03-04  Gianluca Petrillo : Changes to Python initialization of LArSoft geometry
* 2025-02-27  Lane Kashur : Add E+W flexibility in SCE workhorse script
* 2025-02-27  Marco Del Tutto : Update galleryAnalysis to v10
* 2025-02-27  Marco Del Tutto : Merge branch 'develop' into feature/mdeltutt_python_services
* 2025-02-26  Marco Del Tutto : Do not use CRTAuxDetInitializerSBND initializer
* 2025-02-20  Bear Carlson : Revert "Revert "Save pedestal and RMS calculation in ChannelInfo object per TPC channel.""
* 2025-02-18  Marco Del Tutto : Rename CRTAuxDetInitializer to CRTAuxDetInitializerSBND.
* 2025-02-18  Marco Del Tutto : Correcly include tool in cmakelists source
* 2025-02-17  Marco Del Tutto : Fix SetupAuxDetGeometry constructor
* 2025-02-15  Marco Del Tutto : Add python services to tests
* 2025-02-15  Marco Del Tutto : Bring up to date with ICARUS equivalent code
* 2025-02-15  Marco Del Tutto : Fix bug in registering WireReadout service
* 2025-02-14  Marco Del Tutto : Update python interface to service for LArSoft v10
* 2025-02-14  Marco Del Tutto : Move CRTAuxDetInitializer declaration to a header file.
* 2025-02-13  lkashur : Update SpaceChargeSBND.h

sbndutil 
---------------------------------------------------

* 2025-04-10  Brinden Carlson : Merge tag 'v10_04_07' into develop
* 2025-04-10  Brinden Carlson : Merge branch 'release/v10_04_07'
* 2025-04-10  Brinden Carlson : Update to sbncode v10_04_07
* 2025-03-20  Brinden Carlson : Merge tag 'v10_04_06_01' into develop
