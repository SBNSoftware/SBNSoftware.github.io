---
layout: page
title: sbncode_v09_84_00
toc: true
---

sbncode_v09_84_00 Release Notes
=======================================================================================

[List of sbncode releases](https://sbnsoftware.github.io/AnalysisInfrastructure/ReleaseManagement/Releases/List_of_SBN_code_releases)

Download instructions for [sbncode]()

Date
---------------------------------------------------
01 March 2024

Purpose
---------------------------------------------------
* Weekly release

New features
---------------------------------------------------
A new weekly release of sbncode (v09_84_00) has been cut and distributed

* sbncode (v09_84_00 ):
  
  Using:
  * larsoft           v09_84_00
  * systematicstools  v01_03_04
  * nusystematics     v01_03_14
  * sbndaq_artdaq_core v1_08_00of4
      * artdaq_core v3_10_00 (s120b)
  * sbnobj            v09_18_01
      * lardataobj v09_17_03


  Includes:
  * SBNSoftware/sbncode Introduce module to respect the trigger simulation #421
  * SBNSoftware/sbncode Moved SystTools from icaruscode so we share this with SBND #433
  * SBNSoftware/sbncode Moving to HadronHP for low energy hadron simulation. #435
  * SBNSoftware/sbncode Simple merge and SBN merge changes #430
  
Extra info
---------------------------------------------------
We expect this to be the last release with art 3.12. We expect the next release to be built with art 3.14.
