---
layout: page
title: ReleaseNotes09250001
toc: true
---

-----------------------------------------------------------------------------
| v09.25.00.01 | 05 Jul 2021 | [ReleaseNotes](ReleaseNotes09250001.html) |
| --- | --- | --- |



sbndcode v09_25_00_01 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_25_00_01](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_25_00_01/sbndcode-v09_25_00_01.html)

Purpose
---------------------------------------------------

* Weekly Release

New features
---------------------------------------------------

* sbndcode PR 116:
  * Final (release) version of Geometry v2
  * Updates to use geometry v2 as default
  * Cleaned up the gdml folder
  * NOTE: This is a breaking change, art will throw an exceptional when running over larsoft files made with previous geometry versions

* sbndcode PR 119:
  * updates drift distance configuration for geometry v2

* sbndcode PR 121:
  * PandoraShower Hit Inputs
  * Since the input to pandora was changed to gaushit we can no longer use the standard set of cheating tools, we most define an SBND set with the appropriate overrides. 
  * I also moved the change to input label into the pandoramodules fcl rather than have it overridden in the reco fcl.

* sbnd_data:
  * Added OpticalLibrary/SBND_OpLibOUT_v2.00.root for hybrid light simulation model.
  * Added PID/Dazzle.weights.xml, PID/Razzle.weights.xml for Razzle-Dazzle PID

Bug fixes
---------------------------------------------------

Updated dependencies
---------------------------------------------------

* sbncode v09_25_00_01

Change List
==========================================

sbndcode v09_25_00_01
---------------------------------------------------

* 2021-07-05  Patrick Green : Merge branch 'release/v09_25_00_01'
* 2021-07-05  Patrick Green : Update to v09_25_00_01
* 2021-07-05  Patrick Green : Merge pull request #119 from SBNSoftware/feature/icaza_driftdistance_update
* 2021-07-05  Patrick Green : Merge pull request #116 from SBNSoftware/feature/NewGeometry_v2
* 2021-07-02  Marco Del Tutto : Pass the test_geometry_sbnd.fcl fcl to the Geometry tests, do not rely on the default settings in geometry_unit_test_sbnd.h
* 2021-07-02  Marco Del Tutto : Use v02_00 as default for the tests
* 2021-07-02  Marco Del Tutto : Modifies preparseGDML so that it keeps only one setup
* 2021-07-02  Patrick Green : Merge pull request #121 from SBNSoftware/feature/etyley_pandoraShowerHit
* 2021-07-01  Edward Tyley : Remove unnecessary overrides
* 2021-07-01  Edward Tyley : Add SBND specific PandoraShower cheating configs to accomodate change to input label
* 2021-06-30  Patrick Green : Merge tag 'v09_25_00' into develop
* 2021-06-28  Marco Del Tutto : Update vis macro with dewars, racks and overburden items
* 2021-06-28  Marco Del Tutto : Update instructions if running with overburden configuration
* 2021-06-28  Iker de Icaza : Update drift distance to geometry v2
* 2021-06-25  Gustavo Valdiviesso : Fixed geometry
* 2021-06-23  Gustavo Valdiviesso : Updating gdml tools
* 2021-06-23  Gustavo Valdiviesso : Geometry v2 release
* 2021-04-22  Marco Del Tutto : Merge branch 'feature/NewGeometry_v2' of github.com:SBNSoftware/sbndcode into feature/NewGeometry_v2
* 2021-04-22  Marco Del Tutto : Fixes crt position name poCRT to posCRT
* 2021-04-22  Marco Del Tutto : Fix positions of volumes in volDetEnclosure
* 2021-04-22  Marco Del Tutto : Fix material definitions for matCA6
* 2021-04-22  Marco Del Tutto : Updating geoVis_sbnd.C for the new geometry
* 2021-04-22  Marco Del Tutto : Adding the overburden to the volDetEnclosure.
* 2021-04-22  Gustavo Valdiviesso : added mass buffer
* 2021-04-21  Marco Del Tutto : Merge branch 'feature/NewGeometry_v2' of github.com:SBNSoftware/sbndcode into feature/NewGeometry_v2
* 2021-04-21  Marco Del Tutto : Changing ground material for layers 1 and 2 from dirt to CA-6.
* 2021-04-15  Marco Del Tutto : Merge branch 'feature/NewGeometry_v2' of github.com:SBNSoftware/sbndcode into feature/NewGeometry_v2
* 2021-04-15  Marco Del Tutto : Avoid volDetEnclosure and volShielding overlap
* 2021-04-15  Marco Del Tutto : Avoid volDetEnclosure and volShielding overlap
* 2021-04-15  Marco Del Tutto : Merge branch 'feature/NewGeometry_v2' of github.com:SBNSoftware/sbndcode into feature/NewGeometry_v2
* 2021-04-15  Marco Del Tutto : Removing plywood and mezzanine items overlaps
* 2021-04-15  Marco Del Tutto : Removing plywood and mezzanine items overlaps
* 2021-04-12  Marco Del Tutto : Add a fcl file which allows switching to the geometry configuration with overburden
* 2021-04-09  Marco Del Tutto : Fixing some overlaps
* 2021-04-08  Marco Del Tutto : Trimming whitespaces
* 2021-04-08  Marco Del Tutto : Fix position names to be unique
* 2021-04-08  Marco Del Tutto : Minor adjustements to fix overlaps
* 2021-04-07  Marco Del Tutto : Increasing dimGround_X_mm and dimGround_Z_mm
* 2021-04-07  Marco Del Tutto : Adding mezzanine grating roof, racks, and external dewars.
* 2021-04-04  Marco Del Tutto : Adding mezzanine racks
* 2021-04-02  Gustavo Valdiviesso : corrections
* 2021-03-19  Gustavo Valdiviesso : Fixed materials names
* 2021-03-18  Marco Del Tutto : Renaming matLiquidArgon to LAr
* 2021-03-17  Marco Del Tutto : Renaming volCryostatLid* to volCryoLid*, as volCryostat is used in LArSoft to identify the cryostat itself
* 2021-03-16  Gustavo Valdiviesso : Updated geoVis for new geometry
* 2021-03-15  Gustavo Valdiviesso : New geometry with fixes
* 2021-02-09  Marco Del Tutto : Removing spurious constants.
* 2021-02-09  Marco Del Tutto : Making sure volume names are unique
* 2021-02-09  Marco Del Tutto : Adding an extra fhicl configuration from the SBND geometry with the shielding (overburden).
* 2021-02-09  Marco Del Tutto : Adding the gdml files with the default SBND geometry, plus the shielding (overburden).
* 2021-02-09  Marco Del Tutto : Adding the shielding block (overburden) back to the base gdml file
* 2021-02-08  Gustavo Valdiviesso : using local copy of geometry to fix a conflict
* 2021-02-08  Gustavo Valdiviesso : fixed G4 warnings
* 2021-02-08  Gustavo Valdiviesso : fixed G4 warnings
* 2021-02-08  Marina : Updating sbnd_pds_mapping.json for geometry v02_00
* 2021-02-04  Marina : Fixing RefactoredGDMLSchema issue
* 2021-02-03  Gustavo Valdiviesso : Refactored fcl and Geometry v02

sbndutil v09_25_00_01
---------------------------------------------------

* 2021-07-05  Patrick Green : Merge branch 'release/v09_25_00_01'
* 2021-07-05  Patrick Green : Update to v09_25_00_01
* 2021-06-30  Patrick Green : Merge tag 'v09_25_00' into develop
