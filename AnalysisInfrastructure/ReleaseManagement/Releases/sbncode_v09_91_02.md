---
layout: page
title: sbncode_v09_91_02
toc: true
---

sbncode_v09_91_02 Release Notes
=======================================================================================

[List of sbncode releases](https://sbnsoftware.github.io/AnalysisInfrastructure/ReleaseManagement/Releases/List_of_SBN_code_releases)

Date
---------------------------------------------------
15 July 2024

Purpose
---------------------------------------------------
* Weekly release

New features
---------------------------------------------------
A weekly release of sbncode (v09_91_02) has been cut and distributed

* sbncode (v09_91_02):

  Using (updated dependencies):
  * larsoft          v09_91_02
  * sbnobj           v09_19_03
  * sbnanaobj        v09_23_02_01
  * lardataobj       v09_18_05
  * nusystematics    v1_05_01

   Includes:
  * Incorporate gputnam trigger product change [#467](https://github.com/SBNSoftware/sbncode/pull/467) Introduces extra SRTrigger info (see discussion and linked PRs for more information)
  * Improve SystToolsEventWeight [#464](https://github.com/SBNSoftware/sbncode/pull/464) Save genie event records to CAFs to allow more efficient XS reweighting
  * Restore SBN_QGSP_BERT_NNC to be QGSP_BERT with no neutron cut [#462](https://github.com/SBNSoftware/sbncode/pull/462) Update to physics list. See [this issue](https://github.com/SBNSoftware/sbncode/issues/453) for more details
    
Extra info
---------------------------------------------------

This version is the first one which includes the updated GENIE v3.4.2 needed for SBND. See [this issue](https://cdcvs.fnal.gov/redmine/issues/28747#change-96131) for details about this change 
