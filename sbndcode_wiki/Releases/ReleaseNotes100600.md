--
layout: page
title: ReleaseNotes100600
toc: true
---

-----------------------------------------------------------------------------
| v10.06.00 | 09 May 2025 | [ReleaseNotes](ReleaseNotes100600.html) |
| --- | --- | --- |



sbndcode v10_06_00 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v10_06_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v10_06_00/sbndcode-v10_06_00.html)

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
### Release Notes for [sbndcode] from v10_05_00 to v10_06_00
- PR #737: bump version
  - **Description**: Please provide a detailed description of the changes this pull request introduces.
  - **Labels**:
  - **Reviewers**:
  - **Assignees**:
- PR #732: data sce correction fcls
  - **Description**: updates on fcls to enable SCE correction on data  - `workflow_reco2.fcl` updated with pandoraSCE(Calo,Pid)Data - `reco2_data.fcl` updated to run SCE modules - `cafmakerjob_sbnd_data_sce.fcl` made with SCE labels, to serve as the cafmakerjob base fcl with SCE correction - `cafmakerjob_sbnd_data_(bnblight,bnbzerobias,offbeamlight)_sce.fcl` are copies of the non-sce fcls, inheriting `cafmakerjob_sbnd_data_sce.fcl` instead of `cafmakerjob_sbnd_data_base.fcl`
  - **Labels**: caf
  - **Reviewers**:
  - **Assignees**: wjdanswjddl

sbndcode sbndcode
---------------------------------------------------

* 2025-05-09  nathanielerowe : git flow release finish May9 Merge branch 'release/v10_06_00'
* 2025-05-09  nathanielerowe : Update to larsoft 10_06_00
* 2025-05-09  nathanielerowe : Merge pull request #732 from SBNSoftware/feature/munjung-data_sce
* 2025-05-09  Mun Jung Jung : fix include fcl file order
* 2025-05-08  nathanielerowe : Update product_deps
* 2025-05-06  Mun Jung Jung : make data sce fcl names consistent with those of mc
* 2025-05-02  nathanielerowe : Merge pull request #737 from SBNSoftware/nrowe_sbncode_v10_06_00
* 2025-05-02  NathanielERowe : bump version
* 2025-05-02  lynnt20 : update reco2_data.fcl with opt0finder sce
* 2025-05-02  Moon Jung : Update sbndcode/JobConfigurations/standard/reco/reco2_data.fcl
* 2025-05-02  Moon Jung : Update sbndcode/JobConfigurations/standard/reco/reco2_data.fcl
* 2025-05-02  Mun Jung Jung : remove icarus crt lines from sbnd data cafmaker
* 2025-05-01  Moon Jung : Merge branch 'develop' into feature/munjung-data_sce
* 2025-05-01  Mun Jung Jung : crt services for new prod modules
* 2025-05-01  Mun Jung Jung : update cvnsce and crt modules
* 2025-04-29  Brinden Carlson : Merge tag 'v10_05_00' into develop
* 2025-04-25  Mun Jung Jung : data sce correction fcls

sbndutil
---------------------------------------------------

* 2025-05-09  nathanielerowe : Merge tag &apos;v10_06_00&apos; into develop
* 2025-05-09  nathanielerowe : git flow release finish May9 Merge branch &apos;release/v10_06_00&apos;
* 2025-05-09  nathanielerowe : Update to larsoft 10_06_00
* 2025-04-29  Brinden Carlson : Merge tag &apos;v10_05_00&apos; into develop
                                                                    
                                                                                                                                                                                                1,1           T
