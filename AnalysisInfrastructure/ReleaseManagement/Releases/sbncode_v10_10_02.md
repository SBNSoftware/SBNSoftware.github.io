---
layout: page
title: sbncode_v10_10_02
toc: true
---

sbncode_v10_10_02 Release Notes 
=======================================================================================

[List of sbncode releases](https://sbnsoftware.github.io/AnalysisInfrastructure/ReleaseManagement/Releases/List_of_SBN_code_releases)

A git comparison of all the code changes between this release and the previous one: [Compare v10_09_00 and v10_10_02](https://github.com/SBNSoftware/sbncode/compare/v10_06_00_04...v10_09_00)

Date
---------------------------------------------------
12 September 2025

Purpose
---------------------------------------------------
* Feature release

New features
---------------------------------------------------
A new release of sbncode (v10_10_02) has been cut and distributed

* sbndata (v01_08):
  
  Includes:

  * Geant4Reweight SBN/SBND implementation [#9](https://github.com/SBNSoftware/sbndata/pull/9): Adds input files required for Geant4Reweight SBN implementation.

* sbnobj (v10_02_00):

  Using(updated dependencies):
  
  * lardataobj          v10_02_01
 
  Includes:

  * Feature/maxd bnb qual cut [#135](https://github.com/SBNSoftware/sbnobj/pull/135): Adds additional information to BNBSpillInfo in order to create SBND Figure of Merit for BNB.
  * Frame Shift Module to Correct Timing in Data - PR for Develop [#142](https://github.com/SBNSoftware/sbnobj/pull/142): Two new data products: `sbnd::timing::TimingInfo` and `sbnd::timing::FrameShiftInfo`.
  
* sbnanaobj (v10_00_07):

  Includes:

  * BNB FOM updates for CAFs [#146](https://github.com/SBNSoftware/sbnanaobj/pull/146): Added information to CAFs from BNBInfo to capture new variables for beam quality metrics including Figure of Merit and monitor offsets.
  * adding efield and phi to SRCaloPoint [#149](https://github.com/SBNSoftware/sbnanaobj/pull/149): Adding efield and phi to sbnanaobj/StandardRecord/SRCaloPoint.cxx.
  This is a follow up for recent updates from LArSoft's side in larreco and lardataobj which are tagged from v10_02_00 of them.
  * Frame Shift Module to Correct Timing in Data - PR For Develop [#154](https://github.com/SBNSoftware/sbnanaobj/pull/154): New Standard Record Classes to Store Timing Correction in SBND Data.

* sbnalg (v10_10_02):

  Using(updated dependencies):
  
  * lardataalg          v10_01_02
  * sbnobj              v10_02_00
  * sbnanaobj           v10_00_07

* sbncode (v10_10_02):

  Using (updated dependencies):

  * genie_xsec          v3_04_00  --  Reverted back to genie_xsec v3_04_00 until we switch to GENIE v3_06
  * larsoft			        v10_10_02
  * sbnalg              v10_10_02
 
  Includes:

  * Feature/icarus bnb only [#523](https://github.com/SBNSoftware/sbncode/pull/523): Fixes issue [#479](https://github.com/SBNSoftware/sbncode/issues/479), restructures code so SBND BNB modules and ICARUS BNB modules can share some code.
  * Feature/maxd bnb qual cut [#551](https://github.com/SBNSoftware/sbncode/pull/551): Added additional information to the BNBSpillInfo module including additional monitors and monitor offsets from IFBeam that allow for the creation of the BNB FOM adapted from MicroBooNE using sbnd information.
  * Geant4Reweight SBN/SBND implementation [#555](https://github.com/SBNSoftware/sbncode/pull/555): Adds in Geant4Reweight SBN implementation for use in SBND.
  * Frame Shift Module to Correct Timing in Data - PR For Develop [#562](https://github.com/SBNSoftware/sbncode/pull/562): New module for timing reconstruction in introduced at reco2 in sbndcode.
    Module makes data products that are saved in CAF as new Standard Record products.
  * Add `find_package` for eigen [#569](https://github.com/SBNSoftware/sbncode/pull/569): A fix for building with spack - adds direct dependency which Spack is more strict about than UPS.
  * 
    
Extra info
---------------------------------------------------
Note that `genie_xsec` has been downgraded to 3_04_00 to ensure same version as `genie`. 
Uses LArSoft v10_10_02. Release notes for the last few LArSoft suites here:
* [LArSoft v10_10_00 release notes](https://github.com/LArSoft/larsoft/releases/tag/v10_10_00)
* [LArSoft v10_10_01 release notes](https://github.com/LArSoft/larsoft/releases/tag/v10_10_01)
* [LArSoft v10_10_02 release notes](https://github.com/LArSoft/larsoft/releases/tag/v10_10_02)
