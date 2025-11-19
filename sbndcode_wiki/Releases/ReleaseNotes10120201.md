---
layout: page
title: ReleaseNotes10120201
toc: true
---

-----------------------------------------------------------------------------
| v10.12.02.01 | 19 Nov 2025 | [ReleaseNotes](ReleaseNotes10120201.html) |
| --- | --- | --- |



sbndcode v10_12_02_01 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v10_12_02_01](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v10_12_02_01/sbndcode-v10_12_02_01.html)

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
### Release Notes for [sbndcode] from v10_12_02 to v10_12_02_01
- PR #860: GDML v02_06 - fix TPC z
  - **Description**: 760 introduced GDML v02_05 which intended to move the z position of the first TPC wire back by 4.2cm but a typo meant it moved it by 4.65cm. This PR introduces GDML v02_06 which moves the position forward by 0.45cm ensuring they are in the intended location.  Whilst using v02_05 another bug was also found. The WireCell stage requires it's own geometry file which can be created by processing the GDML. This hadn't been updated for v02_05 and resulted in offsets between the true and reconstructed positions. For v02_06 this update is made so that the same does not occur.  This PR: - Adds the v02_06 base GDML and the two processed versions. - Points the geometry fcl at the new GDML - Points the GENIE rockbox fcls at a new xml created with the new GDML & current flux - Points the WireCell jsonnet at the new WireCell geometry file.  The latter two files --are-- _will be_ provided in Lynn's accompanying PR SBNSoftware/sbnd_data1  These PRs will close issue 846
  - **Labels**: bug, geometry
  - **Reviewers**: marcodeltutto
  - **Assignees**: henrylay97, lynnt20
- PR #858: Blip True EDep from sim:IDE Object
  - **Description**:
  - **Labels**:
  - **Reviewers**:
  - **Assignees**: Jjm321814
- PR #865: Add bug fix to FrameShift module when RWM signal is missing
  - **Description**: Please provide a detailed description of the changes this pull request introduces.
  - **Labels**:
  - **Reviewers**:
  - **Assignees**: VCLanNguyen
- PR #867: Fix lightproptime for cases when there is no SPEC TDC
  - **Description**: When there is no SPECTDC products on the event the light propagation module does not put any `sbn::CorrectedOpFlashTiming` object on the event, which causes an error. This PR fixes the issue by replacing the return statement with a continue statement.  It does also fix a minor bug found when running pds-only reconstruction. Waveform alignment module was not correctly configured in this case.
  - **Labels**: bug
  - **Reviewers**: GaetanoFricano
  - **Assignees**: asanchezcastillo
- PR #839: CRT Calibration Database Interface
  - **Description**: Removes old calibration service that read text files and replace with new service, modelled on the PMT one, that uses the calibration database as requested. For now there is still a single value for each parameter but others are working on getting time/run dependency available.  A lot of fcl changes are made to cope with this.  I have also taken the opportunity to move a lot more functionality into the `CRTChannelMapService` to avoid many algorithms doing their own constructions of channel IDs.  The database files are added via SBNSoftware/sbnd_data2  This PR will resolve 770.
  - **Labels**: enhancement, maintenance, crt, calibration
  - **Reviewers**: asanchezcastillo
  - **Assignees**: henrylay97

sbndcode sbndcode
---------------------------------------------------

