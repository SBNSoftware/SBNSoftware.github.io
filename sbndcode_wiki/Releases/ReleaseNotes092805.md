title: ReleaseNotes092805
toc: true
---

-----------------------------------------------------------------------------
| v09.28.05 | 10 Sep 2021 | [ReleaseNotes](ReleaseNotes092805.html) |
| --- | --- | --- |



sbndcode v09_28_05 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_28_05](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_28_05/sbndcode-v09_28_05.html)

Purpose
---------------------------------------------------

* Weekly release

New features
---------------------------------------------------

* Added ESTAR look-up table to sbnd_data v01_08_00
  * for use in shower energy reconstruction

Bug fixes
---------------------------------------------------

* sbndcode PR 178:
  * G4 fcls with no optical simulation
  * This PR fixes the g4 fcls that run larg4 without optical simulation. Resolves issue #153.

Updated dependencies
---------------------------------------------------

* sbncode v09_28_05
* larsoft v09_28_05

Change List
==========================================

sbndcode v09_28_05
---------------------------------------------------

* 2021-09-10  Patrick Green : Merge branch 'release/v09_28_05'
* 2021-09-10  Patrick Green : Update to v09_28_05
* 2021-09-10  Patrick Green : Merge pull request #178 from SBNSoftware/mdeltutt_larg4_issue153
* 2021-09-09  Marco Del Tutto : Fix the g4_no_opticalsim* fcls with the new larg4. This just requires removing the ionandscintout, pdfastsim, and pdfastsimout processes from the simulate path.
* 2021-09-09  Marco Del Tutto : Properly set the keepEMShowerDaughters: true from the ParticleListAction service.
* 2021-09-03  Patrick Green : Merge tag 'v09_28_04' into develop

sbndutil v09_28_05
---------------------------------------------------

* 2021-09-10  Patrick Green : Merge branch 'release/v09_28_05'
* 2021-09-10  Patrick Green : Update to v09_28_05
* 2021-09-03  Patrick Green : Merge tag 'v09_28_04' into develop
