---
layout: page
title: ReleaseNotes10110101
toc: true
---

-----------------------------------------------------------------------------
| v10.11.01.01 | 24 Oct 2025 | [ReleaseNotes](ReleaseNotes10110101.html) |
| --- | --- | --- |



sbndcode v10_11_01_01 Release Notes
=======================================================================================
### Release Notes for [sbndcode] from v10_11_01 to v10_11_01_01
- PR #856: Bugfix/wc random
  - **Description**: 
  - **Labels**:
  - **Reviewers**:
  - **Assignees**:
- PR #849: Adding new likelihood-based PID variables in larana to sbnd reco2
  - **Description**: Please provide a detailed description of the changes this pull request introduces.
  - **Labels**: enhancement, reco1/reco2
  - **Reviewers**:
  - **Assignees**: sungbinoh
- PR #843: Update e-lifetime in MC
  - **Description**: Apparently we only changed the e-lifetime in reco, not simulation...
  - **Labels**: detsim
  - **Reviewers**:
  - **Assignees**: linyan-w
- PR #845: Digital Noise Event Filter
  - **Description**: We had already a digital noise channel filter in the utilities directory of sbndcode, but discussion in the first analysis task force meeting steered us towards an event filter.  See SBN-Doc-43681 for details.
  - **Labels**: tpc, data
  - **Reviewers**: jzennamo
  - **Assignees**: tomjunk
- PR #842: TPC Matching in data crtana trees
  - **Description**: Something we picked up at the workshop. The crtana trees (produced in calib ntuples) have the TPC matching turned off for data unnecessarily.
  - **Labels**: enhancement
  - **Reviewers**:
  - **Assignees**: henrylay97

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v10_11_01_01](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v10_11_01_01/sbndcode-v10_11_01_01.html)

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


sbndcode sbndcode
---------------------------------------------------

* 2025-10-24  Nathaniel : Merge branch 'release/v10_11_01_01'
* 2025-10-24  Nathaniel : Update to sbncode v10_11_01_)1
* 2025-10-24  nathanielerowe : Merge pull request #842 from SBNSoftware/feature/hlay_crtana_data_tpc_matching
* 2025-10-24  nathanielerowe : Merge branch 'develop' into feature/hlay_crtana_data_tpc_matching
* 2025-10-24  nathanielerowe : Merge pull request #845 from SBNSoftware/trj_digital_noise_event_filter_oct9_2025
* 2025-10-24  nathanielerowe : Merge branch 'develop' into trj_digital_noise_event_filter_oct9_2025
* 2025-10-24  nathanielerowe : Merge pull request #843 from SBNSoftware/debug/linyan-elifetime
* 2025-10-24  nathanielerowe : Merge branch 'develop' into debug/linyan-elifetime
* 2025-10-24  nathanielerowe : Merge pull request #849 from sungbinoh/feature/sungbino_likepid
* 2025-10-24  nathanielerowe : Merge branch 'develop' into feature/sungbino_likepid
* 2025-10-23  nathanielerowe : Update output commands to drop bad masks and channels
* 2025-10-23  nathanielerowe : Update output commands to drop bad masks and channels
* 2025-10-23  nathanielerowe : Modify output commands to drop certain items
* 2025-10-23  nathanielerowe : Modify output commands to drop specific bad data
* 2025-10-23  nathanielerowe : non-deterministic behavior fix
* 2025-10-23  nathanielerowe : non-deterministic behavior fix
* 2025-10-23  nathanielerowe : non-deterministic behavior fix
* 2025-10-23  nathanielerowe : Update output commands for non-deterministic simulation
* 2025-10-21  sungbinoh : Merge branch 'feature/sungbino_likepid' of github.com:sungbinoh/sbndcode into feature/sungbino_likepid
* 2025-10-21  sungbinoh : adding likepids to sbndcode/JobConfigurations/standard/reco/reco2_data.fcl physics.reco2
* 2025-10-20  Nathaniel : Merge tag 'v10_11_01' into develop
* 2025-10-20  nathanielerowe : Merge branch 'develop' into feature/sungbino_likepid
* 2025-10-20  nathanielerowe : Merge branch 'develop' into debug/linyan-elifetime
* 2025-10-09  Thomas Junk : Digital Noise Event Filter
* 2025-10-07  linyan-w : Update e-lifetime in MC
* 2025-10-07  Henry Lay : TPC Matching in data crtana trees
* 2025-09-17  sungbinoh : adding likelihood pid