* 2025-11-19  Nathaniel : Merge branch 'release/v10_12_02_01'
* 2025-11-19  Nathaniel : Update to sbndcode v10_12_02_01
* 2025-11-19  nathanielerowe : Merge pull request #839 from SBNSoftware/feature/hlay_crt_calibration_database_interface
* 2025-11-19  nathanielerowe : Merge branch 'develop' into feature/hlay_crt_calibration_database_interface
* 2025-11-19  nathanielerowe : Merge pull request #867 from SBNSoftware/bugfix/acastill_lightproptime
* 2025-11-19  nathanielerowe : Merge branch 'develop' into bugfix/acastill_lightproptime
* 2025-11-19  nathanielerowe : Merge pull request #865 from SBNSoftware/lnguyen/frame_bugfix_v10_11_01
* 2025-11-19  nathanielerowe : Merge branch 'develop' into lnguyen/frame_bugfix_v10_11_01
* 2025-11-19  nathanielerowe : Merge pull request #858 from SBNSoftware/feature/blip_changeto_simide
* 2025-11-19  nathanielerowe : Merge branch 'develop' into feature/blip_changeto_simide
* 2025-11-19  Henry Lay : Add extra library for safety
* 2025-11-18  nathanielerowe : Merge branch 'develop' into feature/hlay_crt_calibration_database_interface
* 2025-11-18  nathanielerowe : Merge pull request #860 from SBNSoftware/feature/hlay_lynnt_gdml_v02_06
* 2025-11-18  nathanielerowe : Merge branch 'develop' into feature/hlay_crt_calibration_database_interface
* 2025-11-18  nathanielerowe : Merge branch 'develop' into feature/hlay_lynnt_gdml_v02_06
* 2025-11-18  nathanielerowe : Update sbnd_data version to v01_37_00
* 2025-11-17  nathanielerowe : Update SkipTesting.txt to include BNB Flux files
* 2025-11-17  nathanielerowe : Merge branch 'develop' into bugfix/acastill_lightproptime
* 2025-11-17  nathanielerowe : Merge branch 'develop' into lnguyen/frame_bugfix_v10_11_01
* 2025-11-17  nathanielerowe : Merge branch 'develop' into feature/blip_changeto_simide
* 2025-11-17  nathanielerowe : Merge branch 'develop' into feature/hlay_lynnt_gdml_v02_06
* 2025-11-17  nathanielerowe : Merge branch 'develop' into feature/hlay_crt_calibration_database_interface
* 2025-11-14  Nathaniel : Merge tag 'v10_12_02' into develop
* 2025-11-11  Henry Lay : Bugfix on if statement
* 2025-11-10  nathanielerowe : Merge branch 'develop' into feature/hlay_lynnt_gdml_v02_06
* 2025-11-10  Alejandro Sánchez Castillo : Add waveform alignment module also for pds-only reco
* 2025-11-07  Alejandro Sánchez Castillo : Fix for cases when there is no SPEC TDC
* 2025-11-06  VCLanNguyen : Add bug fix when RWM signal is missing
* 2025-11-05  Jacob McLaughlin : Merge branch 'feature/blip_adding_collection_hitclust' into feature/blip_changeto_simide
* 2025-11-04  Jacob McLaughlin : Outputing collection plane hit clusts
* 2025-11-04  Jacob McLaughlin : Removing debug
* 2025-10-29  nathanielerowe : Merge branch 'develop' into feature/hlay_lynnt_gdml_v02_06
* 2025-10-28  Henry Lay : GDML v02_06 - fix TPC z
* 2025-10-24  Jacob McLaughlin : Merge branch 'develop' into feature/blip_changeto_simide
* 2025-10-24  Jacob McLaughlin : Adjusted to only include collection plane
* 2025-10-21  Jacob McLaughlin : initial draft of simIDE interface
* 2025-10-15  Jacob McLaughlin : Updated Sim::EnergyDeposit to Sim::IDE
* 2025-10-02  Henry Lay : Don't want them permanently on
* 2025-10-02  Henry Lay : Remove old debug statements
* 2025-10-02  Henry Lay : Better debug statements
* 2025-10-02  Henry Lay : Consistent usage
* 2025-10-02  Henry Lay : And make use of that
* 2025-10-02  Henry Lay : Combine crt services for better maintenance
* 2025-10-02  Henry Lay : Remove old calibration service
* 2025-10-02  Henry Lay : Better use of service (step 1)
* 2025-10-02  Henry Lay : Move all channel calculations into the channel map service
* 2025-10-01  Henry Lay : Ensure values from database are updated on the start of each run
* 2025-10-01  Henry Lay : Use the channel status enum directly
* 2025-10-01  Henry Lay : Merge error
* 2025-10-01  Henry Lay : Merge branch 'feature/hlay_crt_geo_alg_service' into feature/hlay_crt_calibration_database_interface
* 2025-09-30  Henry Lay : Add channel table in same manner
* 2025-09-29  Henry Lay : Update calibration service to properly pass values
* 2025-09-29  Henry Lay : Merge tag 'v10_10_03_02' into feature/hlay_crt_calibration_database_interface
* 2025-08-22  Henry Lay : Add rest of FEB table and access from CRTGeo alg
* 2025-08-22  Henry Lay : Use data CRT geo alg in CRTAna
* 2025-08-21  Henry Lay : Naive addition of draft for CRT calibration database interface

