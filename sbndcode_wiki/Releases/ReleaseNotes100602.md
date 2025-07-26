--
layout: page
title: ReleaseNotes100602
toc: true
---

-----------------------------------------------------------------------------
| v10.06.02 | 26 Jul 2025 | [ReleaseNotes](ReleaseNotes100602.html) |
| --- | --- | --- |



sbndcode v10_06_02 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v10_06_02](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v10_06_02/sbndcode-v10_06_02.html)

Purpose
---------------------------------------------------

New features
---------------------------------------------------

Bug fixes
---------------------------------------------------

Updated dependencies
---------------------------------------------------

Supported qualifiers
---------------------------------------------------

Change List
==========================================
  - **Assignees**:
- PR #766: Add wc_device jsonnet parameter and gpu_fcls
  - **Description**:
  - **Labels**:
  - **Reviewers**:
  - **Assignees**:
- PR #763: Update DNN ROI fcls for validation production, add option of run only DNN ROI
  - **Description**: This PR updates and refactors fcls for running DNN-base ROI finding. Previously, the `JobConfigurations/standard` fcls had commented lines that could be uncommented to enable DNN ROI. With this PR, all relevant fcls are stored in `JobConfigurations/dnnroi` and `JobConfigurations/standard` fcls run only the traditional workflow. For the complete transition to DNN ROI for the upcoming fall production, the `JobConfigurations/dnnroi/<standard_fcl_name>_dnnroi.fcl` should replace the `JobConfigurations/dnnroi/<standard_fcl_name>.fcl` files.  Summary of changes in workflow: - Updates on jsonnets and addition of fcls to run only DNN ROI finding - `structs:use_dnnroi` knob to switch between running only traditional ROI and running traditional+DNN ROI in parallel is replaced with `params:roi` knob to choose between `trad`, `dnn`, `both` options. - for each option, dedicated SP tables are configured in `wcsimsp_sbnd.fcl` and `wcsp_data_sbnd.fcl` files, instead of overwriting each configuration from detsim/reco fcls  new fcls relevant for DNN ROI validation production: - MC: - `standard_detsim_sbnd_bothrois.fcl`: runs both ROIs during detsim-simtpc2d - `standard_reco1_sbnd_dnnroi.fcl`: runs Reco1 on simtpc2d:dnnsp Wire product - Data: - `reco1_data_bothrois.fcl`: runs both ROIs during reco1-sptpc2d, run downstream reco1 on sptpc2d:gauss - `scrub_gaushit_data.fcl`: scrubs gaushit from the output of the above fcl - `reco1_postscrub_data_dnnroi.fcl`: run downstream reco1 again on the output of the above fcl, this time on sptpc2d:dnnsp 
  - **Labels**: simulation, reco1/reco2
  - **Reviewers**: jzennamo, absolution1, weihythu, nathanielerowe, lynnt20
  - **Assignees**: wjdanswjddl
- PR #755: Drop wiener wires
  - **Description**: This PR is for dropping wiener wires. A previous PR 702 tried to do this, but 702 modified the wrong drop fcl. This PR adds dropping wiener wires and removing that unused drop fcl to avoid confusion.
  - **Labels**: maintenance, reco1/reco2
  - **Reviewers**: jzennamo, absolution1, lynnt20
  - **Assignees**: linyan-w
