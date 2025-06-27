---
layout: page
title: ReleaseNotes100601
toc: true
---

-----------------------------------------------------------------------------
| v10.06.01 | 27 Jun 2025 | [ReleaseNotes](ReleaseNotes100601.html) |
| --- | --- | --- |



sbndcode v10_06_01 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v10_06_01](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v10_06_01/sbndcode-v10_06_01.html)

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
### Release Notes for [sbndcode] from v10_06_00_02 to v10_06_01
- PR #736: DNN ROI Finding 
  - **Description**: This PR includes updates to enable DNN ROI finding, as well as configurations for generating samples for training the DNN. When DNN ROI is enabled, `simtpc2d:dnnsp` (or `sptpc2d:dnnsp` for data) `recob:Wire` products are saved, _in addition to_ the traditional `gauss` and `wiener` products.  For now, the option to run signal processing with DNN ROI is set to false, so this PR shouldn't immediately affect the current workflow in any way.  Detailed notes on updates:  - `wcls-sim-drift-depoflux-nf-sp.jsonnet`, `wcls-nf-sp-data.jsonnet`, `wcls-nf-sp.jsonnet` were updated to run just the current SP chain using traditional ROI finding workflow by default (`use_dnnroi == false`) and run both traditional and DNN ROI finding SP chains when `use_dnnroi == true`.  - `dnnroi.jsonnet` contains the function to run DNN ROI finding on an APA  - `wcsimsp_sbnd.fcl` and `wcsp_data_sbnd.fcl` fcls are updated with DNN ROI specific external variables:  - `use_dnnroi`: option to run SP chain using DNN ROI finding, in addition to the traditional SP chain - `nchunks`: number of chunks to divide the wire dimension in for inference, must match the NN training configuration - `tick_per_slice`: scale factor for downsampling in the time dimension for inference, must match the NN training configuration - `dnnroi_model_p0`, `dnnroi_model_p1`: path to NN file, to be stored in `/cvmfs/sbnd.opensciencegrid.org/products/sbnd/sbnd_data/<version>/WireCell`, which is on $WIRECELL_PATH. - `cafmakerjob_sbnd.fcl`,  `cafmakerjob_sbnd_data_base.fcl`, `standard_detsim_sbnd.fcl`, `standard_reco1_sbnd.fcl`, `reco1_data.fcl`, were updated with commented lines that can be uncommented to run the workflow with DNN ROI finding, using the `dnnsp` product.  - `wcls-sim-drift-depoflux-nf-sp-samples_{tru,rec}.jsonnet`, `wirecell_sim_{tru,rec}.fcl`: jsonnets and fcls for generating training samples
  - **Labels**: detsim, data
  - **Reviewers**: jzennamo, weihythu, ebelchio12
  - **Assignees**: wjdanswjddl
- PR #683: Feature/acastill deconvolution database
  - **Description**: This pull request modifies the optical deconvolution module to retrieve the values for the single electron response, SPE and noise filter parameters from the calibration database. This PR is to be merged with 673 .
  - **Labels**: reco1/reco2
  - **Reviewers**:
  - **Assignees**: asanchezcastillo
- PR #740: WireCell Coherent Noise Updated Grouping
  - **Description**: WireCell coherent noise removal updates: channel grouping is updated. Includes some bugfixes (`std.range` is inclusive on start/stop, and some starting channel indices were incorrect). Based on noise-removal performance via covariance matrices, groups that had 128 channels are now split into groups of 64 channels (better performance).  One of the groups of 64 on the APA0 collection plane is split into 32+32, since half of the group is dead.
  - **Labels**: tpc
  - **Reviewers**:
  - **Assignees**: lynnt20
- PR #601: Create README.md
  - **Description**: Creates a `README`
  - **Labels**: documentation
  - **Reviewers**:
  - **Assignees**: mking99456, bear-is-asleep

sbndcode sbndcode
---------------------------------------------------

* 2025-06-27  Nathaniel : Merge branch 'release/v10_06_01'
* 2025-06-27  Nathaniel : Update versioning
* 2025-06-27  nathanielerowe : Update product_deps
* 2025-06-27  nathanielerowe : Merge pull request #601 from SBNSoftware/feature/readme
* 2025-06-27  nathanielerowe : Merge branch 'develop' into feature/readme
* 2025-06-27  nathanielerowe : Merge pull request #740 from SBNSoftware/bugfix/wirecellgrouped
* 2025-06-27  nathanielerowe : Merge branch 'develop' into bugfix/wirecellgrouped
* 2025-06-27  nathanielerowe : Merge pull request #683 from SBNSoftware/feature/acastill_deconvolution_database
* 2025-06-27  nathanielerowe : Merge branch 'develop' into feature/acastill_deconvolution_database
* 2025-06-27  nathanielerowe : Merge pull request #736 from SBNSoftware/feature/munjung-dnnsp_cfg
* 2025-06-27  nathanielerowe : Merge branch 'develop' into bugfix/wirecellgrouped
* 2025-06-27  nathanielerowe : Merge branch 'develop' into feature/munjung-dnnsp_cfg
* 2025-06-27  nathanielerowe : Merge branch 'develop' into feature/acastill_deconvolution_database
* 2025-06-22  nathanielerowe : Update pull_request_template.md
* 2025-06-18  Nathaniel : Merge tag 'v10_06_00_02' into develop
* 2025-06-04  nathanielerowe : Merge branch 'develop' into feature/munjung-dnnsp_cfg
* 2025-05-28  lynnt20 : remove new params from nf jsonnet
* 2025-05-28  lynnt20 : remove new configs from nf jsonnet
* 2025-05-27  nathanielerowe : Merge branch 'develop' into feature/munjung-dnnsp_cfg
* 2025-05-27  nathanielerowe : Merge branch 'develop' into feature/acastill_deconvolution_database
* 2025-05-27  nathanielerowe : Merge branch 'develop' into feature/readme
* 2025-05-20  lynnt20 : add special grouping due to dead 32 channels on collection plane
* 2025-05-19  lynnt20 : update channel grouping - change groups 128 -> 64 due to better performance - some channel start indices were incorrect (bugfix)
* 2025-05-19  lynnt20 : add new configurables for coherent noise removal
* 2025-05-05  Mun Jung Jung : save simdigits for training files
* 2025-04-30  Mun Jung Jung : cfgs to run dnn sp
* 2025-03-26  Alejandro Sánchez Castillo : Fix include
* 2025-03-26  Alejandro Sánchez Castillo : Merge branch 'develop' into feature/acastill_deconvolution_database
* 2025-03-14  Alejandro Sánchez Castillo : Merge branch 'develop' into feature/acastill_deconvolution_database
* 2025-03-05  Alejandro Sánchez Castillo : Fix deconvolution includes
* 2025-03-03  Alejandro Sánchez Castillo : Adapt PMT deconvolution to work with calibration database
* 2025-01-21  Bear Carlson : Create README.md

sbndutil
---------------------------------------------------

* 2025-06-27  Nathaniel : Merge tag 'v10_06_01' into develop
* 2025-06-27  Nathaniel : Merge branch 'release/v10_06_01'
* 2025-06-27  Nathaniel : Update versioning
* 2025-06-18  Nathaniel : Merge tag 'v10_06_00_02' into develop
