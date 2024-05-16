---
layout: page
title: ReleaseNotes099000
toc: true
---

-----------------------------------------------------------------------------
| v09.90.00 | 16 May 2024 | [ReleaseNotes](ReleaseNotes099000.html) |
| --- | --- | --- |



sbndcode v09_90_00 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_90_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_90_00/sbndcode-v09_90_00.html)

Purpose
---------------------------------------------------
Weekly release

New features
---------------------------------------------------
* https://github.com/SBNSoftware/sbndcode/pull/463 - increase precision of timestamp calculation to 64 bits -- was 32 bits
* https://github.com/SBNSoftware/sbndcode/pull/464 - Add electronics monitoring plots. Save raw data in hdf5 format.
* https://github.com/SBNSoftware/sbndcode/pull/465 - CI usages update
* https://github.com/SBNSoftware/sbndcode/pull/466 - Trj digitalnoisechannelstatus may3 2024
* https://github.com/SBNSoftware/sbndcode/pull/467 - Add analyzer for PDS MC/reco studies

Bug fixes
---------------------------------------------------

Updated dependencies
---------------------------------------------------
* sbncode v09_90_00
* larsoft v09_90_00

Supported qualifiers
---------------------------------------------------
* e26:prof
* e26:debug

Change List
==========================================

sbndcode sbndcode
---------------------------------------------------

* 2024-05-16  Brinden Carlson : Merge branch 'release/v09_90_00'
* 2024-05-16  Brinden Carlson : Updating dependencies to match larsoft v09_90_00
* 2024-05-15  Francisco Javier Nicolás-Arnaldos : Merge pull request #467 from SBNSoftware/feature/fnicolas_pdsanalyzer
* 2024-05-15  Francisco Javier Nicolás-Arnaldos : Merge pull request #466 from SBNSoftware/trj_digitalnoisechannelstatus_may3_2024
* 2024-05-14  Bear Carlson : Merge pull request #464 from yangtj207/feature/tjyang_omevd
* 2024-05-14  Bear Carlson : Merge branch 'develop' into feature/tjyang_omevd
* 2024-05-14  Bear Carlson : Merge pull request #463 from SBNSoftware/trj64bittimestamp_April29_2024
* 2024-05-14  Bear Carlson : Merge branch 'develop' into trj64bittimestamp_April29_2024
* 2024-05-07  Thomas Junk : tighter cuts -- try not to cut out EM showers
* 2024-05-07  Thomas Junk : Add in Joe Zennamo's idea of cutting on number of samples a certain distance from pedestal, both in raw digits and recob::wire
* 2024-05-07  Thomas Junk : make event prep method public so it can be called by modules and services
* 2024-05-07  Thomas Junk : shift around service definition macro calls
* 2024-05-05  Francisco Javier Nicolás-Arnaldos : Update README.md
* 2024-05-05  Francisco Javier Nicolás-Arnaldos : Update README.md
* 2024-05-05  Fran Nicolas : Update README
* 2024-05-05  Fran Nicolas : Add flash x variables
* 2024-05-05  Fran Nicolas : fix fhicls
* 2024-05-05  Fran Nicolas : install fhicl
* 2024-05-05  Fran Nicolas : Add PDS analyzer for MC and reco studies
* 2024-05-05  Francisco Javier Nicolás-Arnaldos : Merge pull request #465 from SBNSoftware/coackley_ci_usage_update_v09_88_01
* 2024-05-03  Thomas Junk : Digital Noise channel status identifier service
* 2024-05-02  Rachel Coackley : update usages
* 2024-04-30  Tingjun Yang : Add electronics monitoring plots. Save raw data in hdf5 format.
* 2024-04-29  Thomas Junk : increase precision of timestamp calculation to 64 bits -- was 32 bits
* 2024-04-29  Francisco Javier Nicolás-Arnaldos : Merge pull request #461 from SBNSoftware/release/SBN2024A

sbndutil 
---------------------------------------------------

* 2024-05-16  Brinden Carlson : Merge tag 'v09_90_00' into develop
* 2024-05-16  Brinden Carlson : Merge branch 'release/v09_90_00'
* 2024-05-16  Brinden Carlson : Updating dependencies to match larsoft v09_90_00
* 2024-05-15  Francisco Javier Nicolás-Arnaldos : Merge pull request #14 from yangtj207/feature/tjyang_create_raw_def
* 2024-04-29  Francisco Javier Nicolás-Arnaldos : Merge pull request #15 from SBNSoftware/release/SBN2024A
* 2024-04-29  Tingjun Yang : Add comment.
* 2024-04-12  Tingjun Yang : Add a script to create definitions of SBND raw data files per run.
* 2024-04-04  Fran Nicolas : Merge tag 'v09_88_00_02' into develop
* 2024-04-04  Fran Nicolas : Merge branch 'release/v09_88_00_02'
