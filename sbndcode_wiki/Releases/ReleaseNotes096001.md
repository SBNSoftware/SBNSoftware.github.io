---
layout: page
title: ReleaseNotes096001
toc: true
---

-----------------------------------------------------------------------------
| v09.60.01 | 14 oct 2022 | [ReleaseNotes](ReleaseNotes096001.html) |
| --- | --- | --- |



sbndcode v09_60_01 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_60_01](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_60_01/sbndcode-v09_60_01.html)

Purpose
---------------------------------------------------
Weekly release

New features
---------------------------------------------------
* sbndcode PR305
  * Convert CI to use SCE enabled fcls
* sbndcode PR301
  * Reset LArFFT service in CalWireSBND module
  * Intended to fix sbndcode issue #300

Bug fixes
---------------------------------------------------

Updated dependencies
---------------------------------------------------
* larsoft v09_60_01
* sbncode v09_60_01

Change List
==========================================

sbndcode
---------------------------------------------------

* 2022-10-14  Fran Nicolas : Merge branch 'release/v09_60_01'
* 2022-10-14  Fran Nicolas : Update to larsoft v09_60_01
* 2022-10-14  Francisco Javier Nicolás-Arnaldos : Merge pull request #304 from SBNSoftware/feature/hlay_ci
* 2022-10-14  Francisco Javier Nicolás-Arnaldos : Merge pull request #301 from SBNSoftware/feature/fnicolas_fftinit
* 2022-10-14  Fran Nicolas : Remove default fhicl values and decrease to LogInfo
* 2022-10-10  Henry Lay : Convert CI to sce fcls
* 2022-10-04  Fran Nicolas : Merge tag 'v09_60_00' into develop
* 2022-09-20  Fran Nicolas : Reset FFT service for each event
* 2022-09-20  Fran Nicolas : Add FFT parameters

sbndutil
---------------------------------------------------

* 2022-10-14  Fran Nicolas : Merge tag 'v09_60_01' into develop
* 2022-10-14  Fran Nicolas : Merge branch 'release/v09_60_01'
* 2022-10-14  Fran Nicolas : Update to larsoft v09_60_01
* 2022-10-04  Fran Nicolas : Merge tag 'v09_60_00' into develop
