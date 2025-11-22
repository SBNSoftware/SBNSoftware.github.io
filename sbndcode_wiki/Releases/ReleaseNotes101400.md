---
layout: page
title: ReleaseNotes101400
toc: true
---

-----------------------------------------------------------------------------
| v10.14.00 | 21 Nov 2025 | [ReleaseNotes](ReleaseNotes101400.html) |
| --- | --- | --- |



sbndcode v10_14_00 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v10_14_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v10_14_00/sbndcode-v10_14_00.html)

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
### Release Notes for [sbndcode] from v10_12_02_01 to v10_14_00
- PR #863: Update PMT calibration db for new PMT detsim
  - **Description**: This PR modifies the PMT Calibration Database Service to provide the information requires for realistic PTM detsim. In particular, it adds function to retrieve: - Whether a PMT is on or off, so the signal for off PMTs is not simulated. This is particularly relevant after the implementation of the new trigger emulation tool. - PMT non-linearity parameters.  It does also modify the database configuration file so it can access the latest database tag.  NOTE: This PR should be updated with commits from https://github.com/SBNSoftware/sbndcode/pull/873 once  the latter is ready to be merged.  Please provide a detailed description of the changes this pull request introduces.
  - **Labels**: detsim
  - **Reviewers**:
  - **Assignees**: asanchezcastillo
- PR #875: MC PMT Software Trigger + Trigger Subdirectory Reorganization
  - **Description**: Add MC version of PMT Software Trigger, add data PMT Software Trigger (equivalent to DAQ version) and reorganize the Trigger subdirectory in order to differentiate between legacy hardware+software PMT trigger simulation and current PMT software trigger simulation/development. All current PMT Metric modules (producers, filter, and analyzers) have now been moved to Trigger subdirectory `PMTSoftware`.  detsim and cafmaker fcls have been updated to run/accept PMT software trigger inputs/outputs. CAF maintainers have been added as reviewers for the accompanying PRs in `sbncode` and `sbnanaobj`.   `PMTMetricProducer.cc` Replica of `sbndaq-artdaq/ArtModules/SBND/SoftwareTrigger/PMTMetricProducer_module.cc`. The version in `sbndaq-artdaq` cannot be called in `sbndcode` since DAQ repos are not generally available through UPS, and vice versa.   `PMTMCMetricProducer.cc` First-pass at replicating software trigger in data. Inputs are `raw::OpDetWaveform`. Module simply takes 10 us chunk of optical waveforms from the PMTs and sums them into a "flash".
  - **Labels**: enhancement
  - **Reviewers**: linyan-w
  - **Assignees**: lynnt20
- PR #873: addign time dependent etau correction and global tag for calib DB tag for TPC etau and PDS gain
  - **Description**: - Adding global tag feature to summarize tags of calibration DB tables - Referring to icaruscode for the same feature - A new directory `sbndcode/Calibration/configurations/` for this purpose. - We can manage tags of all different calibration DB tables in this directory. - Now `sbndcode/Calibration/PDSDatabaseInterface/pmtcalibrationdatabase_sbnd.fcl` refers to this directory to collect `PMTCalibrationDatabaseTag` and `DatabaseTimeStamp`.  - Adding time dependent etau correction for data - Setting `sbnd_calorimetryalgdata.CaloDoLifeTimeCorrection: false` not to apply etau correction in `larreco`. - Then, adding `@local::driftnorm_sql` to `sbnd_calonormtoolsdata` so that etau correction could be made by normtool. - The `sbndcode/Calibration/TPCCalorimetry/NormalizeDriftSQLite_tool.cc` performs etau correction. This module collects etau for each TPC and apply it to the corresponding side of the TPC. - I have validated it using multiple data reco1 files  ``` lar -c reco2_data.fcl -s root://fndcadoor.fnal.gov:1094/pnfs/fnal.gov/usr/sbn/data_add/sbn_nd/poms_production/data/MCP2025B_noPOT/v10_10_03_01/FullRun1_RollingDev/reco1/bnblight/d3/reco1_filtered_decoded-raw_filtered_data_EventBuilder3_p2_art2_run18306_10_strmBNBLight_20250308T232959-d323d2a1-41c0-5f6c-ecc2-10dd0aadddcd.root -n 1 ... NormalizeDriftSQLite Tool -- Lifetime Data: TPC East: 67.769 TPC West: 61.8949 ... NormalizeDriftSQLite Tool -- Norm factor: 1.00381 at TPC: 0 Cryo: 0 Time: 0.257529 Track T0: 0, x: -161.693 ... ```  ``` lar -c reco2_data.fcl -s root://fndcadoor.fnal.gov:1094/pnfs/fnal.gov/usr/sbn/data_add/sbn_nd/poms_production/data/MCP2025B_noPOT/v10_10_03_01/FullRun1_RollingDev/reco1/bnblight/e0/reco1_filtered_decoded-raw_filtered_data_EventBuilder5_art1_run18412_18_strmBNBLight_20250410T024835-e0e0fc77-b089-3d97-ecb3-506cf9e2db83.root ... NormalizeDriftSQLite Tool -- Lifetime Data: TPC East: 51.1139 TPC West: 43.6863 ... ```
  - **Labels**: reco1/reco2, data
  - **Reviewers**:
  - **Assignees**: sungbinoh