- PR #764: fcl with etau 35ms
  - **Description**: fcl refactor / updates for upcoming detector variation production - delete obsolete directory in `JobConfigurations/standard/g4/lifetime` - add mc detsim elifetime variation fcls in `JobConfigurations/standard/detsim/detector_variation` - add reco2 elifetime variation fcls in `JobConfigurations/standard/reco/detector_variations` - add caf elifetime variation fcls in `JobConfigurations/standard/caf/detector_variations` (note this isn't currently neccessary)  
  - **Labels**: simulation, reco1/reco2
  - **Reviewers**: mrmooney, sungbinoh, absolution1
  - **Assignees**: wjdanswjddl
- PR #760: Update to GDML v02_05 - Fix TPC Z Dimension
  - **Description**: In the past, we forgot to update the Z dimension of the TPC [here](https://github.com/SBNSoftware/sbndcode/blob/develop/sbndcode/Geometry/gdml/sbnd_v02_04_base.gdmlL138). It's set to 509.4 cm, but it should be 1670*0.3 = 501 cm. This width is used when placing detector components in the world volume. Making this change will move the first wire back by (509.4 - 501) / 2 = 4.2 cm, exactly the offset seen by @sxy1439. Fixes 741. Geometry integrity tested by running some BNB+Cosmic events. Will need to replicate plots of dQ/dx along the YZ plane to ensure this fixes the offset issue.
  - **Labels**: geometry, simulation
  - **Reviewers**: mrmooney, miquelnebot
  - **Assignees**: marcodeltutto
- PR #748: CCNueFilter (develop PR) 
  - **Description**: - Adds a new fcl block inside `Filters/filters.fcl` for a charged-current electron-neutrino interaction inside the TPC active volume. - Adds a new gen fcl that runs rockbox + the ccnue filter  Partially resolves issue 655. ~Currently testing, will update from draft to ready when test files look sensible.~
  - **Labels**: enhancement, simulation
  - **Reviewers**: jzennamo, marcodeltutto
  - **Assignees**: lynnt20

sbndcode sbndcode
---------------------------------------------------

* 2025-07-26  Nathaniel : Merge branch 'release/v10_06_02'
* 2025-07-26  Nathaniel : Bump versions
* 2025-07-26  nathanielerowe : Merge pull request #748 from SBNSoftware/feature/lynnt_ccnuefilter
* 2025-07-26  nathanielerowe : Merge branch 'develop' into feature/lynnt_ccnuefilter
* 2025-07-26  nathanielerowe : Merge pull request #760 from SBNSoftware/feature/mdeltutt_geom_fix
* 2025-07-26  nathanielerowe : Merge branch 'develop' into feature/mdeltutt_geom_fix
* 2025-07-26  nathanielerowe : Merge pull request #764 from SBNSoftware/feature/munjung-detvar_fcls
* 2025-07-26  nathanielerowe : Merge branch 'develop' into feature/munjung-detvar_fcls
* 2025-07-26  nathanielerowe : Merge pull request #755 from SBNSoftware/features/linyan_recodrop
* 2025-07-26  nathanielerowe : Merge branch 'develop' into features/linyan_recodrop
* 2025-07-26  nathanielerowe : Merge pull request #763 from SBNSoftware/feature/munjung-dnnsp_workflow_fcls
* 2025-07-26  nathanielerowe : Merge branch 'develop' into feature/munjung-dnnsp_workflow_fcls
* 2025-07-26  nathanielerowe : Merge branch 'develop' into features/linyan_recodrop
* 2025-07-26  nathanielerowe : Update ci_tests.cfg
* 2025-07-26  nathanielerowe : Merge branch 'develop' into feature/munjung-detvar_fcls
* 2025-07-26  nathanielerowe : Merge branch 'develop' into feature/lynnt_ccnuefilter
* 2025-07-26  nathanielerowe : Merge branch 'develop' into feature/mdeltutt_geom_fix
* 2025-07-26  nathanielerowe : Update product_deps
* 2025-07-23  Mun Jung Jung : Merge branch 'feature/munjung-dnnsp_workflow_fcls' of https://github.com/SBNSoftware/sbndcode into feature/munjung-dnnsp_workflow_fcls
* 2025-07-23  Mun Jung Jung : update training sample making code
* 2025-07-23  Moon Jung : Merge pull request #766 from SBNSoftware/nrowe_gpu_fcls
* 2025-07-23  Marco Del Tutto : Update geomscan file to gdml v02_05
* 2025-07-21  nathanielerowe : reduce number of wc_device params
* 2025-07-21  nathanielerowe : fix tools_maker
* 2025-07-21  nathanielerowe : Initial commit
* 2025-07-21  Linyan Wan : Update default e-lifetime in reco to 35 ms as the run1 e-lifetime study by Sungbin shows
* 2025-07-21  linyan-w : Delete sbndcode/JobConfigurations/standard/g4/lifetime/g4_35ms_electron_lifetime.fcl
* 2025-07-21  Mun Jung Jung : reco2 detvar fcls
* 2025-07-21  Mun Jung Jung : caf etau var fcls for future
* 2025-07-21  linyan-w : Merge pull request #765 from SBNSoftware/feature/linyan-cleanupelifetime
* 2025-07-21  linyan-w : Merge branch 'feature/munjung-detvar_fcls' into feature/linyan-cleanupelifetime
* 2025-07-21  Mun Jung Jung : correct etau variation fcls for wc detsim
* 2025-07-21  Linyan Wan : Remove reference in the CMakeList
* 2025-07-21  Linyan Wan : Remove obsolete e-lifetime directory (these fcls use obsolete handles so will not work)
* 2025-07-19  Mun Jung Jung : fcl with etau 35ms
* 2025-07-18  Mun Jung Jung : update sp only block
* 2025-07-18  Mun Jung Jung : remove dnn related comments from standard fcls
* 2025-07-18  Mun Jung Jung : remove unnecessary comment
* 2025-07-18  Mun Jung Jung : inherit fcls when possible
* 2025-07-18  Mun Jung Jung : put SP sinks back in
* 2025-07-18  Mun Jung Jung : add Linyan's fcls
* 2025-07-18  Marco Del Tutto : Fix TPC dimension on Z. From 509.4 cm to 1670*0.3 = 501 cm
* 2025-07-18  Marco Del Tutto : Add setup script with ROOT version that works with the preparser.
* 2025-07-17  Mun Jung Jung : put dnnroi fcls in a separate job fcl dir
* 2025-07-17  Mun Jung Jung : don't save trad sp images for dnnroi only workflow
* 2025-07-17  Mun Jung Jung : dnnroi only fcls for data
* 2025-07-17  Mun Jung Jung : add dnn roi only workflow for mc
* 2025-07-15  Linyan Wan : Add wiener drops
* 2025-07-15  Linyan Wan : Drop wiener wires and clean up drop files
* 2025-07-09  lynnt20 : Reapply "Merge branch 'develop' into feature/lynnt_ccnuefilter"
* 2025-07-08  lynnt20 : fix to ensure that events with only numu dirt do not pass
* 2025-07-08  lynnt20 : Revert "Merge branch 'develop' into feature/lynnt_ccnuefilter"
* 2025-07-08  lynnt20 : Revert "fix to ensure that events with only numu dirt do not pass"
* 2025-07-08  lynnt20 : Merge branch 'develop' into feature/lynnt_ccnuefilter
* 2025-07-08  lynnt20 : fix to ensure that events with only numu dirt do not pass
* 2025-07-02  lynnt20 : add new `ccnuefilter` filter block, remove deprecated fcl block
* 2025-07-02  lynnt20 : create new rockbox fcl that includes ccnue filter
* 2025-07-02  lynnt20 : make comment syntax uniform
* 2025-06-27  Nathaniel : Merge tag 'v10_06_01' into develop

