---
layout: page
title: ReleaseNotes101002
toc: true
---

-----------------------------------------------------------------------------
| v10.10.02 | 16 Sep 2025 | [ReleaseNotes](ReleaseNotes101002.html) |
| --- | --- | --- |



sbndcode v10_10_02 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v10_10_02](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v10_10_02/sbndcode-v10_10_02.html)

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
### Release Notes for [sbndcode] from v10_09_00 to v10_10_02
- PR #750: CCNueFilter (v10_06_00 production PR)
  - **Description**: - Adds a new fcl block inside `Filters/filters.fcl` for a charged-current electron-neutrino interaction inside the TPC active volume. - Adds a new gen fcl that runs rockbox + the ccnue filter. Events with an AV CC nue interaction will be passed, as well dirt activity in the same event.  Partially resolves issue 655. Some validation and discussion in the develop PR 748.
  - **Labels**: enhancement, simulation
  - **Reviewers**: jzennamo, lyates17
  - **Assignees**: lynnt20
- PR #758: Bump versioning for production patch release
  - **Description**:
  - **Labels**:
  - **Reviewers**:
  - **Assignees**: 
- PR #756: Updates to semi-analytical light simulation: optical path tool
  - **Description**:
  - **Labels**:
  - **Reviewers**: miquelnebot
  - **Assignees**:
- PR #809: Update calibration database to provide new attributes
  - **Description**: Update calibration database to provide new pds-related attributes. This PR requires merging a new version of sbnd_data which is currently located at `/exp/sbnd/app/users/acastill/FallProductionPR/v10_09_00/sbnd_data`
  - **Labels**: enhancement
  - **Reviewers**: VCLanNguyen
  - **Assignees**: asanchezcastillo
- PR #807: Feature/acastill tpcpmt bfm upgrade
  - **Description**: This PR introduces changes to the TPCPMTBarycenter flash matching algorithm to improve its performance. In particular, it makes use of the directionality of the charge/light footprints and a very naive light-calorimetry that is used along with the separation between the charge/light barycenter to build a chi2 that is used to perform charge/light matching.
  - **Labels**: reco1/reco2
  - **Reviewers**: linyan-w, lynnt20
  - **Assignees**: asanchezcastillo
- PR #818: Revert "Feature/acastill tpcpmt bfm upgrade"
  - **Description**:
  - **Labels**:
  - **Reviewers**:
  - **Assignees**:
- PR #791: Geant4Reweight SBN/SBND implementation
  - **Description**:
  - **Labels**:
  - **Reviewers**:
  - **Assignees**:
- PR #795: Prepare SCE maps and relevant FHiCLs for detector variation samples
  - **Description**: Three new space charge effect (SCE) maps are created with this PR:  
