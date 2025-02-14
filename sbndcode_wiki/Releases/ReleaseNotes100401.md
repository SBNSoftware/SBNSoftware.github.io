---
layout: page
title: ReleaseNotes100401
toc: true
---

-----------------------------------------------------------------------------
| v10.04.01 | 14 Feb 2025 | [ReleaseNotes](ReleaseNotes100401.html) |
| --- | --- | --- |



sbndcode v10_04_01 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v10_04_01](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v10_04_01/sbndcode-v10_04_01.html)

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
### Release Notes for [sbndcode] from v10_03_01 to v10_04_01
- PR #592: FilterChoppy_module.cc
  - **Description**: This PR adds a check to see if the size of the raw::RDTimeStamp collection is zero and skips the filter calculation if it is.  It also switches the logic of what happens if there are no RDTimeStamps -- either because of an invalid handle or the collection size is zero.  This PR sets the behavior in such cases to true and not false.  The reason for that is so that runs with no TPC data, such as run 18044, which has CRT and PTB data  only, can pass the choppy event filter.  If there is no choppiness because there is no TPC data, then there is no need to reject the event.
  - **Labels**: bug
  - **Reviewers**: 
  - **Assignees**: tomjunk
- PR #596: Updated list of unresponsive channels
  - **Description**: This PR updates the list of unresoonsive channels in data with channels 8395 and 11147. Fixes 594.
  - **Labels**: detsim, data
  - **Reviewers**: 
  - **Assignees**: marcodeltutto
- PR #606: WireCell NF+SP updates (teardrop mitigation)
  - **Description**: Teardrop Mitigation  - update coherent noise filtering channel grouping to match reality - update one signal processing filter value: loose low-frequency filter for ROI finding, unrelated to TPC 2D deconvolution. Value is increased to remove residual low-frequency noise present in data.   Generic updates  - turn on coherent noise filtering for simulation - update number of ticks for `depofluxwriter` - update front porch size (from 400 -> 405 ticks) to match data since August 2024.   Note: Because we are adding coherent noise filtering and there's a very slight shift due to the front porch update, we can expect some changes in the CI.
  - **Labels**: tpc, data
  - **Reviewers**: 
  - **Assignees**: lynnt20
- PR #615: X-ARAPUCAs Offline Decoder v2.0: timing update & bugfix
  - **Description**: X-ARAPUCAs offline decoder v2.0 adds: - SPEC-TDC access: now there are two possible time reference frames for the decoded waveforms (SPEC-TDC ETT and CAEN-only). - Timing Reference Information product: product containing the timing reference frame activated in the decoding process. - Bug fix on extended fragments. - Improves and updates code documentation and code readibility.
  - **Labels**: bug, pds
  - **Reviewers**: jicrespo
  - **Assignees**: aliciavr
- PR #616: Add X-ARAPUCAs offline decoder to the production chain
  - **Description**: - Updates the `run_decoders_job.fcl` to add the X-ARAPUCAs offline decoder to the production chain.
  - **Labels**: pds, data
  - **Reviewers**: 
  - **Assignees**: aliciavr
- PR #621: Increase space in hitdumper for CRT
  - **Description**: Please provide a detailed description of the changes this pull request introduces.
  - **Labels**: crt
  - **Reviewers**: 
  - **Assignees**: henrylay97
