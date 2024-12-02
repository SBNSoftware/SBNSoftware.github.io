---
layout: page
title: sbncode_v10_01_03
toc: true
---

sbncode_v10_01_03 Release Notes
=======================================================================================

[List of sbncode releases](https://sbnsoftware.github.io/AnalysisInfrastructure/ReleaseManagement/Releases/List_of_SBN_code_releases)

A git comparison of all the code changes between this release and the previous one: [Compare v10_01_03 and v09_93_01_p01](https://github.com/SBNSoftware/sbncode/compare/v09_93_01_p01...v10_01_03)

Date
---------------------------------------------------
2 December 2024

Purpose
---------------------------------------------------
* Weekly release

New features
---------------------------------------------------
A weekly release of sbncode (v10_01_03) has been cut and distributed

* sbncode (v10_01_03):

  Using (updated dependencies):
  * larsoft			        v10_01_03
  * sbnobj			        v10_00_00
  *-- lardataobj        v10_00_01
  * nusystematics		    v1_05_03
  * sbndaq_artdaq_core	v1_10_03
  

   Includes:
  
  * Accommodate geometry-refactoring changes [#393](https://github.com/SBNSoftware/sbncode/pull/393) Major changes to geometry object handling and definitions in larsoft. This PR addresses these larsoft changes consistently within the SBN code framework.
  * Updated commit hashtag for Supera submodule pursuant to #393. 
    
Extra info
---------------------------------------------------
