---
layout: page
title: ReleaseNotes094600
toc: true
---

-----------------------------------------------------------------------------
| v09.46.00 | 22 Mar 2022 | [ReleaseNotes](ReleaseNotes094600.html) |
| --- | --- | --- |



sbndcode v09_46_00 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_46_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_46_00/sbndcode-v09_46_00.html)

Purpose
---------------------------------------------------

* Weekly release

New features
---------------------------------------------------

* sbndcode PR 265: 
  * adds PMT software trigger module and fragment producer
  * updates to the whole PMT trigger simulation chain, see DocDb 25200 
  * requires SBNSoftware/sbnobj#48

Bug fixes
---------------------------------------------------

* sbndcode PR 256:   
  * CRT Geometry Mapping BugFix 
  * When we adopted geometry v02_00 we inverted how the x & y dimensions are defined for CRT strips and modules. This caused some issues with the CRT reconstruction which made assumptions about the directions of quantities like width and height.
  * This makes the changes to fix the reconstruction. I have also taken the time to check all other uses of CRTGeoAlg to ensure it is correct in other places, in doing this I found lots of unused functions have removed them.

* sbndcode PR 263: 	
  * Change EnergyCut from 1e-5 to 1e-2
  * Geant understands the energy cut value in MeV, so this should be 1e-2 MeV = 10 keV, and not 1e-5 MeV, as shown in issue: #261.

Updated dependencies
---------------------------------------------------

* sbncode v09_46_00
* larsoft v09_46_00

Change List
==========================================

sbndcode
---------------------------------------------------

* 2022-03-22  Patrick Green : Merge branch 'release/v09_46_00'
* 2022-03-22  Patrick Green : Update to v09_46_00
* 2022-03-22  Patrick Green : Merge remote-tracking branch 'remotes/origin/feature/marcodeltutto-patch-1' into release/v09_46_00
* 2022-03-22  Patrick Green : Merge remote-tracking branch 'remotes/origin/feature/hlay_crt_reco_changes_release_SBN2021C' into release/v09_46_00
* 2022-03-18  Patrick Green : Merge pull request #265 from SBNSoftware/feature/lynnt_pmt_trig
* 2022-03-17  lynnt-uchicago : fixed fcl variable bug
* 2022-03-16  lynnt-uchicago : cleaned up comments
* 2022-03-16  lynnt-uchicago : cleaned up metrics, added comments
* 2022-03-11  Patrick Green : Merge tag 'v09_45_00' into develop
* 2022-03-11  Marco Del Tutto : Change EnergyCut from 1e-5 to 1e-2
* 2022-03-10  lynnt-uchicago : added quick PE calculation and hitdumper branches
* 2022-03-03  lynnt-uchicago : added channel mapping and calculated PE
* 2022-03-03  lynnt-uchicago : cleaned baseline/pulse algo, added wvfm histos
* 2022-03-03  lynnt-uchicago : changed min/max start/end times to 1510 us
* 2022-03-01  lynnt-uchicago : changed hardcoded times to MaxEndTime and MinStartTime
* 2022-02-28  lynnt-uchicago : merge
* 2022-02-28  lynnt-uchicago : Merge remote-tracking branch
* 2022-02-28  lynnt-uchicago : Merge branch 'develop' into feature/lynnt_pmt_trig
* 2022-02-28  lynnt-uchicago : intermediate debugging stage + added fcl
* 2022-02-28  Patrick Green : tidying up fhicls etc.
* 2022-02-25  Patrick Green : allow for case where no trigger in time with beam
* 2022-02-25  Patrick Green : Extending maximum waveform length
* 2022-02-24  lynnt-uchicago : added baseline
* 2022-02-24  lynnt-uchicago : Merge remote-tracking branch 'origin/feature/pgreen_artdaq_fragment_conversion' into feature/lynnt_pmt_trig
* 2022-02-23  lynnt-uchicago : Merge remote-tracking branch 'origin/feature/eyandel_pmttrigger_fullwaveforms' into feature/lynnt_pmt_trig
* 2022-02-23  lynnt-uchicago : fixed window, deleted comment
* 2022-02-23  lynnt-uchicago : Merge branch 'develop' into feature/lynnt_pmt_trig
* 2022-02-23  lynnt-uchicago : Merge branch 'feature/lynnt_pmt_trig' of https://github.com/SBNSoftware/sbndcode into feature/lynnt_pmt_trig
* 2022-02-23  lynnt-uchicago : comment, change default windowEnd to 1.8
* 2022-02-23  eyandel : change hardcoded waveform size to instead encompass full waveform size needed for event, add in Verbose fhicl option to turn off cout statements
* 2022-02-22  Patrick Green : Merge branch 'develop' into feature/pgreen_artdaq_fragment_conversion
* 2022-02-22  Patrick Green : Merge branch 'develop' into feature/pgreen_artdaq_fragment_conversion
* 2022-02-22  Patrick Green : Turning hard-coded values into fhicl parameters + cleanup
* 2022-02-21  Patrick Green : Added check for beam window
* 2022-02-18  Patrick Green : Created PMT software trigger producer module
* 2022-02-16  Patrick Green : Cleaned up and added timestamps to the PMT artdaq fragments
* 2022-02-15  Patrick Green : Created PMT Artdaq Fragment producer module
* 2022-02-11  Henry Lay : Add comments
* 2022-02-01  Henry Lay : Update DetSimAna module for new namings
* 2022-02-01  Henry Lay : Return functions
* 2022-01-31  Henry Lay : Remove unused functions
* 2022-01-31  Henry Lay : Improve boolean logic
* 2022-01-31  Henry Lay : Improve boolean logic
* 2022-01-31  Henry Lay : Amend CRTGeoAlg to cope with change of coordinate system
* 2022-01-27  Henry Lay : Delete unused functions
* 2022-01-26  Patrick Green : Update to v09_37_01_03p01
* 2022-01-26  Patrick Green : Merge pull request #251 from SBNSoftware/feature/zennamo_dropmcreco_intime

sbndutil
---------------------------------------------------

* 2022-03-22  Patrick Green : Merge tag 'v09_46_00' into develop
* 2022-03-22  Patrick Green : Merge branch 'release/v09_46_00'
* 2022-03-22  Patrick Green : Update to v09_46_00
* 2022-03-11  Patrick Green : Merge tag 'v09_45_00' into develop
