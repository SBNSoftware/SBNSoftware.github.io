---
layout: page
title: ReleaseNotes097500
toc: true
---

-----------------------------------------------------------------------------
| v09.75.00 | 31 May 2023 | [ReleaseNotes](ReleaseNotes097500.html) |
| --- | --- | --- |



sbndcode v09_75_00 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_75_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_75_00/sbndcode-v09_75_00.html)

Purpose
---------------------------------------------------
Weekly release

New features
---------------------------------------------------
* SBNSoftware/sbndcode#331: Changes for art 3.12
* SBNSoftware/sbndcode#334: Change default pandora nu score
  * Accompanying PR to PandoraPFA/LArContent#207
  * It will activate a new feature in the slice ID algorithm allowing us to manually set the default probability to -1
* SBNSoftware/sbndcode#351: Wire-cell simulation production fcls
  * Add fcls for wire-cell 2D simulation
* SBNSoftware/sbndcode#354: Added a fcl for generating nu+e events and reweighting just flux weights
* SBNSoftware/sbndcode#352: Use accessory files from StashCache instead of dCache #352
  * PR is intended to update FHiCL file to point to accessory files from StashCache, using the associated CVMFS path, instead of using the /pnfs path.  

Bug fixes
---------------------------------------------------

Updated dependencies
---------------------------------------------------
* sbncode v09_75_00
* larsoft v09_75_00
* art v3_12_00
* larbatch v01_59_02

Change List
==========================================

sbndcode sbndcode
---------------------------------------------------

* 2023-05-31  Fran Nicolas : Merge branch 'release/v09_75_00'
* 2023-05-31  Fran Nicolas : Update to larsoft v09_75_00
* 2023-05-31  Francisco Javier Nicolás-Arnaldos : Merge pull request #352 from vitodb/feature/vito_use_StashCache
* 2023-05-31  Francisco Javier Nicolás-Arnaldos : Merge pull request #331 from knoepfel/art-3.12-changes
* 2023-05-22  Francisco Javier Nicolás-Arnaldos : Merge pull request #354 from SBNSoftware/feature/brindenc
* 2023-05-22  Francisco Javier Nicolás-Arnaldos : Merge pull request #351 from ebelchio12/ebelchio12_wirecell
* 2023-05-15  Brinden Carlson : added fluxwgt fcl
* 2023-04-04  Kyle Knoepfel : Accommodate API changes.
* 2023-05-10  Vito Di Benedetto : Use CORSIKA files from StashCache instead of dCache
* 2023-05-10  ebelchio12 : Add wire-cell 2D simulation
* 2023-05-10  ebelchio12 : keep ionandscint for wire-cell
* 2023-05-05  Francisco Javier Nicolás-Arnaldos : Merge pull request #334 from SBNSoftware/feature/hlay_pandora_nu_score
* 2023-05-04  Fran Nicolas : Merge tag 'v09_73_00' into develop
* 2023-05-04  Brinden Carlson : Added nu e generation fcl
* 2023-04-19  Henry Lay : Change default pandora nu score

sbndutil
---------------------------------------------------

* 2023-05-31  Fran Nicolas : Merge tag 'v09_75_00' into develop
* 2023-05-31  Fran Nicolas : Merge branch 'release/v09_75_00'
* 2023-05-31  Fran Nicolas : Update to larsoft v09_75_00
* 2023-05-31  Francisco Javier Nicolás-Arnaldos : Merge pull request #11 from SBNSoftware/fjnicolas-art3.12
* 2023-05-31  Francisco Javier Nicolás-Arnaldos : Update larbatch version
* 2023-05-16  Francisco Javier Nicolás-Arnaldos : Update product_deps
* 2023-05-04  Fran Nicolas : Merge tag 'v09_73_00' into develop
