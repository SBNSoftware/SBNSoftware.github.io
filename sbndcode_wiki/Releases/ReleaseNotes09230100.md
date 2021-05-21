---
layout: page
title: ReleaseNotes09230100
toc: true
---

-----------------------------------------------------------------------------
| v09.23.01.00 | 21 May 2021 | [ReleaseNotes](ReleaseNotes09230100.html) |
| --- | --- | --- |



sbndcode v09_23_01_00 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_23_01_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_23_01_00/sbndcode-v09_23_01_00.html)

Purpose
---------------------------------------------------

* Weekly release

New features
---------------------------------------------------

* sbndcode PR 105:
  * Add facility to deaden readout channels (and kill some of the channels that are unphysical)
  * I've opted to kill the channels when the detector response is being run so that the sim channels remain intact.
  * I've also deadened some unphysical channels.
  * See this docdb entry for more information: https://sbn-docdb.fnal.gov/cgi-bin/sso/ShowDocument?docid=21576

Bug fixes
---------------------------------------------------

Updated dependencies
---------------------------------------------------

* sbncode v09_23_01_00
* larsoft v09_23_01

Change List
==========================================

sbndcode v09_23_01_00
---------------------------------------------------

* 2021-05-21  Patrick Green : Merge branch 'release/v09_23_01_00'
* 2021-05-21  Patrick Green : Update to v09_23_01_00
* 2021-05-21  Patrick Green : Merge pull request #105 from SBNSoftware/jumperedtpc
* 2021-05-17  Patrick Green : Merge tag 'v09_22_03_01' into develop
* 2021-05-11  Dom Brailsford : Merge branch 'develop' into jumperedtpc
* 2021-03-05  Dom Brailsford : Fix labels in typos. Update the entries in the lists to correspond to the actually missing channels. Include new labels for the missing channels where the combs should be.
* 2021-03-05  Dom Brailsford : Use the bad channel sequences from badchannels_sbnd.fcl
* 2021-03-05  Dom Brailsford : FCL to record which channel numbers are deemed bad.  I figured an extra fcl dedicated to listing bad channels will keep things more organised.
* 2021-03-05  Dom Brailsford : Only simulate the response for channels not flagged as 'bad', according to the channel status service

sbndutil v09_23_01_00
---------------------------------------------------

* 2021-05-21  Patrick Green : Merge branch 'release/v09_23_01_00'
* 2021-05-21  Patrick Green : Update to v09_23_01_00
* 2021-05-17  Patrick Green : Merge tag 'v09_22_03_01' into develop
