---
layout: page
title: ReleaseNotes090800
toc: true
---

-----------------------------------------------------------------------------
| v09.08.00 | 26 Oct 2020 | [ReleaseNotes](ReleaseNotes090800.html) |
| --- | --- | --- |



sbndcode v09_08_00 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_08_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_08_00/sbndcode-v09_08_00.html)

Purpose
---------------------------------------------------

* Weekly release
* Designed to be baseline release for production SBN-2020A.
New features
---------------------------------------------------

Bug fixes(Bug-fixes)
---------------------------------------------------

Updated dependencies
---------------------------------------------------

* sbncode v09_08_00
* [larsoft v09_08_00](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/ReleaseNotes090800)

Change List
==========================================

sbndcode v09_08_00
---------------------------------------------------

* 2020-10-26  Andrew Scarff : Merge branch 'release/v09_08_00'
* 2020-10-26  Andrew Scarff : Update to larsoft v09_08_00
* 2020-10-26  Andrew Scarff : Merge pull request #45 from SBNSoftware/mdeltutt_opt0finder
* 2020-10-22  Marco Del Tutto : Fix conflicts, improve names
* 2020-10-21  Andrew Scarff : Merge tag 'v09_07_00' into develop
* 2020-10-15  Marco Del Tutto : Merge branch 'develop' into mdeltutt_opt0finder
* 2020-10-15  Marco Del Tutto : Adding opt0finder to reco2_sce.fcl, and also creating reco2_sce_noflashmatch.fcl, which is the same as reco2_sce.fcl, but does not \
include opt0finder.
* 2020-10-15  Marco Del Tutto : Fix typo
* 2020-10-14  Marco Del Tutto : Turning off the debug printout
* 2020-10-14  Marco Del Tutto : Adding a reco1 and a reco2reco2 fcl that run the usual reconstruction chain without the flashmatching.
* 2020-10-14  Marco Del Tutto : Adding opt0finder (flashmatching) to the default reco processing chain
* 2020-10-14  Marco Del Tutto : Comment out the service for the optical library
* 2020-10-14  Marco Del Tutto : Change some of the LogInfo to LogWarning
* 2020-10-12  Marco Del Tutto : Clean up
* 2020-10-12  Marco Del Tutto : Add a very simple SBNDOpT0FinderAna module to show how to retrive the flash matching results.
* 2020-10-12  Marco Del Tutto : Adding README.md
* 2020-10-12  Marco Del Tutto : Clean up
* 2020-10-11  Marco Del Tutto : Moving flashmatchalg.fcl (flash matching configuration file from sbndcode to sbncode).
* 2020-10-11  Marco Del Tutto : Clean up flashmatch configuration file.
* 2020-10-11  Marco Del Tutto : Remove outdated parameters
* 2020-10-11  Marco Del Tutto : OpT0Finder now runs matching in both TPCs
* 2020-10-10  Marco Del Tutto : Removing singleton implementation QLLMatch so we can run two instances of the matching with two different configurations.
* 2020-10-10  Marco Del Tutto : Add both tpc 0 and 1 to fcl config
* 2020-10-10  Marco Del Tutto : Fix init of _charge_to_n_photons_shower
* 2020-10-10  Marco Del Tutto : Fix sbndcode and sbncode names in CMakelists and includes
* 2020-10-10  Marco Del Tutto : Change sbndcode to sbncode in CMakelists and includes
* 2020-10-10  Marco Del Tutto : Moving OpT0Finder from sbndcode to sbncode
* 2020-10-10  Marco Del Tutto : Fix pds map pointer
* 2020-10-10  Marco Del Tutto : Merge branch 'Release2020A_00' into mdeltutt_opt0finder
* 2020-10-10  Marco Del Tutto : Add pds map tool
* 2020-10-09  Marco Del Tutto : Merge branch 'develop' into mdeltutt_opt0finder
* 2020-10-09  Marco Del Tutto : Flash matching now runs
* 2020-10-09  Marco Del Tutto : Use analytical method for sbnd
* 2020-10-09  Marco Del Tutto : Add addtional product classes
* 2020-10-05  Marco Del Tutto : Fix typo
* 2020-10-05  Marco Del Tutto : add matching result tree to output
* 2020-10-05  Marco Del Tutto : Add (cryo, tpc) selection at input
* 2020-10-05  Marco Del Tutto : Add reflected light to hypo construction
* 2020-10-05  Marco Del Tutto : Clean up
* 2020-10-05  Marco Del Tutto : Make sure the fmwk interface knows about the number of opdets
* 2020-10-05  Marco Del Tutto : Removing old ccv factors
* 2020-10-05  Marco Del Tutto : Adding back NPt filter algos
* 2020-10-05  Marco Del Tutto : This commit adds an initial opt0finder flash matching code to sbndcode

sbndutil v09_08_00
---------------------------------------------------

* 2020-10-26  Andrew Scarff : Merge branch 'release/v09_08_00'
* 2020-10-26  Andrew Scarff : Update to larsoft v09_08_00
* 2020-10-21  Andrew Scarff : Merge tag 'v09_07_00' into develop

