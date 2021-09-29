---
layout: page
title: ReleaseNotes093100
toc: true
---

-----------------------------------------------------------------------------
| v09.31.00 | 27 Sep 2021 | [ReleaseNotes](ReleaseNotes093100.html) |
| --- | --- | --- |



sbndcode v09_31_00 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_31_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_31_00/sbndcode-v09_31_00.html)

Purpose
---------------------------------------------------

* Weekly release

New features
---------------------------------------------------

* sbndcode PR 173:
  * Add caloskimmer, that runs uncalibrated calorimetry then creates ntuples for calibration, into the standard sbnd reco2 file. 
  * Also edit the pandoraCalo to use Gnocchi module.

* sbndcode PR 179:
  * adds crossing muon modules for comissioning
  * depends on SBNSoftware/sbnobj#26

* remotes/origin/feature/team_for_art_v3_09
  * updates for art v3_09  

Bug fixes
---------------------------------------------------

* sbndcode PR 181:
  * fixes hit associations for the muon tracks in the commisioning modules

Updated dependencies
---------------------------------------------------

* sbncode v09_31_00_01
* larsoft v09_31_00

Change List
==========================================

sbndcode
---------------------------------------------------

* 2021-09-27  Patrick Green : Merge branch 'release/v09_31_00'
* 2021-09-27  Patrick Green : Update to v09_31_00
* 2021-09-27  Patrick Green : Merge pull request #173 from SBNSoftware/lnguyen_caloskim_reco2_fcl
* 2021-09-27  Patrick Green : Merge pull request #181 from SBNSoftware/feature/lynnt_comm
* 2021-09-23  lynnt-uchicago : Merge branch 'feature/lynnt_comm' of https://github.com/SBNSoftware/sbndcode into feature/lynnt_comm
* 2021-09-23  lynnt-uchicago : fix missing line/bug in hit association creation
* 2021-09-21  Lynn Garren : cetbuildtools v8_17_03
* 2021-09-21  Patrick Green : Merge pull request #179 from SBNSoftware/feature/lynnt_comm
* 2021-09-17  Lynn Garren : cmake_minimum_required
* 2021-09-17  Lynn Garren : use relative DESTINATION
* 2021-09-17  Lynn Garren : cleanup
* 2021-09-17  Lynn Garren : use install_gdml properly
* 2021-09-17  Patrick Green : Merge tag 'v09_29_00' into develop
* 2021-09-16  lynnt-uchicago : Update .gitignore
* 2021-09-15  lynnt-uchicago : Update README.md
* 2021-09-15  lynnt-uchicago : Merge branch 'feature/lynnt_comm' of https://github.com/SBNSoftware/sbndcode into feature/lynnt_comm
* 2021-09-15  lynnt-uchicago : M_PI, size_t, LineCount fcl, added extra comments
* 2021-09-15  lynnt-uchicago : added muonhit branches + fcl param
* 2021-09-14  Lan Nguyen : change the name of caloskim calorimetry module
* 2021-09-13  lynnt-uchicago : cleaned up fcl comments
* 2021-09-13  lynnt-uchicago : cleaned up fcl comments
* 2021-09-13  lynnt-uchicago : moved README into Commissioning directory
* 2021-09-10  lynnt-uchicago : Delete sbndcode/Commissioning/safe directory
* 2021-09-10  lynnt-uchicago : Delete testProducer_module.cc
* 2021-09-10  lynnt-uchicago : Delete testSimpleFilter_module.cc
* 2021-09-10  lynnt-uchicago : Delete testFilter_module.cc
* 2021-09-10  lynnt-uchicago : Delete README_old.md
* 2021-09-10  lynnt-uchicago : updated format of README
* 2021-09-10  lynnt-uchicago : updated format of README
* 2021-09-10  lynnt-uchicago : updated README for MuonTrack obj/modules
* 2021-09-10  lynnt-uchicago : updated default t0 value
* 2021-09-10  lynnt-uchicago : fixed duplicate fcl parameters
* 2021-09-10  lynnt-uchicago : clean up, add fcl comments
* 2021-09-10  lynnt-uchicago : remove old AC modules
* 2021-09-10  lynnt-uchicago : cleaned up std::cout statements
* 2021-09-07  lynnt-uchicago : working associations updates
* 2021-09-03  Lan Nguyen : rename caloskim in reco fcl
* 2021-09-02  Lan Nguyen : edit required fcl parameters to run pandoraCalo with Gnocchi module
* 2021-08-31  lynnt-uchicago : attempt to add associations
* 2021-08-31  lynnt-uchicago : added filter and updated fcl
* 2021-08-25  Lynn Garren : find geant4
* 2021-08-25  Lynn Garren : for larsoft v09_28_02_01
* 2021-08-25  Lynn Garren : Merge branch 'develop' into feature/team_for_art_v3_09
* 2021-08-25  lynnt-uchicago : added muon track product
* 2021-08-25  lynnt-uchicago : concision/clean upate
* 2021-08-24  lynnt-uchicago : first build with working MuonTrack obj
* 2021-08-24  lynnt-uchicago : hardcoded endpoint fix for top/bottom planes
* 2021-08-20  Lan Nguyen : change pandoraCalo to use Gnocchi module
* 2021-08-20  Lan Nguyen : comment out opticalt0
* 2021-08-20  Lan Nguyen : add caloskim calorimetry into reco2 block
* 2021-08-20  Lan Nguyen : edit standard reco2 sbnd fcl to include caloskimmer
* 2021-08-13  lynnt-uchicago : created generalized muon modules
* 2021-08-13  lynnt-uchicago : Merge branch 'develop' into feature/lynnt_comm updating larsoft
* 2021-08-12  lynnt-uchicago : fixed comments
* 2021-08-12  lynnt-uchicago : fixed missing line
* 2021-08-11  Lynn Garren : larcorealg::GeometryTestLib
* 2021-08-11  Lynn Garren : various changes for art 3.09
* 2021-08-10  lynnt-uchicago : updated readme
* 2021-08-10  lynnt-uchicago : updated readme + commented out print statements
* 2021-08-10  lynnt-uchicago : updated readme
* 2021-08-10  lynnt-uchicago : Merge branch 'feature/lynnt_comm' of https://github.com/SBNSoftware/sbndcode into feature/lynnt_comm
* 2021-08-10  lynnt-uchicago : reorganized and renamed modules
* 2021-08-10  lynnt-uchicago : Create README.md
* 2021-08-10  lynnt-uchicago : updated actrks reset, added trajectories, fixed t0
* 2021-08-09  lynnt-uchicago : added ac tracks to hitdumper tree
* 2021-08-06  lynnt-uchicago : del
* 2021-08-06  lynnt-uchicago : fixed label
* 2021-08-06  lynnt-uchicago : fixed spacing
* 2021-08-06  lynnt-uchicago : first commit of producer+filter
* 2021-08-06  lynnt-uchicago : cleaned up hough_col
* 2021-08-05  lynnt-uchicago : tried changing from void function defs
* 2021-08-04  lynnt-uchicago : added trajectory, endpoints, and t0 for AC
* 2021-08-04  lynnt-uchicago : fixed compile errors
* 2021-08-04  lynnt-uchicago : fixed compile errors
* 2021-08-03  lynnt-uchicago : first attempt at wire intersection
* 2021-08-03  lynnt-uchicago : partway update to wire intersection
* 2021-08-02  lynnt-uchicago : reverted accidental changes
* 2021-08-02  lynnt-uchicago : cleaned spacing
* 2021-07-30  lynnt-uchicago : Merge branch 'develop' into feature/lynnt_comm
* 2021-07-30  lynnt-uchicago : update
* 2021-07-30  lynnt-uchicago : removed hitdumper ana, output only
* 2021-07-29  lynnt-uchicago : cleaned up filter
* 2021-07-29  lynnt-uchicago : adding hough transform
* 2021-07-29  lynnt-uchicago : rewrote fcl and initialized var properly
* 2021-07-29  lynnt-uchicago : removed redundant line
* 2021-07-29  lynnt-uchicago : update
* 2021-07-29  lynnt-uchicago : added fcl file
* 2021-07-28  lynnt-uchicago : first commit

sbndutil
---------------------------------------------------

* 2021-09-27  Patrick Green : Merge tag 'v09_31_00' into develop
* 2021-09-27  Patrick Green : Merge branch 'release/v09_31_00'
* 2021-09-27  Patrick Green : Update to v09_31_00
* 2021-09-21  Lynn Garren : cetbuildtools v8_17_03
* 2021-09-17  Lynn Garren : modernize
* 2021-09-17  Lynn Garren : use relative DESTINATION
* 2021-09-17  Patrick Green : Merge tag 'v09_29_00' into develop
* 2021-08-25  Lynn Garren : update version for testing
* 2021-08-25  Lynn Garren : Merge branch 'develop' into feature/team_for_art_v3_09
* 2021-08-11  Lynn Garren : for art 3.09