1. SCEoffsets_SBND_E500_dualmap_CV_voxelTH3.root (1.1x nominal in East TPC, 1.4x nominal in West TPC) 
2. SCEoffsets_SBND_E500_dualmap_0x_voxelTH3.root (bin contents in CV histogram are multiplied by zero) 
3. SCEoffsets_SBND_E500_dualmap_2x_voxelTH3.root (bin contents in CV histogram are multiplied by two)  
As usual, these maps are to be stored in the latest version of **sbnd_data/SCEoffsets**.   Motivation for the scalings used for 1 (1.1x and 1.4x offsets) comes from differences seen in spatial offsets between TPCs using Spring 2025 crossing muon data. New FHiCL files for g4 simulation point to these maps and are located in **JobConfigurations/standard/g4/sce_variations/**: - g4_enable_nominalspacecharge_sbnd.fcl - g4_enable_zerospacecharge_sbnd.fcl - g4_enable_doublespacecharge_sbnd.fcl  Additionally, the standard LArSoft SCE FHiCL (**LArSoftConfigurations/spacecharge_sbnd.fcl**) now points to the updated CV map.  For validation, a small sample of anode-cathode crossing muons was created at the gen stage, and processed with each of the SCE variation maps at the g4 stage.
  - **Labels**: simulation
  - **Reviewers**:
  - **Assignees**: lkashur
- PR #739: Add Waveform Alignment module
  - **Description**: Add a new module to that perform waveform alignment on PMT OpDetWaveform products.  The module take OpDetWaveform from the decoding stage, then applies various timing calibration: correcting PPS path, total cable path from PMT to digitiser, digitser jittering, PMT response via cosmic calibration.  The module will be part of the standard workflow to reconstruct PMT data at the reco1 stage, and input into the module to make OpHit and OpFlash.  The fcl change is included in this PR:  1. sbndcode/OpDetReco/OpDeconvolution/job/opdeconvolution_sbnd_data.fcl 2. sbndcode/OpDetReco/OpDeconvolution/job/sbnd_flashfinder_deco_data.fcl 3. sbndcode/JobConfigurations/standard/reco/reco1_data.fcl
  - **Labels**: enhancement, pds, data
  - **Reviewers**: fjnicolas
  - **Assignees**: VCLanNguyen
- PR #754: Cafmakerjob unify pot data label
  - **Description**: Please provide a detailed description of the changes this pull request introduces.
  - **Labels**: caf
  - **Reviewers**: lyates17
  - **Assignees**: nathanielerowe
- PR #808: Feature/acastill opflash fixes
  - **Description**: This PR includes some fixes to the OpFlash geometry algorithms. In particular it does: - Modify the geometry threshold algorithm calculation to account for channels that are not being reconstructed for each of the TPCs. This is done through the calibration database service, which is read after the constructor of `FlashGeoThreshold_tool.cc` , which requires to create a new method to initialise the algorithm after the database is read. - Modifies the geometry threshold algorithm to provide an independent threshold for the Y and the Z coordinate, which has been shown to be the optimal configuration (https://sbn-docdb.fnal.gov/cgi-bin/sso/ShowDocument?docid=41584) - Handles the drift distance estimation for cases in which the `eta_pmt` is not contained within the calibrated points.  This PR needs https://github.com/SBNSoftware/sbndcode/pull/809 to be merged.
  - **Labels**: pds, reco1/reco2
  - **Reviewers**: linyan-w
  - **Assignees**: asanchezcastillo
- PR #792: Change RockBox Min Energy Deposited
  - **Description**: This PR changes the min energy deposited used for rockbox from 100 MeV to 10 MeV. It also add two more fcls: - `prodgenie_corsika_proton_rockbox100_sbnd.fcl` To run with 100 MeV cut - `prodgenie_corsika_proton_rockbox_lowenergy_sbnd.fcl` To require energy deposit between 1 and 100 MeV  The second fcl is possible thanks to a change to the `SimEnergyDepFakeTriggerFilter` module, which now can set bot the min and max deposited energy.   Filter acceptance rate:  | FHiCL | Cut on Deposited Energy | Pass Rate | |---|---|---| | `prodgenie_corsika_proton_rockbox_sbnd.fcl` | E_dep>10 MeV | 22.1% | | `prodgenie_corsika_proton_rockbox100_sbnd.fcl` | E_dep>100 MeV | 17.9% | | `prodgenie_corsika_proton_rockbox_lowenergydirt_sbnd.fcl` | 1<E_dep<100 MeV | 6.2% (Dirt only) | N/A | E_dep>1MeV | 23.5%
  - **Labels**: simulation
  - **Reviewers**: jzennamo, linyan-w
  - **Assignees**: marcodeltutto
- PR #812: X-ARAPUCA timing update for consistency with PMT and CRT decoders
  - **Description**: **Timing update to the X-ARAPUCA decoder including:** **- Same timing priority than PMT and CRT decoders: [0] SPEC-TDC, [1] PTB-HLT, [2] CAEN-only.**  Additionally: - Enhancement of the debug output (decoder_hist.root, and debug output messages). - Encapsulation enhancement of the timing functionality.
  - **Labels**: enhancement, pds, data
  - **Reviewers**: VCLanNguyen
  - **Assignees**: aliciavr
- PR #804: Frame Shift Module to Correct Timing in Data - PR For Develop
  - **Description**: New module for timing reconstruction. Module make data products for downstream reconstruction. Add to reco2 workflow
  - **Labels**: breaking change, reco1/reco2
  - **Reviewers**: lynnt20
  - **Assignees**: VCLanNguyen
- PR #783: Changing detsim drops for detvars
  - **Description**: This is a PR into develop for fall production. - Keeping `sim::SimPhotonsLites` for PDS detvar samples (boost reco1 file size by 1%) - workflow: scrub opdaq from detsim, rerun opdaq only detsim - Keeping `SimEnergyDeposits_PriorSCE_G4` (boost reco1 file size by > 30%) - originally planned just for the 1xdata stat CV MC sample that detvar samples will scrub from - realized that we need it for wiremod and thus modifying the default drop
  - **Labels**: maintenance, detsim
  - **Reviewers**: tbwester
  - **Assignees**: linyan-w

---------------------------------------------------

* 2025-09-16  Nathaniel : Merge branch 'release/v10_10_02'
* 2025-09-16  Nathaniel : update to larsoft v10_10_02
* 2025-09-16  nathanielerowe : Merge pull request #783 from SBNSoftware/Bugfix/linyan-keepdetsim
* 2025-09-16  nathanielerowe : Merge branch 'develop' into Bugfix/linyan-keepdetsim
* 2025-09-16  nathanielerowe : Merge pull request #804 from SBNSoftware/lnguyen/frame_shift_pr_dev
* 2025-09-16  nathanielerowe : Merge branch 'develop' into lnguyen/frame_shift_pr_dev
* 2025-09-16  nathanielerowe : Merge pull request #812 from SBNSoftware/feature/aliciavr_XARAPUCA_offline_decoder_v3.0-timing
* 2025-09-16  nathanielerowe : Merge branch 'develop' into feature/aliciavr_XARAPUCA_offline_decoder_v3.0-timing
* 2025-09-16  nathanielerowe : Merge pull request #792 from SBNSoftware/feature/mdeltutt_rockbox
* 2025-09-16  nathanielerowe : Merge branch 'develop' into feature/mdeltutt_rockbox
* 2025-09-16  nathanielerowe : Merge pull request #808 from SBNSoftware/feature/acastill_opflash_fixes
* 2025-09-16  nathanielerowe : Merge branch 'develop' into feature/acastill_opflash_fixes
* 2025-09-16  nathanielerowe : Merge pull request #754 from SBNSoftware/cafmakerjob-unify-pot-data-label
* 2025-09-16  nathanielerowe : Merge branch 'develop' into cafmakerjob-unify-pot-data-label
* 2025-09-16  nathanielerowe : Merge pull request #739 from SBNSoftware/lnguyen/wfalign_v10_06_00
* 2025-09-16  nathanielerowe : Merge branch 'develop' into lnguyen/wfalign_v10_06_00
* 2025-09-16  nathanielerowe : Merge pull request #795 from SBNSoftware/feature/lkashur_sce_detvar
* 2025-09-16  nathanielerowe : Merge branch 'develop' into feature/lkashur_sce_detvar
* 2025-09-16  nathanielerowe : Merge pull request #791 from pgreen135/feature/pgreen_g4rw_for_develop
* 2025-09-16  nathanielerowe : Merge branch 'develop' into feature/pgreen_g4rw_for_develop
* 2025-09-16  nathanielerowe : Merge branch 'develop' into feature/mdeltutt_rockbox
* 2025-09-16  nathanielerowe : Merge branch 'develop' into feature/aliciavr_XARAPUCA_offline_decoder_v3.0-timing
* 2025-09-16  nathanielerowe : Merge branch 'develop' into lnguyen/frame_shift_pr_dev
* 2025-09-16  nathanielerowe : Merge branch 'develop' into cafmakerjob-unify-pot-data-label
* 2025-09-16  nathanielerowe : Merge branch 'develop' into feature/lkashur_sce_detvar
* 2025-09-16  nathanielerowe : Merge branch 'develop' into Bugfix/linyan-keepdetsim
* 2025-09-16  nathanielerowe : Merge branch 'develop' into feature/acastill_opflash_fixes
* 2025-09-16  nathanielerowe : Merge branch 'develop' into lnguyen/wfalign_v10_06_00
* 2025-09-16  nathanielerowe : Merge pull request #818 from SBNSoftware/revert-807-feature/acastill_tpcpmt_bfm_upgrade
* 2025-09-16  nathanielerowe : Revert "Feature/acastill tpcpmt bfm upgrade"
* 2025-09-15  nathanielerowe : Merge branch 'develop' into lnguyen/wfalign_v10_06_00
* 2025-09-15  nathanielerowe : Merge branch 'develop' into feature/acastill_opflash_fixes
* 2025-09-15  nathanielerowe : Merge pull request #807 from SBNSoftware/feature/acastill_tpcpmt_bfm_upgrade
* 2025-09-15  nathanielerowe : Merge branch 'develop' into feature/acastill_tpcpmt_bfm_upgrade
* 2025-09-15  nathanielerowe : Merge branch 'develop' into feature/acastill_opflash_fixes
* 2025-09-15  nathanielerowe : Merge branch 'develop' into lnguyen/wfalign_v10_06_00
* 2025-09-15  nathanielerowe : Merge pull request #809 from SBNSoftware/feature/acastill_calibrationdatabase_update
* 2025-09-15  nathanielerowe : Merge branch 'develop' into feature/acastill_calibrationdatabase_update
* 2025-09-15  nathanielerowe : unrevert sbnd_data for alejandro's PR
* 2025-09-15  nathanielerowe : Merge branch 'develop' into feature/acastill_calibrationdatabase_update
* 2025-09-15  nathanielerowe : Merge pull request #756 from pgreen135/feature/pgreen_optical_path_tool
* 2025-09-15  nathanielerowe : Merge branch 'develop' into feature/pgreen_optical_path_tool
* 2025-09-15  nathanielerowe : Update opt0finder_sbnd.fcl for pgreen PR
* 2025-09-15  linyan-w : Keep SimEnergyDeposits to accomodate potential G4 process name changes
* 2025-09-15  nathanielerowe : Merge branch 'develop' into feature/pgreen_optical_path_tool
* 2025-09-15  nathanielerowe : revert sbnd_data version
* 2025-09-15  nathanielerowe : Merge branch 'develop' into feature/pgreen_optical_path_tool
* 2025-09-15  nathanielerowe : Update product_deps
* 2025-09-15  nathanielerowe : Merge branch 'develop' into feature/pgreen_optical_path_tool
* 2025-09-15  Patrick Green : adding larsim::OpticalPath to OpT0Finder cmakelists
* 2025-09-12  nathanielerowe : Merge branch 'develop' into feature/acastill_calibrationdatabase_update
* 2025-09-12  nathanielerowe : Update product_deps
* 2025-09-11  Alicia Vázquez-Ramos : Add intuitive HL channel constants for default status. Fix name of the timing refrence info product.
* 2025-09-11  Alejandro Sánchez Castillo : Add new database timestamp
* 2025-09-11  Linyan Wan : Make default to keep SimEnergyDeposits for wiremod
* 2025-09-10  lkashur : Create detsim_detvar.fcl
* 2025-09-10  nathanielerowe : Merge branch 'develop' into lnguyen/wfalign_v10_06_00
* 2025-09-10  nathanielerowe : Merge branch 'develop' into cafmakerjob-unify-pot-data-label
* 2025-09-10  nathanielerowe : Merge branch 'develop' into feature/lkashur_sce_detvar
* 2025-09-10  nathanielerowe : Update product_deps
* 2025-09-10  nathanielerowe : Merge branch 'develop' into feature/lkashur_sce_detvar
* 2025-09-10  nathanielerowe : Merge branch 'develop' into feature/pgreen_g4rw_for_develop
* 2025-09-09  Marco Del Tutto : Decrease threshold to 1 MeV
* 2025-09-09  VCLanNguyen : add pmt response correction
* 2025-09-09  VCLanNguyen : Merge branch 'feature/acastill_calibrationdatabase_update' of https://github.com/SBNSoftware/sbndcode into lnguyen/wfalign_v10_06_00
* 2025-09-09  Alejandro Sánchez Castillo : Merge branch 'develop' into feature/acastill_tpcpmt_bfm_upgrade
* 2025-09-09  Alejandro Sánchez Castillo : Change workflow so geo algorithm is configured after calibration database
* 2025-09-08  Alejandro Sánchez Castillo : Merge branch 'develop' into feature/acastill_calibrationdatabase_update
* 2025-09-08  Alejandro Sánchez Castillo : Merge branch 'develop' into feature/acastill_opflash_fixes
* 2025-09-04  VCLanNguyen : Merge branch 'lnguyen/frame_shift_pr_dev' of https://github.com/SBNSoftware/sbndcode into lnguyen/frame_shift_pr_dev
* 2025-09-04  Alicia Vázquez-Ramos : Clean code and add comments to the code
* 2025-09-04  Alicia Vázquez-Ramos : Updated general timing. Improved debug output. Enhanced rollover and computations management. New auxiliar functions. Enhanced X axis from plots of decoder_hist.root
* 2025-09-04  VCLanNguyen : set default debug as false
* 2025-09-03  VCLanNguyen : move parameters to fcl
* 2025-09-02  VCLanNguyen : add labels to fcl
* 2025-09-02  VCLanNguyen : add caf maker fcl parameter
* 2025-09-02  VCLanNguyen : add new flag to enable/disable timing correction in caf
* 2025-09-03  Marco Del Tutto : Ensure that the only dirt events pass with the low energy filter rockbox
* 2025-09-02  Alejandro Sánchez Castillo : Update calibration database to provide new atributed
* 2025-09-02  Alicia Vázquez-Ramos : Clean code from SPEC-TDC and PTB references access
* 2025-07-14  Alejandro Sánchez Castillo : Fix bug in flash geo calculation
* 2025-06-24  Alejandro Sánchez Castillo : Fix Drift for failure cases
* 2025-05-15  Alejandro Sánchez Castillo : Add Y-Z independent threshold for flash geo
* 2025-09-02  Alejandro Sánchez Castillo : Add score to the tpcpmt bfm
* 2025-07-14  Alejandro Sánchez Castillo : Fix typo
* 2025-07-14  Alejandro Sánchez Castillo : Cleanup
* 2025-07-14  Alejandro Sánchez Castillo : Cleanup
* 2025-07-14  Alejandro Sánchez Castillo : Cleanup
* 2025-07-14  Alejandro Sánchez Castillo : Update config fcl
* 2025-07-14  Alejandro Sánchez Castillo : Improve BFM with charge/light directionality
* 2025-09-02  Alicia Vázquez-Ramos : Get closest SPEC-TDC ETRIG reference to the raw timestamp of the event header
* 2025-09-02  Alicia Vázquez-Ramos : Bugfix on getting the PTB reference
* 2025-09-02  Alicia Vázquez-Ramos : Update timing reference priority to be [0] ETRIG, [1] PTB and [2] CAEN-only. Enhance ETRIG code and make a function for it. Remove RWM reference
* 2025-09-01  Alicia Vázquez-Ramos : Get closest PTB reference to the raw timestamp of the event header
* 2025-09-01  Alicia Vázquez-Ramos : Filter by allowed HL triggers
* 2025-08-29  VCLanNguyen : Merge branch 'develop' into lnguyen/frame_shift_pr_dev
* 2025-08-29  VCLanNguyen : remove comments
* 2025-08-29  VCLanNguyen : move products from sbndcode to sbnobj
* 2025-08-29  Alicia Vázquez-Ramos : Access to PTB products
* 2025-08-28  lkashur : Add filename printout to SpaceChargeSBND.cxx
* 2025-08-28  lkashur : Create detsim_enable_zerospacecharge_sbnd.fcl
* 2025-08-28  lkashur : Create detsim_enable_doublespacecharge_sbnd.fcl
* 2025-08-28  lkashur : Delete sbndcode/JobConfigurations/standard/g4/sce_variations directory
* 2025-08-28  VCLanNguyen : Turn missing TDC products exception to a log
* 2025-08-27  Alicia Vázquez-Ramos : Starting point after latest XA top-hat plot timing updates
* 2025-08-26  VCLanNguyen : add reco2 fcl + some fixes
* 2025-08-25  Nathaniel : Merge tag 'v10_09_00' into develop
* 2025-08-25  nathanielerowe : Merge branch 'develop' into Bugfix/linyan-keepdetsim
* 2025-08-25  VCLanNguyen : add a new variable to correct at CAF
* 2025-08-25  lkashur : Add "rockbox" to zero variation fhicl
* 2025-08-25  lkashur : Add "rockbox" to nominal variation fhicl
* 2025-08-25  lkashur : Add "rockbox" to double variation fhicl
* 2025-08-25  lkashur : Add path to updated SCE CV map in spacecharge_sbnd.fcl
* 2025-08-21  Lane Kashur : Add folder for SCE detector variations at g4 stage
* 2025-08-20  Marco Del Tutto : Add fcls for rockbox with min dep energy of 100, and with dep energy btw 1 and 100
* 2025-08-20  Marco Del Tutto : Set min energy for rockbox to 10 MeV instead of 100 MeV
* 2025-08-20  Marco Del Tutto : Add option to set max dep energy
* 2025-08-19  VCLanNguyen : add frame shift to reco2 fcl
* 2025-08-18  nathanielerowe : Merge branch 'develop' into feature/pgreen_g4rw_for_develop
* 2025-08-17  Patrick Green : removing std::move call and adding larsim::OpticalPath to CMakeLists
* 2025-08-15  VCLanNguyen : add saving additional info
* 2025-08-14  Linyan Wan : Revert the default to drop all SimEnergyDeposits
* 2025-08-14  Linyan Wan : Add new drop file to keep SimEnergyDepo for detvars
* 2025-08-14  Linyan Wan : Keep sim::SimEnergyDeposits_ionandscint_PriorSCE_G4 and drop sim::SimEnergyDeposits_ionandscint__G4
* 2025-08-13  Linyan Wan : Save SimEnergyDeposits_ionandscint_priorSCE_G4 for future detvar
* 2025-08-12  VCLanNguyen : Add a new object TimingInfo to store timestamp in unix format
* 2025-08-11  Linyan Wan : Keep sim::SimPhotonsLites for PDS detvar
* 2025-08-06  VCLanNguyen : first commit
* 2025-08-04  Patrick Green : add set of cafmaker fhicls for g4rw
* 2025-07-24  Patrick Green : adding cafmaker fhicl for g4rw
* 2025-07-21  Patrick Green : clarifying comment
* 2025-07-17  nathanielerowe : Merge pull request #758 from SBNSoftware/release/v10_06_00_03
* 2025-07-17  Nathaniel : Bump versioning for production patch release
* 2025-07-17  nathanielerowe : Merge pull request #750 from SBNSoftware/feature/lynnt_ccnuefilter_prod
* 2025-07-16  Patrick Green : implementing sbnd case of optical path tool for semi-analytical model
* 2025-07-16  Patrick Green : change needed for updated SemiAnalyticalModel constructor
* 2025-07-15  nathanielerowe : Update cafmakerjob_sbnd_data_sce_bnblight.fcl
* 2025-07-15  nathanielerowe : Update cafmakerjob_sbnd_data_bnblight.fcl
* 2025-07-15  nathanielerowe : Update cafmakerjob_sbnd_data_sce_offbeamlight.fcl
* 2025-07-15  nathanielerowe : Update cafmakerjob_sbnd_data_offbeamlight.fcl
* 2025-07-08  lynnt20 : fix to ensure that events with only numu dirt do not pass
* 2025-07-02  lynnt20 : add new `ccnuefilter` filter block, remove deprecated fcl block
* 2025-07-02  lynnt20 : create new rockbox fcl that includes ccnue filter
* 2025-07-02  lynnt20 : make comment syntax uniform
* 2025-07-08  VCLanNguyen : breakdown individual correction factors
* 2025-07-08  VCLanNguyen : update reco1 fcl to pick up new waveforms, fix bugs in opflash finder fcls
* 2025-05-16  VCLanNguyen : fix correction for timing board
* 2025-05-15  VCLanNguyen : clean old comments
* 2025-05-15  VCLanNguyen : Add timing module
