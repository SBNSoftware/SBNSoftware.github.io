---
layout: page
title: sbncode_v10_05_00
toc: true
---

sbncode_v10_05_00 Release Notes 
=======================================================================================

[List of sbncode releases](https://sbnsoftware.github.io/AnalysisInfrastructure/ReleaseManagement/Releases/List_of_SBN_code_releases)

A git comparison of all the code changes between this release and the previous one: [Compare v10_05_00 and v10_04_08](https://github.com/SBNSoftware/sbncode/compare/v10_04_08...v10_05_00)

Date
---------------------------------------------------
28 April 2025

Purpose
---------------------------------------------------
* Weekly release

New features
---------------------------------------------------
A weekly release of sbncode (v10_05_00) has been cut and distributed

* sbnobj (v10_00_10):

  Includes:
  
  * SBND CRT Veto [#127](https://github.com/SBNSoftware/sbnobj/pull/127) : Adds a simple CRT Veto class for SBND.
  * Channel ROI and hit updates [#129](https://github.com/SBNSoftware/sbnobj/pull/129) : Updates definition of ChannelROI to allow for dynamic scaling of ADCs and declares association between `ChannelROI` and `recob::Hit` objects.

* sbnanaobj (v10_00_02):

  Includes:

  * Add TPC attribute to SROpFlash [#138](https://github.com/SBNSoftware/sbnanaobj/pull/138) : Adds tpc attribute to `SROpFlash` object.

* sbnalg (v10_05_00):

  Using(updated dependencies):
  * sbnobj              v10_00_10
  * sbnanaobj           v10_00_02

* sbncode (v10_05_00):

  Using (updated dependencies):
  * larsoft			        v10_05_00
  * sbnalg              v10_05_00
  * nusystematics       v1_05_07

   Includes:
  
  * Updates to Enable ICARUS Spring Production [#526](https://github.com/SBNSoftware/sbncode/pull/526) : Various updates required for ICARUS production.
  * Modify `MergeSimChannels` signature with check to skip G4 tracks or no [#533](https://github.com/SBNSoftware/sbncode/pull/533) : For compatibility with larsim at larsoft v10_05_00.
  * Save OpFlash information in CAF files in SBND [#534](https://github.com/SBNSoftware/sbncode/pull/534) : Splits `FillOpFlash` into two detector-specific calls so SBND can have OpFlashes saved in CAFs.
    
Extra info
---------------------------------------------------
Uses LArSoft v10_05_00, [release notes here](https://github.com/LArSoft/larsoft/releases/tag/v10_05_00).
