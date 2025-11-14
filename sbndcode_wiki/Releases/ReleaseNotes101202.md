---
layout: page
title: ReleaseNotes101202
toc: true
---

-----------------------------------------------------------------------------
| v10.12.02 | 14 Nov 2025 | [ReleaseNotes](ReleaseNotes101202.html) |
| --- | --- | --- |



sbndcode v10_12_02 Release Notes
=======================================================================================
### Release Notes for [sbndcode] from v10_11_01_01 to v10_12_02
- PR #840: Use vector not set for CRTTrack taggers
  - **Description**: Change usage of CRT track tagger list to be vector not set. Closes issue 768.
  - **Labels**: crt
  - **Reviewers**:
  - **Assignees**: henrylay97
- PR #864: Adding a fcl  wth 0.1 MeV threshold for dirt
  - **Description**: Please provide a detailed description of the changes this pull request introduces.  Adding a new fcl file with lower dirt threshold 0.1 MeV for a validation study in 2025 Fall production.  Filer efficiency is ~ 29% based on `lar -c prodgenie_corsika_proton_rockbox0p1_sbnd.fcl -n 100`. Bellow is a table from Macro's PR [792](https://github.com/SBNSoftware/sbndcode/pull/792).  | FHiCL | Cut on Deposited Energy | Pass Rate | |---|---|---| | `prodgenie_corsika_proton_rockbox_sbnd.fcl` | E_dep>1 MeV | TPD | | `prodgenie_corsika_proton_rockbox100_sbnd.fcl` | E_dep>100 MeV | 17.9% | | `prodgenie_corsika_proton_rockbox_lowenergydirt_sbnd.fcl` | 1<E_dep<100 MeV | 6.2% (Dirt only) | N/A | E_dep>1MeV | 23.5%  So, there would be about 25% increase in the filtering efficiency compared to 1 MeV threshold.  For the record, in this version of sbndcode (`v10_11_01_01`), -n 100 gives filtering efficiencies for various thresholds - 0.1 MeV: 29/100 - 0.5 MeV: 24/100 - 1 MeV: 22/100  So, 0.5 MeV will increase the filtering efficiency about 10% compared to 1 MeV.
  - **Labels**: simulation
  - **Reviewers**:
  - **Assignees**: sungbinoh
- PR #833: Veto flashes outside the bnb time window
  - **Description**: This PR changes the BFM workflow from many-to-many matching to one-to-many. Based on ICARUS' experience, this has shown to yield a better matching efficiency (see https://sbn-docdb.fnal.gov/cgi-bin/sso/ShowDocument?docid=33862)  Please provide a detailed description of the changes this pull request introduces.
  - **Labels**: enhancement
  - **Reviewers**:
  - **Assignees**: asanchezcastillo
- PR #850: HNL MeVPrtl fcls for generation
  - **Description**: Fcls included to generate samples with and without cosmics for production. Included [35, 50, 75, 100, 125, 140] MeV masses for N--> nue+e- channel and [140, 165, 190, 215, 240, 260] MeV masses for N --> nu pi0.
  - **Labels**: enhancement
  - **Reviewers**:
  - **Assignees**: jorge-romeo
- PR #848: changes for special blip processing
  - **Description**:
  - **Labels**:
  - **Reviewers**:
  - **Assignees**: Jjm321814
- PR #834: Feature/acastill lightpropagationfixes
  - **Description**: Remove CorrectedOpFlash attributes that can be found via slice-correctedopflash assns. It also changes the attributes to reflect each of the corrections separately.
  - **Labels**: enhancement
  - **Reviewers**:
  - **Assignees**: asanchezcastillo

