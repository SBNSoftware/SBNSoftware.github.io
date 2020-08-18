---
layout: page
title: ReleaseNotes086201
toc: true
---

-----------------------------------------------------------------------------
| v08.62.01 | 18 Aug 2020 | [ReleaseNotes](ReleaseNotes086201.html) |
| --- | --- | --- |



sbndcode v08_62_01 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v08_62_01](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v08_62_01/sbndcode-v08_62_01.html)

Purpose
---------------------------------------------------

* Weekly release

New features
---------------------------------------------------

Bug fixes(Bug-fixes)
---------------------------------------------------

Updated dependencies
---------------------------------------------------

* [larsoft v08_62_01](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/ReleaseNotes086201)
* pandora v03_15_00a


Change List
==========================================

sbndcode v08_62_01
---------------------------------------------------

* 2020-08-18  Andrew Scarff : Merge branch 'release/v08_62_01'
* 2020-08-18  Andrew Scarff : Update to larsoft v08_62_01
* 2020-08-18  Andrew Scarff : Merge pull request #20 from ikatza/feature/icaza_libpaths
* 2020-08-17  Iker de Icaza Astiz : Rename lib path names to follow the convention of full path
* 2020-08-17  Andrew Scarff : Merge pull request #19 from ikatza/feature/icaza_opdetdigi_seed
* 2020-08-17  Andrew Scarff : Merge branch 'develop' into feature/icaza_opdetdigi_seed
* 2020-08-17  Andrew Scarff : Update product_deps to use new version of sbnd_data (v01_03_00)
* 2020-08-14  Iker de Icaza Astiz : Change the raw pointers to std::unique_ptr<CLHEP::RandGeneral>
* 2020-08-11  Iker de Icaza Astiz : Rename vars, 'cause I ❤️  consistency
* 2020-08-11  Iker de Icaza Astiz : Remove unnecessary headers
* 2020-08-11  Iker de Icaza Astiz : Pass engine by ref so RandGenerals can be deleted, and delete them
* 2020-08-11  Iker de Icaza Astiz : Change the type of the hists to avoid hardcoding the number of bins.
* 2020-08-07  Andrew Scarff : Merge tag 'v08_62_00' into develop
* 2020-08-06  Iker de Icaza Astiz : Use CLHEP::RandGeneral() to produce reproducible rands instead of ROOT machinerie

sbndutil v08_62_01
---------------------------------------------------

* 2020-08-18  Andrew Scarff : Merge branch 'release/v08_62_01'
* 2020-08-18  Andrew Scarff : Update to larsoft v08_62_01
* 2020-08-07  Andrew Scarff : Merge tag 'v08_62_00' into develop
