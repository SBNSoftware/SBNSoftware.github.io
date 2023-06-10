---
layout: page
title: ReleaseNotes097501
toc: true
---

-----------------------------------------------------------------------------
| v09.75.01 | 10 Jun 2023 | [ReleaseNotes](ReleaseNotes097501.html) |
| --- | --- | --- |



sbndcode v09_75_01 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_75_01](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_75_01/sbndcode-v09_75_01.html)

Purpose
---------------------------------------------------
Weekly release

New features
---------------------------------------------------
* SBNSoftware/sbndcode#324
  * Added option in configuration to enable and disable HNL ThreeBodyAnisotropies
* SBNSoftware/sbndcode#353: updates to the PDS simulation & reconstruction chain
  * G4 stage: the ScintillationPreScale parameter
  * DetSim stage:
    * Updated PMT detection efficiencies
    * Updated pedestal simulation
    * Updates to the PMT saturation model: adds sturation due to dynamic range and includes PMT non linear effects
  * Reco1 stage:
    * Adds new method to estimate the OpFlash ZY barycenter
    * Updates how the PMTRatio metric (used to infer the OpFlash drift position) is calculated
    * Switch to a gauss filter for the PMT deconvolution


Bug fixes
---------------------------------------------------

Updated dependencies
---------------------------------------------------
* sbncode v09_75_01
* larsoft v09_75_01
* sbnd_data v09_75_01

Change List
==========================================

sbndcode sbndcode
---------------------------------------------------

* 2023-06-10  Fran Nicolas : Merge branch 'release/v09_75_01'
* 2023-06-10  Fran Nicolas : Update to larsoft v09_75_01
* 2023-06-10  Francisco Javier Nicolás-Arnaldos : Merge pull request #353 from SBNSoftware/feature/fnicolas_pdssim
* 2023-06-07  Fran Nicolas : Remove unused variables
* 2023-06-07  Francisco Javier Nicolás-Arnaldos : Merge pull request #324 from SBNSoftware/feature/Luispelegrina_HNL3BAn
* 2023-06-05  Fran Nicolas : Update PMTNonLinearity file description
* 2023-06-05  Fran Nicolas : Remove make_tool include
* 2023-05-31  Fran Nicolas : Merge tag 'v09_75_00' into develop
* 2023-05-19  Fran Nicolas : Update pedestal to 90/10 signal/overshoot
* 2023-05-15  Fran Nicolas : Update baseline parameters
* 2023-05-15  Fran Nicolas : Add non linearity to the SimPhotons
* 2023-05-15  Fran Nicolas : Remove remaning couts in flash geo tools and remove f preffix in some local variables
* 2023-05-12  Fran Nicolas : Code cleaning
* 2023-05-12  Fran Nicolas : AAdd gauss filter for PMTs
* 2023-05-12  Fran Nicolas : code cleaning
* 2023-05-04  Luis Pelegrina Gutiérrez : Fix a bug regarding how HNL totalwidth is calculated
* 2023-04-11  Luis Pelegrina Gutiérrez : Toggled of ThreeBodyAnisotropic Decay by default
* 2023-04-03  Fran Nicolas : merge develop and solve conflicts
* 2023-03-30  Fran Nicolas : Update non linear upper limit
* 2023-03-27  Fran Nicolas : Add new method to estimate flash center
* 2023-03-24  Fran Nicolas : Update drift estimator algorithm
* 2023-03-24  Fran Nicolas : Update simulation of PMT saturation/nonlinearity
* 2023-03-15  Luis Pelegrina Gutiérrez : Added option in configuration to enable and disable HNL ThreeBodyAnisotropies
* 2023-01-31  Fran Nicolas : Update PMT detection efficiencies value
* 2023-01-31  Fran Nicolas : Rename functions for uncoated PMTs
* 2023-01-31  Fran Nicolas : Update PMTAlgs to read different efficiecies
* 2023-01-31  Fran Nicolas : Update scintillation pre-scale

sbndutil
---------------------------------------------------

* 2023-06-10  Fran Nicolas : Merge tag 'v09_75_01' into develop
* 2023-06-10  Fran Nicolas : Merge branch 'release/v09_75_01'
* 2023-06-10  Fran Nicolas : Update to larsoft v09_75_01
* 2023-05-31  Fran Nicolas : Merge tag 'v09_75_00' into develop
