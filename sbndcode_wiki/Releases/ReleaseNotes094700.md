---
layout: page
title: ReleaseNotes094700
toc: true
---

-----------------------------------------------------------------------------
| v09.47.00 | 06 Apr 2022 | [ReleaseNotes](ReleaseNotes094700.html) |
| --- | --- | --- |



sbndcode v09_47_00 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_47_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_47_00/sbndcode-v09_47_00.html)

Purpose
---------------------------------------------------

* Weekly release

New features
---------------------------------------------------

* sbndcode PR 269:  
  * XArapucas Gauss filter+tunned hitfinder+amplitude variations
  * Added a gaussian filter + tuned hitfinder for Daphne XArapucas test SER (with overshoot).
  * Added amplitude fluctuations at detsim level fitted from data, see docdb 25332

* sbndcode PR 272:  
  * PMT trigger
  * add in separate thresholds for coated and uncoated, add option for individual PMT thresholds

* sbndcode PR 274:
  * Set RootOutput parameter saveMemoryObjectThreshold=0 in several standard fcl files.
  
* sbndcode PR 276:
  * Add lite versions of various fcl files, dropping unused data products.   

Bug fixes
---------------------------------------------------

* sbndcode PR 267:
  * Fix typo, not dropping SimEnergyDeposits as intended.

Updated dependencies
---------------------------------------------------

* sbncode v09_47_00
* larsoft v09_47_00

Change List
==========================================

sbndcode
---------------------------------------------------

* 2022-04-06  Patrick Green : Merge branch 'release/v09_47_00'
* 2022-04-06  Patrick Green : Update to v09_47_00
* 2022-04-06  Patrick Green : fixing typo, not dropping product as intended -- hgreenlee PR 267
* 2022-04-05  Patrick Green : Merge pull request #274 from hgreenlee/greenlee_savemem_develop
* 2022-04-05  Patrick Green : Merge pull request #276 from hgreenlee/greenlee_wf_lite_develop
* 2022-04-01  Herbert Greenlee : Add reco lite fcl files.
* 2022-04-01  Herbert Greenlee : Add detsim lite fcl files.
* 2022-04-01  Herbert Greenlee : Add g4 lite fcl files.
* 2022-04-01  Herbert Greenlee : Add drop sequence fcls.
* 2022-03-18  Herbert Greenlee : Set RootOutput parameter saveMemoryObjectThreshold=0.
* 2022-03-30  Patrick Green : Add commented version number for CIs
* 2022-03-29  Patrick Green : Merge pull request #272 from SBNSoftware/feature/eyandel_pmttrigger
* 2022-03-29  Patrick Green : Merge pull request #269 from SBNSoftware/origin/feature/rodrigoa_Xarapucas_Updates
* 2022-03-29  Rodrigo Alvarez Garrote : typo, comment again cout
* 2022-03-24  eyandel : add in separate thresholds for coated and uncoated, add option for individual PMT thresholds
* 2022-03-22  Patrick Green : Merge tag 'v09_46_00' into develop
* 2022-03-21  Rodrigo Alvarez Garrote : Gaus filter for XArapuca, hitfinder tuned for Daphne XArapucas
* 2022-03-21  Rodrigo Alvarez Garrote : added Amplitude fluctuations

sbndutil
---------------------------------------------------

* 2022-04-06  Patrick Green : Merge tag 'v09_47_00' into develop
* 2022-04-06  Patrick Green : Merge branch 'release/v09_47_00'
* 2022-04-06  Patrick Green : Update to v09_47_00
* 2022-03-22  Patrick Green : Merge tag 'v09_46_00' into develop
