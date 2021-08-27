---
layout: page
title: ReleaseNotes0928010101
toc: true
---

-----------------------------------------------------------------------------
| v09.28.01.01.01 | 27 Aug 2021 | [ReleaseNotes](ReleaseNotes0928010101.html) |
| --- | --- | --- |



sbndcode v09_28_01_01_01 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_28_01_01_01](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_28_01_01_01/sbndcode-v09_28_01_01_01.html)

Purpose
---------------------------------------------------

* Patch release for SBN-2021B

New features
---------------------------------------------------

* sbndcode PR 144:
  * Adding module for light signals deconvolution #144
  * This PR adds a new module that performs signals deconvolution for the PMTs
  * Details about the implementation in https://sbn-docdb.fnal.gov/cgi-bin/sso/ShowDocument?docid=22863 (docdb 22863).

Bug fixes
---------------------------------------------------

* sbndcode PR 167:
  * Fix Issue 166: opDetDigitizer needs to accept multiple collections per direct/reflected light.

* sbndcode PR 168:
  * removing mcreco due to LArG4 empty trajectory bug
  * MCReco causes SegFault errors due to a bug in LArG4 that creates copies of MCParticles with no trajectory points
  * This is a hotfix for issue #165 but does not fix it
  * There is an open larsoft issue here: https://cdcvs.fnal.gov/redmine/issues/26197

Updated dependencies
---------------------------------------------------

Change List
==========================================

sbndcode v09_28_01_01_01
---------------------------------------------------

* 2021-08-27  Patrick Green : Update to v09_28_01_01_01
* 2021-08-27  Patrick Green : Merge remote-tracking branch 'remotes/origin/feature/fnicolas_opdecov2' into release/SBN2021B
* 2021-08-27  Patrick Green : Merge pull request #168 from SBNSoftware/feature/jzennamo_DisableMCReco
* 2021-08-27  Patrick Green : Merge pull request #167 from SBNSoftware/feature/wketchum_Issue166
* 2021-08-26  Wesley : updates to opDetDigitizerWorker to add photon collections together, coming from different collections
* 2021-08-26  Joseph Zennamo : removing mcreco due to LArG4 empty trajectory bug
* 2021-08-24  Patrick Green : Update ci_tests.cfg
* 2021-08-19  fran-nicar : Add configuration fcl that doesn't drop deco waveforms
* 2021-08-19  fran-nicar : Making OpDeconvolutionAlg an art tool
* 2021-08-18  fran-nicar : Pass argument by reference, logerror message and don't overwrite input waveform
* 2021-08-18  fran-nicar : Removing unused functions
* 2021-08-11  fran-nicar : Adding module for light signals deconvolution

sbndutil v09_28_01
---------------------------------------------------
