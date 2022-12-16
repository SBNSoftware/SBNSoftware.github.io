---
layout: page
title: ReleaseNotes096301
toc: true
---

-----------------------------------------------------------------------------
| v09.63.01 | 15 dic 2022 | [ReleaseNotes](ReleaseNotes096301.html) |
| --- | --- | --- |



sbndcode v09_63_01 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_63_01](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_63_01/sbndcode-v09_63_01.html)

Purpose
---------------------------------------------------
Weekly release

New features
---------------------------------------------------
- SBNSoftware/sbndcode#309
  - Updated PDS reco1 used in our standard fhicls 
- SBNSoftware/sbndcode#303
  - Improvements and corrections to the Simple Flash Matcher 
- SBNSoftware/sbndcode#293
  - Added lines to track/shower creation blocks to run the creations over all PFOs

Bug fixes
---------------------------------------------------
- SBNSoftware/sbndcode#310

Updated dependencies
---------------------------------------------------
- sbncode v09_63_01
- larsoft v09_63_01
- sbnd_data v1_16_00

Extra info
---------------------------------------------------
This tag introduces to breaking changes:
- Updated CAF structure, produces both a track and a shower for every PFParticle (details in SBNSoftware/sbndcode#293)
- Refactored PDS reco1 workflow including signal deconvolution is now used by default in the stadard fhicls (details in SBNSoftware/sbndcode#309)

Change List
==========================================

sbndcode sbndcode
---------------------------------------------------

* 2022-12-15  Fran Nicolas : Merge branch 'release/v09_63_01'
* 2022-12-15  Fran Nicolas : Update to larsoft v09_63_01
* 2022-12-15  Francisco Javier Nicolás-Arnaldos : Merge pull request #309 from SBNSoftware/feature/pdsdeco_workflow
* 2022-12-15  Francisco Javier Nicolás-Arnaldos : Merge pull request #312 from SBNSoftware/release/SBN2022B
* 2022-12-15  Fran Nicolas : Update to version v09_63_00_02
* 2022-12-15  Francisco Javier Nicolás-Arnaldos : Merge pull request #293 from SBNSoftware/feature/rh_allPFOs
* 2022-12-14  rhowell42 : removed superfluous line 128
* 2022-12-12  rhowell42 : Added UseAllParticle tags to the shower creation modules used here.
* 2022-12-12  Francisco Javier Nicolás-Arnaldos : update to sbncode v09_63_00_02
* 2022-12-12  Francisco Javier Nicolás-Arnaldos : Merge pull request #310 from ikatza/feature/icaza_fix_testFHiCLfiles
* 2022-12-12  Francisco Javier Nicolás-Arnaldos : Merge pull request #303 from ikatza/feature/icaza_fm_newmets
* 2022-12-07  Fran Nicolas : Remove deprecated headers
* 2022-11-23  Fran Nicolas : Solve seg faults in flash algorithm
* 2022-11-23  Fran Nicolas : Standarize ophit labels
* 2022-11-23  Fran Nicolas : Update OpChRange to match current geo
* 2022-11-23  Fran Nicolas : Remove readout delay from opflash t0
* 2022-11-23  Fran Nicolas : Remove deprecated PDS deco production fhicls
* 2022-11-21  Iker de Icaza Astiz : Update sbnd_data again
* 2022-11-18  Iker de Icaza Astiz : Rename fcls to avoid collisions and make clear they're SBND's
* 2022-11-17  Rodrigo Alvarez Garrote : added xarapucas opflashes
* 2022-11-17  Rodrigo Alvarez Garrote : added xarapuca deconvolved wvfs and hits, set saturation value from detsim values
* 2022-11-15  Fran Nicolas : Remove cout
* 2022-11-15  Fran Nicolas : Add opdeconvolution workflow to the standards fhicl
* 2022-11-15  Fran Nicolas : Switch to measured PMT SER
* 2022-11-15  Fran Nicolas : Add option to skip saturated signals in opdeco
* 2022-11-15  Fran Nicolas : Conf fhicls restructuring
* 2022-11-15  Iker de Icaza Astiz : Merge branch 'develop' into feature/icaza_fm_newmets
* 2022-11-14  Fran Nicolas : Merge tag 'v09_63_00' into develop
* 2022-10-07  Iker de Icaza Astiz : Merge branch 'develop' into feature/icaza_fm_newmets
* 2022-10-05  Iker de Icaza Astiz : Update fcl to match the code
* 2022-09-12  Iker de Icaza Astiz : Create various fcls to run with SCE services
* 2022-09-12  Iker de Icaza Astiz : Create and use relevant SCE table
* 2022-09-12  Iker de Icaza Astiz : Load backtracker and particle inventory systems by default
* 2022-09-12  Iker de Icaza Astiz : Comments on future development
* 2022-09-05  Iker de Icaza Astiz : Only match potential nu candidates
* 2022-09-05  Iker de Icaza Astiz : Update the templates binning to have reduce the range and number of bins
* 2022-08-22  Iker de Icaza Astiz : Correct the drift distance when scoring
* 2022-08-19  Iker de Icaza Astiz : Change some histos params, update names and other odd bits
* 2022-08-10  Iker de Icaza Astiz : Merge branch 'develop' into feature/icaza_fm_newmets
* 2022-08-09  Ryan Howell : added lines to track and shower creation blocks to run the creations over all PFOs
* 2022-07-08  Iker de Icaza Astiz : Add option to correct drift distance using hypotetical flash time
* 2022-07-08  Iker de Icaza Astiz : Force metrics creation to only match one flash in the beam spill
* 2022-07-08  Iker de Icaza Astiz : Update fcl params to use new features, add comments of work to do

sbndutil
---------------------------------------------------

* 2022-12-15  Fran Nicolas : Merge tag 'v09_63_01' into develop
* 2022-12-15  Fran Nicolas : Merge branch 'release/v09_63_01'
* 2022-12-15  Fran Nicolas : Update to larsoft v09_63_01
* 2022-11-14  Fran Nicolas : Merge tag 'v09_63_00' into develop