- PR #880: Adding missing library link
  - **Description**:
  - **Labels**: maintenance
  - **Reviewers**: aliciavr
  - **Assignees**: PetrilloAtWork
- PR #879: Add proton light quenching
  - **Description**: Please provide a detailed description of the changes this pull request introduces.  This PR implements a light quenching factor for protons. The currently used modified box model is in agreement with experimental data (Ref Doke et al., Jpn. J. Appl. Phys. Vol. 41 (2002) pp. 1538–1545.) for MIPs but not for protons. The dotted line from the figure below shows the modified model prediction in the absence of electric field, which agrees with Figure 2 from the previous reference for MIPs but not for protons. Assuming the same light attenuation factor due to the electric field for protons and electrons (~0.6), the expected relative scintillation yield (L/L0) for protons can be calculated as the value quoted from the reference ~0.81 corrected by the electric field attenuation factor, that is  L/L0 ~ 0.49. From the figure below, we can see that the relative scintillation yield currently predicted by the modified box model is ~0.7, so we need an extra quenching factor of 0.7 to match the expected L/L0 ~ 0.49. <img width="1316" height="1052" alt="image" src="https://github.com/user-attachments/assets/4cfbe60c-b5ef-43e3-87c6-7338a822ed4e" />
  - **Labels**:
  - **Reviewers**: ggamezdiego
  - **Assignees**: asanchezcastillo
- PR #855: Fix booleans in from new MultiPart Generators
  - **Description**: Fix booleans in from new MultiPart Generators
  - **Labels**: bug
  - **Reviewers**:
  - **Assignees**: bear-is-asleep
