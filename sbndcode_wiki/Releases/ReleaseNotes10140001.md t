---
layout: page
title: ReleaseNotes10140001
toc: true
---

-----------------------------------------------------------------------------
| v10.14.00.01 | 26 Nov 2025 | [ReleaseNotes](ReleaseNotes10140001.html) |
| --- | --- | --- |



sbndcode v10_14_00_01 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v10_14_00_01](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v10_14_00_01/sbndcode-v10_14_00_01.html)

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
### Release Notes for [sbndcode] from v10_14_00 to v10_14_00_01
- PR #886: Bugifx/acastill realistic pmt
  - **Description**: After (https://github.com/SBNSoftware/sbndcode/pull/876), the `OpHitFinder` algorithm for realistic MC workflow was missconfigured. The OpHitFinder module was taking raw waveforms coming from the `pmtpulseoscillation` module instead of `deconvolved` waveforms coming from `opdecopmt` module. This PR corrects the label for the `OpHitFinder` algorithm to use deconvolved waveforms.  It does also: - Remove XA reconstruction for light-only reconstruction fcl. - Uses the correct drift estimation curve for realistic MC. - Updates PMT detection efficiencies for better data/MC agreement   Please provide a detailed description of the changes this pull request introduces.
  - **Labels**: bug
  - **Reviewers**: fjnicolas
  - **Assignees**: asanchezcastillo
- PR #885: Trigger Emulation Bug Fix and smaller updates
  - **Description**: Trigger Emulation Bug Fix includes: - Bug fix: previously the MonPulse length was taken from the FIRST waveforms in the vector of OpDetWaveforms, but this length corresponded to an XArapuca waveform, which is not the same size. This is fixed to now take the length from the first PMT waveform. (this is the major fix!) - Added check: added warnings to make sure we are only considering and slicing PMT waveforms - Added a vector of the number of pairs above threshold to the event (could be added to the cafs later) - Added a vector of the number of pairs above threshold to the PMT decoder output too - Updated Baseline fcl parameter to Run 2 Baseline,
  - **Labels**: bug, trigger
  - **Reviewers**:
  - **Assignees**: npallat
- PR #882: Drop opdaq waveforms
  - **Description**: This PR drops the OpDetWaveforms produced by opdaq after running detsim stage. These are no longer required since this OpDetwaveforms used for downstream reconstruction are the ones produced by pmtpulseoscillation.
  - **Labels**: bug
  - **Reviewers**:
  - **Assignees**: asanchezcastillo

sbndcode
---------------------------------------------------
* 2025-11-26  nathanielerowe : Merge pull request #882 from SBNSoftware/bugfix/acastill_drop_opdaq_waveforms
* 2025-11-26  nathanielerowe : Merge branch 'develop' into bugfix/acastill_drop_opdaq_waveforms
* 2025-11-26  nathanielerowe : Merge pull request #885 from SBNSoftware/feature/TriggerWorkNikki-PR
* 2025-11-26  nathanielerowe : Merge branch 'develop' into feature/TriggerWorkNikki-PR
* 2025-11-26  nathanielerowe : Merge pull request #886 from SBNSoftware/bugifx/acastill_realisticPMT
* 2025-11-25  Nikki Pallat : Bug fix: empty fPMT_Channels fix
* 2025-11-25  Alejandro Sánchez Castillo : Update PMT Eff for better data/MC agreement
* 2025-11-25  Alejandro Sánchez Castillo : Update PMT Eff for better data/MC agreement
* 2025-11-25  Nikki Pallat : Fix: Change back to Run 1 Baseline and other minor changes to opDetDigitizerSBND_module.cc
* 2025-11-25  Alejandro Sánchez Castillo : Update PMT detection efficiencies
* 2025-11-25  Alejandro Sánchez Castillo : Update PMT baseline
* 2025-11-25  Alejandro Sánchez Castillo : Feed correct label into ophit reconstruction
* 2025-11-25  Alejandro Sánchez Castillo : Remove XA reco for light-only reco fcl
* 2025-11-25  Alejandro Sánchez Castillo : Use realistic MC for MC
* 2025-11-25  Alejandro Sánchez Castillo : Fix drift estimator file for realistic MC
* 2025-11-24  Nikki Pallat : Fix: bug fix for correct MonPulse length, addition of number of pairs over threshold vector to events, updated Baseline to Run 2 Baseline, and checks that we are not considering any XArapuca channels
* 2025-11-24  Alejandro Sánchez Castillo : Drop opdaq waveforms
* 2025-11-21  Nathaniel : Merge tag 'v10_14_00' into develop
