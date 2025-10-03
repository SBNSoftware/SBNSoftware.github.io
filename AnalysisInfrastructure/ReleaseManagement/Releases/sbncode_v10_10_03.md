---
layout: page
title: sbncode_v10_10_03
toc: true
---

sbncode_v10_10_03 Release Notes 
=======================================================================================

[List of sbncode releases](https://sbnsoftware.github.io/AnalysisInfrastructure/ReleaseManagement/Releases/List_of_SBN_code_releases)

A git comparison of all the code changes between this release and the previous one: [Compare v10_10_02 and v10_10_03](https://github.com/SBNSoftware/sbncode/compare/v10_10_02...v10_10_03)

Date
---------------------------------------------------
18 September 2025

Purpose
---------------------------------------------------
* Feature release

New features
---------------------------------------------------
A new release of sbncode (v10_10_03) has been cut and distributed

* sbnobj (v10_02_01):
 
  Includes:

  * Calib NTuple CRT Timing Additions [#139](https://github.com/SBNSoftware/sbnobj/pull/139): Adds SBND CRT specific branches for calibration tuples.
  * Feature/acastill opflashtiming [#140](https://github.com/SBNSoftware/sbnobj/pull/140): Introduces the `CorrectedOpFlashTiming` object that stores OpFlash time after corrections.
  * Feature/acastill tpcpmtbfm upgrade [#144](https://github.com/SBNSoftware/sbnobj/pull/144): Adds new attributes to `TPCPMTBarycenterFM` to store chi2 and score used to do matching.
  
* sbnanaobj (v10_00_08):

  Includes:

  * Add score and chi2 to tmppmt bfm SR [#156](https://github.com/SBNSoftware/sbnanaobj/pull/156): Adds new attributes to `SRTPCPMTBarycenterMatch` to store chi2 and score used to do matching
  * Feature/acastill corrected opflash [#157](https://github.com/SBNSoftware/sbnanaobj/pull/157): Introduces the `SRCorrectedOpFlash` object that stores OpFlash time after corrections.
  * Update SRSBNDTimingInfo.h [#158](https://github.com/SBNSoftware/sbnanaobj/pull/158): Uses same default values for `SRSBNDTrigger` and normal `SRTrigger`.

* sbnalg (v10_10_03):

  Using(updated dependencies):
  
  * sbnobj              v10_02_01
  * sbnanaobj           v10_00_08

* sbncode (v10_10_03):

  Using (updated dependencies):

  * larsoft			          v10_10_03
  * sbndata             v01_08
  * sbnalg              v10_10_03
 
  Includes:

  * CAFMaker changes to accommodate to Pandora track/shower discrimination changes [#546](https://github.com/SBNSoftware/sbncode/pull/546): Updates `FillPFPVars` in the CAFMaker so the BDT tools used pick up the right variables for ICARUS Pandora track/shower discrimination.
  * Calib NTuple CRT Timing Additions [#557](https://github.com/SBNSoftware/sbncode/pull/557): Additions to SBND CRT calibration tuples.
  * Add tpcpmt bfm score and chi2 to CAF files [#565](https://github.com/SBNSoftware/sbncode/pull/565): New attributes to `TPCPMTBarycenterFM` object.
  * Feature/acastill corrected opflash [#566](https://github.com/SBNSoftware/sbncode/pull/566): Introduces `CorrectedOpFlashTiming` object that stores the OpFlash time after corrections to improve timing resolution.
    
Extra info
---------------------------------------------------
Uses LArSoft v10_10_03. Release notes for the last few LArSoft suites here:
* [LArSoft v10_10_03 release notes](https://github.com/LArSoft/larsoft/releases/tag/v10_10_03)
