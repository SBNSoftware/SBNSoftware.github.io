---
layout: page
title: sbncode_v09_92_00
toc: true
---

sbncode_v09_92_00 Release Notes
=======================================================================================

[List of sbncode releases](https://sbnsoftware.github.io/AnalysisInfrastructure/ReleaseManagement/Releases/List_of_SBN_code_releases)

A git comparison of all the code changes between this release and the previous one: [Compare v09_92_00 and v09_91_02](https://github.com/SBNSoftware/sbncode/compare/v09_91_02_02...v09_92_00)

Date
---------------------------------------------------
17 October 2024

Purpose
---------------------------------------------------
* Weekly release

New features
---------------------------------------------------
A weekly release of sbncode (v09_92_00) has been cut and distributed

* sbncode (v09_92_00):

  Using (updated dependencies):
  * larsoft			        v09_92_00
  * sbnobj			        v09_19_05
  * lardataobj          v09_18_05
  * sbndaq_artdaq_core	v1_09_02of1

   Includes:
  
  * Keep CAF happy with CRT [#471](https://github.com/SBNSoftware/sbncode/pull/471) Ensures that CAFMaker continues to pickup the correct variable (for MC) when changes are made in sbnobj to the format of the CRT reconstruction objects.
  * Accommodate changes to recob::Hit [#472](https://github.com/SBNSoftware/sbncode/pull/472) Pursuant to changes introduced in LArSoft/lardataobj#42
  * Change the default channel simulation to 2d [#473](https://github.com/SBNSoftware/sbncode/pull/473)
  * update for sbndaq offline release [#474](https://github.com/SBNSoftware/sbncode/pull/474)
    
Extra info
---------------------------------------------------
* Includes breaking changes to sbndcode and icaruscode due to changes in lardataobj (see above PR#472). Corresponding PRs in sbnd and icarus were initiated.
