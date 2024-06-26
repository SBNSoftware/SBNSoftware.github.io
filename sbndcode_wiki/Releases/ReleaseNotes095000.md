---
layout: page
title: ReleaseNotes095000
toc: true
---

-----------------------------------------------------------------------------
| v09.50.00 | 06 may 2022 | [ReleaseNotes](ReleaseNotes095000.html) |
| --- | --- | --- |



sbndcode v09_50_00 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_50_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_50_00/sbndcode-v09_50_00.html)

Purpose
---------------------------------------------------
Weekly release

New features
---------------------------------------------------
* sbndcode PR 280:
  * Add a new cone shape feature for PFO Characterisation in PandoraNu.
  * The changes include:
    * Enable Cone Charge Feature Tools to run at PfoCharBDT1&2
    * Rename PfoCharBDT appropriately since now there are two trees at stage 1 and 2
    * Set 0.51 to match the cut value of each BDT.
    * Neutrino Algorithms are moved from after to before the PfoCharBDT2.
  * sbnd_data updated to v01_13_00

* sbndcode PR 282:
  * add headers needed for larsoft v09_50_00
  * Also, larcorealg test headers will move:
    * test/Geometry/geometry_unit_test_base.h becomes larcorealg/TestUtils/geometry_unit_test_base.h
    * test/Geometry/GeometryTestAlg.h becomes larcorealg/test/Geometry/GeometryTestAlg.h
    * test/Geometry/GeometryIteratorLoopTestAlg.h becomes larcorealg/test/Geometry/GeometryIteratorLoopTestAlg.h
    * test/Geometry/GeometryIteratorTestAlg.h becomes larcorealg/test/Geometry/GeometryIteratorTestAlg.h

Bug fixes
---------------------------------------------------

Updated dependencies
---------------------------------------------------
* sbncode v09_50_00
* larsoft v09_50_00
* sbnd_data v01_13_00

Change List
==========================================

sbndcode
---------------------------------------------------

* 2022-05-06  fran-nicar : Merge branch 'release/v09_50_00'
* 2022-05-06  fran-nicar : Update to larsoft version v09_50_00
* 2022-05-06  Francisco Javier Nicolás-Arnaldos : Merge pull request #282 from lgarren/feature/lg_v09_50_00
* 2022-05-06  Francisco Javier Nicolás-Arnaldos : Merge pull request #280 from SBNSoftware/feature/lnguyen_cone_shape_feature_bdt
* 2022-05-04  Lynn Garren : lardataobj_OpticalDetectorData is gone
* 2022-05-04  Lynn Garren : add headers needed for larsoft v09_50_00
* 2022-05-04  Lynn Garren : larcorealg test headers have moved
* 2022-05-03  VCLanNguyen : Merge branch 'develop' into feature/lnguyen_cone_shape_feature_bdt
* 2022-05-03  Vu Chi Lan Nguyen : point sbndcode product_deps to the new sbnd_data v01_13_00
* 2022-05-02  Vu Chi Lan Nguyen : Point to the new xml on sbnd_data v1_13_00
* 2022-04-29  fran-nicar : Merge tag 'v09_49_00' into develop
* 2022-04-27  Vu Chi Lan Nguyen : fixed typo
* 2022-04-27  Vu Chi Lan Nguyen : enable ConeCharge feature for PfoCharBDT1&2, moved LAr Neutrino Hierarchy block to before PfoCharBDT2, change name of PfoCharBDT
* 2022-04-20  Vu Chi Lan Nguyen : enable Cone Charge Feature tool in Track Shower BDT1
* 2022-04-20  Vu Chi Lan Nguyen : enable Cone Charge Feature tool in Track Shower BDT

sbndutil
---------------------------------------------------

* 2022-05-06  fran-nicar : Merge tag 'v09_50_00' into develop
* 2022-05-06  fran-nicar : Merge branch 'release/v09_50_00'
* 2022-05-06  fran-nicar : Update to larsoft version v09_50_00
* 2022-04-29  fran-nicar : Merge tag 'v09_49_00' into develop

