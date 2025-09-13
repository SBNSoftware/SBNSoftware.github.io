---
layout: page
title: Release Notes Page
toc: true
---

sbnana v10_01_02 Release Notes
=======================================================================================

[List of sbncode releases](https://github.com/SBNSoftware/SBNSoftware.github.io/tree/master/AnalysisInfrastructure/Releases)

Date
---------------------------------------------------
12 September 2025

Purpose
---------------------------------------------------
* sbnana patch release

New features
---------------------------------------------------
 
A patch release of sbnana v10_01_02 has been cut and distributed.
	
Updated dependencies:
sbnanaobj     v10_00_07

PRs Included:
- Adding TruthVar [#113](https://github.com/SBNSoftware/sbnana/pull/113): Adding TruthVar which corresponds to `Var` but per `SRTrueInteratcion` not `SRSlice`. 
- Update ICARUS containment [#121](https://github.com/SBNSoftware/sbnana/pull/121): Update ICARUS containment requirement to exclude detector corners.
- Updade `ICARUSDataQualityCuts.h` [#125](https://github.com/SBNSoftware/sbnana/pull/125): Make it so run 9435 is actually excluded from the Good Runs list as the comment says it should be.

Extra info
---------------------------------------------------
