---
layout: page
title: ReleaseNotes093600
toc: true
---

-----------------------------------------------------------------------------
| v09.36.00 | 12 Nov 2021 | [ReleaseNotes](ReleaseNotes093600.html) |
| --- | --- | --- |



sbndcode v09_36_00 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_36_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_36_00/sbndcode-v09_36_00.html)

Purpose
---------------------------------------------------

* Weekly release

New features
---------------------------------------------------

* sbndcode #172:
  * Create fcl_checks test for the ci
  * Have created a ci_test that performs a standard set of checks on fcl files:
  * Firstly, it checks that the fcl can be parsed (when fully expanded)
  * Secondly, it compares the output of a fhicl-dump to a reference version

* sbndcode #203
  * GENIE Rockbox Dirt Workflow
  * This PR adds fcls and filters required to generate dirt interactions using the GENIEHelper RockBox configuration, fixing #176.

* sbndcode #204:
  * Set SimChannel module as simdrift in main backtracker service settings
  * Setting this in the main inherited "sbnd_backtrackerservice" parameters, so individual modules don't have to worry about setting it.

* sbndcode #206:
  * Drop SimEnergyDeposits made by LArG4 in standard g4 workflow
  * Fixes SBNSoftware/sbncode#185

* sbndutil #7:
  * Don't set environment variables EXPERIMENT, SAM_EXPERIMENT, and JOBSUB_GROUP

Bug fixes
---------------------------------------------------

* sbndcode #208:
  * Correct fcl path for fhicl CI tests

* sbndcode #209:
  * Turn off genie random seed flag
  * This PR solves #130 which has been a persistent issue with the CI.
  * I did some further debugging on this today with the idea of opening a larsoft level issue. I established that alongside the original noted issue: the occasional occurrence of pileup events (visible in the CI output as a difference in the number of MCTruth) There is also a more deep level random seed issue: the generated single event (even when the pileup doesn't occur) is non-identical (different energies & positions). I found a section of GENIEHelper that uses a fcl flag UseHelperRndGen4GENIE which is set to true by default. This parameter is meant to avoid issues with the random seed by storing it to re-initialise with a few lines later, however by deactivating it both seeding issues are solved and the CI produces the same event every time (I ran 20 iterations).

* sbndcode #210:
  * Update INPUT_STREAM for fcl_checks regression tests
  * This PR has a fix for fcl_checks configuration in ci_tests.cfg

* sbndcode #211:
  * Utilise vtx histogram range parameter #211
  * While creating #209 I was using the the hist_ files produced in GENIEGen. I realised that for SBND this uses a vertex position range that assumes a totally positive x detector. Using this parameter ensures that the plots of the vertices x position include both TPCs not just the positive x one

Updated dependencies
---------------------------------------------------

* sbncode v09_26_00_01
* larsoft v09_26_00

Change List
==========================================

sbndcode
---------------------------------------------------

* 2021-11-12  Patrick Green : Merge branch 'release/v09_36_00'
* 2021-11-12  Patrick Green : Update to v09_36_00
* 2021-11-10  Patrick Green : Merge pull request #203 from SBNSoftware/feature/etyley_dirt
* 2021-11-10  Edward Tyley : Drop more products in dirt workflow inkeeping with PR 206
* 2021-11-09  Patrick Green : Merge pull request #209 from SBNSoftware/bugfix/hlay_genie_random_seeding
* 2021-11-09  Patrick Green : Merge pull request #206 from SBNSoftware/mdeltutt_sbncode_issue185
* 2021-11-09  Patrick Green : Merge pull request #210 from SBNSoftware/feature/vito_update_ci_tests_cfg
* 2021-11-09  Patrick Green : Merge pull request #211 from SBNSoftware/feature/hlay_genie_gen_vtx_hists_range
* 2021-11-08  Vito Di Benedetto : Update INPUT_STREAM for fcl_checks regression tests
* 2021-11-08  Henry Lay : Utilise vtx histogram range parameter
* 2021-11-08  Henry Lay : Turn off genie random seed flag
* 2021-11-08  Patrick Green : Merge pull request #208 from SBNSoftware/feature/hlay_ci_fcl_checks
* 2021-11-08  Henry Lay : Correct fcl path
* 2021-11-08  Patrick Green : Merge pull request #172 from SBNSoftware/feature/hlay_ci_fcl_checks
* 2021-11-08  Henry Lay : Update fcl_file_checks.list
* 2021-11-08  Patrick Green : Merge pull request #204 from wforeman/develop
* 2021-11-08  Henry Lay : Tiny tidy
* 2021-11-05  Vito Di Benedetto : cosmetic change
* 2021-11-05  Vito Di Benedetto : Configure fcl_checks test to let CI mechanism to handle reference files
* 2021-11-05  Marco Del Tutto : Drop the SimEnergyDeposits made by LArG4 in standard g4 workflow
* 2021-11-05  Edward Tyley : Update split_tpc_nu output patterns to retain the input file names
* 2021-11-05  Edward Tyley : Add sce version of dirt g4 fcls
* 2021-11-05  Edward Tyley : Move splitting dirt/tpc output to dedicated fcl that can be run after any previous dirt fcl
* 2021-11-05  Edward Tyley : Update path of GENIE rockbox max path length
* 2021-11-05  Edward Tyley : Update SimEnergyDep Filter
* 2021-10-28  Edward Tyley : Tidy rockbox fcls
* 2021-10-28  Edward Tyley : Tidy merge sim sources fcls for dirt overlay samples
* 2021-10-28  Edward Tyley : Add comments to rockbox overlay fcls
* 2021-10-27  Edward Tyley : First commit of working prodoverlay rockbox workflow
* 2021-10-27  Edward Tyley : Update filters for rockbox
* 2021-10-20  Edward Tyley : Create split output rockbox fcl
* 2021-10-20  Edward Tyley : First commit of GENIE rockbox fcls for simulating dirt
* 2021-11-05  Patrick Green : Merge tag 'v09_35_01' into develop
* 2021-11-05  Henry Lay : Make the output file easier to parse
* 2021-11-04  Henry Lay : Correct access to references
* 2021-11-04  Henry Lay : Small corrections
* 2021-11-04  Henry Lay : Ensure sensible structure within tar
* 2021-11-04  Henry Lay : Update to use tarball
* 2021-11-04  Henry Lay : Merge branch develop into feature/hlay_ci_fcl_checks
* 2021-11-03  Will Foreman : Set SimChannel module as simdrift in main backtracker service settings
* 2021-09-20  Henry Lay : Add check for existence of reference
* 2021-09-20  Henry Lay : Change list of fcl files checked
* 2021-09-01  Henry Lay : Fix indentation
* 2021-08-02  Henry Lay : Create fcl_checks test for the ci

sbndutil
---------------------------------------------------

* 2021-11-12  Patrick Green : Merge tag 'v09_36_00' into develop
* 2021-11-12  Patrick Green : Merge branch 'release/v09_36_00'
* 2021-11-12  Patrick Green : Update to v09_36_00
* 2021-11-12  Patrick Green : Merge pull request #7 from hgreenlee/greenlee_table_file
* 2021-11-09  Herbert Greenlee : Don't set environment variables EXPERIMENT, SAM_EXPERIMENT, and JOBSUB_GROUP.
* 2021-11-05  Patrick Green : Merge tag 'v09_35_01' into develop
