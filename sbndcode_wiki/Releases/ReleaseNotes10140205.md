---
layout: page
title: ReleaseNotes10140205
toc: true
---

-----------------------------------------------------------------------------
| v10.14.02.05 | 07 May 2026 | [ReleaseNotes](ReleaseNotes10140205.html) |
| --- | --- | --- |



sbndcode v10_14_02_05 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v10_14_02_05](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v10_14_02_05/sbndcode-v10_14_02_05.html)

Change List
==========================================


### Release Notes for [sbndcode] from v10_14_02_04 to v10_14_02_05
- **PR #924: Update to sbncode v10_14_02_04**
  - **Description**: 
  - **Relevant PR links**: 
  - **Documentation Links**: 
  - **Labels**: 
  - **Reviewers**: 
  - **Assignees**: 
- **PR #927: Rare event filter for SBND Production (Production PR)**
  - **Description**: Adds a signal filter module that is configurable for specifying common requirements for cross section signal definitions, and a workflow fcl to separate signal events into different output streams.  The intended use of the workflow fcl is to select multiple types of rare events needed for different analyses from a single large generator stage production. Currently, it saves primary pi0s (CC and NC separately), eta mesons, CC electron neutrinos, kaons, and delta-radiative decays (CC and NC separately).  Filter Module Features: - Filter based on final state primary particles with optional KE thresholds - Filter based on neutrino interaction properties: Nu flavor, In TPC, CC/NC, target PDG codes, modes - Module checks a list of filters to accept events that pass one or more conditions (e.g., accept events containing particle A or particle B)  Some example signal definition configurations are added to fcls/signal_filters_sbnd.fcl.
  - **Relevant PR links**: Requires [sbncode PR648](https://github.com/SBNSoftware/sbncode/pull/648) for the CC Delta radiative filter and NC Delta radiative exit fix.   Link(s) to docdb describing changes (optional) [DocDB 46087](https://sbn-docdb.fnal.gov/cgi-bin/sso/ShowDocument?docid=46087)
  - **Documentation Links**: 
  - **Labels**: enhancement
  - **Reviewers**: sungbinoh, seokjuchung
  - **Assignees**: 
- **PR #930: Feature/lynnt lightcalorimetry clean, production gen2**
  - **Description**: 
  - **Relevant PR links**: 
  - **Documentation Links**: 
  - **Labels**: 
  - **Reviewers**: 
  - **Assignees**: 
