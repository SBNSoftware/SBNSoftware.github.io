---
layout: page
title: ReleaseNotes100500
toc: true
---

-----------------------------------------------------------------------------
| v10.05.00 | 29 Apr 2025 | [ReleaseNotes](ReleaseNotes100500.html) |
| --- | --- | --- |



sbndcode v10_05_00 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v10_05_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v10_05_00/sbndcode-v10_05_00.html)

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
### Release Notes for [sbndcode] from v10_04_07 to v10_05_00
- PR #728: Update to v10_04_08
  - **Description**: Needed in develop to test  PR 705. We'll later push this to a tagged release the normal way.  Note this only needs to pass unit tests, since it just checks the dependencies upstream.
  - **Labels**: maintenance
  - **Reviewers**: Li-Jiaoyang97
  - **Assignees**: 
- PR #673: Feature/acastill pmtdatabaseinterface
  - **Description**: This pull request introduces the required service to access the pds calibration database from any LArSoft module. It does also modifies `services_sbnd.fcl` to include the service by default. This PR requires to have an updated version of `sbnd_data` to include the `.db` file containing the information to read. This can be found in `/exp/sbnd/app/users/acastill/Database/sbnd_data`.
  - **Labels**: enhancement
  - **Reviewers**: VCLanNguyen
  - **Assignees**: asanchezcastillo
- PR #719: Updating calibration constants with values measured using 2025A Spring Dev Samples
  - **Description**: Updating TPC gain calibration constants for MC and Data with values measured using 2025A Spring Dev Samples.  Bellow figure is based on Moon's proton selection shown in page 7 of SBN-doc-40729. Updated calibration constant provides better agreement between MC and Data in chi2 distribution. The figure is using only collection plane. This PR updates calibration constants for all three planes.  <img width="587" alt="Screenshot 2025-04-10 at 10 38 35 PM" src="https://github.com/user-attachments/assets/5d633ea5-d526-4dce-b8bf-4ff8310d9a61" />  This PR affects both Reco2 and CAF, for all processes that use TPC gain calibration constants.
  - **Labels**: reco1/reco2, caf
  - **Reviewers**: mrguzzo
  - **Assignees**: sungbinoh, wjdanswjddl
- PR #721: Add tpcpdbarycentermatching to standard workflow
  - **Description**: This PR includes tpcpmtbarycenterflashmatching module as a part of the standard reconstruction workflow both in data and MC.
  - **Labels**: pds
  - **Reviewers**: 
  - **Assignees**: asanchezcastillo
