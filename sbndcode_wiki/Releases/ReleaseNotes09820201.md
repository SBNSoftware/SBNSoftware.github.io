---
layout: page
title: ReleaseNotes09820201
toc: true
---

-----------------------------------------------------------------------------
| v09.82.02.01 | 30 Jan 2024 | [ReleaseNotes](ReleaseNotes09820201.html) |
| --- | --- | --- |



sbndcode v09_82_02_01 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_82_02_01](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_82_02_01/sbndcode-v09_82_02_01.html)

Purpose
---------------------------------------------------
Weekly release

New features
---------------------------------------------------
* SBNSoftware/sbndcode#402: Updated CRT reconstruction
  * See https://sbn-docdb.fnal.gov/cgi-bin/sso/RetrieveFile?docid=29115&filename=CRT_Clustering_Reconstruction_CM_Presentation.pdf&version=2 
* SBNSoftware/sbndcode#405: OpT0 CRUMBS
  * Adds OpT0 variables as an alternative flash matching input to the CRUMBS tool
* SBNSoftware/sbndcode#403: Razzled
  * Razzled is a new MVA PID based on using both the Razzle & Dazzle inputs to make a determination of the likely PID of a pandora PFParticle. 
* SBNSoftware/sbndcode#386: CNN scores with michel scores around pfp endpoints

Bug fixes
---------------------------------------------------
* SBNSoftware/sbndcode#404: Patch for SimpleFlash
  * Added check for empty OpHit array
  * Added Verbose fhicl parameter 

Updated dependencies
---------------------------------------------------
* sbncode v09_82_02_01
* larsoft v09_82_02
* sbnd_data v01_23_00
  * Includes updated weights for CRUMBS (with OpT0Finder variables+updated CRT reconstruction)
  * Includes weights for Razzled PID tool
  * Includes updated weights for Razzle and Dazzle PID tools (trained for WireCell workflow)

Change List
==========================================

sbndcode sbndcode
---------------------------------------------------

