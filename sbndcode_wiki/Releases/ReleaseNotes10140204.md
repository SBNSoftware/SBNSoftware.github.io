---
layout: page
title: ReleaseNotes10140204
toc: true
---

-----------------------------------------------------------------------------
| v10.14.02.04 | 26 Mar 2026 | [ReleaseNotes](ReleaseNotes10140204.html) |
| --- | --- | --- |



sbndcode v10_14_02_04 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v10_14_02_04](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v10_14_02_04/sbndcode-v10_14_02_04.html)

Change List
==========================================

### Release Notes for [sbndcode] from v10_14_02_03 to v10_14_02_04
- PR #919: Feature/adding blip to caf prod version
  - **Description**: 
  - **Labels**:
  - **Reviewers**: linyan-w
  - **Assignees**: Jjm321814
- PR #908: Pandora bugfix - Shower merging algorithm - Production
  - **Description**: Please provide a detailed description of the changes this pull request introduces.
  - **Labels**: bug, reco1/reco2
  - **Reviewers**:
  - **Assignees**: aliciavr
- PR #923: [Production] Light yield detvar for gen2
  - **Description**: This is a PR for gen2 lightyield detvar (2 PDE changes). This is intended for gen2 production.
  - **Labels**: pds, detsim
  - **Reviewers**: asanchezcastillo
  - **Assignees**: linyan-w
sbndcode sbndcode
---------------------------------------------------