* 2025-11-14  nathanielerowe : Merge pull request #834 from SBNSoftware/feature/acastill_lightpropagationfixes
* 2025-11-14  nathanielerowe : Merge branch 'develop' into feature/acastill_lightpropagationfixes
* 2025-11-14  nathanielerowe : Merge pull request #848 from SBNSoftware/feature/separate_blip_hitfinding_fcl
* 2025-11-14  nathanielerowe : Merge branch 'develop' into feature/separate_blip_hitfinding_fcl
* 2025-11-14  nathanielerowe : Merge pull request #850 from jorge-romeo/HNL_masses_gen_fcls
* 2025-11-14  nathanielerowe : Merge branch 'develop' into HNL_masses_gen_fcls
* 2025-11-14  nathanielerowe : Merge pull request #833 from SBNSoftware/bugfix/acastill_bfm_timeveto
* 2025-11-14  nathanielerowe : Merge branch 'develop' into bugfix/acastill_bfm_timeveto
* 2025-11-14  nathanielerowe : Merge pull request #864 from sungbinoh/feature/sungbin_dirt_th_0p1MeV
* 2025-11-14  nathanielerowe : Merge branch 'develop' into feature/sungbin_dirt_th_0p1MeV
* 2025-11-12  nathanielerowe : Merge branch 'develop' into feature/acastill_lightpropagationfixes
* 2025-11-12  nathanielerowe : Update sbncode version to v10_12_02
* 2025-11-12  kjplows : update sbncode dep for CI
* 2025-11-10  nathanielerowe : Merge branch 'develop' into feature/acastill_lightpropagationfixes
* 2025-11-10  nathanielerowe : Merge pull request #840 from SBNSoftware/feature/hlay_crt_track_tagger_order
* 2025-11-10  nathanielerowe : Merge branch 'develop' into feature/acastill_lightpropagationfixes
* 2025-11-06  sungbinoh : adding prodgenie_corsika_proton_rockbox0p1_sbnd.fcl that wth 0.1 MeV th. for dirt
* 2025-11-04  Alejandro Sánchez Castillo : Merge branch 'develop' into bugfix/acastill_bfm_timeveto
* 2025-11-04  John Plows : Merge branch 'develop' into feature/hlay_crt_track_tagger_order
* 2025-10-30  Linyan Wan : Merge branch 'feature/separate_blip_hitfinding_fcl' of github.com:SBNSoftware/sbndcode into feature/separate_blip_hitfinding_fcl
* 2025-10-30  Linyan Wan : Change data CI cafmaker include to follow the standard sce
* 2025-10-29  nathanielerowe : fix drops overwrite
* 2025-10-29  Linyan Wan : dnn tags for data & MC
* 2025-10-28  Linyan Wan : add dnn label to cnn
* 2025-10-27  Jacob McLaughlin : added special blip process back in
* 2025-10-27  Jacob McLaughlin : Merge branch 'develop' into feature/separate_blip_hitfinding_fcl
* 2025-10-24  Nathaniel : Merge tag 'v10_11_01_01' into develop
* 2025-10-24  nathanielerowe : Merge branch 'develop' into feature/hlay_crt_track_tagger_order
* 2025-10-23  linyan-w : Update standard_detsim_sbnd.fcl
* 2025-10-23  nathanielerowe : Merge branch 'develop' into feature/separate_blip_hitfinding_fcl
* 2025-10-21  nathanielerowe : Merge branch 'develop' into feature/acastill_lightpropagationfixes
* 2025-10-21  Jacob McLaughlin : addressing several code review comments
* 2025-10-20  nathanielerowe : Merge branch 'develop' into feature/hlay_crt_track_tagger_order
* 2025-10-16  jorge-romeo : Add fcls with cosmics
* 2025-10-16  jorge-romeo : HNL MeVPrtl gen files for [35, 50, 75, 100, 125, 140] MeV for N --> nue+e- and [140, 165, 190, 215, 240, 260] MeV for N --> nu pi0
* 2025-10-15  Jacob McLaughlin : adjusted min hit heights
* 2025-10-15  Jacob McLaughlin : Missed a couple files from the other branch
* 2025-10-15  Jacob McLaughlin : Forcing low threshold trad roi on by default in data
* 2025-10-15  Jacob McLaughlin : changes for special blip processing
* 2025-09-29  Alejandro Sánchez Castillo : Add flash attributes and initialize flash geo
* 2025-09-26  Alejandro Sánchez Castillo : Fix pfp ordering when using SCE products
* 2025-09-26  Alejandro Sánchez Castillo : Veto flashes outside the bnb time window
* 2025-09-26  Alejandro Sánchez Castillo : Update attributed
* 2025-09-26  Alejandro Sánchez Castillo : Update analyzer
* 2025-07-28  Henry Lay : Use vector not set for CRTTrack taggers


[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v10_12_02](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v10_12_02/sbndcode-v10_12_02.html)

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
