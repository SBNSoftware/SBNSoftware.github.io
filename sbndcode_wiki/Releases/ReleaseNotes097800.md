---
layout: page
title: ReleaseNotes097800
toc: true
---

-----------------------------------------------------------------------------
| v09.78.00 | 15 Aug 2023 | [ReleaseNotes](ReleaseNotes097800.html) |
| --- | --- | --- |



sbndcode v09_78_00 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_78_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_78_00/sbndcode-v09_78_00.html)

Purpose
---------------------------------------------------
Weekly release

New features
---------------------------------------------------
* SBNSoftware/sbndcode#361: SBND OpT0Finder Updates
  * turning off Minuit minimization. This version of OpT0Finder in SBND is optimized only for one-to-many matching (one flash to many slices).
  * usinganab::Calorimetry objects for track spacepoint conversion (charge-to-light)
  * tuned shower constant conversion (charge-to-light)
  * Masking is now on a match-specific basis instead of an entire event basis; masks are set for each flash and each slice, so the mask for the match is a combination of the flash-mask and slice-mask.
  * added function to use XARAPUCA flashes (default is PMT only)
  * default scoring method is to use normalized chi-squared mode
 

Bug fixes
---------------------------------------------------

Updated dependencies
---------------------------------------------------
* sbncode v09_78_00
* larsoft v09_78_00

Change List
==========================================

sbndcode sbndcode
---------------------------------------------------

* 2023-08-15  Fran Nicolas : Merge branch 'release/v09_78_00'
* 2023-08-15  Fran Nicolas : Update to larsoft v09_78_00
* 2023-08-09  Francisco Javier Nicolás-Arnaldos : Merge pull request #361 from SBNSoftware/feature/lynnt_pdssim_opt0finder
* 2023-08-08  lynnt-uchicago : fix how we specify channel masks
* 2023-08-08  lynnt-uchicago : Merge tag 'v09_75_03_02' into feature/lynnt_pdssim_opt0finder
* 2023-08-04  Fran Nicolas : Merge tag 'v09_77_00' into develop
* 2023-07-14  lynnt-uchicago : set correct defaults in opt0finder_sbnd.fcl
* 2023-07-14  lynnt-uchicago : update producer names for opt0SCE in reco base
* 2023-07-11  lynnt-uchicago : added tpc (slice) and pds (flash) specific masks
* 2023-07-07  lynnt-uchicago : Merge branch 'feature/lynnt_pdssim_opt0finder' of https://github.com/SBNSoftware/sbndcode into feature/lynnt_pdssim_opt0finder
* 2023-07-07  lynnt-uchicago : clean up code for using xARAPUCAs
* 2023-07-03  Miquel Nebot : Merge branch 'develop' into feature/lynnt_pdssim_opt0finder
* 2023-06-29  lynnt-uchicago : change name of efficiency fcl parameter to match sbncode
* 2023-06-20  lynnt-uchicago : new pmt sim updates, updated fcl parameters, TTree structure update
* 2023-06-05  lynnt-uchicago : Merge branch 'feature/lynnt_opt0finder' into feature/lynnt_pdssim_opt0finder
* 2023-04-19  lynnt-uchicago : update opt0finder object implementation - add default fcl parameters into run fcl
* 2023-04-19  lynnt-uchicago : fcl to skip opdets, first commit with OpT0Finder object - new fcl that can specify the channel numbers of opdets to skip (automatically adds to mask). currently has APSIA channels - change from `anab::T0` objects to `sbn::OpT0Finder` - clean up comments
* 2023-03-29  lynnt-uchicago : update fcls, add apsia channels to mask, clean up
* 2023-03-01  lynnt-uchicago : Merge tag 'v09_67_00' into feature/lynnt_opt0finder
* 2023-03-01  lynnt-uchicago : remove hardcoded parameters, clean up fcls, add mask
* 2023-02-13  lynnt-uchicago : add block if arapuca+pmt flashes aren't matched
* 2023-01-19  lynnt-uchicago : first attempt at fixing exiting particles
* 2023-01-18  lynnt-uchicago : add option to use PMT+XARAPUCA OpFlashes
* 2022-12-15  lynnt-uchicago : fix calo plane, collection or best plane option
* 2022-11-29  lynnt-uchicago : change shw label to ShowerSBN, add CalAreaConst
* 2022-11-29  lynnt-uchicago : attempt to use avg E per step for showers
* 2022-11-21  lynnt-uchicago : intermediate commit to include truth + calo hit debugging
* 2022-11-17  lynnt-uchicago : changed charge limit to dQdx limit, moved lifetime corr
* 2022-11-04  lynnt-uchicago : implemented cuts on dQ/pitch values from calo obj
* 2022-10-31  lynnt-uchicago : more output tree branches + nphoton limit
* 2022-10-14  lynnt-uchicago : first commit of calo object impelementation
* 2022-10-13  lynnt-uchicago : added calibration constant as fcl and commented out old QL conversion
* 2022-10-03  lynnt-uchicago : add trk object to QCluster, a few more branches into tree
* 2022-09-26  lynnt-uchicago : comment out std::couts
* 2022-09-20  lynnt-uchicago : changed OpT0 fcl process name (to not clash with opflashes)
* 2022-09-20  lynnt-uchicago : nuselect, recombination calc, additional branches

sbndutil
---------------------------------------------------

* 2023-08-15  Fran Nicolas : Merge tag 'v09_78_00' into develop
* 2023-08-15  Fran Nicolas : Merge branch 'release/v09_78_00'
* 2023-08-15  Fran Nicolas : Update to larsoft v09_78_00
* 2023-08-04  Fran Nicolas : Merge tag 'v09_77_00' into develop
