---
layout: page
title: ReleaseNotes09220101
toc: true
---

-----------------------------------------------------------------------------
| v09.22.01.01 | 23 Apr 2021 | [ReleaseNotes](ReleaseNotes09220101.html) |
| --- | --- | --- |



sbndcode v09_22_01_01 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_22_01_01](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_22_01_01/sbndcode-v09_22_01_01.html)

Purpose
---------------------------------------------------

* Weekly release

New features
---------------------------------------------------

* sbndcode PR 97
  * TPC readout window reduction 
  * This PR includes all the changes related to setting the new default TPC readout time to 1.3 ms with a 0.2 ms front/back porch (see sbn-doc-21573). 
  * Full list of changes detailed in https://github.com/SBNSoftware/sbndcode/pull/97.

Bug fixes
---------------------------------------------------

Updated dependencies
---------------------------------------------------

* sbncode v09_22_01_01
* larsoft v09_22_01
* larbatch v01_56_00 

Change List
==========================================

sbndcode v09_22_01_01
---------------------------------------------------

* 2021-04-23  Patrick Green : Merge branch 'release/v09_22_01_01'
* 2021-04-23  Patrick Green : Update to larsoft v09_22_01
* 2021-04-22  Patrick Green : Merge pull request #97 from wforeman/feature/wforeman_20percent_porch
* 2021-04-16  Will Foreman : Adding SCE-enabled g4 stage for in-time cosmics
* 2021-04-16  Will Foreman : Fixing T0 in prodsingle electron/pi+ file
* 2021-04-16  Patrick Green : Merge tag 'v09_22_01' into develop
* 2021-04-15  Will Foreman : Tying up some loose ends
* 2021-04-15  Will Foreman : Set dummy values for Geant4 times to be outside expected range
* 2021-04-15  Will Foreman : Tidying up
* 2021-04-15  Will Foreman : Uncommenting different methods of calculating Geant4 track ID using recoutils
* 2021-04-15  Will Foreman : Change clock inheritance back to previous setting
* 2021-04-15  Will Foreman : Add fcl that drops heavy raw products
* 2021-04-15  Will Foreman : Remove fcl for 15% porch since this will be new default
* 2021-04-15  Will Foreman : Make filenames conform with new simplified naming scheme
* 2021-04-15  Will Foreman : Merge branch 'develop' of github.com:SBNSoftware/sbndcode into feature/wforeman_20percent_porch
* 2021-04-15  Will Foreman : Remove fcls needed in readout window tests
* 2021-04-15  Will Foreman : Add comment about LAr temp measurement from MicroBooNE
* 2021-04-02  Will Foreman : Fixing merge conflicts
* 2021-04-02  Will Foreman : Updates to AnalysisTree for calculating completeness and efficiency of slices, and saving extra info about hits
* 2021-03-22  Will Foreman : Deleting clock-specific services file
* 2021-03-22  Will Foreman : Reverting changes, since clock configuration inheritance doesn't work as expected
* 2021-03-22  Will Foreman : Further consolidating some clock configuration settings so they aren't repeated in different places
* 2021-03-22  Will Foreman : Restore simplified T0=0 scheme for singles, assuming inheritance of clock settings is enabled
* 2021-03-16  Will Foreman : Fixing merge conflicts
* 2021-03-16  Will Foreman : Changed PDS default readout to 12us
* 2021-03-16  Will Foreman : Added services files for scenarios where gen+g4 was run using the full 3 drift windows, but later stages use shorter TPC readout
* 2021-03-11  Will Foreman : Set opdet trigger alg to enable PDS readouts for a full drift period prior to TPC readout start, use 24us as the standard opdet readout, and also made fixes in the slicing up of raw waveforms into individual triggered readouts
* 2021-03-10  Will Foreman : Merge remote-tracking branch 'origin' into feature/wforeman_20percent_porch
* 2021-03-10  Will Foreman : Adding configurations for both the 15-percent porch (now the default) and the case for when only G4/Gen was run with the 3-drift config
* 2021-03-07  Will Foreman : Enclose problematic section of code in a try bracket
* 2021-03-05  Will Foreman : Disable inheriting clock config for now
* 2021-03-05  Will Foreman : Fix SampleTime typo
* 2021-03-05  Will Foreman : Cleaning up length calculation for MCParticle
* 2021-03-05  Will Foreman : Remove debugging cout statements
* 2021-03-05  Will Foreman : Update 3drift config for new frame period
* 2021-03-05  Will Foreman : Event display updates to conform to new readout window settings
* 2021-03-05  Will Foreman : Create 3 drift window versions of corsika+cosmic prod scripts, and remove some redundant parameter settings
* 2021-03-03  Will Foreman : Create g4, detsim, and reco1 scripts with SCE enabled, but otherwise using default readout settings
* 2021-03-03  Will Foreman : Update all prodsingle scripts to use the right T0 based on new G4RefTime
* 2021-03-03  Will Foreman : Update cosmic generators to conform to new readout time
* 2021-03-03  Will Foreman : Update detector and clock properties to use 0.2 ms front and back porch by default
* 2021-03-02  Will Foreman : Adding VIM swap files to gitignore

sbndutil v09_22_01_01
---------------------------------------------------

* 2021-04-23  Patrick Green : Merge branch 'release/v09_22_01_01'
* 2021-04-23  Patrick Green : Update to larsoft v09_22_01
* 2021-04-16  Patrick Green : Merge tag 'v09_22_01' into develop                                                                                                                                    
