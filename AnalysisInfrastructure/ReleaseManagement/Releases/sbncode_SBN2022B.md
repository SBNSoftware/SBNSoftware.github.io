---
layout: page
title: sbncode_SBN2022B
toc: true
---

sbncode_SBN2022B Release Notes
=======================================================================================

[List of sbncode releases](https://sbnsoftware.github.io/AnalysisInfrastructure/ReleaseManagement/Releases/List_of_SBN_code_releases)

Download instructions for [sbncode]()

Date
---------------------------------------------------
11 November 2022

Purpose
---------------------------------------------------
* Autumn production release

New features
---------------------------------------------------
A new production release SBN2022B of sbncode (v09_63_00)  has been cut and distributed

* sbncode (v09_63_00 in ups / SBN2022B in GitHub):
  Using:
  * larsoft v09_63_00 
  * sbnobj  v09_15_00
    * lardataobj v09_13_01
  * sbnanaobj v09_20_00 
  * cetmodules		v3_20_00
  
  Includes:
  * SBNSoftware/sbncode Update to cetmodules #304
  * SBNSoftware/sbnobj Update to cetmodules #70
  * SBNSoftware/sbnanaobj Update to cetmodules  #82
  * DeepLearnPhysics/Supera Migrate to cetmodules and use CMake targets. #11
  * sbncode/Supera': checked out 'b164e1a446297ca3329cef853a858d089a21483e   
  * SBNSoftware/sbncode Accommodate breaking changes in geometry #309
  * SBNSoftware/sbncode Add RawDigits to be covered by fSilenceMissingDataProducts parameter in TrackSkimmer.#315
  * SBNSoftware/sbncode Fix Calo Point Time and add it PFP T0 #308
  * SBNSoftware/sbnanaobj Add in t0 variable to PFP #84
  

Extra info
---------------------------------------------------
 This is a production release using v09_63_00 tag in ups and SBN2022B in GitHub.
 
 In this release a migration to use cetmodules has been introduced.
  More info: https://indico.fnal.gov/event/53302
  
 Note also the braking change introduce in LArSoft:
  https://github.com/LArSoft/larsoft/releases/tag/v09_63_00
