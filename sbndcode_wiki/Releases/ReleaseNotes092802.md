---
layout: page
title: ReleaseNotes092802
toc: true
---

-----------------------------------------------------------------------------
| v09.28.02 | 24 Aug 2021 | [ReleaseNotes](ReleaseNotes092802.html) |
| --- | --- | --- |



sbndcode v09_28_02 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_28_02](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_28_02/sbndcode-v09_28_02.html)

Purpose
---------------------------------------------------

* Weekly release

New features
---------------------------------------------------

* sbndcode PR 152:
  * Consolidated ROI threshold settings
  * To avoid confusion, I consolidated the ROI threshold settings for CalWireSBND from the base reco script (reco_sbnd.fcl) into the fhicl parameterset file (Calibration/roitools_sbnd.fcl), where the previous settings were defined.
  * Also added some comments to roitools_sbnd.fcl citing the DocDB entry where values were tuned, and also explaining how the threshold works.
 
 * sbndcode PR 158:
    * Re-enable WireIntersection test
    * Now that larcorealg PR#20 has been merged, the WireIntersection test can be renabled.

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

Updated dependencies
---------------------------------------------------

* sbncode v09_28_02
* larsoft v09_28_02

Change List
==========================================

sbndcode v09_28_02
---------------------------------------------------

* 2021-08-24  Patrick Green : Merge branch 'release/v09_28_02'
* 2021-08-24  Patrick Green : Update to v09_28_02
* 2021-08-24  Patrick Green : Merge remote-tracking branch 'remotes/origin/release/SBN2021B' into release/v09_28_02
* 2021-08-23  Patrick Green : Merge pull request #152 from wforeman/develop
* 2021-08-23  Patrick Green : Merge pull request #158 from SBNSoftware/feature/hlay_geom_tests
* 2021-08-21  Patrick Green : Update to v09_28_01_01
* 2021-08-21  Patrick Green : Merge remote-tracking branch 'remotes/origin/bugfix/hlay_anatree_module_label' into release/v09_28_01
* 2021-08-21  Patrick Green : Merge remote-tracking branch 'remotes/origin/ggamezdiego-patch-3' into release/v09_28_01
* 2021-08-20  Patrick Green : Merge pull request #164 from SBNSoftware/feature/jzennamo_fluxfilecap
* 2021-08-19  Joseph Zennamo : capping the number of flux files due to stash cache latency, thanks Herb
* 2021-08-19  Joseph Zennamo : Switch SimChannel Label for new LArG4
* 2021-08-19  Joseph Zennamo : dropping opt0finder, it is segfaulting
* 2021-08-19  Patrick Green : Merge pull request #161 from SBNSoftware/feature/hlay_ci_usage
* 2021-08-19  Henry Lay : Correct silly error, Henry you fool
* 2021-08-19  Patrick Green : Merge pull request #159 from SBNSoftware/feature/hlay_ci_usage
* 2021-08-19  Henry Lay : Update memory range for g4 ci tests
* 2021-08-19  Henry Lay : Re-enable WireIntersection test
* 2021-08-19  Patrick Green : Merge pull request #155 from SBNSoftware/ggamezdiego-patch-3
* 2021-08-18  Patrick Green : Merge pull request #156 from SBNSoftware/bugfix/hlay_anatree_module_label
* 2021-08-18  ggamezdiego : Update PDFastSim_sbnd.fcl
* 2021-08-17  Will Foreman : Consolidated ROI threshold settings, added comments
* 2021-08-17  Henry Lay : Use new module label for sim channels
* 2021-08-17  Patrick Green : Merge tag 'v09_28_01' into develop

sbndutil v09_28_02
---------------------------------------------------

* 2021-08-24  Patrick Green : Merge branch 'release/v09_28_02'
* 2021-08-24  Patrick Green : Update to v09_28_02
* 2021-08-17  Patrick Green : Merge tag 'v09_28_01' into develop
