---
layout: page
title: sbncode_v09_65_03
toc: true
---

sbncode_v09_65_03 Release Notes
=======================================================================================

[List of sbncode releases](https://sbnsoftware.github.io/AnalysisInfrastructure/ReleaseManagement/Releases/List_of_SBN_code_releases)

Download instructions for [sbncode]()

Date
---------------------------------------------------
25 January 2023

Purpose
---------------------------------------------------
* Weekly release

New features
---------------------------------------------------
A new weekly release sbncode (v09_65_03)  has been cut and distributed

* sbncode (v09_65_03):
  
  Using:
  * larsoft   v09_65_03 
    * nusystematics   v01_02_05 
  * sbnobj    v09_15_04
  * sbnanaobj v09_20_02

  
  Including:
  * SBNSoftware/sbncode Shifting CRT T0 and T1 properly in CAFMaker #323
  * SBNSoftware/sbncode BNB Kaon Gen for SBND + Time of Flight Implementation #324 
  * SBNSoftware/sbncode add explicit library includes to some CMakeLists.txt files #325 
  * SBNSoftware/sbncode fix ReferenceRayDistance parameter in Higgs Portal generator #326
  * SBNSoftware/sbnobj Fix sbn::crt::ts1()#72 
  * SBNSoftware/sbnobj trigger metrics bug fix #74
  * SBNSoftware/sbnanaobj Add missing vector line for SRPFPs to classes def #88 
 


Extra info
---------------------------------------------------
This release brings up to date the software stack so gets synchronised with LArSoft, however SBND will not have a follow-up 
release due to broken reconstruction until new LArSoft release with the fix is cut.
