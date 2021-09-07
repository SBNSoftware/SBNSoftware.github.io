---
layout: page
title: ReleaseNotes09270002
toc: true
---

-----------------------------------------------------------------------------
| v09.27.00.02 | 30 Jul 2021 | [ReleaseNotes](ReleaseNotes09270002.html) |
| --- | --- | --- |



sbndcode v09_27_00_02 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_27_00_02](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_27_00_02/sbndcode-v09_27_00_02.html)

Purpose
---------------------------------------------------

* Weekly release

New features
---------------------------------------------------

Bug fixes
---------------------------------------------------

* sbndcode PR 128:
  * Override larsoft and assign view using plane number for signal shape sim
  * LArSoft is confusing the "View" (U/V/Y) for planes 0/1 in TPC 0 in the new geometry, resulting in the simulated signal shape being swapped for these two planes. 
    The result is a ~10-fold increase in noise hits in tpc0/plane0 due to mis-matched signal shapes in the de-convolution stage. 
    This fix simply overrides LArSoft's strange way of assigning the View, and instead explicitly uses the plane numbers (0=U, 1=V).

Updated dependencies
---------------------------------------------------

* sbncode v09_27_00_02

Change List
==========================================

sbndcode v09_27_00_02
---------------------------------------------------

* 2021-07-30  Patrick Green : Merge branch 'release/v09_27_00_02'
* 2021-07-30  Patrick Green : Update to v09_27_00_02
* 2021-07-29  Patrick Green : Merge pull request #128 from wforeman/feature/wforeman_planeview_bugfix
* 2021-07-27  Patrick Green : Add .swo vim swap files to git ignore
* 2021-07-26  Will Foreman : Override larsoft and assign view based on plane number for signal shape sim
* 2021-07-26  Patrick Green : Merge tag 'v09_27_00' into develop

sbndutil v09_27_00_02
---------------------------------------------------

* 2021-07-30  Patrick Green : Merge branch 'release/v09_27_00_02'
* 2021-07-30  Patrick Green : Update to v09_27_00_02
* 2021-07-26  Patrick Green : Merge tag 'v09_27_00' into develop
