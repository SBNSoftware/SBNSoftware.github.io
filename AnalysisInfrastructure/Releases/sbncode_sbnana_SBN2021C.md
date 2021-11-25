---
layout: page
title: sbncode_sbnana_SBN2021C
toc: true
---

sbncode sbnana SBN2021C (v09_37_01) Release Notes
=======================================================================================

[List of sbncode releases](https://github.com/SBNSoftware/SBNSoftware.github.io/tree/master/AnalysisInfrastructure/Releases)

Download instructions for [sbncode]()

Date
---------------------------------------------------
22 November 2021

Purpose
---------------------------------------------------
* SBN2021C production release

New features
---------------------------------------------------
The SBN2021C production  release of sbncode and sbnana has been cut and distributed.
Usual versioning  (v09_37_01) for ups/mrb and SBN2021C GitHub tag/branch have been used.

* sbncode (v09_37_01):

  Using:
  * larsoft             v09_37_01
  * sbnobj              v09_12_08
  * lardataobj    v09_03_05
  * sbnanaobj           v09_17_06
  * sbndata             v01_03

  PRs Included:

  * SBNSoftware/sbncode port T. Brooks' GeometryWrappers #195
  * SBNSoftware/sbncode Feature/jlarkin refactor cafmaker fcl #197
  * SBNSoftware/sbncode Update ICARUS detector location and detector box #193
  * SBNSoftware/sbncode Updates to CAF #194 
  * SBNSoftware/sbncode Update CMakeLists.txt #200, #201, #202 fix bugs
  * SBNSoftware/sbncode This is a fix for a seg-fault arising from missing MWR devices#199
  * SBNSoftware/sbncode Update SBNEventWeight Module FHiCLs.#192
  * SBNSoftware/sbncode Calibration NTuple Update #196
  * SBNSoftware/sbncode change genieweight fhicl, universes 100->20 #203
  * SBNSoftware/sbnanaobj Updates to CAF #31
  * SBNSoftware/sbnobj Calibration NTuple Update #33

* sbnana (v09_37_01):

  Using:
  * sbnanaobj        v09_17_06
  * sbndata  	 v01_03

  PRs Included:

  * SBNSoftware/sbnana Implement NuMI flux systs using external histogram file #47

Extra info
---------------------------------------------------
