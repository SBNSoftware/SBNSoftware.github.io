---
layout: page
title: ReleaseNotes092900
toc: true
---

-----------------------------------------------------------------------------
| v09.29.00 | 17 Sep 2021 | [ReleaseNotes](ReleaseNotes092900.html) |
| --- | --- | --- |



sbndcode v09_29_00 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_29_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_29_00/sbndcode-v09_29_00.html)

Purpose
---------------------------------------------------

* Weekly release

New features
---------------------------------------------------

* sbndcode PR 180:
  * Adding tool for PMT gain fluctuations
  * This PR adds an art tool to simulate PMT gain fluctuations (algorithm taken from icaruscode/PMT/Algorithms/PMTsimulationAlg.h). More details can be found in docdb-23286.
  * Added PMTAlg directory containing the art tool for gain fluctuations
  * Added modified version for the 'AddSPE' function in DigiPMTSBNDAlg.cc
  * Note that the MakeGainFluctuations parameter in digi_pmt_sbnd.root is set to true, so SER fluctuation are simulated by default with this PR. 

Bug fixes
---------------------------------------------------

Updated dependencies
---------------------------------------------------

* sbncode v09_29_00
* larsoft v09_29_00

Change List
==========================================

sbndcode v09_29_00
---------------------------------------------------

* 2021-09-17  Patrick Green : Merge branch 'release/v09_29_00'
* 2021-09-17  Patrick Green : Update to v09_29_00
* 2021-09-17  Patrick Green : Merge pull request #180 from SBNSoftware/feature/fnicolas_sprfluc
* 2021-09-15  fran-nicar : Renaming variables, change AddSPE function and make MakeGainFluctuations a fhicl::OptionalDelegatedParameter
* 2021-09-15  fran-nicar : Add comments/TODO in the configuration file
* 2021-09-14  fran-nicar : Set MakeGainFluctuations to true and remove unnecesary dependencies
* 2021-09-10  Patrick Green : Merge tag 'v09_28_05' into develop
* 2021-09-10  fran-nicar : Adding tool for PMT SPR fluctuations

sbndutil v09_29_00
---------------------------------------------------

* 2021-09-17  Patrick Green : Merge branch 'release/v09_29_00'
* 2021-09-17  Patrick Green : Update to v09_29_00
* 2021-09-10  Patrick Green : Merge tag 'v09_28_05' into develop