- PR #854: Adopt G4BNB v1.1.0 Flux Files
  - **Description**: This PR changes the default flux files used for the main workflow to use the new [G4BNB v1.1.0](https://github.com/SBNSoftware/G4BNB/releases/tag/v1.1.0) production flux files.  Update flux files wiki: https://sbnsoftware.github.io/sbndcode_wiki/The_SBND_flux_files.html  Note that, since G4BNB files are in dk2nu format, `GDK2NUFLUXXML` must point to the following file that containes the flux window specification for SBND: ``` export GDK2NUFLUXXML=/cvmfs/sbnd.osgstorage.org/pnfs/fnal.gov/usr/sbnd/persistent/stash/fluxFiles/bnb/G4BNB/v1.1.0/GNuMIFlux.xml ```  Addittionally: - For some genie fhicl files, a "legacy" version is available that runs the with the old flux files: - GENIE only: `sbndcode/JobConfigurations/standard/gen/genie/other_flux_config/flux_configk/` - GENIE+CORSIKA rockbox: `sbndcode/JobConfigurations/standard/gen/genie_corsika/other_flux_config/flux_configl/` - This PR also include fhicls to run in RHC mode and beamdump mode (flux files were made with a previous version of G4BNB, v1.0.0) - This PR includes a CAFMaker fhicl that runs on gen-level files
  - **Labels**: simulation
  - **Reviewers**:
  - **Assignees**: marcodeltutto
- PR #872: updating residual range cut for caf maker with non-sce corrected object
  - **Description**: Please provide a detailed description of the changes this pull request introduces.
  - **Labels**: caf
  - **Reviewers**:
  - **Assignees**: sungbinoh
- PR #881: turn coherent noise removal off for both MC and data
  - **Description**: Turn off coherent noise removal in noise filtering for both MC and data signal processing.
  - **Labels**: detsim, reco1/reco2, data
  - **Reviewers**: sungbinoh, weihythu
  - **Assignees**: wjdanswjddl
- PR #853: adding TrackLikePidLabel: to cafmakerjob fcl files
  - **Description**: This PR adds `physics.producers.cafmaker.TrackLikePidLabel` into cafmakerjob fcl files. This is required to save the likelihood PID products created in reco2 stages into CAF.  For more information about the PID variables, please check [SBN-doc-42330](https://sbn-docdb.fnal.gov/cgi-bin/sso/ShowDocument?docid=42330).  - A relevant PR in `larana` that adds  new PID class `LikelihoodPIDAlg`: [PR41](https://github.com/LArSoft/larana/pull/41) - A relevant PR in `sbndcode` to add LikelihoodPIDAlg product in reco2 stage [PR849](https://github.com/SBNSoftware/sbndcode/pull/849). - Relevant PRs in sbnanaobj and sbncode: `sbnanaobj` [PR168](https://github.com/SBNSoftware/sbnanaobj/pull/168) and `sbncode` [PR593](https://github.com/SBNSoftware/sbncode/pull/593) .
  - **Labels**: caf
  - **Reviewers**: justinjmueller
  - **Assignees**: sungbinoh
- PR #876: Feature/acastill realistic pmt mc
  - **Description**: This PR aims at providing a realistic PMT MC simulation at the detsim stage. In particular it modifies the following items: - PMT response simulation: with this PR the response of each PMT is simulated independently using a SER retrieved from the calibration database. - PMT noise simulation: with this PR the simulated noise for each PMT is randomly sampled from a file containing 1000 noise templates for each PMT. - PMT Gain Fluctuation: this PR introduces a new tool `PMTGaussianGainFluctuation_tool.cc` that allows simulating a different gaussian gain fluctuation for each PMT. - PMT Non-linearities: this PR introduces a new tool `PMTNonLinearityTF1ChannelByChannel_tool.cc` that allows simulating pmt non-linearity on a channel by channel basis. - PMT Pulse Oscillation: this PR introduces a new module `PMTPulseOscillation_module.cc` that reproduces the low-frequency oscillations that have been observed after large-amplitude signals. More information here (). - PMT Detection Efficiency: this PR modifies the PMT detection efficiencies to improve the data/MC agreement.  This PR does all the mentioned changes to the standard simulation workflow. It does also refactor the PMT-related fcl configuration files so there is only one single configuration file that contains ideal MC, realistic MC and data configurations.
  - **Labels**: detsim
  - **Reviewers**:
  - **Assignees**: asanchezcastillo


sbndcode sbndcode
---------------------------------------------------

* 2025-11-21  Nathaniel : Merge branch 'release/v10_14_00'
* 2025-11-21  Nathaniel : Update versioning
* 2025-11-21  nathanielerowe : Merge pull request #876 from SBNSoftware/feature/acastill_realistic_pmt_mc
* 2025-11-21  Alejandro Sánchez Castillo : Fix path within sbnd_data
* 2025-11-21  nathanielerowe : Merge branch 'develop' into feature/acastill_realistic_pmt_mc
* 2025-11-21  nathanielerowe : Update sbncode version to v10_14_00
* 2025-11-21  nathanielerowe : Merge pull request #853 from sungbinoh/feature/sungbino_likepid_into_cafmaker
* 2025-11-21  nathanielerowe : Merge branch 'develop' into feature/sungbino_likepid_into_cafmaker
* 2025-11-21  nathanielerowe : Merge pull request #881 from SBNSoftware/feature/munjung-CNR_off
* 2025-11-21  nathanielerowe : Merge branch 'develop' into feature/munjung-CNR_off
* 2025-11-21  nathanielerowe : Merge pull request #872 from sungbinoh/feature/sungbin_caf_rr_cut_nosce_fcl
* 2025-11-21  nathanielerowe : Merge branch 'develop' into feature/sungbin_caf_rr_cut_nosce_fcl
* 2025-11-21  nathanielerowe : Merge pull request #854 from SBNSoftware/feature/mdeltutt_g4bnb
* 2025-11-21  nathanielerowe : Merge branch 'develop' into feature/mdeltutt_g4bnb
* 2025-11-21  nathanielerowe : Merge pull request #855 from SBNSoftware/feature/bearc_fixmultipart
* 2025-11-21  nathanielerowe : Merge branch 'develop' into feature/bearc_fixmultipart
* 2025-11-21  nathanielerowe : Merge pull request #879 from SBNSoftware/feature/acastill_lightprotonquenching
* 2025-11-21  nathanielerowe : Merge branch 'develop' into feature/acastill_lightprotonquenching
* 2025-11-21  nathanielerowe : Merge pull request #880 from PetrilloAtWork/feature/gp_linkFix
* 2025-11-21  nathanielerowe : Merge branch 'develop' into feature/gp_linkFix
* 2025-11-21  nathanielerowe : Merge pull request #873 from sungbinoh/feature/sungbino_timedep_etau
* 2025-11-21  nathanielerowe : Merge branch 'develop' into feature/sungbino_timedep_etau
* 2025-11-21  Alejandro Sánchez Castillo : Add PMTPulseOscillation subdir
* 2025-11-21  nathanielerowe : Merge pull request #875 from SBNSoftware/feature/lynnt_Fall25_pmtmetrics
* 2025-11-21  nathanielerowe : Merge branch 'develop' into feature/lynnt_Fall25_pmtmetrics
* 2025-11-21  nathanielerowe : Merge branch 'develop' into feature/acastill_realistic_pmt_mc
* 2025-11-21  nathanielerowe : Merge pull request #863 from SBNSoftware/feature/acastill_calibdb_update
* 2025-11-21  nathanielerowe : Merge branch 'develop' into feature/acastill_realistic_pmt_mc
* 2025-11-21  nathanielerowe : Merge branch 'develop' into feature/sungbino_likepid_into_cafmaker
* 2025-11-21  Alejandro Sánchez Castillo : Translate comments on the code
* 2025-11-21  Alejandro Sánchez Castillo : Change PMT detection efficiencies
* 2025-11-21  Alejandro Sánchez Castillo : Treat correctly the on/off calibrated/uncalibrated PMTs
* 2025-11-21  Alejandro Sánchez Castillo : Remove CRT includes
* 2025-11-21  Alejandro Sánchez Castillo : Fix comment on PMT response
* 2025-11-20  Mun Jung Jung : turn coherent noise removal off for both MC and data
* 2025-11-20  nathanielerowe : Add pathPrepend for GNuMIFlux.xml file
* 2025-11-20  nathanielerowe : Merge branch 'develop' into feature/mdeltutt_g4bnb
* 2025-11-20  Gianluca Petrillo : Adding missing library link
* 2025-11-20  nathanielerowe : Merge branch 'develop' into feature/bearc_fixmultipart
* 2025-11-20  nathanielerowe : Merge branch 'develop' into feature/acastill_lightprotonquenching
* 2025-11-20  nathanielerowe : Merge branch 'develop' into feature/acastill_calibdb_update
* 2025-11-20  nathanielerowe : Merge branch 'develop' into feature/sungbino_timedep_etau
* 2025-11-20  nathanielerowe : Merge branch 'develop' into feature/sungbin_caf_rr_cut_nosce_fcl
* 2025-11-20  nathanielerowe : Update sbnd_data version to v01_38_00
* 2025-11-20  Alejandro Sánchez Castillo : Add proton light quenching
* 2025-11-19  Alejandro Sánchez Castillo : Fix calibration database tag
* 2025-11-19  Alejandro Sánchez Castillo : Update tag for fall production configuration
* 2025-11-19  Alejandro Sánchez Castillo : Fix conflicts
* 2025-11-19  Alejandro Sánchez Castillo : Fix conflicts
* 2025-11-19  Alejandro Sánchez Castillo : Modify standard config to include realistic PMT MC and major fcl refactoring
* 2025-11-19  Alejandro Sánchez Castillo : Remove cout
* 2025-11-19  Alejandro Sánchez Castillo : Update default configuration
* 2025-11-19  Alejandro Sánchez Castillo :  Fix noise baseline and cleanup
* 2025-11-19  Alejandro Sánchez Castillo : Remove polarity as fcl-configurable parameter
* 2025-11-19  Alejandro Sánchez Castillo : Remove polarity as fcl-configurable parameter
* 2025-11-19  Alejandro Sánchez Castillo : Modify HDOpticalWaveform configuration for data time sampling
* 2025-11-19  Linyan Wan : Bypass flux version check as the current flux version naming is different
* 2025-11-19  Linyan Wan : Merge remote-tracking branch 'refs/remotes/origin/feature/mdeltutt_g4bnb' into feature/mdeltutt_g4bnb
* 2025-11-19  Linyan Wan : modify the geomscan file
* 2025-11-19  Nathaniel : Merge tag 'v10_12_02_01' into develop
* 2025-11-18  Alejandro Sánchez Castillo : Update database configuration
* 2025-11-19  Alejandro Sánchez Castillo : Revert "Update database configuration"
* 2025-11-19  Alejandro Sánchez Castillo : Fix random number generator
* 2025-11-19  Alejandro Sánchez Castillo : Modify MC workflow for realistic PDS
* 2025-11-19  Alejandro Sánchez Castillo : Add PMT pulse oscillation module
* 2025-11-18  Alejandro Sánchez Castillo : Update database configuration
* 2025-11-18  Alejandro Sánchez Castillo : Remove non linearity parameters from fcl
* 2025-11-13  Alejandro Sánchez Castillo : Declare configure method on base class
* 2025-11-13  Alejandro Sánchez Castillo : Call configuration function before using the tool
* 2025-11-13  Alejandro Sánchez Castillo : Add configuration function for old version
* 2025-11-13  Alejandro Sánchez Castillo : Add intialization method for using calibration database
* 2025-11-18  nathanielerowe : Merge branch 'develop' into feature/mdeltutt_g4bnb
* 2025-11-18  nathanielerowe : Merge branch 'develop' into feature/mdeltutt_g4bnb
* 2025-11-18  Linyan Wan : Merge remote-tracking branch 'refs/remotes/origin/feature/mdeltutt_g4bnb' into feature/mdeltutt_g4bnb
* 2025-11-18  Linyan Wan : Correct table name
* 2025-11-18  sungbinoh : use clockdata for t_drift in NormalizeDriftSQLite_tool.cc. Adding exception handlings too
* 2025-11-18  lynnt20 : add both run1/run2 daq labels
* 2025-11-18  lynnt20 : whoops
* 2025-11-18  lynnt20 : add pmtmetricmc config line and the `sbnd` tag to the config fcl
* 2025-11-18  lynnt20 : remove semicolon throwing fhicl error
* 2025-11-17  lynnt20 : Merge branch 'develop' into feature/lynnt_Fall25_pmtmetrics
* 2025-11-17  nathanielerowe : Merge branch 'develop' into feature/mdeltutt_g4bnb
* 2025-11-17  nathanielerowe : Merge branch 'develop' into feature/sungbino_likepid_into_cafmaker
* 2025-11-17  nathanielerowe : Merge branch 'develop' into feature/mdeltutt_g4bnb
* 2025-11-17  lynnt20 : update to the Run1 producer labels for pmtmetric in the DAQ
* 2025-11-17  lynnt20 : add fcl configurable ADC to PE conversion
* 2025-11-17  lynnt20 : add fcl configurable ADC to PE conversion
* 2025-11-17  lynnt20 : rename producers to be consistent with daq config, add instance name to differentiate between online/offline
* 2025-11-17  lynnt20 : restore deleted CMakeList - dunno how that happened
* 2025-11-17  lynnt20 : undo changes AKA move fcls back to PMT subdirectory
* 2025-11-17  lynnt20 : update stream type to match daq config
* 2025-11-17  lynnt20 : add software metric labels to cafmaker
* 2025-11-17  lynnt20 : add software trigger labels to cafmaker
* 2025-11-17  lynnt20 : add software trigger to detsim
* 2025-11-17  lynnt20 : add config fcl for mc producer module
* 2025-11-17  lynnt20 : clean up fcls, update metric labels to reflect current daq config - producer labels should be `pmtmetricbnb` and `pmtmetricoffbeam`
* 2025-11-17  Linyan Wan : Rename fcls to avoid conflict
* 2025-11-17  sungbinoh : For Alejandro's comment, adding pds db timestamp into PDS tagsets too.
* 2025-11-17  sungbinoh : adding comment for run range r1
* 2025-11-14  sungbinoh : minor update
* 2025-11-14  sungbinoh : addign time dependent etau correction and global tag for calib DB tags for TPC etau and PDS gain
* 2025-11-14  lynnt20 : simple readme
* 2025-11-14  lynnt20 : remove ttree and update padding
* 2025-11-14  sungbinoh : updating TrackHitFillRRStartCut and TrackHitFillRREndCut to 1000 for cafmakerjob_sbnd.fcl
* 2025-11-14  lynnt20 : additions to keep offline same as online - changing padding value for sum function - add check for empty container
* 2025-11-14  lynnt20 : clean up cmakelists
* 2025-11-13  lynnt20 : create new subdirectory for software trigger thats in use
* 2025-11-12  lynnt20 : missing trig_ts in trig_metrics
* 2025-11-12  lynnt20 : first commit of working MC software trigger producer
* 2025-02-26  lynnt20 : flash peak pe bug fix
* 2025-02-07  lynnt20 : update to recent daq config
* 2025-01-17  lynnt20 : first commit of offline pmtmetricsproducer (same as daq module), with fcl cleanup
* 2025-11-11  Alejandro Sánchez Castillo : Fix TF1 memory leak
* 2025-11-11  Alejandro Sánchez Castillo : Add off channel attribute for digitalization
* 2025-11-10  Alejandro Sánchez Castillo : Add SER, gain fluct and nonlinearity per channel
* 2025-11-10  Alejandro Sánchez Castillo : Add channel-by-channel non linearity
* 2025-11-06  Alejandro Sánchez Castillo : Update calibration db to provide nonlinearity params
* 2025-11-06  Alejandro Sánchez Castillo : Implement data-based gaussian gain fluctuations
* 2025-11-03  linyan-w : Merge branch 'develop' into feature/mdeltutt_g4bnb
* 2025-10-23  Brinden Carlson : Update multipart generator to have engines run without segmentation faults
* 2025-10-21  Marco Del Tutto : Merge branch 'feature/mdeltutt_g4bnb' of github.com:SBNSoftware/sbndcode into feature/mdeltutt_g4bnb
* 2025-10-21  Marco Del Tutto : Add new and legacy flux fhicl files
* 2025-10-21  Marco Del Tutto : Add G4BNB v1.1.0 flux files
* 2025-10-20  sungbinoh : adding TrackChi2PidLabel to cafmakerjob fcl files
* 2025-10-03  Marco Del Tutto : Add flc files for fhc, rhc, beamdump generation, as well as truth-only caf
* 2025-10-03  Marco Del Tutto : G4BNB flux files production b
* 2025-07-11  Marco Del Tutto : Add files and config to run with G4BNB. Only in beam dump mode for now.

