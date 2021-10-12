---
layout: page
title: ReleaseNotes092800
toc: true
---

-----------------------------------------------------------------------------
| v09.28.00 | 06 Aug 2021 | [ReleaseNotes](ReleaseNotes092800.html) |
| --- | --- | --- |



sbndcode v09_28_00 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_28_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_28_00/sbndcode-v09_28_00.html)

Purpose
---------------------------------------------------

* Weekly release

New features
---------------------------------------------------

* sbndcode PR 127:
  * Adding QL-correlated G4 script and enabling the charge-light correlated model in Geant as default.

* sbndcode PR 129:
  * Simple-Flash Match: multi-matcher, unbiased, tuneable, fast.
  * corresponds to changes in SBNSoftware/sbncode#152
  * adds Multi-flash matching allowing many to many matching, along with various optimisations
  * updated flash matching metrics (sbnd_data v01_07_00)

* sbndcode PR 131:
  * move experiment genie_xse dependency to sbncode
  * issue details: SBNSoftware/sbncode#15

* sbndcode PR 135:
  * adding BNB full osc fcl
  * addresses issue: SBNSoftware/sbncode#155 

* sbndcode PR 136:
  * Update opticalproperties_sbnd.fcl
  * Update tau_slow from 1590 ns to 1300 ns (discussed DocDB:22941)


Bug fixes
---------------------------------------------------

* sbndcode PR 132:
  * Ensure ci tests & reference generation use same empty files
  * This is the first stage in an effort to fix the error seen in issue #130. It ensures that (for the nu_cosmics_gen tests) both the seq test (used for reference file generation) and the quick test (used to perform the actual ci_tests) use the same empty file as input.

Updated dependencies
---------------------------------------------------

* sbnd_data v01_07_00
* sbncode v09_28_00
* larsoft v09_28_00

Change List
==========================================

sbndcode v09_28_00
---------------------------------------------------

* 2021-08-06  Patrick Green : Merge branch 'release/v09_28_00'
* 2021-08-06  Patrick Green : Update to v09_28_00
* 2021-08-06  Miquel Nebot : Merge pull request #131 from SBNSoftware/feature/miquelnebot_geniedeps
* 2021-08-06  Patrick Green : Merge pull request #136 from SBNSoftware/ggamezdiego-patch-3
* 2021-08-06  ggamezdiego : Update opticalproperties_sbnd.fcl
* 2021-08-06  Patrick Green : Merge pull request #127 from wforeman/develop
* 2021-08-06  Patrick Green : Merge pull request #135 from SBNSoftware/feature/jzennamo_adding_fullosc_fcl
* 2021-08-05  Joseph Zennamo : adding full osc fcl
* 2021-08-04  Patrick Green : Merge pull request #132 from SBNSoftware/bugfix/ci_genie_seeding_error
* 2021-08-04  Miquel Nebot : Merge branch 'develop' into feature/miquelnebot_geniedeps
* 2021-08-03  Patrick Green : sbnd_data v01_07_00
* 2021-08-02  Henry Lay : Ensure ci tests & reference generation use same empty files
* 2021-08-02  Miquel Nebot : Merge pull request #129 from ikatza/feature/icaza_fm_multi
* 2021-08-02  Miquel Nebot : move experiment genie_xse dependency to sbncode
* 2021-07-30  Patrick Green : Merge tag 'v09_27_00_02' into develop
* 2021-07-29  Iker de Icaza Astiz : Change to SBND unbiasing formula
* 2021-07-29  Iker de Icaza Astiz : Create new fcl specific to create metrics
* 2021-07-29  Iker de Icaza Astiz : Define unbiassing vars
* 2021-07-28  Iker de Icaza Astiz : Code that needs to be uncommented/commented to create metrics
* * 2021-07-28  Iker de Icaza Astiz : Run multi fm by default, only for 50+50 us pre/post porch around the beam
* 2021-07-22  Will Foreman : Enable QL-anticorrelation by default
* 2021-07-21  Will Foreman : Adding QL-correlated G4 script
* 2021-07-06  Iker de Icaza Astiz : Go back to using number of x bins
* 2021-06-22  Iker de Icaza Astiz : Turbo FM Power Up :fireworks:
* 2021-06-02  Iker de Icaza Astiz : Add param to also use induction wires, remove another useless param
* 2021-06-01  Iker de Icaza Astiz : Remove fcl parameter, it shouldn't be changed from its current value
* 2021-05-30  Iker de Icaza Astiz : Stop using charge and pe scales, they're useless

sbndutil v09_28_00
---------------------------------------------------

* 2021-08-06  Patrick Green : Merge branch 'release/v09_28_00'
* 2021-08-06  Patrick Green : Update to v09_28_00
* 2021-07-30  Patrick Green : Merge tag 'v09_27_00_02' into develop
