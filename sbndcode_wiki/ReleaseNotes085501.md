---
lang: en
title: ReleaseNotes085501
---

-----------------------------------------------------------------------------
| v08.55.01 | 17 Jun 2020 | [ReleaseNotes](ReleaseNotes085501.html) |
| --- | --- | --- |



sbndcode v08_55_01 Release Notes(#sbndcode-v08_55_01-Release-Notes)
=======================================================================================

-   **Table of contents**
-   [sbndcode v08_55_01 Release Notes](#sbndcode-v08_55_01-Release-Notes)
    -   [Purpose](#Purpose)
    -   [New features](#New-features)
    -   [Bug fixes](#Bug-fixes)
    -   [Updated dependencies](#Updated-dependencies)
-   [Change List](#Change-List)
    -   [sbndcode v08\_51\_00](#sbndcode-v08_55_01)
    -   [sbndutil v08\_51\_00](#sbndutil-v08_55_01)

[List of sbndcode releases](List_of_SBND_code_releases.html)
Download instructions for [sbndcode v08_55_01](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v08_55_01/sbndcode-v08_55_01.html)

Purpose(#Purpose)
---------------------------------------------------

* Weekly release

New features(#New-features)
---------------------------------------------------

* New changes merged into develop:
  * New noise model (this was included before, but is now default).
  * New gain constants.
  * New diffusion constants.
  * New deconvolution filter.
  * New hit thresholds.
  * New (temporary) ROI thresholds.

Bug fixes(Bug-fixes)
---------------------------------------------------

Updated dependencies
---------------------------------------------------

* [larsoft v08_55_01](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/ReleaseNotes085501)

Change List
==========================================

sbndcode v08_55_01(#sbndcode-v08_55_01)
---------------------------------------------------

* 2020-06-17  Andrew Scarff : Merge branch 'release/v08_55_01'
* 2020-06-17  Andrew Scarff : Update to larsoft v08_55_01
* 2020-06-16  Andrew Scarff : Changed data driven noise model to default with new hit thresholds. Included changes to gain and diffusion constants an\
d the new Gaussian deconvolution filter. ROI thresholds also in place but will need updating after a study.
* 2020-06-05  Andrew Scarff : Merge tag 'v08_55_00' into develop

h2. sbndutil v08_55_01

* 2020-06-17  Andrew Scarff : Merge branch 'release/v08_55_01'
* 2020-06-17  Andrew Scarff : Update to larsoft v08_55_01
* 2020-06-05  Andrew Scarff : Merge tag 'v08_55_00' into develop
