--
layout: page
title: ReleaseNotes091900
toc: true
---

-----------------------------------------------------------------------------
| v09.19.00 | 26 Mar 2021 | [ReleaseNotes](ReleaseNotes091900.html) |
| --- | --- | --- |



sbndcode v09_19_00 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_19_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_19_00/sbndcode-v09_19_00.html)

Purpose
---------------------------------------------------

* Weekly Release

New features
---------------------------------------------------

* sbndcode PR 88:
  * updated semi-analytic light simulation parameters to include wire shadowing
  * added PDFastSim configuration fhicl for refactored LArG4

* sbndcode PR 92:
  * updated the Pandora config xml to remove a flag causing erroneous ZeroMode config in first cluster characterisation

* sbndcode PR 93:
  * fixed optrigger alg to produce uniformly-sized waveforms + and set readout length to 12us
  * fixed bug causing the ARAPUCAs to use the PMTs’ threshold, that was resulting in them triggering on noise
  * cleaned up various parts of the code

* sbndutil PR 5:
  * production scripts for flattening and concatenating CAFs

* sbndutil PR 6:
  * update experiment_utilities.py to use FileCatalogMetadataSBN when adding metadata configurations to fcl files

Bug fixes
---------------------------------------------------

Updated dependencies
---------------------------------------------------

* sbncode v09_19_00
* larsoft v09_19_00

Change List
==========================================

sbndcode v09_19_00
---------------------------------------------------

* 2021-03-26  Patrick Green : Merge branch 'release/v09_19_00'
* 2021-03-26  Patrick Green : Update to larsoft v09_19_00
* 2021-03-26  Patrick Green : Merge pull request #88 from pgreen135/feature/pgreen_wiresParameterisations
* 2021-03-25  Patrick Green : Merge pull request #93 from wforeman/feature/wforeman_optrig
* 2021-03-24  Will Foreman : Fixed typo in pmt_uncoated and simplified the check for if the PD is ARAPUCA
* 2021-03-24  Will Foreman : Fixed optrigger alg to produce uniformly-sized waveforms, cleaned up a few snippets, and set readout length to 12us
* 2021-03-23  Patrick Green : Merge pull request #92 from SBNSoftware/feature/hlay_reco_xml_fix
* 2021-03-23  Patrick Green : Merge tag 'v09_18_00_02' into develop
* 2021-03-22  Henry Lay : Remove erronous ZeroMode in first cluster characterisation
* 2021-03-12  Patrick Green : Modified VUV parameters to resolve interpolation issue identified during testing.
* 2021-03-02  Patrick Green : Added PDFastSim configuration fhicl to be compatible with updates in PDFastSimPAR module
* 2021-03-02  Patrick Green : Updated semi-analytic light simulation parameters to include wire shadowing

sbndutil v09_19_00
---------------------------------------------------

* 2021-03-26  Patrick Green : Merge branch 'release/v09_19_00'
* 2021-03-26  Patrick Green : Update to larsoft v09_19_00
* 2021-03-25  Patrick Green : Merge pull request #5 from SBNSoftware/feature/etyley_cafmetadata
* 2021-03-25  Patrick Green : Merge pull request #6 from SBNSoftware/feature/hlay_metadata_change
* 2021-03-25  Henry Lay : Update to SBN metadata
* 2021-03-25  Edward Tyley : Better parsing of arguments
* 2021-03-25  Edward Tyley : Add Chris' suggestions to bash and samweb improvements
* 2021-03-25  Christopher Backhouse : Additional typo fixes
* 2021-03-25  Christopher Backhouse : Fix name of script
* 2021-03-25  Christopher Backhouse : Fix a bunch of typos in printouts and comments
* 2021-03-25  Edward Tyley : First commit of script to cancatinate and flatten CAFs
* 2021-03-25  Edward Tyley : Use sed to append metadata json files so that it can run on files stored on dCache
* 2021-03-23  Patrick Green : Merge tag 'v09_18_00_02' into develop
