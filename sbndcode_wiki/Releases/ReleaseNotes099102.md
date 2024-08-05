---
layout: page
title: ReleaseNotes099102
toc: true
---

-----------------------------------------------------------------------------
| v09.91.02 | 05 Aug 2024 | [ReleaseNotes](ReleaseNotes099102.html) |
| --- | --- | --- |



sbndcode v09_91_02 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_91_02](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_91_02/sbndcode-v09_91_02.html)

Purpose
---------------------------------------------------

New features
---------------------------------------------------

Bug fixes
---------------------------------------------------

Updated dependencies
---------------------------------------------------

Supported qualifiers
---------------------------------------------------

Change List
==========================================

sbndcode sbndcode
---------------------------------------------------

* 2024-08-05  Brinden Carlson : fix unmerged changes
* 2024-08-05  Brinden Carlson : Merge branch 'release/v09_91_02' of https://github.com/SBNSoftware/sbndcode into release/v09_91_02
* 2024-08-05  Brinden Carlson : Restore to remove templates
* 2024-07-18  Brinden Carlson : Update to larsoft v09_91_02
* 2024-08-05  Brinden Carlson : Merge branch 'develop' of https://github.com/SBNSoftware/sbndcode into release/v09_91_02
* 2024-07-30  Bear Carlson : Update issue templates
* 2024-07-30  Bear Carlson : Update pull_request_template.md
* 2024-07-30  Bear Carlson : Update issue templates
* 2024-07-30  Bear Carlson : Update issue templates
* 2024-07-29  Bear Carlson : Create CONTRIBUTING.md
* 2024-07-24  Bear Carlson : Merge pull request #485 from SBNSoftware/bugfix/bearc_github
* 2024-07-24  Bear Carlson : Delete .github/workflows directory
* 2024-07-24  Brinden Carlson : Add PR template
* 2024-07-18  Brinden Carlson : Update to larsoft v09_91_02
* 2024-07-18  Bear Carlson : Merge pull request #482 from SBNSoftware/bugfix/reco_ci
* 2024-07-17  Bear Carlson : Rename reco1_sce_comm.fcl to reco1_comm.fcl
* 2024-07-16  Dom Brailsford : Update the commissioning fcl to use the replacement fcl
* 2024-07-16  Dom Brailsford : New drops sequence and job fcl that maintains the previous set of drops for the old reco1 fcls
* 2024-07-16  Brinden Carlson : fix testfcl CI
* 2024-07-16  Brinden Carlson : fix testfcl CI
* 2024-07-16  Bear Carlson : Merge pull request #481 from SBNSoftware/feature/firstdata
* 2024-07-16  Bear Carlson : Merge branch 'develop' into feature/firstdata
* 2024-07-16  Bear Carlson : Merge pull request #460 from SBNSoftware/dbrailsf_noicefclmate
* 2024-07-16  Bear Carlson : Merge branch 'develop' into dbrailsf_noicefclmate
* 2024-07-16  Dom Brailsford : Change the CI and unit tests to use standard_reco1_sbnd
* 2024-07-16  Dom Brailsford : Bad typo/lazy copy-pasting
* 2024-07-15  Bear Carlson : Merge pull request #480 from SBNSoftware/feature/hlay_crt_channel_map_for_gdml_v02_01
* 2024-07-15  Bear Carlson : Merge branch 'develop' into feature/hlay_crt_channel_map_for_gdml_v02_01
* 2024-07-15  Bear Carlson : Merge pull request #478 from SBNSoftware/feature/CRTgeom2
* 2024-07-15  Dom Brailsford : FCL to not delete any products
* 2024-07-15  Dom Brailsford : Remove another redundant fcl
* 2024-07-15  Dom Brailsford : Remove redundant fcls (these are completely covered by standard_reco1_sbnd.fcl now)
* 2024-07-15  Dom Brailsford : Rename and change fcl include
* 2024-07-15  Dom Brailsford : Update readmes
* 2024-07-15  Dom Brailsford : Merge branch 'develop' into dbrailsf_noicefclmate
* 2024-07-15  Dom Brailsford : Remove name/version text from top of fcls
* 2024-07-11  Bear Carlson : Update cafmakerjob_sbnd.fcl
* 2024-07-09  Marco Del Tutto : Remove unneeded check to ensure auxiliary detector ID and its GDML copynumber are the same
* 2024-07-09  Bear Carlson : Merge branch 'develop' into feature/CRTgeom2
* 2024-07-09  Henry Lay : Update logic for reversal of two north wall layers
* 2024-07-09  Henry Lay : Channel map update with further corrections to east wall (inversions) and new flat module
* 2024-06-24  Henry Lay : Update channel map for N-S inversion
* 2024-07-08  Tingjun Yang : Add first version of reconstruction fcl files for data based on wirecell 2D deconvolution.
* 2024-07-08  Bear Carlson : Merge pull request #479 from SBNSoftware/feature/jskim_SaveGENIEEventRecodForMCCAFMaker
* 2024-07-05  Ewerton Belchior : add noise filtering to sp chain
* 2024-07-05  Ewerton Belchior : add noise filtering to sp chain
* 2024-07-05  Ewerton Belchior : add noise filtering to sp chain
* 2024-07-05  Ewerton Belchior : add noise filtering to sp chain
* 2024-07-05  Ewerton Belchior : add noise filtering to sp chain
* 2024-07-05  Jaesung Kim : Merge branch 'develop' into feature/jskim_SaveGENIEEventRecodForMCCAFMaker
* 2024-07-05  Jaesung Kim : Adding doc-db number in the comment for SaveGENIEEventRecord
* 2024-07-05  Jaesung Kim : Setting cafmaker.SaveGENIEEventRecord to true for MC CAFMaker
* 2024-07-02  Bear Carlson : Merge pull request #470 from SBNSoftware/feature/hlay_crt_decoder_only
* 2024-07-02  Bear Carlson : Merge branch 'develop' into feature/hlay_crt_decoder_only
* 2024-06-13  David Payne : As built CRT geometry, v1.1
* 2024-06-13  David Payne : To pick up geometry v02_01
* 2024-06-11  David Payne : As built CRT geometry, v1
* 2024-06-11  Henry Lay : Add south wall and correct mistakes in CRT channel map
* 2024-06-11  Henry Lay : Hide log statement behind debug flag and add further fcls
* 2024-06-05  Bear Carlson : Merge pull request #476 from SBNSoftware/feature/lynnt_pmt_decoder
* 2024-06-05  Bear Carlson : Merge branch 'develop' into feature/lynnt_pmt_decoder
* 2024-06-04  Bear Carlson : Merge pull request #468 from SBNSoftware/feature/mdeltutt_hp_physics_list
* 2024-06-04  Bear Carlson : Merge branch 'develop' into feature/mdeltutt_hp_physics_list
* 2024-06-04  Bear Carlson : Merge pull request #474 from SBNSoftware/feature/bearc_pmt_data
* 2024-06-04  Marco Del Tutto : Merge branch 'develop' into feature/mdeltutt_hp_physics_list
* 2024-05-31  lynnt20 : actually correct mapping....
* 2024-05-31  Brinden Carlson : Merge branch 'feature/bearc_pmt_data' of github.com:SBNSoftware/sbndcode into feature/bearc_pmt_data
* 2024-05-31  Brinden Carlson : refactored fcl to be cleaner
* 2024-05-29  Bear Carlson : Merge branch 'develop' into feature/bearc_pmt_data
* 2024-05-29  Brinden Carlson : add fcls tuned to pmt data
* 2024-05-28  Bear Carlson : Merge pull request #471 from SBNSoftware/fjnicolas-patch-2
* 2024-05-28  lynnt20 : update pmt decoder channel map
* 2024-05-21  Francisco Javier Nicolás-Arnaldos : Update SBNDPDSAnalyzer_module.hh
* 2024-05-21  Francisco Javier Nicolás-Arnaldos : Solve compiling errors in SBNDPDSAnalyzer with c14
* 2024-05-20  Henry Lay : Change in swapped FEBs
* 2024-05-20  Bear Carlson : Merge pull request #469 from SBNSoftware/bugfix/bearc_wc_simenergy_fix
* 2024-05-20  Bear Carlson : Merge branch 'develop' into bugfix/bearc_wc_simenergy_fix
* 2024-05-20  Henry Lay : Update channel map to add west wall
* 2024-05-20  Henry Lay : Add CRT decoder
* 2024-05-20  Henry Lay : Add first CRT channel map
* 2024-05-16  Brinden Carlson : Merge tag 'v09_90_00' into develop
* 2024-05-15  Bear Carlson : Update wcls-sim-drift-depoflux-nf-sp.jsonnet
* 2024-05-06  Marco Del Tutto : Merge branch 'develop' into feature/mdeltutt_hp_physics_list
* 2024-05-06  Marco Del Tutto : Use QGSP_BERT_HP physics list
* 2024-05-05  Francisco Javier Nicolás-Arnaldos : Merge branch 'develop' into dbrailsf_noicefclmate
* 2024-04-19  Dom Brailsford : typo
* 2024-04-19  Dom Brailsford : Use the upstream outputCommands list in the sequence (to pick up the keep command)
* 2024-04-19  Dom Brailsford : Add a keep command, as this can minimise boilerplate elsewhere
* 2024-04-19  Dom Brailsford : Set hit label for gaushittruthmatch HitAssociations
* 2024-04-19  Dom Brailsford : Update drops to drop ml and fasthit
* 2024-04-19  Dom Brailsford : Add cluster 3D for ML reco
* 2024-04-19  Dom Brailsford : Beat the fcl into submission so that it runs
* 2024-04-19  Dom Brailsford : Typos
* 2024-04-19  Dom Brailsford : If you @table when you should @local, you're gunna have a bad time
* 2024-04-19  Dom Brailsford : Missing header
* 2024-04-19  Dom Brailsford : Another header reorder
* 2024-04-19  Dom Brailsford : Missing truthmatching header
* 2024-04-19  Dom Brailsford : Reorder headers to make prologs continuous
* 2024-04-19  Dom Brailsford : Typo
* 2024-04-19  Dom Brailsford : Merge branch 'develop' into dbrailsf_noicefclmate
* 2024-03-11  Dom Brailsford : Redesign standard reco1 to incorporate the more modular construction of the workflow
* 2024-03-11  Dom Brailsford : Add label overrides
* 2024-03-11  Dom Brailsford : Typo
* 2024-03-11  Dom Brailsford : Missing keyword
* 2024-03-11  Dom Brailsford : Indentation fix
* 2024-03-11  Dom Brailsford : Add physics table set and fill in the basic stuff thats common to every job
* 2024-03-11  Dom Brailsford : Add CMake bits
* 2024-03-11  Dom Brailsford : define a drops fcl for reco1, which defines the list of producers to drop in the output
* 2024-03-11  Dom Brailsford : workflow fcl for reco1.  This fcl defines the producers and sequences for reco1 jobs
* 2024-03-11  Dom Brailsford : Add a generic job fcl that all sbnd jobs should inherit from
* 2024-03-11  Dom Brailsford : How does this still exist?
* 2024-03-11  Dom Brailsford : Another 3drift fcl
* 2024-03-11  Dom Brailsford : Remove workflows that drop opt0finder
* 2024-03-11  Dom Brailsford : Remove 3drift workflows (legacy/deprecated 3drift workflows have not been deleted)

sbndutil 
---------------------------------------------------

* 2024-08-05  Brinden Carlson : Merge tag 'v09_91_02' into develop
* 2024-08-05  Brinden Carlson : Merge branch 'release/v09_91_02'
* 2024-07-18  Brinden Carlson : Update to larsoft v09_91_02
* 2024-05-16  Brinden Carlson : Merge tag 'v09_90_00' into develop
