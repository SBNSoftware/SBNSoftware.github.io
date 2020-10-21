---
layout: page
title: ReleaseNotes090700
toc: true
---

-----------------------------------------------------------------------------
| v09.07.00 | 21 Oct 2020 | [ReleaseNotes](ReleaseNotes090700.html) |
| --- | --- | --- |



sbndcode v09_07_00 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_07_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_07_00/sbndcode-v09_07_00.html)

Purpose
---------------------------------------------------

* Weekly release

New features
---------------------------------------------------

* Many updates in preparation for the 2020A_00 release

Bug fixes(Bug-fixes)
---------------------------------------------------

Updated dependencies
---------------------------------------------------

* [larsoft v09_07_00](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/ReleaseNotes090700)

Change List
==========================================

sbndcode v09_07_00
---------------------------------------------------

* 2020-10-21  Andrew Scarff : Merge branch 'release/v09_07_00'
* 2020-10-21  Andrew Scarff : Update to larsoft v09_07_00
* 2020-10-21  Andrew Scarff : Merge pull request #49 from SBNSoftware/feature/zennamo_constants
* 2020-10-21  Andrew Scarff : Merge pull request #53 from SBNSoftware/feature/gputnam-MCP2020A-reco-fmatch
* 2020-10-21  Andrew Scarff : Merge pull request #51 from SBNSoftware/feature/gputnam-MCP2020A-FixIntimeCosmic
* 2020-10-21  Andrew Scarff : Merge pull request #52 from SBNSoftware/feature/gputnam-MCP2020A-SCEconfig
* 2020-10-21  Andrew Scarff : Merge branch 'develop' into feature/gputnam-MCP2020A-SCEconfig
* 2020-10-21  Andrew Scarff : Merge pull request #48 from SBNSoftware/dbrailsf_reco1reco3drift
* 2020-10-21  Andrew Scarff : Merge pull request #46 from SBNSoftware/feature/etyley_pandoraShowerBayes
* 2020-10-21  Andrew Scarff : Merge pull request #43 from SBNSoftware/feature/fnicolas
* 2020-10-20  Francisco Javier Nicolás-Arnaldos : Merge branch 'develop' into feature/fnicolas
* 2020-10-20  Francisco Nicolas-Arnaldos : Solving conflicts
* 2020-10-20  Francisco Nicolas-Arnaldos : TPB times now included for visible (x)arapucas at digitization module
* 2020-10-20  gputnam : Add intime config w/ SCE + 3drift on.
* 2020-10-20  gputnam : Remove SCE from regular in-time cosmic config and add dedicated SCE-ON in-time cosmic gen config.
* 2020-10-20  Andrew Scarff : Merge pull request #54 from SBNSoftware/feature/etyley_MCP2020A
* 2020-10-20  Edward Tyley : Added pandoraShowerSBN to run by default
* 2020-10-20  Francisco Nicolas-Arnaldos : Code cleaning
* 2020-10-19  gputnam : Add sim-filter config for using Lite-photons.
* 2020-10-19  gputnam : fix fhicl typo.
* 2020-10-19  gputnam : Revert "Don't overwrite KeepParticlesInVolumes for gen-stage intime-G4."
* 2020-10-19  gputnam : Don't overwrite KeepParticlesInVolumes for gen-stage intime-G4.
* 2020-10-19  gputnam : Make base fmatch config usable for inclusion in base reco config.
* 2020-10-19  gputnam : Update reco2 sce config to use the new space-charge-ON base config.
* 2020-10-19  gputnam : Setup CMake so PDMapAlg actually gets built as a tool.
* 2020-10-19  gputnam : Add in flash-matching to base SBND reco config.
* 2020-10-19  gputnam : Switch generator name to 'corsika' to be consistent with cosmic MC generator for overlay. This is needed to ensure CAFMaker can correctly identify\
 the MC-type.
* 2020-10-19  gputnam : Turn-off debug mode.
* 2020-10-19  gputnam : Revert back to old (correct) way of running in-time cosmic filtering scheme.
* 2020-10-19  gputnam : Create common base config for over-writing service parameters to enable Space-Charge. Fill in SCE+3drift configs wherever needed.
* 2020-10-19  gputnam : Merge pull request #41 from SBNSoftware/gputnam/filter-gen-intime
* 2020-10-19  Joseph Zennamo : Merge branch 'develop' of github.com:SBNSoftware/sbndcode into feature/zennamo_constants
* 2020-10-19  Joseph Zennamo : Changed calo constants to value proposed by SBN Calibration Group
* 2020-10-19  Joseph Zennamo : Changed Lifetime to 10 ms
* 2020-10-16  Dom Brailsford : Merge branch 'develop' of github.com:SBNSoftware/sbndcode into develop
* 2020-10-16  Dom Brailsford : Add reco1 and reco2 fcls for 3 drift windows.  Move old-style reco fcls into deprecated directory
* 2020-10-16  Andrew Scarff : Update product_deps
* 2020-10-16  Andrzej Szelc : add three configuration files for fall  production
* 2020-10-15  Andrew Scarff : Update minimum CMake version in CMakeLists.txt to match sbncode
* 2020-10-06  Edward Tyley : Create SBND specific Bayes dEdx tool which points to prior file in sbnd_data
* 2020-10-14  Dom Brailsford : Merge pull request #44 from SBNSoftware/feature/etyley_SCEShowerConfigs
* 2020-10-14  Andrew Scarff : Merge pull request #40 from ikatza/bugfix/icaza_CloseFiles
* 2020-10-14  Edward Tyley : Deleted legacy comments and moved pandoraShower configs to pandoramodules_sbnd.fcl
* 2020-10-13  Edward Tyley : Update shower fcls with MinAngleToWire cut for SBN
* 2020-10-12  Andrew Scarff : Merge tag 'v09_06_00_01' into develop
* 2020-10-10  Francisco Javier Nicolás-Arnaldos : comment out some printouts
* 2020-10-10  Francisco Javier Nicolás-Arnaldos : Removing if conditional which skip some OpCh in GetFlashLocation
* 2020-10-10  Francisco Javier Nicolás-Arnaldos : Changing QE in CreatePDWaveformLite
* 2020-10-10  Francisco Javier Nicolás-Arnaldos : Update opticalproperties_sbnd.fcl
* 2020-10-10  Francisco Nicolas-Arnaldos : Solving bug in digitization module (no waveform was created for some coated PMTs)
* 2020-10-09  gputnam : Change gen-in-time filter to enforce particles only arriving in beam spill.
* 2020-10-09  Iker de Icaza Astiz : Close files after using them, explicitly open read only
* 2020-10-09  Edward Tyley : Added SCE corrected shower configs and made standard SBN shower config

sbndutil v09_07_00
---------------------------------------------------

* 2020-10-21  Andrew Scarff : Merge branch 'release/v09_07_00'
* 2020-10-21  Andrew Scarff : Update to larsoft v09_07_00
* 2020-10-16  Andrew Scarff : Update product_deps
* 2020-10-15  Andrew Scarff : Update product_deps to include latest larbatch version
* 2020-10-15  Andrew Scarff : Update minimum CMake version in CMakeLists.txt to match sbncode
* 2020-10-12  Andrew Scarff : Merge tag 'v09_06_00_01' into develop
