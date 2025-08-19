---
layout: page
title: sbncode_v10_09_00
toc: true
---

sbncode_v10_09_00 Release Notes 
=======================================================================================

[List of sbncode releases](https://sbnsoftware.github.io/AnalysisInfrastructure/ReleaseManagement/Releases/List_of_SBN_code_releases)

A git comparison of all the code changes between this release and the previous one: [Compare v10_06_00_04 and v10_09_00](https://github.com/SBNSoftware/sbncode/compare/v10_06_00_04...v10_09_00)

Date
---------------------------------------------------
11 August 2025

Purpose
---------------------------------------------------
* Feature release

New features
---------------------------------------------------
A new release of sbncode (v10_09_00) has been cut and distributed

* sbnobj (v10_01_02):

  Using(updated dependencies):
  
  * lardataobj          v10_02_00
 
  Includes:

  * synchronise to sbnanaobj/StandardRecord/SREnums.h [#128](https://github.com/SBNSoftware/sbnobj/pull/128) : Companion to [sbnanaobj/#110](https://github.com/SBNSoftware/sbnanaobj/pull/110)
  * Move PMTBeamSignal data product from icaruscode to sbnobj [#130](https://github.com/SBNSoftware/sbnobj/pull/130): Moves PMTBeamSignal to SBN-wide repo and adds helper functions to reconstruct beam bunch structure in ICARUS.
  
* sbnanaobj (v10_00_06):

  Includes:

  * Use `kDefaultRWType` for the default `ReweightType_t` [#110](https://github.com/SBNSoftware/sbnanaobj/pull/110) : Renames `ReweightType_t::kDefault` to `ReweightType_t::kDefaultRWType`
  * Add PMT Beam Signal timing to ICARUS CAFs [#141](https://github.com/SBNSoftware/sbnanaobj/pull/141) : Adds new variable to SROpFlash storing OpFlash time with respect to RWM time.

* sbnalg (v10_09_00):

  Using(updated dependencies):
  
  * lardataalg          v10_01_01
  * sbnobj              v10_01_02
  * sbnanaobj           v10_00_06

* sbncode (v10_09_00):

  Using (updated dependencies):
  
  * genie_xsec          v3_06_00
  * larsoft			        v10_09_00
  * sbnalg              v10_09_00
 
  Includes:

  * Update explicit references to `EventWeightParameterSet::kMultisim` [#530](https://github.com/SBNSoftware/sbncode/pull/530) : Companion to Companion to [sbnanaobj/#110](https://github.com/SBNSoftware/sbnanaobj/pull/110)
  * Add PMT Beam Signal timing to ICARUS CAFs [#541](https://github.com/SBNSoftware/sbncode/pull/541) : Reads the RWM into CAFMaker, enabling reconstruction of beam bunch structure seen by ICARUS PMTs.
    
Extra info
---------------------------------------------------
Note the change in capitalisation for `kMultisim`, which is now `kMultiSim` across the entire codebase.
Uses LArSoft v10_09_00. Release notes for the last few LArSoft suites here:
* [LArSoft v10_07_00 release notes](https://github.com/LArSoft/larsoft/releases/tag/v10_07_00)
* [LArSoft v10_08_00 release notes](https://github.com/LArSoft/larsoft/releases/tag/v10_08_00)
* [LArSoft v10_08_01 release notes](https://github.com/LArSoft/larsoft/releases/tag/v10_08_01)
* [LArSoft v10_08_02 release notes](https://github.com/LArSoft/larsoft/releases/tag/v10_08_02)
* [LArSoft v10_08_03 release notes](https://github.com/LArSoft/larsoft/releases/tag/v10_08_03)
* [LArSoft v10_09_00 release notes](https://github.com/LArSoft/larsoft/releases/tag/v10_09_00)
