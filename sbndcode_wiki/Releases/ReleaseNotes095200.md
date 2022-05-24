---
layout: page
title: ReleaseNotes095200
toc: true
---

-----------------------------------------------------------------------------
| v09.52.00 | 24 may 2022 | [ReleaseNotes](ReleaseNotes095200.html) |
| --- | --- | --- |



sbndcode v09_52_00 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_52_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_52_00/sbndcode-v09_52_00.html)

Purpose
---------------------------------------------------
Weekly release

New features
---------------------------------------------------
* sbndcode PR 285:
  * Modification of the random number generator function called at DetSim for XARAPUCAs
  * Detsim XARAPUCAs: Change shoot() to fire()

* sbndcode PR 283:
  * Adds a fcl for running CRUMBS as a standalone producer.
 
* sbndcode PR 281:
  * Updated CRT Simulation
  * Summary of changes:
   * introduction of FEBData to store all 32 channels for each FEB
	 * CRTData is now constructed from FEBData objects with a new CRTSlimmer module
	 * CRT simulation triggering has been improved
	 * CRT waveform simulation has been implemented
	 * FEB dead time is now simulated
	 * CRT unit tests have been added

Bug fixes
---------------------------------------------------
* sbndcode PR 284:
  * Small bugfix
  * TPB time now implemented for simphotonslite vis-XARAPUCAs


Updated dependencies
---------------------------------------------------
* sbncode v09_52_00
* larsoft v09_52_00

Change List
==========================================

sbndcode
---------------------------------------------------

