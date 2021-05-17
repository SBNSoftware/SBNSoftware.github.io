---
layout: page
title: ReleaseNotes09220301
toc: true
---

-----------------------------------------------------------------------------
| v09.22.03.01 | 17 May 2021 | [ReleaseNotes](ReleaseNotes09220301.html) |
| --- | --- | --- |



sbndcode v09_22_03_01 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_22_03_01](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_22_03_01/sbndcode-v09_22_03_01.html)

Purpose
---------------------------------------------------

* Weekly release

New features
---------------------------------------------------

* sbndcode PR 84:
  * Integrated File Slimming into Production Chain
  * This work follows the discussion in: https://sbn-docdb.fnal.gov/cgi-bin/private/ShowDocument?docid=20825
  * It retunes the signal processing, drops data-products, replaces SimChannels with an assn between Hits and MCParticles, and sparsifies the MCParticles to be on the scale of the wire pitch
  * Note: SimChannels were temporarily added back in due to issues with truth matching requiring changes in LArSoft. Issue opened to take them out, aiming to drop them before next production

* sbndcode PR 104:
  * Commissioning HitDumper Updates
  * Updates to the HitDumper analyzer used for commissioning studies
  * Add POT information, Saves all CRT taggers by default, Keeps art-root files by default, General clean-up

* sbndcode PR 107:
  * Reduce verbosity of SBNDOpT0Finder

Bug fixes
---------------------------------------------------

Updated dependencies
---------------------------------------------------

* sbncode v09_22_03_01

Change List
==========================================

sbndcode v09_22_03_01
---------------------------------------------------

* 2021-05-17  Patrick Green : Merge branch 'release/v09_22_03_01'
* 2021-05-17  Patrick Green : Update to v09_22_03_01
* 2021-05-13  Patrick Green : Merge pull request #84 from SBNSoftware/feature/zennamo_AddingHitTruthMatching
* 2021-05-13  Patrick Green : Merge pull request #107 from SBNSoftware/feature/icaza_reduce_verbosity
* 2021-05-12  Iker de Icaza Astiz : Reduce verbosity of SBNDOpT0Finder
* 2021-05-12  Patrick Green : Merge pull request #106 from pgreen135/bugfix/pgreen_fixing_c7_errors
* 2021-05-12  Patrick Green : Fixing c7 compiler errors
* 2021-05-11  Patrick Green : Merge pull request #104 from SBNSoftware/mdeltutt_hitdumper
* 2021-05-11  Joseph Zennamo : Merge branch 'develop' into feature/zennamo_AddingHitTruthMatching
* 2021-05-11  Joseph Zennamo : Merge branch 'develop' into feature/zennamo_AddingHitTruthMatching
* 2021-05-11  Joseph Zennamo : moved drop command to base reco fcl
* 2021-05-11  Joseph Zennamo : switch to using gaushit
* 2021-05-11  Joseph Zennamo : switch from linecluster to gaushit in reco chain
* 2021-05-07  Marco Del Tutto : Keep art-root files and also all CRT taggers
* 2021-05-07  Patrick Green : Merge tag 'v09_22_03_00' into develop
* 2021-05-06  Marco Del Tutto : Clean up
* 2021-05-05  Marco Del Tutto : Add POT information to HitDumper
* 2021-05-01  Joseph Zennamo : temporarilly adding back simchannels, which are heavy
* 2021-05-01  Joseph Zennamo : Merge tag 'tags/v09_22_02' into feature/zennamo_AddingHitTruthMatching
* 2021-03-11  Joseph Zennamo : dropping unneed association to save space
* 2021-03-03  Joseph Zennamo : missed dropping a heavy data-product
* 2021-02-12  Joseph Zennamo : added script to search for fcl files
* 2021-02-12  Joseph Zennamo : dropped extra data-products
* 2021-02-12  Joseph Zennamo : sparsify MCParticles
* 2021-02-12  Joseph Zennamo : sparsify MCParticles
* 2021-02-12  Joseph Zennamo : added ROITuning and fixing the truth matching to linecluster hits
* 2021-01-28  Joseph Zennamo : adding gausHitTruthMatch
* 2021-01-28  Joseph Zennamo : adding backtracker services

sbndutil v09_22_03_01
---------------------------------------------------

* 2021-05-17  Patrick Green : Merge branch 'release/v09_22_03_01'
* 2021-05-17  Patrick Green : Update to v09_22_03_01
* 2021-05-07  Patrick Green : Merge tag 'v09_22_03_00' into develop
