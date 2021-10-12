layout: page
title: ReleaseNotes092804
toc: true
---

-----------------------------------------------------------------------------
| v09.28.04 | 03 Sep 2021 | [ReleaseNotes](ReleaseNotes092804.html) |
| --- | --- | --- |



sbndcode v09_28_04 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_28_04](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_28_04/sbndcode-v09_28_04.html)

Purpose
---------------------------------------------------

* Weekly release

New features
---------------------------------------------------

* sbndcode PR 144:
  * Adding module for light signals deconvolution
  * This PR adds a new module that performs signals deconvolution for the PMTs
  * Details about the implementation in https://sbn-docdb.fnal.gov/cgi-bin/sso/ShowDocument?docid=22863 (docdb 22863).

* sbndcode PR 170:
  * Match resource ranges between quick and seq CI tests

* Added OpDetSim/digi_pmt_sbnd_v2int0.root to sbnd_data v01_08_00
  * contains aternative PMT single photon response

Bug fixes
---------------------------------------------------

* sbndcode PR 167:
  * Fix Issue 166: opDetDigitizer needs to accept multiple collections per direct/reflected light.

Updated dependencies
---------------------------------------------------

* sbncode v09_28_04
* larsoft v09_28_04

Change List
==========================================

sbndcode v09_28_04
---------------------------------------------------

* 2021-09-03  Patrick Green : Merge branch 'release/v09_28_04'
* 2021-09-03  Patrick Green : Update to v09_28_04
* 2021-09-03  Patrick Green : Merge remote-tracking branch 'remotes/origin/feature/wketchum_Issue166' into release/v09_28_04
* 2021-09-01  Patrick Green : Merge pull request #170 from SBNSoftware/feature/hlay_ci
* 2021-09-01  Henry Lay : Match resource ranges between quick and seq tests
* 2021-08-26  Wesley : updates to opDetDigitizerWorker to add photon collections together, coming from different collections
* 2021-08-24  Patrick Green : Merge pull request #144 from SBNSoftware/feature/fnicolas_opdecov2
* 2021-08-24  Patrick Green : Merge tag 'v09_28_02' into develop
* 2021-08-19  fran-nicar : Add configuration fcl that doesn't drop deco waveforms
* 2021-08-19  fran-nicar : Making OpDeconvolutionAlg an art tool
* 2021-08-18  fran-nicar : Pass argument by reference, logerror message and don't overwrite input waveform
* 2021-08-18  fran-nicar : Removing unused functions
* 2021-08-11  fran-nicar : Adding module for light signals deconvolution

sbndutil v09_28_04
---------------------------------------------------

* 2021-09-03  Patrick Green : Merge branch 'release/v09_28_04'
* 2021-09-03  Patrick Green : Update to v09_28_04
* 2021-08-24  Patrick Green : Merge tag 'v09_28_02' into develop
