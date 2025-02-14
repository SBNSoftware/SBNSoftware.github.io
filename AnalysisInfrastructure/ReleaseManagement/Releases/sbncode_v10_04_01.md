---
layout: page
title: sbncode_v10_04_01
toc: true
---

sbncode_v10_04_01 Release Notes
=======================================================================================

[List of sbncode releases](https://sbnsoftware.github.io/AnalysisInfrastructure/ReleaseManagement/Releases/List_of_SBN_code_releases)

A git comparison of all the code changes between this release and the previous one: [Compare v10_04_01 and v10_03_01_p01](https://github.com/SBNSoftware/sbncode/compare/v10_03_01...v10_04_01)

Date
---------------------------------------------------
14 February 2025

Purpose
---------------------------------------------------
* Weekly release

New features
---------------------------------------------------
A weekly release of sbncode (v10_04_01) has been cut and distributed

* sbncode (v10_04_01):

  Using (updated dependencies):
  * larsoft			        v10_04_01
  * sbnobj			        v10_00_03
  *-- lardataobj        v10_00_03
  * sbnanaobj           v09_23_03

   Includes:
  
  * Better handling of space points for bad channels [#490](https://github.com/SBNSoftware/sbncode/pull/490) It was realized the handling of bad channels could be done better so took advantage to make improvements.
  * Added SBN (shared) GENIE configuration for BNB and NuMI [#492](https://github.com/SBNSoftware/sbncode/pull/492) This request stores in sbncode a configuration template for GENIEGen module that include common settings like the time structure of the beam, its intensity, ν-Ar cross sections, and a few sparse others.
  * Save CVN scores in CAFMaker [#493](https://github.com/SBNSoftware/sbncode/pull/493) Save CVN scores in CAFMaker.
  * Fix bugs in v10 upgrade [#501](https://github.com/SBNSoftware/sbncode/pull/501) Various bug fixes necessary to move SBND and ICARUS code to v10.
  * Flatten the GENIE event record in flat CAF [#503](https://github.com/SBNSoftware/sbncode/pull/503) Changes the way the GENIE EventRecord is stored in flat CAFs. Instead of storing the entire genie::EventRecord (as is done in the regular CAF), the information of the EventRecord is saved as C-style arrays.

    
Extra info
---------------------------------------------------
