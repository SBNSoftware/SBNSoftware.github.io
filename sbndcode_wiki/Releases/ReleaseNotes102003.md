---
layout: page
title: ReleaseNotes102003
toc: true
---

-----------------------------------------------------------------------------
| v10.20.03 | 16 Mar 2026 | [ReleaseNotes](ReleaseNotes102003.html) |
| --- | --- | --- |



sbndcode v10_20_03 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v10_20_03](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v10_20_03/sbndcode-v10_20_03.html)

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
- PR #847: X-ARAPUCA Offline Decoder Update: combination of the extended fragments
  - **Description**: - Implements the combination of the **extended fragments** in the X-ARAPUCA offline decoder.
  - **Labels**: enhancement, pds, data
  - **Reviewers**: jicrespo
  - **Assignees**: aliciavr
- PR #907: Pandora bugfix - Shower merging algorithm
  - **Description**: Please provide a detailed description of the changes this pull request introduces.
  - **Labels**: bug, reco1/reco2
  - **Reviewers**:
  - **Assignees**: aliciavr
- PR #903: build with geant4 v4_11_2_p02
  - **Description**:
  - **Labels**:
  - **Reviewers**:
  - **Assignees**:
- PR #916: CRT Blobs
  - **Description**: I am starting to put together slides and PRs to preserve work of mine that lives offline before I leave.  The CRTBlob reconstruction aims to produce objects that represent the totality of all activity happening within a fcl-configurable coincidence window.  They are similar to CRTTracks but without geometric track constraints, and as such can capture all activity from a single source, for example when multiple particles from the same air shower are detected or secondary particles are produced from the muon scattering.  It was used to produce a plot for the detector paper and is therefore worth preserving. It is not run by default in production fcls but does provide fcls for running it independently in the CRT-only workflow or standalone. Nothing prevents it being added to production fcls in future if it is desired for any analyses.
  - **Labels**: crt, reco1/reco2
  - **Reviewers**:
  - **Assignees**: henrylay97
- PR #917: CRT Saturation
  - **Description**: I am starting to put together slides and PRs to preserve work of mine that lives offline before I leave.  The CRT ADC saturates at a value of 4089 in data, compared to the 4095 we have been simulating. This PR changes that default value and also ensures that the mechanism to label a saturated channel in the CRTStripHit reconstruction is resilient to this change, and that the pedestal subtraction doesn't impact that.
  - **Labels**: crt, detsim, reco1/reco2, data
  - **Reviewers**:
  - **Assignees**: henrylay97
- PR #921: Updating Memory and CPU Usage Error Bounds for CI Tests
  - **Description**: Please provide a detailed description of the changes this pull request introduces. 
  - **Labels**: maintenance
  - **Reviewers**: vitodb, nathanielerowe
  - **Assignees**: SabrinaBrickner
- PR #920: CRT Analysis Tools
  - **Description**: I am starting to put together slides and PRs to preserve work of mine that lives offline before I leave.  This PR contains a few small updates to the CRTAnalyzer that forms the CRT section of the calibration ntuple files. - Adding the option for analysing CRT Blobs - Replace the rewrite of the timing corrections with calls to the actual functionality in the reconstruction - Include two missing branches from the TPC-CRT matching section.  It also adds three new analyzers that will not be run by standard but provide useful tools for future analysis and reproduction of studies that I've done.  It should be merged following SBNSoftware/sbndcode916 and SBNSoftware/sbnobj167 as it requires their functionality. Details can be found in slides linked below.
  - **Labels**: documentation, enhancement, crt
  - **Reviewers**:
  - **Assignees**: henrylay97
