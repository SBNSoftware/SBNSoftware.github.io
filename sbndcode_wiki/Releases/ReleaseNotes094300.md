---
layout: page
title: ReleaseNotes094300
toc: true
---

-----------------------------------------------------------------------------
| v09.43.00 | 25 Feb 2022 | [ReleaseNotes](ReleaseNotes094300.html) |
| --- | --- | --- |



sbndcode v09_43_00 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_43_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_43_00/sbndcode-v09_43_00.html)

Purpose
---------------------------------------------------

* Weekly release

New features
---------------------------------------------------

* sbndcode PR 257:
  * Feature/vmeddage tof studies
  * This branch has Analyzer module (to do in-detail studies of ToF metric), a producer module which can produce ToF data products and a Filter module to filter events (cosmic-like or neutrino-like) based on ToF data products, produced by the producer module.
  * These modules were tested using a small test sample (in-time cosmic sample produced by Henry) produced as part of the ongoing production. 
  * The producer module and the Filter module use the ToF class, I pushed to the sbnobj reopository (see SBNSoftware/sbnobj#43)

* sbndcode PR 259:
  * Feature/lynnt_pmt_trig pmtTrigger producer updates
  * improvements to memory allocation, removed reference of ophit and opdaq in the fcl file

Bug fixes
---------------------------------------------------

Updated dependencies
---------------------------------------------------

* sbncode v09_43_00
* larsoft v09_43_00

Change List
==========================================

sbndcode
---------------------------------------------------

* 2022-02-25  Patrick Green : Merge branch 'release/v09_43_00'
* 2022-02-25  Patrick Green : Update to v09_43_00
* 2022-02-24  Patrick Green : Merge pull request #257 from SBNSoftware/feature/vmeddage_tof_studies
* 2022-02-21  Patrick Green : Merge pull request #259 from SBNSoftware/feature/lynnt_pmt_trig
* 2022-02-21  lynnt-uchicago : comment out baseline in producer
* 2022-02-18  Patrick Green : Merge tag 'v09_42_04' into develop
* 2022-02-18  lynnt-uchicago : Update pmtTriggerAna_module.cc
* 2022-02-18  lynnt-uchicago : Update HitDumper_module.cc
* 2022-02-18  lynnt-uchicago : Delete run_caentrigger.fcl
* 2022-02-18  lynnt-uchicago : Merge branch 'feature/lynnt_pmt_trig' of https://github.com/SBNSoftware/sbndcode into feature/lynnt_pmt_trig
* 2022-02-18  lynnt-uchicago : removed cout
* 2022-02-18  lynnt-uchicago : Delete caentrigger.fcl
* 2022-02-18  lynnt-uchicago : Delete CAENTriggerProducer_module.cc
* 2022-02-17  lynnt-uchicago : added error msg for missing trigger data product
* 2022-02-17  lynnt-uchicago : added reserve(), int to char, removed opdaq/ophit
* 2022-02-14  Varuna Meddage : now overriding the beginjob functions in analyzer module and producer module, fixed a small function argument in the filter module and added a missing module label in the path list in the run_producers.fcl.
* 2022-02-14  Varuna Meddage : Merge branch 'develop' of https://github.com/SBNSoftware/sbndcode into feature/vmeddage_tof_studies
* 2022-02-11  Varuna Meddage : changed values assigned to some fcl parameters in the configuration fcl file.
* 2022-02-11  Varuna Meddage : changed the tof dataproduct used to filter events.
* 2022-02-11  Varuna Meddage : Added all tof dataproducts in the trigger path.
* 2022-02-09  Varuna Meddage : corrected wrong path provided in the trigger paths.
* 2022-02-08  Varuna Meddage : convert variables of type double to float
* 2022-02-08  Varuna Meddage : Added some new fcl parameter to the moudle and chnaged the fcl parameter values in the fcl file.
* 2022-02-08  Varuna Meddage : Added producer and Filter modules and relevant fcl files. Removed some unnecessary fcl files and modified some existing fcl files.
* 2022-02-07  Varuna Meddage : tested the module by adding some cout statements and removed unnecessary lines in the fcl file.
* 2022-02-07  Varuna Meddage : Merge branch 'develop' of https://github.com/SBNSoftware/sbndcode into feature/vmeddage_tof_studies
* 2022-02-07  lynnt-uchicago : Revert "remove unused variables"
* 2022-02-04  Varuna Meddage : Added the ToF Analyzer module.
* 2022-02-03  lynnt-uchicago : Merge branch 'develop' into feature/lynnt_pmt_trig
* 2022-02-03  lynnt-uchicago : removed comments/changed binning on hist
* 2022-02-03  lynnt-uchicago : fixed missing name
* 2022-02-03  lynnt-uchicago : changed fcl details
* 2022-02-03  lynnt-uchicago : comm det sim fix
* 2022-01-31  lynnt-uchicago : first commit of CAENTrigger
* 2022-01-21  lynnt-uchicago : fixed referencing of endpoints

sbndutil
---------------------------------------------------

* 2022-02-25  Patrick Green : Merge tag 'v09_43_00' into develop
* 2022-02-25  Patrick Green : Merge branch 'release/v09_43_00'
* 2022-02-25  Patrick Green : Update to v09_43_00
* 2022-02-18  Patrick Green : Merge tag 'v09_42_04' into develop
