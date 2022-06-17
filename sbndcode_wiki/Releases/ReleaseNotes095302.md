---
layout: page
title: ReleaseNotes095302
toc: true
---

-----------------------------------------------------------------------------
| v09.53.02 | 17 jun 2022 | [ReleaseNotes](ReleaseNotes095302.html) |
| --- | --- | --- |



sbndcode v09_53_02 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_53_02](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_53_02/sbndcode-v09_53_02.html)

Purpose
---------------------------------------------------
Weekly release

New features
---------------------------------------------------
* sbndcode PR288
    * CRT Hit Timings:
        * Corrects the propagation speed value (currently simulating 10x the speed it should)
        * Adds a correction method to the CRT Hit Reconstruction to account for these two effects using reconstruction information.
        * The relevant fcl parameters are all inherited directly from the ones used in detsim.

Bug fixes
---------------------------------------------------

Updated dependencies
---------------------------------------------------
* sbncode v09_53_02
* larsoft v09_53_02

Change List
==========================================

sbndcode
---------------------------------------------------

* 2022-06-17  Fran Nicolas : Merge branch 'release/v09_53_02'
* 2022-06-17  Fran Nicolas : Update to v09_53_02
* 2022-06-17  Francisco Javier Nicolás-Arnaldos : Merge pull request #288 from SBNSoftware/feature/hlay_crt_hit_timings
* 2022-06-15  Henry Lay : Sort indentation
* 2022-06-14  Henry Lay : Add reco correction for time walk effect
* 2022-06-13  Henry Lay : Move std::cout to LogInfo
* 2022-06-13  Henry Lay : Add reconstruction stage correction for propagation delay
* 2022-06-13  Henry Lay : Correct propagation delay value
* 2022-06-10  Fran Nicolas : Merge tag 'v09_53_01' into develop

sbndutil
---------------------------------------------------

* 2022-06-17  Fran Nicolas : Merge tag 'v09_53_02' into develop
* 2022-06-17  Fran Nicolas : Merge branch 'release/v09_53_02'
* 2022-06-17  Fran Nicolas : Update to v09_53_02
* 2022-06-10  Fran Nicolas : Merge tag 'v09_53_01' into develop