- PR #918: CRT Channel Mapping Event Displays
  - **Description**: I am starting to put together slides and PRs to preserve work of mine that lives offline before I leave.  This PR contains updates to provide the functionality to make the CRT channel mapping event displays that we have used to create the channel map and then check it after each GDML update (see [docDB 34844](https://sbn-docdb.fnal.gov/cgi-bin/sso/ShowDocument?docid=34844)). Specifically this introduces a new analyzer to run the existing CRTEventDisplayAlg in a custom mode, fcls to support this, a bash script for creating the plot dump file and a version of the channel map file that ensures the visualisation is created in the 'default' orientation. How to use this is documented in the docDB slides linked below.
  - **Labels**: crt, geometry
  - **Reviewers**:
  - **Assignees**: henrylay97
- PR #909: Pandora CI cluster metrics
  - **Description**: This pull request adds new fcl and Pandora XML configurations to support direct production of Pandora metrics within the continuous integration system. Provisionally, these contain a number of basic cluster metrics (ARI, purity, completeness, etc), but could in principle be extended in the future.  The ci_reco2_sbnd.fcl inherits from standard_reco2_sbnd.fcl and makes the minimal changes to the Pandora configuration for this workflow to run. The PandoraSettings_CI_SBND.xml mirrors the current PandoraSettings_Master_SBND.xml. Unfortunately, because this can't inherit a workflow, so it will be necessary to ensure suitable syncrhonisation between the CI XML and the standard Master XML if the Master XML changes (the CI XML removes the visualisation algorithms and adds the cluster validation algorithm). However, the Master XML is the most stable part of the configuration, and so changes here should be relatively rare.
  - **Labels**: enhancement, test, reco1/reco2
  - **Reviewers**: miquelnebot, justinjmueller, SergioYB
  - **Assignees**: AndyChappell

sbndcode sbndcode
---------------------------------------------------
* 2026-03-16  Nathaniel : Merge branch 'release/v10_20_03'
* 2026-03-16  Nathaniel : Update versioning
* 2026-03-13  nathanielerowe : Merge pull request #909 from SBNSoftware/feature/chappell_ci_pandora_clstr
* 2026-03-13  nathanielerowe : Merge branch 'develop' into feature/chappell_ci_pandora_clstr
* 2026-03-13  nathanielerowe : Merge pull request #918 from SBNSoftware/feature/hlay_crt_channel_map_evds
* 2026-03-13  nathanielerowe : Merge branch 'develop' into feature/hlay_crt_channel_map_evds
* 2026-03-13  nathanielerowe : Merge pull request #920 from SBNSoftware/feature/hlay_crt_ana
* 2026-03-13  nathanielerowe : Merge branch 'develop' into feature/hlay_crt_ana
* 2026-03-13  nathanielerowe : Merge branch 'develop' into feature/hlay_crt_channel_map_evds
* 2026-03-13  nathanielerowe : Update sbncode version to v10_20_03
* 2026-03-13  nathanielerowe : Merge pull request #921 from SBNSoftware/ci_memory_updates
* 2026-03-13  nathanielerowe : Merge branch 'develop' into ci_memory_updates
* 2026-03-13  nathanielerowe : Merge pull request #917 from SBNSoftware/feature/hlay_crt_saturation
* 2026-03-13  nathanielerowe : Merge branch 'develop' into feature/hlay_crt_saturation
* 2026-03-13  nathanielerowe : Merge pull request #916 from SBNSoftware/feature/hlay_crt_blobs
* 2026-03-13  nathanielerowe : Merge branch 'develop' into feature/hlay_crt_blobs
* 2026-03-13  nathanielerowe : Merge pull request #903 from lgarren/feature/lg_geant4_11
* 2026-03-13  nathanielerowe : Merge branch 'develop' into feature/lg_geant4_11
* 2026-03-13  nathanielerowe : Merge pull request #907 from SBNSoftware/bugfix/PandoraNeutrinoSettingsShowerMergingReordering
* 2026-03-13  nathanielerowe : Merge branch 'develop' into bugfix/PandoraNeutrinoSettingsShowerMergingReordering
* 2026-03-13  nathanielerowe : Merge pull request #847 from SBNSoftware/feature/aliciavr_XARAPUCA_offline_decoder_v4.0-extended_fragments
* 2026-03-13  nathanielerowe : Merge branch 'develop' into feature/aliciavr_XARAPUCA_offline_decoder_v4.0-extended_fragments
* 2026-03-13  nathanielerowe : Merge branch 'develop' into feature/hlay_crt_ana
* 2026-03-07  Sabrina Brickner : updating memory and cpu usage error bounds for CI tests
* 2026-03-05  nathanielerowe : Merge branch 'develop' into feature/hlay_crt_channel_map_evds
* 2026-03-05  Henry Lay : Make safer - at John's suggestion
* 2026-03-05  Henry Lay : Add README to point to documentation
* 2026-03-05  Henry Lay : If we're going to do comments lets get them right
* 2026-03-05  Henry Lay : Add track direction branches to spacepoint timing tree
* 2026-03-03  Henry Lay : Add xshift for CRT-TPC track matching
* 2026-03-03  Henry Lay : Add rate for tracks of limited angle
* 2026-02-27  Henry Lay : Correct some very old naming problems
* 2026-02-27  Henry Lay : Reduce code duplication
* 2026-02-27  Henry Lay : Remove reference to my data area
* 2026-02-27  Henry Lay : Remove unnecessary tophat analysis module
* 2026-02-26  Henry Lay : More sensible default for uint
* 2026-02-26  Henry Lay : Add a few missing branches
* 2026-02-25  Henry Lay : Add more reference shifts
* 2026-02-25  Henry Lay : Add TPC slice based variables
* 2026-02-25  Henry Lay : Make sure timing chain map is installed to path
* 2026-02-25  Henry Lay : Make fcl changes to run CRTTimingAnalysis
* 2026-02-25  Henry Lay : Add track content to CRTTimingAnalysis module, plus a few bugfixes to make run-able
* 2026-02-24  Henry Lay : Fill space point branches in timing analysis
* 2026-02-24  Henry Lay : Update channel map service to add timing chains
* 2026-02-24  Henry Lay : Refactor cluster characterisation to allow external use of timing corrections
* 2026-02-24  Henry Lay : Add skeleton for timing analysis
* 2026-02-23  nathanielerowe : Update sbncode version to v10_15_00
* 2026-02-23  Henry Lay : Add relevant functions for ADRIFT to GeoService
* 2026-02-23  Henry Lay : Add CRTTopHatAnalysis - module for CRT beam top hat analysis
* 2026-02-23  Henry Lay : Add CRTRateAnalysis - module for CRT real time rate analysis
* 2026-02-23  Henry Lay : Add ADRIFT - module for CRT calibration
* 2026-02-23  Henry Lay : Missing branch from CRTAnalysis
* 2026-02-19  nathanielerowe : Update sbncode version to v10_14_02_03
* 2026-02-23  Henry Lay : Ensure tex file is saved in correct area
* 2026-02-23  Henry Lay : Include table for no inversion channel map
* 2026-02-23  Henry Lay : Make consistent between fcl and bash script
* 2026-02-23  Henry Lay : Correctly name parameter
* 2026-02-23  Henry Lay : More configurable
* 2024-07-09  Henry Lay : Add functionality for turning off inversion - useful for the channel mapping event displays
* 2026-02-20  Henry Lay : Remove unnecessary fcl
* 2026-02-20  Henry Lay : Make compatible with current develop
* 2026-02-20  Henry Lay : Make tex script more configurable
* 2025-05-15  Henry Lay : Updated CRT channel mapping display
* 2025-01-27  Henry Lay : New round of channel map evds
* 2024-09-28  Henry Lay : Changes to channel map evd producer
* 2024-08-25  Henry Lay : New CRT gdml channel mapping evds
* 2024-06-24  Henry Lay : Update channel map evds to test David&apos;s updates
* 2024-02-06  Henry Lay : Z points North not South, duh
* 2024-02-06  Henry Lay : Add bash script for making pdf
* 2024-02-06  Henry Lay : Add channel mapping version of module and relevant config
* 2026-02-19  nathanielerowe : Merge branch &apos;develop&apos; into feature/chappell_ci_pandora_clstr
* 2026-02-19  nathanielerowe : Update <span style="background-color:#B58900"><font color="#073642">sbncode</font></span> version to v10_14_02_03
* 2026-02-18  Henry Lay : Manually check saturation
* 2026-02-17  Henry Lay : Clean up fcls
* 2026-02-17  Henry Lay : Add option for blob branches in CRTAnalysis module
* 2025-02-20  Henry Lay : Use saturation to correctly label strip hits
* 2025-02-20  Henry Lay : Change ADC saturation value to match data
* 2026-02-16  Henry Lay : Modernise CMakeLists
* 2025-04-03  Henry Lay : Add blobs to CRT only fcls
* 2025-04-03  Henry Lay : Add CRTBlob producer
* 2026-02-05  AndyChappell : Add synchronisation comment to Pandora Master xml
* 2026-02-05  AndyChappell : Add fcl and pandora xml to support cluster validation metrics in ci system
* 2026-02-03  Alicia Vázquez-Ramos : Restore the shower merging algorithm in another place to avoid inconsistent state of PFParticles (-1 track scores).
* 2026-02-02  nathanielerowe : Revise pull request template with new updates
* 2026-02-02  Nathaniel : Merge tag &apos;v10_14_02_02&apos; into develop
* 2026-01-30  Lynn Garren : remove or disable files which reference LegacyLArG4
* 2026-01-30  Lynn Garren : remove or disable files which reference LegacyLArG4
* 2026-01-30  Lynn Garren : remove or disable files which reference LegacyLArG4
* 2025-11-25  Alicia Vázquez-Ramos : Add warning for some unexpected types of fragments and fix fragments indexing. Improve jittering application.
* 2025-11-24  Alicia Vázquez-Ramos : Update combination condition with timing features integrating the expected jittering of the extended fragments.
* 2025-11-07  Alicia Vázquez-Ramos : Add jittering debug option and combine fragments option
* 2025-11-06  Alicia Vázquez-Ramos : First version of timing check implemented (some extended fragments do not fulfill the requirements
* 2025-11-05  Alicia Vázquez-Ramos : Add version number and update number of debug waveforms to 0
* 2025-10-15  Alicia Vázquez-Ramos : Update SBN Document for reference
* 2025-10-15  Alicia Vázquez-Ramos : Add new comments for code documenting. New variable for debugging the extended fragments combination
* 2025-10-14  Alicia Vázquez-Ramos : Combine all extended fragments succesfully
* 2025-10-10  Alicia Vázquez-Ramos : Combine waveforms and correctly differentiates nominal from extended
* 2025-10-09  Alicia Vázquez-Ramos : Add dump waveforms function
* 2025-10-09  Alicia Vázquez-Ramos : Waveforms decoding function
* 2025-10-09  Alicia Vázquez-Ramos : Shift timing function
* 2025-10-09  Alicia Vázquez-Ramos : Setup to start extended fragments feature