- PR #726: Simulate dirt neutrinos in MPV
  - **Description**: Simulate MPV upstream of detector to train for dirt neutrinos.  <img width="1192" alt="Screenshot 2025-04-14 at 3 50 41 PM" src="https://github.com/user-attachments/assets/ef4bfed1-f2a5-4dc9-b07a-d6d2a90d6915" /> ^^ shows reconstructed neutrino vertex from Pandora after selection. Most are within 50 cm of TPC face in z-direction. <img width="836" alt="image" src="https://github.com/user-attachments/assets/399ece47-4a51-45ba-b2c1-13c218a2a358" />   ^^ shows the density of neutrino interactions by true type after fv cut in pandora selection. See docdb [36641](https://sbn-docdb.fnal.gov/cgi-bin/sso/ShowDocument?docid=36641)   This expands the volume by 75% `(440*440*540)/(360*360*460)=1.753`, so one would need to scale the training dataset size by 75% more events to reproduce a similar training set of the old volume (for the rain/MPR sample).
  - **Labels**: simulation
  - **Reviewers**: mrmooney, francois-drielsma, justinjmueller
  - **Assignees**: bear-is-asleep
- PR #725: Adding T0 correction to raw digit processing for calib purpose
  - **Description**: Adding T0 correction to raw digit processing for calib purpose
  - **Labels**: calibration
  - **Reviewers**: mrmooney
  - **Assignees**: linyan-w
- PR #734: bump version
  - **Description**: Please provide a detailed description of the changes this pull request introduces.
  - **Labels**: maintenance
  - **Reviewers**: bear-is-asleep
  - **Assignees**: nathanielerowe
- PR #729: fix overwrite bug with the BadChannels block
  - **Description**: fix overwrite bug with the BadChannels block and put the entire set in sbnd_channelstatus, copied for sbnd_data_channelstatus
  - **Labels**: bug, detsim, data
  - **Reviewers**: 
  - **Assignees**: sungbinoh, tomjunk
- PR #681: Feature/acastill flash drift distance
  - **Description**: This PR introduces the drift distance reconstruction for OpFlash with data. It does change the `GetDriftPosition()` method in `DriftEstimatorPMTRatio_tool.cc` to compute the eta_pmt parameter as the weighted average for each PDS box. This PR should be merged along with a new `sbnd_data` version that can be found in `/exp/sbnd/app/users/acastill/FlashMatch/v10_04_03/srcs/sbnd_data`.
  - **Labels**: reco1/reco2
  - **Reviewers**: 
  - **Assignees**: asanchezcastillo
- PR #705: CRT Calibrated Timing Corrections
  - **Description**: Jiaoyang's studies have resulted in a set of calibrated timing corrections for each module in the CRT system. This requires two changes to the codebase to read them in: - Factorising out what used to be one file to store the single timing correction per module to four files (t0 cable, t1 cable, t0 calibrated, t1 calibrated). - The CRTStripHit and CRTCluster objects now need to use a `double` to store their timing not an `int`. This is because Jiaoyang's corrections are fractional. The corresponding `sbnobj` PR updates the objects and this PR ensures all usage of the values is done assuming they are doubles.
  - **Labels**: crt, data
  - **Reviewers**: 
  - **Assignees**: henrylay97, Li-Jiaoyang97
- PR #707: Feature/aantonak crtveto
  - **Description**: Please provide a detailed description of the changes this pull request introduces.  This pull request adds a new producer module that uses CRT Space Point information to determine if an event satisfies different sets of CRT Veto Logic. It stores this information by adding a CRT Veto Class from sbnobj to each event at reco2 after the CRT reconstruction has been run. The CRT Veto class just stores a few boolean values flagging whether the event satisfies the corresponding veto logic. This code does not interfere with existing CRT code in any way. The module is contained entirely in a new subdirectory within the CRT directory.
  - **Labels**: crt
  - **Reviewers**: 
  - **Assignees**: aantonakis
- PR #730: Save OpFlash information in CAF files in SBND
  - **Description**: OpFlash information was not being saved in CAF files in SBND. This PRs incorporates the required changes to do so.  This PR depends on https://github.com/SBNSoftware/sbnanaobj/pull/138 and https://github.com/SBNSoftware/sbncode/pull/534
  - **Labels**: enhancement
  - **Reviewers**: PetrilloAtWork
  - **Assignees**: asanchezcastillo
- PR #733: Update parameters of in-time cosmic MC gen filter modules
  - **Description**: Please provide a detailed description of the changes this pull request introduces.
  - **Labels**: simulation
  - **Reviewers**: 
  - **Assignees**: lyates17
- PR #723: Feature/acastill flash drift mc new cal
  - **Description**: After tuning the PMTs detection efficiencies in MC and turning off the channels that were not being reconstructed, the drift calibration curve needs to be retuned. The method for estimating $\eta_{PMT}$ now has to be the same used in data. The new drift calibration curve is to be updated with a new `sbnd_data` version that can be found in `/exp/sbnd/app/users/acastill/PDSDataMC/v10_04_06_01/srcs/sbnd_data`.  This PR is to be merged with 681 and after 728.
  - **Labels**: bug
  - **Reviewers**: 
  - **Assignees**: asanchezcastillo
- PR #731: Update reco2_data.fcl
  - **Description**: This got incorrectly removed during a merge develop commit in 682 - another age old reminder to be really careful with merge conflicts!!  Note the difference in the diff for the `reco2_data.fcl` file between:  https://github.com/SBNSoftware/sbndcode/pull/682/files/b04973509f6356ac9e872ccde95ff543c899a389 (first 4 commits) and https://github.com/SBNSoftware/sbndcode/pull/682/files (once the develop merge has been applied)
  - **Labels**: bug, crt, reco1/reco2
  - **Reviewers**: 
  - **Assignees**: henrylay97


sbndcode sbndcode
---------------------------------------------------

* 2025-04-29  Brinden Carlson : Merge branch 'release/v10_05_00'
* 2025-04-29  Brinden Carlson : Update to sbncode v10_05_00
* 2025-04-29  nathanielerowe : Merge pull request #731 from SBNSoftware/bugfix/re_add_crt_tpc_matching
* 2025-04-29  nathanielerowe : Merge pull request #723 from SBNSoftware/feature/acastill_flash_drift_mc_newCal
* 2025-04-29  nathanielerowe : Merge branch 'develop' into feature/acastill_flash_drift_mc_newCal
* 2025-04-29  nathanielerowe : Merge branch 'develop' into bugfix/re_add_crt_tpc_matching
* 2025-04-29  nathanielerowe : Merge pull request #733 from SBNSoftware/feature/yatesla_intime_cosmic_timing
* 2025-04-29  nathanielerowe : Merge pull request #730 from SBNSoftware/feature/acastill_sbnd_opflash_caf
* 2025-04-29  nathanielerowe : Merge pull request #707 from SBNSoftware/feature/aantonak_crtveto
* 2025-04-29  nathanielerowe : Merge pull request #705 from SBNSoftware/feature/jiaoyang_hlay_crt_timing_corrections
* 2025-04-29  nathanielerowe : Merge pull request #681 from SBNSoftware/feature/acastill_flash_drift_distance
* 2025-04-29  nathanielerowe : Merge pull request #729 from SBNSoftware/trj_channelstatusfix_18apr2025
* 2025-04-29  aantonakis : Merge branch 'develop' into feature/aantonak_crtveto
* 2025-04-28  nathanielerowe : Merge pull request #734 from SBNSoftware/feature/nrowe_bumpversion
* 2025-04-28  NathanielERowe : bump version
* 2025-04-28  Thomas Junk : move noisy channels to the sbnd_channelstatus block and sweep it in to sbnd_data_channelstatus with the one @table
* 2025-04-28  Lauren Yates : Update buffers on in-time cosmic MC filter time windows after discussion with Marco
* 2025-04-28  nathanielerowe : Merge pull request #725 from SBNSoftware/linyan-calib
* 2025-04-28  nathanielerowe : Merge pull request #726 from SBNSoftware/feature/bearc_mpvmpr_dirt_fix
* 2025-04-25  John Plows : Merge branch 'develop' into bugfix/re_add_crt_tpc_matching
* 2025-04-25  Lauren Yates : Update parameters of in-time cosmic MC gen filter modules to use a data-like time window
* 2025-04-25  nathanielerowe : Merge pull request #721 from SBNSoftware/bugfix/tpcbarycenterflashmatching_mc
* 2025-04-25  nathanielerowe : Merge pull request #719 from SBNSoftware/feature/sungbino_ccal_update_2025spring
* 2025-04-25  nathanielerowe : Merge pull request #673 from SBNSoftware/feature/acastill_pmtdatabaseinterface
* 2025-04-25  Henry Lay : Update reco2_data.fcl
* 2025-04-24  Alexander Antonakis : fixed reco2_workflow. Removed unnecessary include statements. Declared variables in the lowest scope when possible
* 2025-04-23  nathanielerowe : Merge pull request #728 from SBNSoftware/feature/bearc_bumpversion
* 2025-04-22  Alejandro Sánchez Castillo : Save OpFlash information in CAF files
* 2025-04-18  Thomas Junk : fix overwrite bug with the BadChannels block and put the entire set in sbnd_channelstatus, copied for sbnd_data_channelstatus
* 2025-04-17  Brinden Carlson : Update to v10_04_08
* 2025-04-17  aantonakis : Merge branch 'develop' into feature/aantonak_crtveto
* 2025-04-16  Bear Carlson : Update multipartvertex_sbnd.fcl
* 2025-04-16  Li Jiaoyang : Merge branch 'develop' into feature/jiaoyang_hlay_crt_timing_corrections
* 2025-04-16  Alejandro Sánchez Castillo : Merge branch 'develop' into feature/acastill_flash_drift_mc_newCal
* 2025-04-14  Bear Carlson : Update multipartvertex_sbnd.fcl
* 2025-04-14  Bear Carlson : Update multipartvertex_sbnd.fcl
* 2025-04-14  Linyan Wan : Adding T0 correction to raw digit processing for calib purpose
* 2025-04-14  Alexander Antonakis : Made small cosmetic changes. Changed BNBLight window values to better ones based on a tophat study. Added producer to the reco2 workflow
* 2025-04-13  Alejandro Sánchez Castillo : Add tpcpdbarycentermatching to standard workflow
* 2025-04-11  Alexander Antonakis : Fixed Timing bug for RWM referencing in BNBLight
* 2025-04-10  sungbinoh : Updating calibration constants with values measured using 2025A Spring dev samples
* 2025-04-10  Brinden Carlson : Merge tag 'v10_04_07' into develop
* 2025-04-10  Alejandro Sánchez Castillo : Modify fcl to run on re-tuned drift calibration curve
* 2025-04-10  Alejandro Sánchez Castillo : Merge branch 'develop' into feature/acastill_flash_drift_distance
* 2025-04-10  Alexander Antonakis : Attempt at Referencing T0 to the RWM. Top Hat isn't quite right for BNBLight
* 2025-04-07  Alexander Antonakis : Made associations with Space Points. Added cluster->Tagger() functionality. Added MC versus Data fcls
* 2025-04-04  Alejandro Sánchez Castillo : Fix bug in interpolation function
* 2025-04-03  Alejandro Sánchez Castillo : Merge branch 'feature/acastill_pmtdatabaseinterface' of github.com:SBNSoftware/sbndcode into feature/acastill_pmtdatabaseinterface
* 2025-04-03  Alejandro Sánchez Castillo : Reference .db file to the new path in FW_SEARCH_PATH
* 2025-04-03  Alejandro Sánchez Castillo : Add CalibrationDatabase to FW_SEARCH_PATH
* 2025-03-31  Alejandro Sánchez Castillo : Configure flash on data
* 2025-03-31  Alejandro Sánchez Castillo :  Add data drift estimation
* 2025-03-31  Alexander Antonakis : Added a CRT Veto Producer module. Stores boolean values based on CRT hit information
* 2025-03-28  Henry Lay : Add relevant value to CRTAnalysis module
* 2025-03-28  Henry Lay : Invert direction of corrections
* 2025-03-27  Alejandro Sánchez Castillo : Merge branch 'develop' into feature/acastill_flash_drift_distance
* 2025-03-27  Alejandro Sánchez Castillo : Fix PMTRatioCalibration_data path
* 2025-03-27  Alejandro Sánchez Castillo : Merge branch 'develop' into feature/acastill_pmtdatabaseinterface
* 2025-03-27  Alejandro Sánchez Castillo : Merge branch 'feature/acastill_pmtdatabaseinterface' of github.com:SBNSoftware/sbndcode into feature/acastill_pmtdatabaseinterface
* 2025-03-27  Alejandro Sánchez Castillo : Fix pds_calibration.db path
* 2025-03-27  Henry Lay : Update to final values from Jiaoyang
* 2025-03-27  Henry Lay : Change from ints to doubles everywhere
* 2025-03-27  Henry Lay : Read new timing delays
* 2025-03-27  Henry Lay : Factorise timing corrections out into four categories
* 2025-03-26  Alejandro Sánchez Castillo : Merge branch 'develop' into feature/acastill_pmtdatabaseinterface
* 2025-03-21  Alejandro Sánchez Castillo : Merge branch 'develop' into feature/acastill_flash_drift_distance
* 2025-03-20  Alejandro Sánchez Castillo : Update sbndcode/OpDetReco/OpDeconvolution/job/sbnd_flashfinder_deco_data.fcl
* 2025-03-20  Alejandro Sánchez Castillo : Merge branch 'develop' into feature/acastill_flash_drift_distance
* 2025-03-17  Alejandro Sánchez Castillo : Merge branch 'develop' into feature/acastill_flash_drift_distance
* 2025-03-13  Alejandro Sánchez Castillo : Fix bug
* 2025-03-13  Alejandro Sánchez Castillo : ename and cleanup
* 2025-03-13  Alejandro Sánchez Castillo : Update flash drift estimation to use with data
* 2025-03-11  Alejandro Sánchez Castillo : Use data calibration for flash drift estimation
* 2025-03-11  Alejandro Sánchez Castillo : Update fcl to run on data
* 2025-03-11  Alejandro Sánchez Castillo : Fix bug in OpFlash drift estimation
* 2025-03-11  Alejandro Sánchez Castillo : Merge branch 'develop' into feature/acastill_pmtdatabaseinterface
* 2025-03-07  Bear Carlson : Bump `sbnd_data` version
* 2025-03-05  Alejandro Sánchez Castillo : Add pmt calibration database service
* 2025-03-05  Alejandro Sánchez Castillo : Fix service provider name
* 2025-03-05  Alejandro Sánchez Castillo : Include fcl and locate in calibration folder
* 2025-03-03  Alejandro Sánchez Castillo : Cleanup
* 2025-03-03  Alejandro Sánchez Castillo : Cleanup
* 2025-03-03  Alejandro Sánchez Castillo : Undo unrequired changes
* 2025-03-03  Alejandro Sánchez Castillo : Fix typo
* 2025-03-03  Alejandro Sánchez Castillo : Remove clang.formal files
* 2025-03-03  Alejandro Sánchez Castillo : Fix conflicts
* 2025-03-03  Alejandro Sánchez Castillo : Remove .clang-format
* 2025-03-03  Alejandro Sánchez Castillo : Format code
* 2025-03-03  Alejandro Sánchez Castillo : Add actua database variables
* 2025-02-26  Alexander Antonakis : Added draft producer module for the CRT Analysis Veto
* 2025-01-27  Alejandro Sánchez Castillo : Merge remote-tracking branch 'origin/develop' into feature/acastill_pmtdatabaseinterface
* 2025-01-27  Alejandro Sánchez Castillo : Adapt Calibration Service from ICARUS

sbndutil 
---------------------------------------------------

* 2025-04-29  Brinden Carlson : Merge tag 'v10_05_00' into develop
* 2025-04-29  Brinden Carlson : Merge branch 'release/v10_05_00'
* 2025-04-29  Brinden Carlson : Update to sbncode v10_05_00
* 2025-04-10  Brinden Carlson : Merge tag 'v10_04_07' into develop