* 2026-03-26  Nathaniel : Update to sbncode v10_14_02_04
* 2026-03-26  nathanielerowe : Merge pull request #923 from SBNSoftware/gen2_lightyield_detvar
* 2026-03-26  Linyan Wan : Bug fix
* 2026-03-25  nathanielerowe : Merge branch 'production/sbnd-gen2' into gen2_lightyield_detvar
* 2026-03-25  nathanielerowe : Merge pull request #908 from SBNSoftware/bugfix/Production_PandoraNeutrinoSettingsShowerMergingReordering
* 2026-03-25  nathanielerowe : Merge branch 'production/sbnd-gen2' into bugfix/Production_PandoraNeutrinoSettingsShowerMergingReordering
* 2026-03-25  nathanielerowe : Merge pull request #919 from SBNSoftware/feature/AddingBlipToCAF_ProdVersion
* 2026-03-25  Linyan Wan : Now the loweff workflow works
* 2026-03-25  Linyan Wan : Make supera work
* 2026-03-25  Linyan Wan : Change blip hit source to dnnsp in detvars, as the tradROI & gaus hits are not saved and are not available in detvar flows
* 2026-03-25  Linyan Wan : Fix part of PDS detvar
* 2026-03-19  Linyan Wan : Light yield detvar for gen2
* 2026-03-02  Jacob McLaughlin : Merge branch 'production/sbnd-gen2' into feature/AddingBlipToCAF_ProdVersion
* 2026-02-19  Jacob McLaughlin : Merge branch 'develop' into feature/AddingBlipToCAF
* 2026-02-19  Jacob McLaughlin : Possible fix in product_deps
* 2026-02-19  nathanielerowe : Update sbncode version to v10_14_02_03
* 2026-02-05  Jacob McLaughlin : resolving merge conflict
* 2026-02-03  Alicia Vázquez-Ramos : Restore the shower merging algorithm in another place to avoid inconsistent state of PFParticles (-1 track scores)
* 2026-01-06  Jacob McLaughlin : resetting to d49df9d -- where all tvector3 is removed but the geo::vector util functions are not used
* 2026-01-05  Jacob McLaughlin : still fixing runtime error
* 2026-01-05  Jacob McLaughlin : still fixing runtime error
* 2026-01-05  Jacob McLaughlin : fixing caps again
* 2026-01-05  Jacob McLaughlin : Revert "Revert "Merge branch 'develop' into feature/AddingBlipToCAF""
* 2026-01-05  Jacob McLaughlin : Revert "Removed some tvector3 dependencies"
* 2026-01-05  Jacob McLaughlin : Revert "Merge branch 'develop' into feature/AddingBlipToCAF"
* 2026-01-05  Jacob McLaughlin : Revert "typo in include"
* 2026-01-05  Jacob McLaughlin : Revert "made pinfo position have a capital like all other blip positions"
* 2026-01-05  Jacob McLaughlin : Revert "thanks compiler"
* 2026-01-05  Jacob McLaughlin : Revert "swap one more tvector3 for geo::point_t"
* 2026-01-05  Jacob McLaughlin : Revert "trying a different accumulator"
* 2026-01-05  Jacob McLaughlin : Revert "gave up on iterator"
* 2026-01-05  Jacob McLaughlin : Revert "put it back"
* 2026-01-05  Jacob McLaughlin : Revert "Removed iterator again"
* 2026-01-05  Jacob McLaughlin : Revert "missed a line"
* 2026-01-05  Jacob McLaughlin : Revert "Don't know how to initilize correctly"
* 2026-01-05  Jacob McLaughlin : Revert "these accumulator are not being nice"
* 2026-01-05  Jacob McLaughlin : Revert "throw out accumulator"
* 2026-01-05  Jacob McLaughlin : Revert "fix typo"
* 2026-01-05  Jacob McLaughlin : Revert "Trying to fix runtime error"
* 2026-01-05  Jacob McLaughlin : Revert "Trying to fix runtime error"
* 2026-01-05  Jacob McLaughlin : :q Revert "Trying to fix runtime error"
* 2026-01-05  Jacob McLaughlin : Revert "Trying to fix runtime error"
* 2026-01-05  Jacob McLaughlin : Trying to fix runtime error
* 2026-01-05  Jacob McLaughlin : Trying to fix runtime error
* 2026-01-05  Jacob McLaughlin : Trying to fix runtime error
* 2026-01-05  Jacob McLaughlin : Trying to fix runtime error
* 2026-01-05  Jacob McLaughlin : fix typo
* 2026-01-05  Jacob McLaughlin : throw out accumulator
* 2026-01-05  Jacob McLaughlin : these accumulator are not being nice
* 2026-01-05  Jacob McLaughlin : Don't know how to initilize correctly
* 2026-01-05  Jacob McLaughlin : missed a line
* 2026-01-05  Jacob McLaughlin : Removed iterator again
* 2026-01-05  Jacob McLaughlin : put it back
* 2026-01-05  Jacob McLaughlin : gave up on iterator
* 2026-01-05  Jacob McLaughlin : trying a different accumulator
* 2026-01-05  Jacob McLaughlin : swap one more tvector3 for geo::point_t
* 2026-01-05  Jacob McLaughlin : thanks compiler
* 2026-01-05  Jacob McLaughlin : made pinfo position have a capital like all other blip positions
* 2026-01-05  Jacob McLaughlin : typo in include
* 2026-01-05  Jacob McLaughlin : Merge branch 'develop' into feature/AddingBlipToCAF
* 2026-01-05  Jacob McLaughlin : Removed some tvector3 dependencies
* 2025-12-10  Jacob McLaughlin : Tab align issue
* 2025-12-10  Jacob McLaughlin : Tab align issue
* 2025-12-10  Jacob McLaughlin : Merge branch 'feature/BlipBugFix' into feature/AddingBlipToCAF
* 2025-12-10  Jacob McLaughlin : addressing Henry comments
* 2025-11-29  Jacob McLaughlin : I hope I don't just replace all these tvector 3
* 2025-11-29  Jacob McLaughlin : Oh I just updated one spot
* 2025-11-29  Jacob McLaughlin : Oh I just updated one spot
* 2025-11-29  Jacob McLaughlin : Adding includes that are probably unneeded
* 2025-11-29  Jacob McLaughlin : Weird these cmake issues appeared now and not earlier
* 2025-11-29  Jacob McLaughlin : How did I miss so many
* 2025-11-29  Jacob McLaughlin : How did I miss so many
* 2025-11-29  Jacob McLaughlin : One more cmake update
* 2025-11-29  Jacob McLaughlin : Not sure this should function
* 2025-11-29  Jacob McLaughlin : Update Power calls
* 2025-11-29  Jacob McLaughlin : more TVector 3 conversion
* 2025-11-29  Jacob McLaughlin : TVector3 Replacement updates
* 2025-11-29  root : fixed library name
* 2025-11-26  Jacob McLaughlin : Merge branch 'feature/BlipBugFix' into feature/AddingBlipToCAF
* 2025-11-20  Jacob McLaughlin : Fixed indentation
* 2025-11-19  Jacob McLaughlin : Merge branch 'develop' into feature/AddingBlipToCAF
* 2025-11-19  Jacob McLaughlin : Fixing changes I didn't intend to make
* 2025-11-14  Jacob McLaughlin : MC caf updates
* 2025-11-14  Jacob McLaughlin : fcl changes to include blips
* 2025-11-14  Jacob McLaughlin : updated caf maker fcl
* 2025-11-14  Jacob McLaughlin : merge issues
* 2025-11-14  Jacob McLaughlin : compile changes
* 2025-11-13  Jacob McLaughlin : compiler is so fussy
* 2025-11-13  Jacob McLaughlin : Tried to separate the removal of classes.h but it doesn't actually work
* 2025-11-13  Jacob McLaughlin : Updating includes
* 2025-11-13  Jacob McLaughlin : CMAKEList updates
* 2025-11-13  Jacob McLaughlin : Forgot to take out cmake lists
* 2025-11-10  Jacob McLaughlin : updated sbnobj
* 2025-11-10  Jacob McLaughlin : Assorted changes to things I don't actually use so the compiler would be happy
* 2025-11-06  Jacob McLaughlin : Trying to get compile to solve
* 2025-11-06  Jacob McLaughlin : adjustments to new paths

