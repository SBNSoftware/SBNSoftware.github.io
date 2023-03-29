---
layout: page
title: ReleaseNotes097100
toc: true
---

-----------------------------------------------------------------------------
| v09.71.00 | 29 mar 2023 | [ReleaseNotes](ReleaseNotes097100.html) |
| --- | --- | --- |



sbndcode v09_71_00 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_71_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_71_00/sbndcode-v09_71_00.html)

Purpose
---------------------------------------------------
Weekly release

New features
---------------------------------------------------
* SBNSoftware/sbndcode#327: enables neutrino time of flight.
* SBNSoftware/sbndcode#319: updates PDS det sim
  * Added a new tool to mimic waveform with higher sampling time

Bug fixes
---------------------------------------------------

Updated dependencies
---------------------------------------------------
* sbncode v09_71_00
* larsoft v09_71_00

Change List
==========================================

sbndcode sbndcode
---------------------------------------------------

* 2023-03-29  Fran Nicolas : Merge branch 'release/v09_71_00'
* 2023-03-29  Fran Nicolas : Version v09_71_00
* 2023-03-29  Francisco Javier Nicolás-Arnaldos : Merge pull request #319 from SBNSoftware/feature/rodrigoa_detsim_update
* 2023-03-29  Francisco Javier Nicolás-Arnaldos : Merge branch 'develop' into feature/rodrigoa_detsim_update
* 2023-03-29  Francisco Javier Nicolás-Arnaldos : Merge pull request #327 from SBNSoftware/feature/lnguyen-enable-genie-ToF-v2
* 2023-03-29  Rodrigo Alvarez Garrote : added mesages to logdebug, switched back to sbnd_data file
* 2023-03-29  Rodrigo Alvarez Garrote : different names for each instance of the tool (1 for pmts and another for xarapucas)
* 2023-03-29  Rodrigo Alvarez Garrote : fhicl configurations now properly set
* 2023-03-28  Rodrigo Alvarez Garrote : testing cubic spline and linear interpolation
* 2023-03-20  Fran Nicolas : Merge tag 'v09_69_01' into develop
* 2023-03-20  Vu Chi Lan Nguyen : enable neutrino time of flight for PR#320
* 2023-02-28  Rodrigo Alvarez Garrote : removed extra point to the first wvf, prevents 0s at the end of pmt signals
* 2023-02-16  Rodrigo Alvarez Garrote : updated sbnd_data version
* 2023-02-16  Rodrigo Alvarez Garrote : Updated PMT simulation with HD wvfs
* 2023-02-15  Rodrigo Alvarez Garrote : pnfs is dead
* 2023-02-15  Rodrigo Alvarez Garrote : X-ARAPUCAS updated detsim
* 2023-01-17  Rodrigo Alvarez Garrote : added xarapuca flc file configs
* 2023-01-17  Rodrigo Alvarez Garrote : added detsim update with HD waveforms
* 2022-12-20  Rodrigo Alvarez Garrote : XARAPUCAs detsim update

sbndutil
---------------------------------------------------

* 2023-03-29  Fran Nicolas : Merge tag 'v09_71_00' into develop
* 2023-03-29  Fran Nicolas : Merge branch 'release/v09_71_00'
* 2023-03-29  Fran Nicolas : Version v09_71_00
* 2023-03-20  Fran Nicolas : Merge tag 'v09_69_01' into develop
