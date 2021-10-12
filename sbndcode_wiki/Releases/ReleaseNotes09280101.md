---
layout: page
title: ReleaseNotes09280101
toc: true
---

-----------------------------------------------------------------------------
| v09.28.01.01 | 21 Aug 2021 | [ReleaseNotes](ReleaseNotes09280101.html) |
| --- | --- | --- |



sbndcode v09_28_01_01 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_28_01_01](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_28_01_01/sbndcode-v09_28_01_01.html)

Purpose
---------------------------------------------------

* Patch release for SBN-2021B

New features
---------------------------------------------------

Bug fixes
---------------------------------------------------

* sbndcode PR 155:
  * Update PDFastSim_sbnd.fcl triplet-time to 1300ns in the newlarg4.
  * previously only updated for legacy larg4

* sbndcode PR 156:
  * Use new module label for sim channels
  * Anatree standard configuration requires these changes to run on files produced using sbndcode v09_28_01 as the module label for SimChannels was changed by PR #134

* sbndcode PR 162:
  * Adding two fixes for getting reco to work for SBND:
  * Removed opT0Finder which is currently seg faulting
  * Change the SimChannel label to match the new LArG4

* sbndcode PR 164: 
  * Capping the number of Flux Files Used Due to Stash Cache Latency Issues
  * The default number of flux files being used (~150) is causing long delays in the configuration of GENIE jobs. This limits the number of flux files to be a bit more than ~5.
  
---------------------------------------------------

Change List
==========================================

sbndcode v09_28_01_01
---------------------------------------------------

* 2021-08-21  Patrick Green : Update to v09_28_01_01
* 2021-08-21  Patrick Green : Merge remote-tracking branch 'remotes/origin/bugfix/hlay_anatree_module_label' into release/v09_28_01
* 2021-08-21  Patrick Green : Merge remote-tracking branch 'remotes/origin/ggamezdiego-patch-3' into release/v09_28_01
* 2021-08-20  Patrick Green : Merge pull request #164 from SBNSoftware/feature/jzennamo_fluxfilecap
* 2021-08-19  Joseph Zennamo : capping the number of flux files due to stash cache latency, thanks Herb
* 2021-08-19  Joseph Zennamo : Switch SimChannel Label for new LArG4
* 2021-08-19  Joseph Zennamo : dropping opt0finder, it is segfaulting
* 2021-08-18  ggamezdiego : Update PDFastSim_sbnd.fcl
* 2021-08-17  Henry Lay : Use new module label for sim channels
* 2021-08-17  Patrick Green : Merge tag 'v09_28_01' into develop

sbndutil v09_28_01
---------------------------------------------------