* 2024-01-30  Fran Nicolas : Merge branch 'release/v09_82_02_01'
* 2024-01-30  Fran Nicolas : Update to larsoft v09_82_02
* 2024-01-26  Francisco Javier Nicolás-Arnaldos : Merge pull request #386 from SBNSoftware/feature/munjung-cnn_hit_class_michel
* 2024-01-26  Francisco Javier Nicolás-Arnaldos : Merge branch 'develop' into feature/munjung-cnn_hit_class_michel
* 2024-01-26  Francisco Javier Nicolás-Arnaldos : Update cafmakerjob_sbnd.fcl
* 2024-01-26  Francisco Javier Nicolás-Arnaldos : Merge pull request #403 from SBNSoftware/feature/hlay_razzled_pr
* 2024-01-26  Henry Lay : Merge remote-tracking branch 'origin/develop' into feature/hlay_razzled_pr
* 2024-01-26  Francisco Javier Nicolás-Arnaldos : Merge pull request #405 from SBNSoftware/feature/hlay_crumbs_opt0
* 2024-01-25  Henry Lay : Bump sbnd_data
* 2024-01-25  Henry Lay : Merge branch 'feature/hlay_crumbs_opt0' of https://github.com/SBNSoftware/sbndcode into feature/hlay_crumbs_opt0
* 2024-01-24  Francisco Javier Nicolás-Arnaldos : Merge pull request #404 from SBNSoftware/feature/rdarby_fm_optemplate_hotfix
* 2024-01-23  Francisco Javier Nicolás-Arnaldos : Merge branch 'develop' into feature/hlay_crumbs_opt0
* 2024-01-23  Francisco Javier Nicolás-Arnaldos : Merge pull request #402 from SBNSoftware/feature/hlay_crt_clustering_base
* 2024-01-23  Henry Lay : Merge remote-tracking branch 'origin/feature/rdarby_fm_optemplate_hotfix' into feature/hlay_crumbs_opt0
* 2024-01-22  Henry Lay : SCE label for opt0 in CAFs
* 2024-01-22  Robert Darby : Verbose parameter
* 2024-01-18  Henry Lay : Add Razzled to fcls
* 2024-01-18  Francisco Javier Nicolás-Arnaldos : Merge branch 'develop' into feature/hlay_crt_clustering_base
* 2024-01-18  Fran Nicolas : Merge tag 'v09_82_01' into develop
* 2024-01-17  Francisco Javier Nicolás-Arnaldos : Merge branch 'develop' into feature/munjung-cnn_hit_class_michel
* 2024-01-17  Henry Lay : Merge branch 'develop' into feature/hlay_crt_clustering_base
* 2024-01-16  Henry Lay : More fcl updates to use modern workflow
* 2024-01-15  Henry Lay : Deactivate CRT unit test for now
* 2024-01-15  Henry Lay : Don't worry about deprecated fcls not working
* 2024-01-15  Henry Lay : Ensure compilation
* 2024-01-12  Henry Lay : Merge remote-tracking branch 'origin/develop' into feature/hlay_crt_clustering_base
* 2024-01-11  Henry Lay : Merge pull request #341 from SBNSoftware/feature/hlay_crt_clustering_spacepointreco
* 2024-01-11  Henry Lay : Merge branch 'feature/hlay_crt_clustering_base' into feature/hlay_crt_clustering_spacepointreco
* 2024-01-11  Henry Lay : Define in fcl
* 2024-01-11  Henry Lay : Remove fcl default
* 2024-01-11  Henry Lay : Merge pull request #340 from SBNSoftware/feature/hlay_crt_clustering_clusterreco
* 2024-01-11  Henry Lay : Merge branch 'feature/hlay_crt_clustering_base' into feature/hlay_crt_clustering_clusterreco
* 2024-01-11  Henry Lay : Merge pull request #339 from SBNSoftware/feature/hlay_crt_clustering_striphitreco
* 2024-01-11  Henry Lay : Merge branch 'feature/hlay_crt_clustering_base' into feature/hlay_crt_clustering_striphitreco
* 2024-01-11  Henry Lay : Merge pull request #344 from SBNSoftware/feature/hlay_crt_clustering_evd
* 2024-01-11  Henry Lay : Merge pull request #348 from SBNSoftware/feature/hlay_crt_clustering_backtracker
* 2024-01-11  Henry Lay : Merge pull request #347 from SBNSoftware/feature/hlay_crt_clustering_ana
* 2023-12-18  Henry Lay : Merge pull request #349 from SBNSoftware/feature/hlay_crt_clustering_tof
* 2023-12-18  Henry Lay : Merge pull request #346 from SBNSoftware/feature/hlay_crt_clustering_fcls
* 2023-12-18  Henry Lay : Merge pull request #345 from SBNSoftware/feature/hlay_crt_clustering_commissioning
* 2023-12-18  Henry Lay : Merge pull request #338 from SBNSoftware/feature/hlay_crt_clustering_utils
* 2023-12-18  Henry Lay : Merge pull request #337 from SBNSoftware/feature/hlay_crt_clustering_simulation
* 2023-12-18  Henry Lay : Merge pull request #336 from SBNSoftware/feature/hlay_crt_clustering_geom
* 2023-12-18  Henry Lay : Merge pull request #335 from SBNSoftware/feature/hlay_crt_clustering_structure
* 2023-10-31  mstancar : Merge pull request #342 from SBNSoftware/feature/hlay_crt_clustering_trackreco
* 2023-10-31  mstancar : Merge pull request #343 from SBNSoftware/feature/hlay_crt_clustering_tpcmatching
* 2023-09-17  Mun Jung Jung : cnnscore in sbnd fcls
* 2023-04-28  Henry Lay : Remove unnecessary library naming
* 2023-04-28  Henry Lay : Remove unnecessary library naming
* 2023-04-28  Henry Lay : Remove unnecessary library naming
* 2023-04-28  Henry Lay : Remove unnecessary library naming
* 2023-04-28  Henry Lay : Remove unnecessary library naming
* 2023-04-28  Henry Lay : Remove unnecessary library naming
* 2023-04-26  Henry Lay : CRT only reco & ana fcls
* 2023-04-26  Henry Lay : Update CRT detector simulation
* 2023-04-26  Henry Lay : Remove older track reco remnants
* 2023-04-26  Henry Lay : Remove older matching
* 2023-04-26  Henry Lay : Remove old hit reco
* 2023-04-26  Henry Lay : Useful fcl for keeping cosmic trajectories
* 2023-04-26  Henry Lay : Add CRT only fcls for g4 & detsim
* 2023-04-26  Henry Lay : Add new CRT sim / reco to standard fcls
* 2023-04-26  Henry Lay : Update utility files
* 2023-04-26  Henry Lay : Update trigger modules to use updated helpers
* 2023-04-26  Henry Lay : Updates to make ToF modules work with new CRT reco
* 2023-04-26  Henry Lay : Signficant updates to geometry helper function
* 2023-04-26  Henry Lay : Update libraries for filters
* 2023-04-26  Henry Lay : Update hit dumper
* 2023-04-26  Henry Lay : Update TPC matching
* 2023-04-26  Henry Lay : Add fcls
* 2023-04-26  Henry Lay : Add fcls
* 2023-04-26  Henry Lay : Add fcls
* 2023-04-26  Henry Lay : Add fcls
* 2023-04-26  Henry Lay : Add track reconstruction
* 2023-04-26  Henry Lay : Add space point reconstruction
* 2023-04-26  Henry Lay : Add cluster reconstruction
* 2023-04-26  Henry Lay : Add strip hit reconstruction
* 2023-04-26  Henry Lay : Add event display algorithm and module
* 2023-04-26  Henry Lay : Add back tracking algorithm
* 2023-04-26  Henry Lay : New analysis module
* 2023-04-26  Henry Lay : Create new structure
* 2023-04-26  Henry Lay : Remove CosmicID algs from compile

sbndutil
---------------------------------------------------

* 2024-01-30  Fran Nicolas : Merge tag 'v09_82_02_01' into develop
* 2024-01-30  Fran Nicolas : Merge branch 'release/v09_82_02_01'
* 2024-01-30  Fran Nicolas : Update to larsoft v09_82_02
* 2024-01-18  Fran Nicolas : Merge tag 'v09_82_01' into develop

Additional comments
---------------------------------------------------
This should be called Henry's release given the insane amount of nice additions he has put in :)