* 2022-05-24  fran-nicar : Merge branch 'release/v09_52_00'
* 2022-05-24  fran-nicar : Update to larsoft v09_52_00
* 2022-05-23  Francisco Javier Nicolás-Arnaldos : Merge pull request #281 from SBNSoftware/feature/mdeltutt_crt_sim
* 2022-05-23  Francisco Javier Nicolás-Arnaldos : Merge pull request #283 from henrylay97/feature/hlay_crumbs_how_tos
* 2022-05-23  Francisco Javier Nicolás-Arnaldos : Merge pull request #284 from SBNSoftware/bugfix/rodrigoa_TPB_bug
* 2022-05-23  Francisco Javier Nicolás-Arnaldos : Merge branch 'develop' into bugfix/rodrigoa_TPB_bug
* 2022-05-23  Francisco Javier Nicolás-Arnaldos : Merge pull request #285 from ikatza/feature/icaza_opdetsim_fires
* 2022-05-19  Marco Del Tutto : Merge branch 'feature/mdeltutt_crt_sim' of github.com:SBNSoftware/sbndcode into feature/mdeltutt_crt_sim
* 2022-05-19  Marco Del Tutto : Turn off debug printouts
* 2022-05-19  Marco Del Tutto : Add ServiceHandle include
* 2022-05-18  Rodrigo Alvarez Garrote : Update DigiArapucaSBNDAlg.cc
* 2022-05-17  Iker de Icaza Astiz : Change shoot() to fire()
* 2022-05-17  Henry Lay : Dom-ify the fcl
* 2022-05-05  Henry Lay : Run CRUMBS as standalone producer
* 2022-05-13  fran-nicar : Merge tag 'v09_51_00' into develop
* 2022-05-13  Marco Del Tutto : Merge branch 'develop' into feature/mdeltutt_crt_sim
* 2022-05-10  Marco Del Tutto : Reset fAuxData
* 2022-05-06  Marco Del Tutto : Improve trigger logic
* 2022-05-05  Marco Del Tutto : Save FEBTruthInfo in the FEBData<->AuxDetIDE assns, and use it in the CRTSlimmer module
* 2022-05-05  Marco Del Tutto : Improve triggering, plus save indeces of sipms assns to AuxDetIDE
* 2022-05-05  Marco Del Tutto : Fix x-y trigger bug
* 2022-05-05  Marco Del Tutto : Add param to better debug trigger
* 2022-04-28  Marco Del Tutto : CRTTrack times are in double format
* 2022-04-28  Marco Del Tutto : Add appropriate time offset to CRT Hits
* 2022-04-13  Marco Del Tutto : Clean up
* 2022-04-11  Marco Del Tutto : Add doxygen strings
* 2022-04-11  Marco Del Tutto : Finish removing couts
* 2022-04-11  Marco Del Tutto : Switch to LogDebug
* 2022-04-11  Marco Del Tutto : Switch to LogDebug
* 2022-04-11  Marco Del Tutto : Exclude MINOS modules based on name, not detector ID
* 2022-04-11  Marco Del Tutto : Add CRT Geometry tests
* 2022-04-08  Marco Del Tutto : Update crtsim_sbnd.fcl with new CRT config
* 2022-04-08  Marco Del Tutto : Move Trigger struct to CreateData method
* 2022-04-08  Marco Del Tutto : Improved comments
* 2022-04-08  Marco Del Tutto : Add waveform emulation test
* 2022-04-08  Marco Del Tutto : Add method to return crt det sim parameters
* 2022-04-08  Marco Del Tutto : Move ChargeResponse calculation to its own function
* 2022-04-08  Marco Del Tutto : Use class engine for getChannelTriggerTicks method, and also make getChannelTriggerTicks public
* 2022-04-08  Marco Del Tutto : Move param config to its own function
* 2022-04-07  Marco Del Tutto : Fix conflicts
* 2022-04-07  Marco Del Tutto : Start adding CRT det sim test
* 2022-04-07  Marco Del Tutto : Fix indentation
* 2022-04-07  Marco Del Tutto : Remove unused libraries
* 2022-04-07  Marco Del Tutto : Clean up CRTDetSimParams file
* 2022-04-07  Marco Del Tutto : Remove unused libraries
* 2022-04-05  Marco Del Tutto : Fix ProcessStrips declaration
* 2022-04-05  Marco Del Tutto : Further clean up
* 2022-04-05  Marco Del Tutto : Clean up and document
* 2022-04-05  Marco Del Tutto : Clean up
* 2022-04-05  Marco Del Tutto : Move trigger decision to CreateData method
* 2022-04-05  Marco Del Tutto : Improve printouts
* 2022-04-05  Marco Del Tutto : Clean up
* 2022-04-05  Marco Del Tutto : Use AND among sipms to save strips
* 2022-04-05  Marco Del Tutto : Add another config for saving strips, currently commented out.
* 2022-04-04  Marco Del Tutto : Fix config param
* 2022-04-01  Marco Del Tutto : Fix trigger time per FEB
* 2022-04-01  Marco Del Tutto : Implement FEB-dependent trigger time
* 2022-04-01  Marco Del Tutto : Add fhicl config to make the two sipms time simulation the same
* 2022-03-31  Marco Del Tutto : Make waveform emul fhicl configurable
* 2022-03-31  Marco Del Tutto : Remove not-needed couts.
* 2022-03-31  Marco Del Tutto : Move final pritout before std::move statement.
* 2022-03-31  Marco Del Tutto : Print out number of tracks at end of event
* 2022-03-31  Marco Del Tutto : Use T1 instead of T0
* 2022-03-30  Marco Del Tutto : Fix conflicts and clean up
* 2022-03-29  Marco Del Tutto : Strip coincidence now implemented at the triggering stage, add time offset, and others
* 2022-03-24  Marco Del Tutto : Add waveform emulation to CRT simulation
* 2022-03-24  Marco Del Tutto : Add CRTSlimmer to legacy detsim fcl
* 2022-03-24  Marco Del Tutto : Add CRTSlimmer to standard detsim fcl
* 2022-03-24  Marco Del Tutto : CRTDetSim module now produces FEBData
* 2022-03-24  Marco Del Tutto : Add CRTSlimmer module to go from FEBData to CRTData
* 2022-03-23  Marco Del Tutto : Initial implementation of FEBData creation by CRTSimAlg
* 2022-03-23  Marco Del Tutto : Reset Taggers at every event
* 2022-03-23  Marco Del Tutto : Add copynumbers to CRT modules
* 2022-03-22  Marco Del Tutto : Fix fcl paths
* 2022-03-22  Marco Del Tutto : Move bulk of CRT simulation to CRTDetSimAlg class

sbndutil
---------------------------------------------------

* 2022-05-24  fran-nicar : Merge tag 'v09_52_00' into develop
* 2022-05-24  fran-nicar : Merge branch 'release/v09_52_00'
* 2022-05-24  fran-nicar : Update to larsoft v09_52_00
* 2022-05-13  fran-nicar : Merge tag 'v09_51_00' into develop
