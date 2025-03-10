---
layout: page
title: Release Notes Page
toc: true
---

sbnana v10_00_00 Release Notes
=======================================================================================

[List of sbncode releases](https://github.com/SBNSoftware/SBNSoftware.github.io/tree/master/AnalysisInfrastructure/Releases)

Date
---------------------------------------------------
10 March 2024

Purpose
---------------------------------------------------
* weekly release

New features
---------------------------------------------------
 
Following last week's release of sbnanaobj v10_00_00, a release of sbnana v10_00_00 has been cut and distributed.
	
Updated dependencies:
sbnanaobj     v10_00_00
ifdhc         v2_7_2

PRs Included:
- Add On/Off Systematics and save sigma values for NSigmaTree [#114](https://github.com/SBNSoftware/sbnana/pull/114): Add new SBNOnOffSyst class for those systematics which only have 1 sigma weights in the CAFs. Add new "_sigma" branches to NSigmaTree which stores the knob value for each weight.
- Updated selection for ICARUS Numu [#115](https://github.com/SBNSoftware/sbnana/pull/115)
- CalorimetrySysts made lazy [#119](https://github.com/SBNSoftware/sbnana/pull/119) - This PR is intended to solve [SBNSoftware/sbndata#8](https://github.com/SBNSoftware/sbndata/issues/8) and supersedes PR [#116](https://github.com/SBNSoftware/sbnana/pull/116), of which it integrates the functionality.

Extra info
---------------------------------------------------
