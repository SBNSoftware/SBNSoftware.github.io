---
layout: page
title: ReleaseNotes10100301
toc: true
---

-----------------------------------------------------------------------------
| v10.10.03.01 | 19 Sep 2025 | [ReleaseNotes](ReleaseNotes10100301.html) |
| --- | --- | --- |



sbndcode v10_10_03_01 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v10_10_03_01](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v10_10_03_01/sbndcode-v10_10_03_01.html)

Change List
==========================================
### Release Notes for [sbndcode] from v10_10_03 to v10_10_03_01
- PR #828: hot fix fcl to run reco1 w/ dnn roi
  - **Description**: One fcl to run reco1 w/ dnn roi. The planned sp both rois + no sp workflow needs fix in the reco1 process sequence which involves validation and also is difficult to maintain.  $${\color{red}!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!}$$  $${\color{red}\bf{\textrm{IMPORTANT UPDATE June 22nd 2025:}}}$$  If you are making a PR which is intended as a patch for the CURRENT production (which started in Spring 2025), you must make two PRs: one for develop and one for the production/v10_06_00 branch.  $${\color{red}!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!}$$
  - **Labels**: bug
  - **Reviewers**:
  - **Assignees**: linyan-w

sbndcode sbndcode
---------------------------------------------------

* 2025-09-19  Nathaniel : Merge branch 'release/v10_10_03_01'
* 2025-09-19  Nathaniel : a few fixes
* 2025-09-19  nathanielerowe : Merge pull request #828 from SBNSoftware/bugfix_dnnroiworkflow
* 2025-09-19  nathanielerowe : Merge branch 'develop' into bugfix_dnnroiworkflow
* 2025-09-19  Linyan Wan : file to run reco1 w/ dnn roi. the sp + nosp workflow needs fix in the process sequence
* 2025-09-19  Nathaniel : Merge tag 'v10_10_03' into develop
