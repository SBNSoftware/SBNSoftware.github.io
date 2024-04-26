---
layout: page
title: ReleaseNotes098901
toc: true
---

-----------------------------------------------------------------------------
| v09.89.01 | 26 Apr 2024 | [ReleaseNotes](ReleaseNotes098901.html) |
| --- | --- | --- |



sbndcode v09_89_01 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_89_01](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_89_01/sbndcode-v09_89_01.html)

Purpose
---------------------------------------------------
Patch release for SBN2024A. Updating to larsoft v09_89_91.

New features
---------------------------------------------------
- SBNSoftware/sbndcode#451: Run mcreco with Dropped Particles

Bug fixes
---------------------------------------------------
- SBNSoftware/sbndcode#457: update trigger to use 14.7k baseline

Updated dependencies
---------------------------------------------------
* sbncode v09_89_01
* larsoft v09_89_01

Supported qualifiers
---------------------------------------------------
* e26:prof
* c14:prof

Change List
==========================================

sbndcode sbndcode
---------------------------------------------------

* 2024-04-26  Fran Nicolas : Update to larsoft v09_89_01
* 2024-04-26  Francisco Javier Nicolás-Arnaldos : Merge pull request #457 from SBNSoftware/feature/bearc_pmttrigger
* 2024-04-26  Francisco Javier Nicolás-Arnaldos : Merge pull request #451 from SBNSoftware/feature/bearc_mcreco_rearrange
* 2024-04-25  Bear Carlson : Remove duplicate includes
* 2024-04-24  Francisco Javier Nicolás-Arnaldos : Merge branch 'develop' into feature/bearc_mcreco_rearrange
* 2024-04-16  Francisco Javier Nicolás-Arnaldos : Merge pull request #459 from SBNSoftware/release/SBN2024A
* 2024-04-15  Francisco Javier Nicolás-Arnaldos : Merge pull request #452 from SBNSoftware/trj_addFEMBAsicChanToMap_Apr4_2024
* 2024-04-11  Brinden Carlson : update trigger to use 14.7k baseline
* 2024-04-11  Brinden Carlson : Remove unecessary fcl overrides
* 2024-04-11  Brinden Carlson : update trigger to use 14.7k baseline
* 2024-04-03  Bear Carlson : Cleanup
* 2024-04-03  Brinden Carlson : rearrange mcreco to g4 stage to input both dropped and nominal MCParticles

sbndutil
---------------------------------------------------

