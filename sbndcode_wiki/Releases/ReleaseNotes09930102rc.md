---
layout: page
title: ReleaseNotes09930102rc0
toc: true
---

-----------------------------------------------------------------------------
| v09.93.01.02rc0 | 19 Dec 2024 | [ReleaseNotes](ReleaseNotes09930102rc0.html) |
| --- | --- | --- |



sbndcode v09_93_01_02rc0 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_93_01_02rc0](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_93_01_02rc0/sbndcode-v09_93_01_02rc0.html)

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
- PR #568: Feature/lynnt wirecell data
  - **Description**: PR 539, Update coherent noise-filtering and other bits for MC and data.  - adjust coherent noise parameters (for signal protection) - update RC tail deconvolution time constant (from 1.1ms to 0.5ms), based on data - change number of expected ticks in data from 3415 -> 3427 - add a main jsonnet for running noise-filtering only
  - **Labels**: 
  - **Reviewers**: 
  - **Assignees**: 
- PR #569: Feature/hlay gdml v02 03
  - **Description**: PR 540, This PR introduces a new GDML file v02_03 which improves the description of the SBND CRT system. Full details are in [docDB 38333](https://sbn-docdb.fnal.gov/cgi-bin/sso/ShowDocument?docid=38333).  The resulting changes are made to the channel map, pedestal and timing delays files (the latter two primarily consisting of the addition of the top CRT).  The CRT channel map folder is reorganised to only contain genuine iterations of channel map change (hardware change) not just bug fix changes. Ideally this would be made run number dependent (as is described in the included README) but that is a next step.
  - **Labels**: 
  - **Reviewers**: 
  - **Assignees**: 
- PR #570: Feature/lynnt pmt decoder
  - **Description**: PR 541  1. Creates a two new data products to persist CAEN/event timing information for the downstream in case we drop the `CAEN1730` Fragments. - `raw::pmt::eventTimingInfo`: saves which timing system and what channel/word was used for the event reference time. - `raw::pmt::boardTimingInfo`: saves the postpercent and a vector of TTT (size will be >1 if there are extended triggers) - Association are also made between `raw::OpDetWaveforms` and `raw::pmt::boardTimingInfo`. Because there are three different instances of `OpDetWaveform`s created in each event, there are also three different instances of the associations. 2. Adds logic for choosing the PTB HLT timestamp when the SPEC TDC ETRIG is missing -  the HLT with the smallest trigger word >0 and <10000 (these limits are fcl configurable) is chosen, a check is also done to ensure the timestamps are within 3 ms (fcl configurable) of the raw header timestamp 3. adds the timing CAEN to the default decoding configuration (AKA the timing CAEN will be decoded by default) - timing CAEN waveforms do not need special treatment for decoding - timing CAEN waveforms from ch0, ch1, ch2 will be saved under instance `TimingChannels` as `raw::OpDetWaveforms`, with channel numbers `900`,`901`,`902` respectively. - timing CAEN waveforms from ch15 will be saved into the pre-existing instance `FTrigChannels` as `raw::OpDetWaveforms` - added fcl configurables to turn on/off saving the above waveforms, and which channels to save 4. adds some flexibility depending on number of TDC ETT found in the decoded TDC objects - if more than 1 TDC ETT is found, then the one closest to the raw header timestamp will be used as the reference time - correction for raw header timestamp is done by default, value set by `raw_ts_correction`, default value is 367 us.
  - **Labels**: 
  - **Reviewers**: 
  - **Assignees**: 
- PR #571: Linyan calib
  - **Description**: Please provide a detailed description of the changes this pull request introduces.
  - **Labels**: 
  - **Reviewers**: 
  - **Assignees**: 
- PR #572: add ellips recomb var fcls and move mod box ones to subdirectory
  - **Description**: Update recombination variation g4 fcls to work with the ellipsoid modified box model, which is the sbndcode default as of `v09_92_02_02`. - Add new fcls that vary the 3 EMB parameters (A, B, R) by 1 and 3 sigma (sigma being the fit uncertainty [reported by ICARUS](https://arxiv.org/abs/2407.12969)) in different combinations, which is noted in the name of the fcl - move the deprecated modified box model variation fcls under the subdirectory `modbox_variations`, and modify to ensure backwards compatibility - `modbox_variations` also includes `g4_sce_dirt_filter_lite_recomb_modbox.fcl`, which turns off EMB and turns on modified box model.  - example fhicl-dump to check that the variables are changed properly: ``` Apptainer> fhicl-dump g4_sce_dirt_filter_lite_recomb_A1_B0_R0.fcl | grep Box EllipsModBoxA: 9.12e-1 EllipsModBoxB: 2.04e-1 EllipsModBoxR: 1.25 ModBoxA: 9.3e-1 ModBoxB: 2.12e-1 UseEllipsModBoxRecomb: true UseModBoxRecomb: false  Apptainer> fhicl-dump g4_sce_dirt_filter_lite_recomb_A0_B1_R0.fcl | grep Box EllipsModBoxA: 9.04e-1 EllipsModBoxB: 2.12e-1 EllipsModBoxR: 1.25 ModBoxA: 9.3e-1 ModBoxB: 2.12e-1 UseEllipsModBoxRecomb: true UseModBoxRecomb: false  Apptainer> fhicl-dump g4_sce_dirt_filter_lite_recomb_A0_B0_R1.fcl | grep Box EllipsModBoxA: 9.04e-1 EllipsModBoxB: 2.04e-1 EllipsModBoxR: 1.27 ModBoxA: 9.3e-1 ModBoxB: 2.12e-1 UseEllipsModBoxRecomb: true UseModBoxRecomb: false  Apptainer> fhicl-dump g4_sce_dirt_filter_lite_recomb_modbox.fcl | grep Box EllipsModBoxA: 9.04e-1 EllipsModBoxB: 2.04e-1 EllipsModBoxR: 1.25 ModBoxA: 9.3e-1 ModBoxB: 2.12e-1 UseEllipsModBoxRecomb: false UseModBoxRecomb: true ```
  - **Labels**: 
  - **Reviewers**: 
  - **Assignees**: 
- PR #573: turn on calibrated electronics response by default
  - **Description**: Turn on using the calibrated electronic response parameters for signal processing for default data processing.
  - **Labels**: 
  - **Reviewers**: 
  - **Assignees**: 
- PR #574: Feature/hjscott1
  - **Description**: Introduces `reco1_rawdigit.fcl` and `reco2_rawdigt.fcl` to `sbndcode` into the standard/reco directory. These fcls perform the standard reco1/reco2 workflow, keeping `RawDigit` waveform information and running the SBND `track_caloskimmer` module to produce caloskim ntuples with `wiresX.adcs` branches filled with TPC waveform information. The fcls are currently configured to reconstruct deconvolved SBND data files, but can be used for mc workflows.
  - **Labels**: 
  - **Reviewers**: 
  - **Assignees**: 
- PR #575: Feature/hitdumper keepcrttracks
  - **Description**: Keep CRT tracks in hitdumper by default.
  - **Labels**: 
  - **Reviewers**: 
  - **Assignees**: 
- PR #576: de-capitalize Services and change ticks to 3427 for new data
  - **Description**: 
  - **Labels**: 
  - **Reviewers**: 
  - **Assignees**: 
- PR #577: Update to sbnd_data v01_26_00
  - **Description**: Update to sbnd_data v01_26_00
  - **Labels**: 
  - **Reviewers**: 
  - **Assignees**: 
- PR #578: Feature/acastill opdeco data
  - **Description**: This pull request introduces the set of required changes to run the PMT data reconstruction. In particular it:  - enables deconvolution on raw PMT waveforms using a SER that has been calibrated for each PMT. - allows for a channel-dependent noise filter (only gauss option at the moment, Wiener filter has to be tested and implemented). - corrects baseline oscillations on the deconvolved waveforms that are due to low-frequency noise on the raw waveforms. - configures the OpHitFinder parameters that are changed to run on data. - by default runs only on the subset of PMTs whose reconstruction has been validated. Further work will follow to have the rest of the PMTs validated.  This PR does also require to have a the new file digi_pmt_sbnd_data.root added to sbnd_data under the OpDetSim folder.
  - **Labels**: 
  - **Reviewers**: 
  - **Assignees**: 
- PR #579: Feature/tjyang cvn
  - **Description**: Integrate CVN model.
  - **Labels**: 
  - **Reviewers**: 
  - **Assignees**: 
- PR #580: Save space for reco1 data stage by dropping cluster3d
  - **Description**: Save space for data keepup by dropping cluster3d products.
  - **Labels**: 
  - **Reviewers**: 
  - **Assignees**: 
- PR #583: Feature/maxd ptb decoder update
  - **Description**: 
  - **Labels**: 
  - **Reviewers**: 
  - **Assignees**: 
- PR #585: Feature/lynnt pmtmetricsana
  - **Description**: Adds an analyzer that will put PMT Software Trigger/PMT Metrics Producer data products into a TTree and filter module to obtain events with beam-coincident light/timing. Useful for creating the top hat plot!
  - **Labels**: 
  - **Reviewers**: 
  - **Assignees**: 
- PR #584: Feature/hlay crt data timing
  - **Description**: As promised at the CM. This PR updates the low-level CRT reconstruction to provide a backup timing reference. Currently the SPEC TDC event trigger is used with the backup being to leave the CRT time in it's raw-est state if the TDC product/channel cannot be found.  This PR adds a first backup of using the PTB HLT before ultimately falling back to the raw-est state if neither can be found. It also makes use of an object provided by @lynnt20 to document this decision on the event.  This branch makes use of Lynn's PMT Decoder PR (541) and Max's PTB Decoder PR (581) so the diff includes the updates from those branches too.
  - **Labels**: 
  - **Reviewers**: 
  - **Assignees**: 


sbndcode sbndcode
---------------------------------------------------

* 2024-12-19  Brinden Carlson : Update to sbncode v09_93_01_p02
* 2024-12-19  Bear Carlson : Merge pull request #584 from SBNSoftware/feature/hlay_crt_data_timing
* 2024-12-19  Henry Lay : Update CMakeLists.txt - slipped through the conflict resolving
* 2024-12-19  Henry Lay : Merge branch 'v09_93_01_01p01rc' into feature/hlay_crt_data_timing
* 2024-12-18  Bear Carlson : Merge pull request #585 from SBNSoftware/feature/lynnt_pmtmetricsana
* 2024-12-18  Bear Carlson : Merge branch 'v09_93_01_01p01rc' into feature/lynnt_pmtmetricsana
* 2024-12-18  Bear Carlson : Merge pull request #583 from SBNSoftware/feature/maxd_PTBDecoderUpdate
* 2024-12-18  Bear Carlson : Merge branch 'v09_93_01_01p01rc' into feature/maxd_PTBDecoderUpdate
* 2024-12-18  Bear Carlson : Merge pull request #580 from SBNSoftware/feature/bearc_supera_data
* 2024-12-18  Bear Carlson : Merge branch 'v09_93_01_01p01rc' into feature/bearc_supera_data
* 2024-12-18  Bear Carlson : Merge pull request #579 from yangtj207/feature/tjyang_cvn
* 2024-12-18  Bear Carlson : Merge branch 'v09_93_01_01p01rc' into feature/tjyang_cvn
* 2024-12-18  Bear Carlson : Merge pull request #578 from SBNSoftware/feature/acastill_opdeco_data
* 2024-12-18  Bear Carlson : Merge branch 'v09_93_01_01p01rc' into feature/acastill_opdeco_data
* 2024-12-18  Bear Carlson : Merge pull request #577 from SBNSoftware/feature/bearc_sbnddata
* 2024-12-18  Bear Carlson : Merge branch 'v09_93_01_01p01rc' into feature/bearc_sbnddata
* 2024-12-18  Bear Carlson : Merge pull request #576 from SBNSoftware/trj_evdfcl_nov25_2024
* 2024-12-18  Bear Carlson : Merge branch 'v09_93_01_01p01rc' into trj_evdfcl_nov25_2024
* 2024-12-18  Bear Carlson : Merge pull request #575 from SBNSoftware/feature/hitdumper_keepcrttracks
* 2024-12-18  Bear Carlson : Merge branch 'v09_93_01_01p01rc' into feature/hitdumper_keepcrttracks
* 2024-12-18  Bear Carlson : Merge pull request #574 from SBNSoftware/feature/hjscott1
* 2024-12-18  Bear Carlson : Merge branch 'v09_93_01_01p01rc' into feature/hjscott1
* 2024-12-18  Bear Carlson : Merge pull request #573 from SBNSoftware/feature/lynnt_elecresp
* 2024-12-18  Bear Carlson : Merge branch 'v09_93_01_01p01rc' into feature/lynnt_elecresp
* 2024-12-18  Bear Carlson : Merge pull request #572 from SBNSoftware/feature/munjung-ellips_recomb_var_fcls
* 2024-12-18  Bear Carlson : Merge branch 'v09_93_01_01p01rc' into feature/munjung-ellips_recomb_var_fcls
* 2024-12-18  Bear Carlson : Merge pull request #571 from SBNSoftware/linyan-calib
* 2024-12-18  Bear Carlson : Merge branch 'v09_93_01_01p01rc' into linyan-calib
* 2024-12-18  Bear Carlson : Merge pull request #570 from SBNSoftware/feature/lynnt_pmt_decoder
* 2024-12-18  Bear Carlson : Merge branch 'v09_93_01_01p01rc' into feature/lynnt_pmt_decoder
* 2024-12-18  Bear Carlson : Merge pull request #569 from SBNSoftware/feature/hlay_gdml_v02_03
* 2024-12-18  Bear Carlson : Merge branch 'v09_93_01_01p01rc' into feature/hlay_gdml_v02_03
* 2024-12-18  Bear Carlson : Merge pull request #568 from SBNSoftware/feature/lynnt_wirecell_data
* 2024-12-18  lynnt20 : Merge branch 'v09_93_01_01p01rc' into feature/lynnt_pmtmetricsana
* 2024-12-18  Henry Lay : Turn off produces line if not referencing
* 2024-12-18  Alejandro Sánchez Castillo : Bugfix
* 2024-12-18  lynnt20 : add fcl for running the filter
* 2024-12-18  Max : Henry's Formatting issues and runnable PTBAna
* 2024-12-17  lynnt20 : add caen9 MSUM channel to default config, fix bug with else if block
* 2024-12-17  Henry Lay : Merge remote-tracking branch 'origin/feature/maxd_PTBDecoderUpdate' into feature/hlay_crt_data_timing
* 2024-12-17  Henry Lay : Add timing documentation to ana module
* 2024-12-17  Henry Lay : Correct use of allowed PTBs
* 2024-12-17  Alejandro Sánchez Castillo : Update OpDeconvolutionAlgWienerData_tool.cc
* 2024-12-17  Alejandro Sánchez Castillo : Update OpDeconvolutionAlgWienerData_tool.cc
* 2024-12-17  Max : Applying Henry's comments
* 2024-12-17  Alejandro Sánchez Castillo : Update OpDeconvolutionAlgWienerData_tool.cc
* 2024-12-17  Max Dubnowski : Update product_deps
* 2024-12-17  Max Dubnowski : Update SBNDPTBDecoder_module.cc
* 2024-12-17  Henry Lay : Add bookkeeping object
* 2024-12-17  Henry Lay : Remove debug prints
* 2024-12-17  Henry Lay : Make a few reversions from Max's branch
* 2024-12-17  Henry Lay : Re-add debugging statements
* 2024-12-17  Henry Lay : Merge remote-tracking branch 'origin/feature/maxd_PTBDecoderUpdate' into feature/hlay_crt_data_timing
* 2024-12-17  Henry Lay : Merge remote-tracking branch 'origin/feature/lynnt_pmt_decoder' into feature/hlay_crt_data_timing
* 2024-12-17  Henry Lay : Improve time referencing - check TDC is closest to event header and add PTB HLT backup option - final fallback is to just remove any PPS rollover in the CRTs but otherwise keep the T0 raw
* 2024-12-13  lynnt20 : move the timing reference objects to a new directory, and fiddle with the names to make accessible to other subsystems (crt)
* 2024-12-17  Alejandro Sánchez Castillo : Update opdeconvolution_alg_data.fcl
* 2024-12-17  Alejandro Sánchez Castillo : Update OpDeconvolutionAlgWienerData_tool.cc
* 2024-12-17  Alejandro Sánchez Castillo : Update opdeconvolution_sbnd_data.fcl
* 2024-12-17  Alejandro Sánchez Castillo : Update sbndcode/OpDetReco/OpDeconvolution/Alg/opdeconvolution_alg_data.fcl
* 2024-12-17  Alejandro Sánchez Castillo : Update run_sbndpds_ana_data.fcl
* 2024-12-17  Alejandro Sánchez Castillo : Update sbndcode/OpDetReco/OpDeconvolution/job/opdeconvolution_sbnd_data.fcl
* 2024-12-17  Alejandro Sánchez Castillo : Update sbndcode/OpDetReco/OpDeconvolution/job/sbnd_ophitfinder_deco_data.fcl
* 2024-12-17  Alejandro Sánchez Castillo : Update sbndcode/OpDetAnalyzer/PDSAnalyzer/job/run_sbndpds_ana_data_withWaveforms.fcl
* 2024-12-16  Max : Updates for sbndaq-artdaq-core v1_10_03
* 2024-12-16  Bear Carlson : Merge branch 'v09_93_01_01p01rc' into feature/lynnt_wirecell_data
* 2024-12-13  lynnt20 : move the timing reference objects to a new directory, and fiddle with the names to make accessible to other subsystems (crt)
* 2024-12-13  lynnt20 : fix typo
* 2024-12-13  lynnt20 : first commit of metric filter
* 2024-12-13  Henry Lay : Merge remote-tracking branch 'origin/feature/lynnt_pmt_decoder' into feature/hlay_crt_data_timing
* 2024-12-12  Max : Updates to the PTB Decoder so updated data fragments can be read and processed properly
* 2024-12-11  Max : Added changes to read 192b words
* 2024-12-10  lynnt20 : add option to read metrics even when instance is empty
* 2024-12-09  Tingjun Yang : Clean up code.
* 2024-12-09  Tingjun Yang : Change lcvn::SBNDPixelMap to lcvn::PixelMap. Use association to get slice information for each pixel map.
* 2024-12-08  Tingjun Yang : Add cvn to reco2_data.fcl.
* 2024-12-08  Tingjun Yang : Loop over all slices.
* 2024-12-08  Tingjun Yang : Add cvn to MC workflow.
* 2024-12-08  Tingjun Yang : Reduce printouts.
* 2024-12-08  Tingjun Yang : Use slice by default.
* 2024-12-08  Tingjun Yang : Add FileCatalogMetadataSBN.
* 2024-12-05  lynnt20 : remove default instance name
* 2024-12-05  lynnt20 : add option to save bes/etrig
* 2024-12-02  Brinden Carlson : Save space for reco1 data stage by dropping cluster3d
* 2024-12-01  Tingjun Yang : Add subrun.
* 2024-11-30  Tingjun Yang : Set t0 correction to true.
* 2024-11-29  Tingjun Yang : Add nhits for each plane.
* 2024-11-28  Tingjun Yang : Use new version of sbnd_data.
* 2024-11-28  Tingjun Yang : Add truth variables to ttree.
* 2024-11-28  Tingjun Yang : Use model in sbnd_data.
* 2024-11-27  Bear Carlson : Update to sbnd_data v01_26_00
* 2024-11-26  Tingjun Yang : Add fcl file to evaluation cvn and save a tree.
* 2024-11-26  Tingjun Yang : Specify inputs and outputs names.
* 2024-11-26  Tingjun Yang : Add a new version of tf_graph that takes inputs as an input.
* 2024-11-26  Alejandro Sánchez Castillo : Include PMT reco in standard data reco1 workflow
* 2024-11-25  Thomas Junk : de-capitalize Services and change ticks to 3427 for new data
* 2024-11-25  Alejandro Sánchez Castillo : Modify threshold
* 2024-11-23  Tingjun Yang : Save cvn scores in a TTree.
* 2024-11-23  Tingjun Yang : Add analyzer module to test CVN performance.
* 2024-11-22  lynnt20 : add analyzer to read pmt metric objects (from data)
* 2024-11-22  Tingjun Yang : Add a method to make pixel map from slice and evaluate it.
* 2024-11-21  Tingjun Yang : Add association between lcvn::SBNDPixelMap and lcvn::Result.
* 2024-11-21  Tingjun Yang : Reorganize fcl files.
* 2024-11-21  Tingjun Yang : Add association between recob::Slice and lcvn::SBNDPixelMap.
* 2024-11-20  Tingjun Yang : Add new fcl files for cvn training.
* 2024-11-20  Tingjun Yang : Initial commit of Varuna's work on CVN.
* 2024-11-18  Bear Carlson : Update sbndcode/Commissioning/fcls/hitdumpermodule.fcl
* 2024-11-18  Alejandro Sánchez Castillo : Add masked channels list
* 2024-11-18  Alejandro Sánchez Castillo : Add masked channels list
* 2024-11-15  Bear Carlson : Keep CRT tracks in hitdumper by default
* 2024-11-15  Alejandro Sánchez Castillo : Merge branch 'develop' into feature/acastill_opdeco_data Merge to catch up with develop
* 2024-11-14  lynnt20 : Merge tag 'v09_93_01_01' into feature/lynnt_pmt_decoder
* 2024-11-14  hjscott1 : Merge branch 'develop' into feature/hjscott1
* 2024-11-14  Brinden Carlson : Merge tag 'v09_93_01_01' into develop
* 2024-11-14  Alejandro Sánchez Castillo :  Undo unneccessary changes
* 2024-11-14  Alejandro Sánchez Castillo :  Undo unneccessary changes
* 2024-11-14  Alejandro Sánchez Castillo :  Undo unneccessary changes
* 2024-11-14  Alejandro Sánchez Castillo :  Undo unneccessary changes
* 2024-11-14  Alejandro Sánchez Castillo :  Undo unneccessary changes
* 2024-11-14  Alejandro Sánchez Castillo :  Undo unneccessary changes
* 2024-11-14  Alejandro Sánchez Castillo : Fix couts
* 2024-11-14  Alejandro Sánchez Castillo : Fix couts
* 2024-11-14  Alejandro Sánchez Castillo : Merge branch 'develop' into feature/acastill_opdeco_data Merging to have the branch up to date with develop
* 2024-11-14  Alejandro Sánchez Castillo : Add frequency cutoff option
* 2024-11-13  Harry Scott : Merge remote-tracking branch 'origin/feature/hjscott1' into feature/hjscott1
* 2024-11-13  Harry Scott : Moving reco drops to dedicated fcl (that keeps rawdigits)
* 2024-11-12  hjscott1 : Merge branch 'develop' into feature/hjscott1
* 2024-11-12  Harry Scott : Added rawdigit reco files
* 2024-11-08  lynnt20 : turn on calibrated electronics response by default
* 2024-11-07  lynnt20 : save multiple triggerTimeTag for extended waveforms, add rollover check for extended trigger
* 2024-11-07  Henry Lay : Thank goodness for the CI
* 2024-11-06  lynnt20 : Merge branch 'develop' into feature/lynnt_pmt_decoder
* 2024-10-31  Brinden Carlson : Update to larsoft v09_93_01
* 2024-10-15  Mun Jung Jung : filename tag to caf ttree
* 2024-09-25  Mun Jung Jung : cafmaker data calo labels
* 2024-09-24  Moon Jung : Update sbndcode/JobConfigurations/standard/caf/cafmakerjob_sbnd_data.fcl
* 2024-09-24  Moon Jung : Update sbndcode/JobConfigurations/standard/caf/cafmakerjob_sbnd_data.fcl
* 2024-09-20  Mun Jung Jung : caf fcl for data
* 2024-10-30  Bear Carlson : Update fast_simulation_reconstruction_test_muons.sh
* 2024-10-30  Bear Carlson : Update fast_simulation_reconstruction_test_electrons.sh
* 2024-10-30  Dom Brailsford : Rename comm fcl to drop 'sce' as its now assumed standard
* 2024-10-30  Dom Brailsford : Mention SCE being enabled as part of the standard reco2 workflow
* 2024-10-04  Dom Brailsford : Remove reco2_sce.fcl
* 2024-10-04  Dom Brailsford : Update the readme
* 2024-10-04  Dom Brailsford : Update all fcls to use standard_reco2_sbnd.fcl again
* 2024-10-04  Dom Brailsford : Update reco2_data.fcl to use standard_reco2_sbnd.fcl
* 2024-10-04  Dom Brailsford : Convert reco2 to the new format
* 2024-10-04  Dom Brailsford : Add a nominal reco2 drops. No additional drops are currently needed for reco2, but add the infrastructure now anyway...
* 2024-10-04  Dom Brailsford : Create a workflow fcl for reco2, mirroring the setup for reco1
* 2024-10-17  Bear Carlson : Update drops_reco1.fcl
* 2024-10-11  Bear Carlson : Save only space points
* 2024-10-14  Patrick Green : fix for running without crt strip hits present
* 2024-10-14  Thomas Junk : update timesize (the size of the frame in samples minus one) to 1143 per communication with Georgia and Seokju
* 2024-10-21  Bear Carlson : Update HitAnalysisAlg.cpp
* 2024-09-12  Kyle Knoepfel : Accommodate changes to recob::Hit
* 2024-10-22  Thomas Wester : fcl to run all the decoders
* 2024-11-06  Thomas Junk : add classes for association pairs, taking examples from lardataobj also add version numbers for the eventTimingInfo and boardTimingInfo classes and rerun mrb to get checksums for them.
* 2024-11-06  lynnt20 : add some checks for expected time difference, more corrections for second rollover
* 2024-11-04  lynnt20 : add usable ptb timing reference, fix bug with tdc calculation
* 2024-11-04  lynnt20 : add new board/event timing info, account for second rollover in some calculations
* 2024-11-04  lynnt20 : first commit of PMT timing-related data products with succesful build
* 2024-11-05  Mun Jung Jung : add ellips recomb var fcls and move mod box ones to subdirectory
* 2024-11-01  lynnt20 : actually update RC response value in simulation
* 2024-11-01  lynnt20 : update RC response value in simulation
* 2024-11-01  Henry Lay : Implementing cleaner suggestion from Dom
* 2024-11-01  Henry Lay : Clean up
* 2024-11-01  Henry Lay : Remove unnecessary fcl
* 2024-11-01  Henry Lay : Make NO-SCE reco2 fcl for calibrations
* 2024-11-01  Henry Lay : Make combined reco fcl use workflow thus removing need for reco_sbnd.fcl
* 2024-11-01  Henry Lay : Further split workflow sequences
* 2024-11-01  lynnt20 : update params.jsonnet so simulation also inherits the right number of ticks
* 2024-11-01  Henry Lay : Divide up sequences in workflow
* 2024-11-01  Henry Lay : Merge branch 'develop' into linyan-calib
* 2024-11-01  Henry Lay : Remove unnecessary variable
* 2024-10-31  Henry Lay : Clang build fix
* 2024-10-31  Henry Lay : Widen parent volume for CRT tops
* 2024-10-31  Henry Lay : Widen parent volume for CRT north
* 2024-10-31  lynnt20 : turn off coherent NF for simulation again
* 2024-10-31  lynnt20 : Revert "tune coherent noise filtering params"
* 2024-10-31  lynnt20 : correct grouping (was missing the last group by accident)
* 2024-10-31  lynnt20 : add section to make sure NF inherits the right number of ticks
* 2024-10-31  Alejandro Sánchez Castillo : Remove cout
* 2024-10-30  Bear Carlson : Merge branch 'develop' into feature/hlay_gdml_v02_03
* 2024-10-30  Alejandro Sánchez Castillo : Update root file with latest noise characterization
* 2024-10-30  Alejandro Sánchez Castillo : Fix fcl for running whole reco chain
* 2024-10-30  Alejandro Sánchez Castillo : Renaming
* 2024-10-30  Alejandro Sánchez Castillo : Modify ophitfinder fcl to run on data
* 2024-10-30  Alejandro Sánchez Castillo : Fix memory leak
* 2024-10-30  Alejandro Sánchez Castillo : Read noise filter parameters from file
* 2024-10-28  Linyan Wan : Reverting the standard reco2 fcl
* 2024-10-28  Linyan Wan : Adding fcl for no sce reco2
* 2024-10-24  lynnt20 : Merge branch 'develop' into feature/lynnt_pmt_decoder
* 2024-10-23  Linyan Wan : Getting CRT out of the MC calib ntuple for now (geometry conflict fix for 24B production)
* 2024-10-21  lynnt20 : add feature to output waveforms from the timing caen
* 2024-10-21  Henry Lay : Update channel maps accordingly
* 2024-10-21  Henry Lay : Update wrappers accordingly
* 2024-10-21  Henry Lay : Compile updates
* 2024-10-21  Henry Lay : Move extra Bern module up the list
* 2024-10-21  lynnt20 : access raw event header for timestamp in case of multiple tdc ett
* 2024-10-19  Henry Lay : Update README.md
* 2024-10-18  Henry Lay : Tell the README it can be beautiful
* 2024-10-18  Henry Lay : Sort orientation of module 70
* 2024-10-18  Henry Lay : Ensure all old FEBs are covered
* 2024-10-18  Henry Lay : Update pedestals and timing delays
* 2024-10-18  Henry Lay : Point fcl at newest channel map
* 2024-10-18  Henry Lay : Add a README for CRT channel mapping
* 2024-10-18  Henry Lay : Reset the channel map conventions
* 2024-10-18  Henry Lay : Merge remote-tracking branch 'origin/develop' into feature/hlay_gdml_v02_03
* 2024-10-16  lynnt20 : turn on coherent noise filtering for simulation
* 2024-10-16  lynnt20 : tune coherent noise filtering params
* 2024-10-16  lynnt20 : update number of ticks
* 2024-10-14  lynnt20 : add noise filtering only jsonnet configuration
* 2024-10-14  lynnt20 : update RC response to 0.5 ms, add documentation on bad channels
* 2024-10-11  Alejandro Sánchez Castillo : Fix diig file path
* 2024-10-11  Alejandro Sánchez Castillo : Fix typo
* 2024-10-11  Alejandro Sánchez Castillo : Separate Data and MC tools
* 2024-10-09  Henry Lay : Tidy up for develop
* 2024-10-08  Henry Lay : Correct top low mapping - thanks Andy
* 2024-10-05  Henry Lay : Slide (modules 82 & 83) to the right
* 2024-10-04  Henry Lay : New channel map for geometry changes
* 2024-10-04  Henry Lay : A couple of special case orientations on the north wall
* 2024-10-04  Henry Lay : It's never done - someone moved this module
* 2024-10-04  Henry Lay : Ensure SiPMs are at correct ends
* 2024-10-04  Henry Lay : Point at new gdml
* 2024-10-04  Henry Lay : Preparsed versions
* 2024-10-04  Henry Lay : You spin my module right round
* 2024-10-04  Henry Lay : Position top layers with respect to pit edge
* 2024-10-03  Henry Lay : Relative separation of top high & low in z
* 2024-10-03  Henry Lay : Align skinny modules
* 2024-10-03  Henry Lay : Correctly position top layers in y
* 2024-10-03  Henry Lay : Position top layers in y
* 2024-10-03  Henry Lay : Ensure NS modules are lower layer, then EW, then EW-central. For the top high
* 2024-10-03  Henry Lay : Flip top high
* 2024-10-03  Henry Lay : Correct offset from north
* 2024-10-03  Henry Lay : Make narrow modules slightly narrower and align to north end
* 2024-10-01  Henry Lay : Correct top low & top high module positions
* 2024-10-01  Henry Lay : Correct positioning of modules in north wall
* 2024-09-28  Henry Lay : Remove extra close statement
* 2024-09-27  Henry Lay : Sort out copy numbering
* 2024-09-27  Henry Lay : Keep naming convention consistent
* 2024-09-27  Henry Lay : Sort out a load of numbering elements
* 2024-09-26  Henry Lay : Make it compilable
* 2024-09-26  Henry Lay : Offset should be 192 not 212
* 2024-09-26  Henry Lay : Add missing decleration
* 2024-09-26  Henry Lay : Correct the problem with order that we had before
* 2024-09-26  Henry Lay : Add offset - bottom
* 2024-09-26  Henry Lay : Add offset
* 2024-09-26  Henry Lay : Position skinny modules
* 2024-09-26  Henry Lay : Add offset
* 2024-09-26  Henry Lay : Position top low
* 2024-09-26  Henry Lay : Position top high
* 2024-09-26  Henry Lay : Add offset
* 2024-09-26  Henry Lay : Declare uB modules
* 2024-09-26  Henry Lay : Add offset
* 2024-09-26  Henry Lay : Add skinny modules
* 2024-09-26  Henry Lay : Add offset
* 2024-09-26  Henry Lay : Add square uB modules
* 2024-09-26  Henry Lay : Adjust existing modules to uB standard width modules
* 2024-09-26  Henry Lay : Adjust other top low layer
* 2024-09-26  Henry Lay : Adjust other top high layer
* 2024-09-26  Henry Lay : Adjust existing modules to uB standard width modules
* 2024-09-26  Henry Lay : Adjust existing modules to uB narrow short modules
* 2024-09-26  Henry Lay : Declare uB narrow long modules
* 2024-09-26  Henry Lay : Add volume definitions for strips types
* 2024-09-26  Henry Lay : Add dimensions for strip arrays
* 2024-09-26  Henry Lay : Add new module sizes
* 2024-09-26  Henry Lay : Add gdml v02_03 - copy of v02_02
* 2024-10-01  Alejandro Sánchez Castillo : Add peak normalization from data
* 2024-10-01  Alejandro Sánchez Castillo : Add fcl to run with data
* 2024-10-01  Alejandro Sánchez Castillo : Add SER normalization
* 2024-09-13  Alejandro Sánchez Castillo : Use SER from data

sbndutil 
---------------------------------------------------

* 2024-11-14  Brinden Carlson : Merge tag 'v09_93_01_01' into develop
