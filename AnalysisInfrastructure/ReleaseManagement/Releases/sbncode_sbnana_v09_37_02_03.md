---
layout: page
title: sbncode_sbnana_v09_37_02_03
toc: true
---

sbncode_sbnana_v09_37_02_03 Release Notes
=======================================================================================

[List of sbncode releases](https://sbnsoftware.github.io/AnalysisInfrastructure/ReleaseManagement/Releases/List_of_SBN_code_releases)

Download instructions for [sbncode]()

Date
---------------------------------------------------
11 April 2022

Purpose
---------------------------------------------------
* Weekly release

New features
---------------------------------------------------
A production patch for sbncode and sbnana SBN2022A (v09_37_02_03) has been released.

* sbncode (v09_37_02_03):
  Using:
  * sbnanaobj           v09_17_06_06

  Includes:
  * SBNSoftware/sbnanaobj Add explicit size fields for numiinfo and bnbinfo #60
  * SBNSoftware/sbncode Fill the new BNB and NuMI size fields #254
  * SBNSoftware/sbnanaobj Upgrade to srproxy v00.35 #59
  * SBNSoftware/sbncode Adding implicit factor of 1e12 protons explicitly to BNB/NuMI POT accounting #253

* sbnana (v09_37_02_03):
  Using:
  * sbnanaobj           v09_17_06_06
  
  Includes:
  * SBNSoftware/sbnana Update SBNWeightSysts to handle BNB flux systs #65 
  * SBNSoftware/sbnana Update to srproxy v00.34 #64
  * SBNSoftware/sbnana Feature/bckhouse_multisigma_sbn2021c #61
  * SBNSoftware/sbnana Remove explicit dependency on srproxy #68
  * SBNSoftware/sbnana Make an attempt at counting exposure for BNB- or NuMI-triggered data #67


Extra info
---------------------------------------------------
