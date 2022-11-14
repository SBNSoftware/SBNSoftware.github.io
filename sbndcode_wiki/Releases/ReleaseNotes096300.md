---
layout: page
title: ReleaseNotes096300
toc: true
---

-----------------------------------------------------------------------------
| v09.63.00 | 14 nov 2022 | [ReleaseNotes](ReleaseNotes096300.html) |
| --- | --- | --- |



sbndcode v09_63_00 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_63_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_63_00/sbndcode-v09_63_00.html)

Purpose
---------------------------------------------------
Autumn (SBN2022B) production release

New features
---------------------------------------------------
* sbndcode PR307
  * Accommodate breaking changes to geometry
  * Pursuant to LArSoft/larcorealg#33
* sbndcode PR308
  * cetmodules migration

Bug fixes
---------------------------------------------------

Updated dependencies
---------------------------------------------------
- larsoft v09_63_00
- sbncode v09_63_00

Additional info
---------------------------------------------------
- Breaking changes
  - Includes migration to use cetmodules (https://indico.fnal.gov/event/53302)
  - Includes breaking changes in the use of the geometry sservice (https://indico.fnal.gov/event/56265/)

Change List
==========================================

sbndcode
---------------------------------------------------

* 2022-11-14  Francisco Javier Nicolás-Arnaldos : Merge pull request #307 from knoepfel/geom-work
* 2022-11-11  Miquel Nebot : Merge pull request #308 from gartung/from-v09_60_01
* 2022-11-10  Patrick Gartung : trailing whitespace cleanup
* 2022-11-09  Patrick Gartung : Second pass at cetmodules migration.
* 2022-11-09  Patrick Gartung : First pass at CMakeList.txt cetmodules migration: use targets, follow MIGRATE comment recommendations.
* 2022-10-06  Kyle Knoepfel : Accommodate breaking changes.
* 2022-11-09  Patrick Gartung : cetmodules migration of ups directory
* 2022-11-09  Patrick Gartung : Merge branch 'SBNSoftware:develop' into from-v09_60_01
* 2022-11-03  Fran Nicolas : Merge tag 'v09_62_00' into develop
* 2022-10-17  Patrick Gartung : Add find_package for daq packages so target will get defined.

sbndutil
---------------------------------------------------

* 2022-11-03  Fran Nicolas : Merge tag 'v09_62_00' into develop
