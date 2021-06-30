---
layout: page
title: ReleaseNotes092500
toc: true
---

-----------------------------------------------------------------------------
| v09.25.00 | 30 Jun 2021 | [ReleaseNotes](ReleaseNotes092500.html) |
| --- | --- | --- |



sbndcode v09_25_00 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_25_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_25_00/sbndcode-v09_25_00.html)

Purpose
---------------------------------------------------

* Weekly Release

New features
---------------------------------------------------

* sbndcode PR 110 
  * Hybrid model for Light simulation
  * adds configuration fcl and the g4 fcl file needed for using the new Hybrid light simulation model (semi-analytic + library)
  * refactored larg4 only, depends geometry v2 (PR #116)

* sbndcode PR 112 
  * Pandora 3D Mop up
  * Rerun the 3D hit creation within the recursive shower mop up
  * Enable shower hierarchy mop up
  * Details of performance changes can be seen in DocDB #21900

Bug fixes
---------------------------------------------------

* sbndcode PR 117 
  * Height of Cosmic Generation Surface 
  * Increases the height of the cosmic generation surface from 18 m to 18.5 m to make sure that it doesn't intersect with the building in geometry v2 (PR #116).
  * Fixes Issue: Cosmic Generation Surface #98

* sbndcode PR 120
  * Fixing prodsingle T0 #120
  * prodsingle's T0 is relative to the beam gate time, so it should be set to 0.

Updated dependencies
---------------------------------------------------

* sbncode v09_25_00
* larsoft v09_25_00

Change List
==========================================

sbndcode v09_25_00
---------------------------------------------------

* 2021-06-30  Patrick Green : Merge branch 'release/v09_25_00'
* 2021-06-30  Patrick Green : Update to v09_25_00
* 2021-06-29  Patrick Green : Merge pull request #112 from SBNSoftware/feature/etyley_pandoraMopUp
* 2021-06-29  Patrick Green : Merge pull request #120 from wforeman/develop
* 2021-06-29  Patrick Green : Merge pull request #110 from claudiaalvgar/Hybrid-ModelUGR
* 2021-06-28  Will Foreman : Prodsingle T0 is relative to beam gate, so no need to set offset based on G4RefTime
* 2021-06-25  Patrick Green : Merge pull request #117 from SBNSoftware/mdeltutt_cosmic_gen_surface
* 2021-06-23  Marco Del Tutto : Adds units
* 2021-06-23  Marco Del Tutto : Increases the height of the cosmic generation surface from 18 m to 18.5 m so it doesn't intersect with the building.
* 2021-06-18  Patrick Green : Merge tag 'v09_24_02' into develop
* 2021-06-17  Claudia Alvarez : Updated Hybrid Model
* 2021-06-14  Edward Tyley : Add documentation for repeated algortihm
* 2021-06-09  Claudia Alvarez : Hybrid Model
* 2021-06-09  Claudia Alvarez : Hybrid Model
* 2021-05-13  Edward Tyley : Update Pandora recursive mop up to run the 3D hit creation and add in shower hierarchy mop up

sbndutil v09_25_00
---------------------------------------------------

* 2021-06-30  Patrick Green : Merge branch 'release/v09_25_00'
* 2021-06-30  Patrick Green : Update to v09_25_00
* 2021-06-18  Patrick Green : Merge tag 'v09_24_02' into develop
