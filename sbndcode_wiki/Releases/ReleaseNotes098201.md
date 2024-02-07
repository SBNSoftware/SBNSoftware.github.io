---
layout: page
title: ReleaseNotes098201
toc: true
---

-----------------------------------------------------------------------------
| v09.82.01 | 18 Jan 2024 | [ReleaseNotes](ReleaseNotes098201.html) |
| --- | --- | --- |



sbndcode v09_82_01 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_82_01](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_82_01/sbndcode-v09_82_01.html)

Purpose
---------------------------------------------------
Weekly release

New features
---------------------------------------------------
* SBNSoftware/sbndcode#395: Latest changes to the XARAPUCA light simulation and reconstruction chain:
  * SER signal max amplitude scalated to the expected 8 ADC counts.
  * Dynamic range set to 12 bits and baseline level (700ADCs), optimized for a signal with ~20% undershoot.
  * All XARAPUCAs set to 62.5 MHz following the new choice of readouts CAEN-v1740
  * VUV XARAPUCAs (now coated XAs) are now also sensible to visible light. Separated efficiencies to VUV and vis light are now configurable for coated XAs (uncoated XAs only see visible light).
  * Baseline noise level adjusted to the CAEN v1740 expected performance ~1/4 of the 1730 RMS.
  * Adjusted frequency of the Gaussian filter, hit finder and flashfinder parameters.
* SBNSoftware/sbndcode#381: Updates to SimpleFlash flash matcher
  * Added OpFlashes to SimpleFlash for SBND and ICARUS
  * Added XARAPUCA flashes to SimpleFlash for SBND
  * Updated SRSlice to accoutn for new flashes in CAF



Bug fixes
---------------------------------------------------
* SBNSoftware/sbndcode#394
  * Fixed XARAPUCA OpHits not being produced in HitDumper
* SBNSoftware/sbndcode#400
  * TPC Decoder: change to use fragment ID to get the FEM crate number 

Updated dependencies
---------------------------------------------------
* sbncode v09_82_91
* larsoft v09_82_91
* sbnd_data v01_22_00

Supported qualifiers
---------------------------------------------------
* e26:prof
* e26:debug

Change List
==========================================

sbndcode sbndcode
---------------------------------------------------

* 2024-01-18  Fran Nicolas : Merge branch 'release/v09_82_01'
* 2024-01-18  Fran Nicolas : Update to larsoft v09_82_01
* 2024-01-18  Francisco Javier Nicolás-Arnaldos : Merge pull request #395 from SBNSoftware/feature/rodrigoa_DetSim_XAs_update
* 2024-01-18  Francisco Javier Nicolás-Arnaldos : Merge pull request #392 from SBNSoftware/bugfix/rodrigoa_HitDumper_XA_ophits
* 2024-01-17  Bear Carlson : Maintain run_hitdumper.fcl defaults
* 2024-01-17  Francisco Javier Nicolás-Arnaldos : Merge branch 'develop' into bugfix/rodrigoa_HitDumper_XA_ophits
* 2024-01-17  Rodrigo Alvarez Garrote : Merge branch 'develop' into feature/rodrigoa_DetSim_XAs_update
* 2024-01-16  Francisco Javier Nicolás-Arnaldos : Merge pull request #381 from Robert-Darby/feature/rdarby_fm_optemplate
* 2024-01-12  Robert Darby : CAFMaker SCE fix
* 2024-01-12  Francisco Javier Nicolás-Arnaldos : Merge pull request #400 from SBNSoftware/trj_jan2024_femcrateid
* 2024-01-10  Francisco Javier Nicolás-Arnaldos : Merge branch 'develop' into feature/rodrigoa_DetSim_XAs_update
* 2024-01-10  Francisco Javier Nicolás-Arnaldos : Merge branch 'develop' into feature/rdarby_fm_optemplate
* 2024-01-10  Francisco Javier Nicolás-Arnaldos : Update product_deps
* 2024-01-10  Francisco Javier Nicolás-Arnaldos : Update XARAPUCA SER path
* 2024-01-09  Rodrigo Alvarez Garrote : sbnd_data deps changed from v01_21_00 to v01_22_00
* 2024-01-09  Rodrigo Alvarez Garrote : point arapucaAlg back to sbnd_data SER
* 2024-01-08  Thomas Junk : use fragment ID to get the FEM crate number
* 2023-12-20  Fran Nicolas : Merge tag 'v09_81_02' into develop
* 2023-11-13  Bear Carlson : Merge pull request #394 from SBNSoftware/bugfix/xa_hitdumper
* 2023-11-09  Brinden Carlson : fixed xa not producing
* 2023-11-06  Rodrigo Alvarez Garrote : XA reconstruction chain updated for the latest changes in detsim
* 2023-11-06  Rodrigo Alvarez Garrote : XAs changed to daphne, support for VUV+Visible light in VUV/coated XAs added
* 2023-10-17  Rodrigo Alvarez Garrote : updated hitdumper XA ophit label
* 2023-09-18  Robert Darby : Added UseOldMetrics, fixed typos
* 2023-08-25  Robert Darby : Merged up to v09_77_00
* 2023-08-25  Robert Darby : Fixed typos
* 2023-07-12  Robert Darby : Replaced UseCollectionPlaneOnly with PlaneList
* 2023-06-22  Robert Darby : Added other flashes to CAFMaker

sbndutil
---------------------------------------------------

* 2024-01-18  Fran Nicolas : Merge tag 'v09_82_01' into develop
* 2024-01-18  Fran Nicolas : Merge branch 'release/v09_82_01'
* 2024-01-18  Fran Nicolas : Update to larsoft v09_82_01
* 2023-12-20  Fran Nicolas : Merge tag 'v09_81_02' into develop
