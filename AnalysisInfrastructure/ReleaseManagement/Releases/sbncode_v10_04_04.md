---
layout: page
title: sbncode_v10_04_04
toc: true
---

sbncode_v10_04_04 Release Notes
=======================================================================================

[List of sbncode releases](https://sbnsoftware.github.io/AnalysisInfrastructure/ReleaseManagement/Releases/List_of_SBN_code_releases)

A git comparison of all the code changes between this release and the previous one: [Compare v10_04_04 and v10_04_03](https://github.com/SBNSoftware/sbncode/compare/v10_04_03...v10_04_04_00)

Date
---------------------------------------------------
27 February 2025

Purpose
---------------------------------------------------
* Weekly release

New features
---------------------------------------------------
A weekly release of sbncode (v10_04_04) has been cut and distributed

* sbnanaobj (v10_00_00):

  Includes: 

  * Add new G4 process to StandardRecord. Set UNKNOWN to "safe" value. [#135](https://github.com/SBNSoftware/sbnanaobj/pull/135)
 
* sbnobj (v10_00_05):

  Includes:

  * Channel info object to hold baseline+rms [#120](https://github.com/SBNSoftware/sbnobj/pull/120)
  * Add ps to decoded TDC, allow 2 different constructors for backward compatibility [#121](https://github.com/SBNSoftware/sbnobj/pull/121) The fix introduces a new variable `timestampPs` in the decoded TDC object `sbnd::timing::DAQTimestamp`.

* sbncode (v10_04_04):

  Using (updated dependencies):
  * larsoft			        v10_04_04
  * sbnanaobj			      v10_00_00
  * sbnobj              v10_00_05

   Includes:
  
  * Lepton Meson HNL Anisotropies and HNL Polarization fix [#502](https://github.com/SBNSoftware/sbncode/pull/502) Revises HNL polarization calculations in MeVPrtlGen
  * Add RadioactiveDecayBase to CAFMaker [#509](https://github.com/SBNSoftware/sbncode/pull/509) Adds a call that handles RadioactiveDecay calls and suppresses noisy errors in CAFMaker
  * Update supera tag [#510](https://github.com/SBNSoftware/sbncode/pull/510) Points to [updated fcl files for Supera](https://github.com/SBNSoftware/sbncode/pull/510/commits/9a1af2f38ddc27cd2de08b9d111f8fa9f344d275)

    
Extra info
---------------------------------------------------

This version of LArSoft reverts [LArSoft/larpandoracontent#72](https://github.com/LArSoft/larpandoracontent/pull/72) which produced unintended changes to the vertex refinement algorithm that affected SBND workflows.
See the [LArSoft release notes](https://github.com/LArSoft/larsoft/releases/tag/v10_04_04) for details.
