---
layout: page
title: ReleaseNotes096600
toc: true
---

-----------------------------------------------------------------------------
| v09.66.00 | 31 ene 2023 | [ReleaseNotes](ReleaseNotes096600.html) |
| --- | --- | --- |



sbndcode v09_66_00 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_66_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_66_00/sbndcode-v09_66_00.html)

Purpose
---------------------------------------------------
Weekly release

New features
---------------------------------------------------
* SBNSoftware/sbndcode#311
  * Accommodate breaking changes in geometry (pursuant to LArSoft/larcorealg#34)
* SBNSoftware/sbndcode#313
  * Basic fcl files set up to run the MeVPrtl generator for Heavy Neutral Lepton production 
* SBNSoftware/sbndcode#314
  * PR to update the software trigger metric producer modules 
* Updates to CI tests:
  * SBNSoftware/sbndcode#315
    * Necessary updates to utilise new geometry in gallery tests
  * SBNSoftware/sbndcode#316
    * Bring the fast sim/reco unit tests into the 2020s  
  * SBNSoftware/sbndcode#317
    * Remove conflicting sbnd_crtsim table  

Bug fixes
---------------------------------------------------

Updated dependencies
---------------------------------------------------
* sbncode v09_66_00
* larsoft v09_66_00

Extra info
---------------------------------------------------
* This is the first `sbndcode` release that accomodates the geometry changes introduced in 
LArSoft `v09_65_00`(see https://github.com/LArSoft/larsoft/releases/tag/v09_65_00). 
* Following up the geometry changes, issues regarding the reconstruciton stage were found (see LArSoft/larpandora#30, solved in `larsoft v09_66_00`) and no `sbndcode v09_65_*` tags were cut.


Change List
==========================================

sbndcode sbndcode
---------------------------------------------------

* 2023-01-31  Fran Nicolas : Merge branch 'release/v09_66_00'
* 2023-01-31  Fran Nicolas : Update to larsoft v09_66_00
* 2023-01-26  Francisco Javier Nicolás-Arnaldos : Merge pull request #317 from SBNSoftware/bugfix/hlay_crtsim_table
* 2023-01-26  Francisco Javier Nicolás-Arnaldos : Merge pull request #316 from SBNSoftware/feature/hlay_unit_tests
* 2023-01-26  Francisco Javier Nicolás-Arnaldos : Merge pull request #314 from SBNSoftware/feature/lynnt_pmt_softtrig
* 2023-01-26  Francisco Javier Nicolás-Arnaldos : Merge pull request #313 from SBNSoftware/feature/lnguyen_hnl_gen_sbnd_fcl
* 2023-01-25  Francisco Javier Nicolás-Arnaldos : Update to larsoft v09_65_03
* 2023-01-23  Vu Chi Lan Nguyen : new fcl
* 2023-01-20  Francisco Javier Nicolás-Arnaldos : Merge pull request #315 from SBNSoftware/bugfix/hlay_geom
* 2023-01-19  Henry Lay : Remove conflicting sbnd_crtsim table
* 2023-01-19  Henry Lay : Bring the fast sim/reco unit tests into the 2020s
* 2023-01-19  Francisco Javier Nicolás-Arnaldos : Update product_deps
* 2023-01-19  Henry Lay : Necessary updates to utilise new geometry
* 2023-01-20  Francisco Javier Nicolás-Arnaldos : Merge pull request #311 from knoepfel/geom-iterator-interface
* 2023-01-12  Vu Chi Lan Nguyen : fix hnl header file
* 2023-01-12  Vu Chi Lan Nguyen : Merge branch 'develop' into feature/lnguyen_hnl_gen_sbnd_fcl
* 2023-01-12  Vu Chi Lan Nguyen : Merge branch 'lnguyen/v09_64_01' into feature/lnguyen_hnl_gen_sbnd_fcl
* 2023-01-12  Vu Chi Lan Nguyen : rename fcl up to standard
* 2023-01-10  lynnt-uchicago : create PMT and CRT specific folders, add README's
* 2023-01-10  lynnt-uchicago : fix bugs and clean
* 2023-01-10  lynnt-uchicago : fix bug in startIdx and triggerTime definition
* 2023-01-10  lynnt-uchicago : update verbose messages
* 2023-01-10  lynnt-uchicago : add output root tree, clean up
* 2023-01-10  lynnt-uchicago : clean up fcl labels
* 2023-01-08  lynnt-uchicago : update to read trigger objects from vectors
* 2023-01-08  lynnt-uchicago : rename boolean metric fcl parameters
* 2023-01-08  lynnt-uchicago : put CRTmetric object into a vector
* 2023-01-05  lynnt-uchicago : uncomment output root tree lines
* 2023-01-05  lynnt-uchicago : add pmt software trig changes to metric producer
* 2023-01-05  lynnt-uchicago : Merge tag 'v09_64_01' into feature/lynnt_pmt_softtrig
* 2023-01-05  lynnt-uchicago : initial build of software trig changes
* 2022-12-21  Fran Nicolas : Merge tag 'v09_64_01' into develop
* 2022-12-16  Vu Chi Lan Nguyen : Merge tag 'v09_63_01' of https://github.com/SBNSoftware/sbndcode into feature/lnguyen_hnl_gen_sbnd_fcl
* 2022-12-16  Vu Chi Lan Nguyen : clean no longer used folders
* 2022-12-15  Vu Chi Lan Nguyen : clean up and rearrange fcl
* 2022-12-14  Vu Chi Lan Nguyen : Merge branch 'feature/lnguyen_hnl_gen' of https://github.com/SBNSoftware/sbndcode into feature/lnguyen_hnl_gen_sbnd_fcl
* 2022-11-29  Kyle Knoepfel : Accommodate breaking changes in geometry.
* 2022-09-02  Vu Chi Lan Nguyen : hnl fcl file
* 2022-07-05  Vu Chi Lan Nguyen : first commit
* 2022-06-28  Vu Chi Lan Nguyen : add fcl file

sbndutil
---------------------------------------------------

* 2023-01-31  Fran Nicolas : Merge tag 'v09_66_00' into develop
* 2023-01-31  Fran Nicolas : Merge branch 'release/v09_66_00'
* 2023-01-31  Fran Nicolas : Update to larsoft v09_66_00
* 2022-12-21  Fran Nicolas : Merge tag 'v09_64_01' into develop
