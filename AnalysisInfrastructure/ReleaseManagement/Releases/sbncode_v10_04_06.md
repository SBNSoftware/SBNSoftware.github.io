---
layout: page
title: sbncode_v10_04_06
toc: true
---

sbncode_v10_04_06 Release Notes 
=======================================================================================

[List of sbncode releases](https://sbnsoftware.github.io/AnalysisInfrastructure/ReleaseManagement/Releases/List_of_SBN_code_releases)

A git comparison of all the code changes between this release and the previous one: [Compare v10_04_06 and v10_04_05](https://github.com/SBNSoftware/sbncode/compare/v10_04_05...v10_04_06)

Date
---------------------------------------------------
17 March 2025

Purpose
---------------------------------------------------
* Weekly release

New features
---------------------------------------------------
A weekly release of sbncode (v10_04_06) has been cut and distributed

* sbnobj (v10_00_07):
  
  Includes:
  
  * Add hit goodness to `sbn::HitInfo` [#122](https://github.com/SBNSoftware/sbnobj/pull/122) : This PR adds a field to store the `recob::Hit::GoodnessOfFit` score to the sbn::HitInfo object so that it is available in the calibration ntuples.

* sbncode (v10_04_06):

  Using (updated dependencies):
  * larsoft			        v10_04_06
  * sbnobj              v10_00_07
  * sbndaq_artdaq_core  v1_10_06

   Includes:
  
  * Add hit goodness to `sbn::HitInfo` [#512](https://github.com/SBNSoftware/sbncode/pull/512) : This PR adds a field to store the `recob::Hit::GoodnessOfFit` score to the sbn::HitInfo object so that it is available in the calibration ntuples.
  * Reduce verbosity of `Cluster3D` [#513](https://github.com/SBNSoftware/sbncode/pull/513)
  * Update supera tag - addresses SBND data fcl [#519](https://github.com/SBNSoftware/sbncode/pull/519) : Fixes Supera's attempt to load XA in data. Points to [updated Supera tag](https://github.com/SBNSoftware/sbncode/pull/519/commits/c849df284e5caae4ea029dc4bc67f365edde8d60) .
    
Extra info
---------------------------------------------------
Uses LArSoft v10_04_06, [release notes here](https://github.com/LArSoft/larsoft/releases/tag/v10_04_06).
