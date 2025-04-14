---
layout: page
title: sbncode_v10_04_08
toc: true
---

sbncode_v10_04_08 Release Notes 
=======================================================================================

[List of sbncode releases](https://sbnsoftware.github.io/AnalysisInfrastructure/ReleaseManagement/Releases/List_of_SBN_code_releases)

A git comparison of all the code changes between this release and the previous one: [Compare v10_04_08 and v10_04_07](https://github.com/SBNSoftware/sbncode/compare/v10_04_07...v10_04_08)

Date
---------------------------------------------------
14 April 2025

Purpose
---------------------------------------------------
* Weekly release

New features
---------------------------------------------------
A weekly release of sbncode (v10_04_08) has been cut and distributed

* sbnobj (v10_00_09):

  Using(updated dependencies):
  * lardataobj          v10_00_05
  
  Includes:
  
  * Refactor each T0 in Calibration NTupler into its own field [#124](https://github.com/SBNSoftware/sbnobj/pull/124) : Creates data product with CRTHitTagging information and modifies TrackCaloSkimmerObj to include CRT-tagged tracks
  * Ints -> Doubles for low-level CRT reco [#126](https://github.com/SBNSoftware/sbnobj/pull/126) : Timings in low-level CRT are now double, not int.

* sbnalg (v10_04_08):

  Using(updated dependencies):
  * lardataalg          v10_00_05
  * sbnobj              v10_00_09

* sbncode (v10_04_08):

  Using (updated dependencies):
  * larsoft			        v10_04_08
  * sbnalg              v10_04_08
  * nusystematics       v1_05_06

   Includes:
  
  * Fix handling of CRT in Calibration NTupler [#525](https://github.com/SBNSoftware/sbncode/pull/525) : Refactor each T0 into its own field
  * Use Ts0 not Ts1 [#527](https://github.com/SBNSoftware/sbncode/pull/527) : CAFs use Ts0 timestamp in both MC and data
    
Extra info
---------------------------------------------------
Uses LArSoft v10_04_08, [release notes here](https://github.com/LArSoft/larsoft/releases/tag/v10_04_08).