- PR #628: PMT (Beam) Metrics Analyzer: Allow stream labels
  - **Description**: By default assume that the `pmtmetricproducer` can have multiple labels, which depend on the file stream. Most recent daq configs (see https://github.com/SBNSoftware/sbnd-daq-fcls/pull/24) have separate instances of `pmtmetricproducer`.
  - **Labels**: data
  - **Reviewers**: 
  - **Assignees**: lynnt20
- PR #632: Update CRT Pedestals
  - **Description**: Updates pedestal values used for the CRT following studies of December/January data.
  - **Labels**: maintenance, crt
  - **Reviewers**: 
  - **Assignees**: henrylay97
- PR #634: CRT North Wall Reco Bugfix
  - **Description**: PR 607 got incorrectly automatically closed. This is those changes.  > Not really sure how this one slipped through. Think it must have been during the merge conflicts that we lost track of a commit here or there. Anyway, this commit ensures that the north wall modules have the correct recorded orientation - a fact that is used in the reconstruction. Without this fix the north wall space point rate is ~0.  Also approved by @aantonakis on previous PR:  > Tested with Run 18039 BNBZeroBias and found that the North Wall was able to produce a Top Hat plot. Before the fix, the North Wall showed almost no rate for similar stats.
  - **Labels**: geometry, reco1/reco2, data
  - **Reviewers**: 
  - **Assignees**: henrylay97
- PR #635: CRT data fcl updates
  - **Description**: PR 591 got incorrectly automatically closed. This is those changes.  > Two minor changes to fcls relating to CRT data reconstruction. > 1.  Allow tracks to be made using the bottom CRT >      - This was turned off during some commissioning studies early on to reduce the reconstruction rate while we understood things further up our priority list. This can now be undone. > 2. Don't drop the RawEventHeader objects in the CRT-only reco workflow. >      - We were dropping all the fragments from the event. We would like to retain this particular fragment as it allows us to undo timing referencing if we want to. Note, this does not affect the standard data reconstruction workflow (reco1_data.fcl and reco2_data.fcl) where currently all fragments are being retained. This only impacts the CRT only workflow used internally by the CRT group.  Also approved by @bear-is-asleep on previous PR.
  - **Labels**: crt, reco1/reco2, data
  - **Reviewers**: 
  - **Assignees**: henrylay97
- PR #622: fix simchannel label to make calohit tmatch work
  - **Description**: `SimChannelLabel` was still configured as `simdrift`, which broke the calohit truth matching. This PR updates it to the proper 2Dsim label, `simtpc2d:simpleSC` to fix this bug. This doesn't affect the CAF workflow itself, but fixes a CAF bug for SBND specifically.
  - **Labels**: caf
  - **Reviewers**: 
  - **Assignees**: wjdanswjddl
- PR #633: Feature/acastill new pmt calibration
  - **Description**: This is a temporary PR in preparation for the workshop production. This PR substitutes the PMT calibration obtained for OV5 (May-Dec 2024) to adjust to the new PMT operational voltajes (OV6, Dec-2024 now). This is a temporary solution until the calibration database is ready to be interfaced with the deconvolution module. The PR also includes a modification to SBNDOpHitFinder to allow for a channel-dependent threshold. This is also a temporary solution. Definitive solution requires modifications to larana and will follow after larana [PR 36](https://github.com/LArSoft/larana/pull/36) is merged.  This PR needs to be merged with a new version of sbnd_data contained at `/exp/sbnd/app/users/acastill/Deconvolution/v10_03_01/srcs/sbnd_data`
  - **Labels**: reco1/reco2
  - **Reviewers**: absolution1
  - **Assignees**: 


sbndcode sbndcode
---------------------------------------------------

* 2025-02-14  Brinden Carlson : Merge branch 'release/v10_04_01'
* 2025-02-14  Brinden Carlson : Update to sbncode v10_04_01
* 2025-02-14  Bear Carlson : Merge pull request #633 from SBNSoftware/feature/acastill_newPMTCalibration
* 2025-02-14  Bear Carlson : Merge branch 'develop' into feature/acastill_newPMTCalibration
* 2025-02-14  Bear Carlson : Merge pull request #622 from SBNSoftware/feature/munjung-calohit_tmatch
* 2025-02-14  Bear Carlson : Merge branch 'develop' into feature/munjung-calohit_tmatch
* 2025-02-13  Mun Jung Jung : cleaning up the mess the pr became.. for the last time..
* 2025-02-13  Bear Carlson : Merge pull request #635 from SBNSoftware/feature/hlay_crt_data_fcl_updates
* 2025-02-13  Bear Carlson : Merge branch 'develop' into feature/hlay_crt_data_fcl_updates
* 2025-02-13  Bear Carlson : Merge pull request #634 from SBNSoftware/bugfix/hlay_crt_nwall_geom_for_reco
* 2025-02-13  Bear Carlson : Merge branch 'develop' into bugfix/hlay_crt_nwall_geom_for_reco
* 2025-02-13  Bear Carlson : Merge pull request #632 from SBNSoftware/feature/hlay_crt_pedestals_v2
* 2025-02-13  Bear Carlson : Merge branch 'develop' into feature/hlay_crt_pedestals_v2
* 2025-02-13  Bear Carlson : Merge pull request #628 from SBNSoftware/feature/lynnt_pmtmetricsana
* 2025-02-13  Bear Carlson : Merge branch 'develop' into feature/lynnt_pmtmetricsana
* 2025-02-13  Bear Carlson : Merge pull request #621 from SBNSoftware/feature/hlay_hitdumper_crt_maximums
* 2025-02-13  Bear Carlson : Merge branch 'develop' into feature/hlay_hitdumper_crt_maximums
* 2025-02-13  Bear Carlson : Merge pull request #616 from SBNSoftware/feature/aliciavr_XARAPUCA_offline_decoder-to-production
* 2025-02-13  Bear Carlson : Merge branch 'develop' into feature/aliciavr_XARAPUCA_offline_decoder-to-production
* 2025-02-13  Bear Carlson : Merge pull request #615 from SBNSoftware/feature/aliciavr_XARAPUCA_offline_decoder_v2.0-timing-update-bugfix
* 2025-02-13  Bear Carlson : Merge branch 'develop' into feature/aliciavr_XARAPUCA_offline_decoder_v2.0-timing-update-bugfix
* 2025-02-13  Bear Carlson : Merge pull request #606 from SBNSoftware/feature/lynnt_wirecell_teardrops
* 2025-02-13  Bear Carlson : Merge branch 'develop' into feature/lynnt_wirecell_teardrops
* 2025-02-13  Bear Carlson : Merge pull request #596 from SBNSoftware/marcodeltutto-patch-1
* 2025-02-13  Bear Carlson : Merge branch 'develop' into marcodeltutto-patch-1
* 2025-02-13  Bear Carlson : Merge pull request #592 from SBNSoftware/trj_bulletproof_choppyfilter_jan9_2025
* 2025-02-13  Bear Carlson : Merge branch 'develop' into trj_bulletproof_choppyfilter_jan9_2025
* 2025-02-13  Bear Carlson : Merge branch 'develop' into feature/aliciavr_XARAPUCA_offline_decoder-to-production
* 2025-02-13  Bear Carlson : Merge branch 'develop' into feature/aliciavr_XARAPUCA_offline_decoder_v2.0-timing-update-bugfix
* 2025-01-07  Henry Lay : Don't drop raw event headers in CRT-only data reco workflow
* 2025-01-07  Henry Lay : Allow tracks through CRT flat
* 2025-01-27  Henry Lay : Fix north wall reco problem
* 2025-02-12  Moon Jung : Delete sbndcode/Calibration/DQM/filtereventid.fcl
* 2025-02-12  Moon Jung : Delete sbndcode/Calibration/DQM/FilterEventID_module.cc
* 2025-02-12  Moon Jung : Delete sbndcode/Calibration/DQM/CMakeLists.txt
* 2025-02-12  Alejandro Sánchez Castillo : Fix bug with fcl configuration
* 2025-02-12  Alejandro Sánchez Castillo : Fix bug
* 2025-02-12  Alejandro Sánchez Castillo : Update fcl
* 2025-02-12  Alejandro Sánchez Castillo : Allow channel dependent threshold for OpHitFinder
* 2025-02-12  Alejandro Sánchez Castillo : Change data file to new calibration
* 2025-02-11  Mun Jung Jung : filtermodule by select by metadata
* 2025-02-11  Brinden Carlson : Merge tag 'v10_03_01' into develop
* 2025-02-11  Henry Lay : Add new pedestals
* 2025-02-10  Alicia Vázquez-Ramos : Update timing_instance_name with a default value to keep it consistent with PMT/CRT workflow
* 2025-02-07  Thomas Junk : also list 2781 and 7167 as bad channels
* 2025-02-05  lynnt20 : Merge tag 'v09_93_01_02p02' into feature/lynnt_pmtmetricsana
* 2025-02-05  lynnt20 : updates for multiple input labels
* 2025-02-03  Mun Jung Jung : fix simchannel label to make calohit tmatch work
* 2025-02-03  Henry Lay : Increase space in hitdumper for CRT
* 2025-01-30  Alicia Vázquez-Ramos : Restore ups/product_deps file
* 2025-01-29  Alicia Vázquez-Ramos : Restore ups/product_deps
* 2025-01-29  Alicia Vázquez-Ramos : Add X-ARAPUCAs offline decoder to production
* 2025-01-29  Alicia Vázquez-Ramos : Merge branch 'develop' into feature/aliciavr_XARAPUCA_offline_decoder_v2
* 2025-01-29  Alicia Vázquez-Ramos : Solved conflicts
* 2025-01-29  Alicia Vázquez-Ramos : Add TimingReferenceInfo object. Add documentation to the new features and enhances readibility of previous debug information.
* 2025-01-29  lynnt20 : update listed year
* 2025-01-25  Alicia Vázquez-Ramos : Merge branch 'develop' into feature/aliciavr_TDC_to_XARAPUCA_offline_decoder
* 2025-01-25  Alicia Vázquez-Ramos : Solve conflicts
* 2025-01-24  lynnt20 : turn on coherent noise filtering for simulation
* 2025-01-24  lynnt20 : update front porch to match data
* 2025-01-24  lynnt20 : update nticks for depofluxwriter
* 2025-01-24  lynnt20 : update channel grouping to match reality
* 2025-01-24  lynnt20 : update loose LF for teardrop mitigation
* 2025-01-24  lynnt20 : Update chndb-perfect.jsonnet (I can't count pt 2)
* 2025-01-24  lynnt20 : Update chndb-base.jsonnet (I can't count)
* 2025-01-24  lynnt20 : Merge branch 'develop' into marcodeltutto-patch-1
* 2025-01-24  Alicia Vázquez-Ramos : Tower waveforms bug fixed
* 2025-01-23  Alicia Vázquez-Ramos : Add timing type option.
* 2025-01-23  Alicia Vázquez-Ramos : Add SPEC-TDC timing information if it exists for a given fragment.
* 2025-01-16  Alicia Vázquez-Ramos : Modified ups/product_deps after merging feature/aliciavr_XARAPUCA_offline_decoder to math the ups/product_deps from sbndcode v09_93_01_02rc01
* 2025-01-16  Alicia Vázquez-Ramos : Merge branch 'feature/aliciavr_XARAPUCA_offline_decoder' into develop
* 2025-01-15  lynnt20 : update chndb-perfect.jsonnet with new unresponsive channels
* 2025-01-15  lynnt20 : update chndb-base.jsonnet with new unresponsive channels
* 2025-01-15  Marco Del Tutto : Add 8395 11147 as unresponsive channels
* 2025-01-11  tomjunk : Merge branch 'develop' into trj_bulletproof_choppyfilter_jan9_2025
* 2025-01-09  Thomas Junk : FilterChoppy_module.cc

sbndutil 
---------------------------------------------------

* 2025-02-14  Brinden Carlson : Merge tag 'v10_04_01' into develop
* 2025-02-14  Brinden Carlson : Merge branch 'release/v10_04_01'
* 2025-02-14  Brinden Carlson : Update to sbncode v10_04_01
