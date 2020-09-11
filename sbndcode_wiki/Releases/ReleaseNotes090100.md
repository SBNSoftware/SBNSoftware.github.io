---
layout: page
title: ReleaseNotes090100
toc: true
---

-----------------------------------------------------------------------------
| v09.01.00 | 07 Sep 2020 | [ReleaseNotes](ReleaseNotes090100.html) |
| --- | --- | --- |



sbndcode v09_01_00 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_01_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_01_00/sbndcode-v09_01_00.html)

Purpose
---------------------------------------------------

* Weekly release.

New features
---------------------------------------------------
This release updates the geometry to v1.5, where PMTs spheres are in vacuum and the xarapuca dummy channels were dropped.

It also swaps the convention for the PDS channel numbers.

Bug fixes(Bug-fixes)
---------------------------------------------------

Updated dependencies
---------------------------------------------------

* [larsoft v09_01_00](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/ReleaseNotes090100)

Change List
==========================================

sbndcode v09_01_00
---------------------------------------------------

* 2020-09-07  Andrew Scarff : Merge branch 'release/v09_01_00'
* 2020-09-07  Andrew Scarff : Update to larsoft v09_01_00
* 2020-09-07  Andrew Scarff : Merge pull request #26 from ikatza/feature/icaza_PDSNumbering
* 2020-09-04  Iker de Icaza Astiz : Update the json map to accomodate for the new convention
* 2020-09-04  Iker de Icaza Astiz : Flip the convention of OpDet numbering
* 2020-09-04  Iker de Icaza Astiz : Override larcorealg SortOpDets() locally
* 2020-09-04  Iker de Icaza : Merge pull request #6 from SBNSoftware/feature/mguzzo_geometry
* 2020-09-01  Marco Del Tutto : Merge branch 'mdeltutt_optical' into develop
* 2020-09-01  Marco Del Tutto : Fix parenthesis for std::abs.
* 2020-09-01  Andrew Scarff : Merge tag 'v09_00_01' into develop
* 2020-06-19  Iker de Icaza Astiz : Cleaning, const correctness, scoping
* 2020-06-19  Iker de Icaza Astiz : Remove hack to merge two optical channels into one readout channel in xarapucas
* 2020-06-19  Iker de Icaza Astiz : Fix ophit_wvfana fcl file and remove "xarapuca"label
* 2020-06-19  Iker de Icaza Astiz : Update geometry file version
* 2020-06-19  Iker de Icaza Astiz : Merge branch 'develop' into feature/mguzzo_geometry
* 2020-06-19  Marina Reggiani-Guzzo : geometry v1.5

sbndutil v09_01_00
---------------------------------------------------

* 2020-09-07  Andrew Scarff : Merge branch 'release/v09_01_00'
* 2020-09-07  Andrew Scarff : Update to larsoft v09_01_00
* 2020-09-01  Andrew Scarff : Merge tag 'v09_00_01' into develop
