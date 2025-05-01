---
layout: page
title: sbncode_v10_06_00
toc: true
---

sbncode_v10_06_00 Release Notes 
=======================================================================================

[List of sbncode releases](https://sbnsoftware.github.io/AnalysisInfrastructure/ReleaseManagement/Releases/List_of_SBN_code_releases)

A git comparison of all the code changes between this release and the previous one: [Compare v10_06_00 and v10_05_00](https://github.com/SBNSoftware/sbncode/compare/v10_05_00...v10_06_00)

Date
---------------------------------------------------
1 May 2025

Purpose
---------------------------------------------------
* Weekly release ; production canidate Spring 2025

New features
---------------------------------------------------
A weekly release of sbncode (v10_06_00) has been cut and distributed

* sbnobj (v10_01_00):

  Using(updated dependencies):
  * lardataobj          v10_01_00
  
* sbnanaobj (v10_00_03):

  Includes:

  * Extended information on the CRTHitT0Matching [#139](https://github.com/SBNSoftware/sbnanaobj/pull/139) : More attributes in the `SRCRTHitMatch` object.

* sbnalg (v10_06_00):

  Using(updated dependencies):
  * lardataalg          v10_00_06
  * sbnobj              v10_01_00
  * sbnanaobj           v10_00_03

* sbncode (v10_06_00):

  Using (updated dependencies):
  * larsoft			        v10_06_00
  * sbnalg              v10_06_00

   Includes:
  
  * This PR introduces CRT Tagging usage into cafs for analyzers [#536](https://github.com/SBNSoftware/sbncode/pull/536) : Introduces the CRTHit tagging into CAF, so that ICARUS analyzers can use relevant information for out of time rejection.
  * Apply ADCScaleFactor correctly [#537](https://github.com/SBNSoftware/sbncode/pull/537) : Bugfix for [#535](https://github.com/SBNSoftware/sbncode/pull/535).
    
Extra info
---------------------------------------------------
Uses LArSoft v10_06_00, [release notes here](https://github.com/LArSoft/larsoft/releases/tag/v10_06_00).
