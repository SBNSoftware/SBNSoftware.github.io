---
layout: page
title: sbncode_v09_82_02
toc: true
---

sbncode_v09_82_02 Release Notes
=======================================================================================

[List of sbncode releases](https://sbnsoftware.github.io/AnalysisInfrastructure/ReleaseManagement/Releases/List_of_SBN_code_releases)

Download instructions for [sbncode]()

Date
---------------------------------------------------
26 Jan 2024

Purpose
---------------------------------------------------
* Weekly release

New features
---------------------------------------------------
A new weekly release of sbncode (v09_82_02) has been cut and distributed

* sbncode (v09_82_02):
  
  Using:
  * larsoft     v09_82_02
  * sbnobj			v09_17_11
  * sbnanaobj		v09_21_08
  * sbndaq_artdaq_core	v1_08_00of2
  * sbndata     v01_06
  
  Includes:
  * SBNSoftware/sbncode CRT Clustering #409
  * SBNSoftware/sbnanaobj CRT Clustering CAF Objects #115
  * SBNSoftware/sbnobj CRT Clustering final  #102
  * SBNSoftware/sbnanaobj cnnscore in SR #108
  * SBNSoftware/sbncode CNN scores with michel scores around pfp endpoints #385
  *  SBNSoftware/sbnobj cnnscore #97
  *  SBNSoftware/sbncode Patch for SimpleFlash #412
  * SBNSoftware/sbncode Update Supera to latest version #406
  * SBNSoftware/sbnanaobj New ICARUS training for track vs shower discrimination Pandora BDT #116
  * SBNSoftware/sbncode New training based on ICARUS MC for the track vs shower discrimination BDT in Pandora  #410
  * SBNSoftware/sbnobj Taking into account MinBias Triggers #100
    *  SBNSoftware/sbncode Feature/howard spillquality for develop based on j zennamo branch #407  
  * SBNSoftware/sbnanaobj Adds beam info for the triggering spill. Quick update as in PR 109 bu… #119
  * SBNSoftware/sbncode Enables Database Lookup for Exposure accounting #394
  * SBNSoftware/sbncode Razzled #411
  * SBNSoftware/sbnanaobj Razzled #117
  * SBNSoftware/sbnobj Razzled #103
  * SBNSoftware/sbndata This PR Adds the ICARUS Run2 Trigger Database #6
  * SBNSoftware/sbncode OpT0 CRUMBS #413
  * SBNSoftware/sbnanaobj OpT0 CRUMBS  #118
  * SBNSoftware/sbnobj OpT0 CRUMBS #104
  * SBNSoftware/sbnobj Additions to sbn::ExtraTriggerInfo data product to store ICARUS adder information #96
  * SBNSoftware/sbndaq-artdaq-core/Feature/hhausner tpc compression #96 to offline #97
  * SBNSoftware/sbndaq-artdaq-core/merge active changes from Tereza Kroupova's version of sbnd_content.h #93

  
Extra info
---------------------------------------------------
This release has been only distributed for e26 qualifiers ( c14 is known to have an upstream issue and won't be distributed for now)
