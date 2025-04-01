---
layout: page
title: sbncode_v10_04_07
toc: true
---

sbncode_v10_04_07 Release Notes 
=======================================================================================

[List of sbncode releases](https://sbnsoftware.github.io/AnalysisInfrastructure/ReleaseManagement/Releases/List_of_SBN_code_releases)

A git comparison of all the code changes between this release and the previous one: [Compare v10_04_07 and v10_04_06_01](https://github.com/SBNSoftware/sbncode/compare/v10_04_06_p01...v10_04_07)

Date
---------------------------------------------------
1 April 2025

Purpose
---------------------------------------------------
* Weekly release

New features
---------------------------------------------------
A weekly release of sbncode (v10_04_07) has been cut and distributed

* sbnobj (v10_00_08):
  
  Includes:
  
  * Add category to enum for unused channel [#123](https://github.com/SBNSoftware/sbnobj/pull/123) : Intended for SBND CRT MINOS modules
  * Add Dictionary [#125](https://github.com/SBNSoftware/sbnobj/pull/125) : Adds dictionary for `std::vector<std::vector<int64_t>>`

* sbnanaobj (v10_00_01):

  Includes:

  * Setting default values for variables [#136](https://github.com/SBNSoftware/sbnanaobj/pull/136) : Default values for `rec.slc.reco.pfp.shw.producer`, `rec.slc.reco.pfp.trk.bestplane`

* **sbnalg (v10_04_07)**:

  Using(updated dependencies):
  * sbnobj              v10_00_08
  * sbnanaobj           v10_00_01

  Includes:

  * Python interfaces to LArSoft and `sbn::CachedPointTracker` algorithm [#1](https://github.com/SBNSoftware/sbnalg/pull/1) : First content commit for `sbnalg`, containing an "example" algorithm
    showing how to arrange and build art-independent C++-code, and the Python shared library to access LArSoft data products and services.

* sbncode (v10_04_07):

  Using (updated dependencies):
  * larsoft			        v10_04_07
  * sbnalg              v10_04_07

   Includes:
  
  * Make sure string is not empty before adding it to metadata [#518](https://github.com/SBNSoftware/sbncode/pull/518) : This is to support non-production jobs
    
Extra info
---------------------------------------------------
Note the new dependency structure of sbncode <-- sbnalg <-- (sbnobj, sbnanaobj). See [DocDB #40408](https://sbn-docdb.fnal.gov/cgi-bin/sso/ShowDocument?docid=40408) for details.

Uses LArSoft v10_04_07, [release notes here](https://github.com/LArSoft/larsoft/releases/tag/v10_04_07).
