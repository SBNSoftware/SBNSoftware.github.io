---
layout: page
title: ReleaseNotes10060005
toc: true
---

-----------------------------------------------------------------------------
| v10.06.00.05 | 05 Sep 2025 | [ReleaseNotes](ReleaseNotes10060005.html) |
| --- | --- | --- |



sbndcode v10_06_00_05 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v10_06_00_05](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v10_06_00_05/sbndcode-v10_06_00_05.html)

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
### Release Notes for [sbndcode] from v10_06_00_04 to v10_06_00_05
- PR #790: Geant4Reweight SBN/SBND implementation
  - **Description**:
  - **Labels**:
  - **Reviewers**: afropapp13
  - **Assignees**:
- PR #794: Change RockBox Min Energy Deposited
  - **Description**: See 792.
  - **Labels**: simulation
  - **Reviewers**: sungbinoh, jzennamo
  - **Assignees**: marcodeltutto
- PR #797: Prepare SCE maps and relevant FHiCLs for detector variation samples for Spring Production
  - **Description**: Three new space charge effect (SCE) maps are created with this PR:  1. SCEoffsets_SBND_E500_dualmap_CV_voxelTH3.root (1.1x nominal in East TPC, 1.4x nominal in West TPC) 2. SCEoffsets_SBND_E500_dualmap_0x_voxelTH3.root (bin contents in CV histogram are multiplied by zero) 3. SCEoffsets_SBND_E500_dualmap_2x_voxelTH3.root (bin contents in CV histogram are multiplied by two)  Scaling of histograms is achieved with the following function: ``` TH3F* scale_TH3F(TH3F* source_hist, string out_name, double scaling) { TH3F* out_hist = (TH3F*) source_hist->Clone(); for(int i=1; i<=source_hist->GetNbinsX(); ++i){ for(int j=1; j<=source_hist->GetNbinsY(); ++j){ for(int k=1; k<=source_hist->GetNbinsZ(); ++k){ Float_t orig = source_hist->GetBinContent(i, j, k); out_hist->SetBinContent(i,j,k, scaling*orig); } } } out_hist->SetName(out_name.c_str()); return out_hist; } ``` As usual, these maps are to be stored in the latest version of **sbnd_data/SCEoffsets**.   For now, I have copied the latest version of sbnd_data to my working directory: **/exp/sbnd/app/users/lkashur/sce_detvar/sbnd_data/**.  Motivation for the scalings used for 1 (1.1x and 1.4x offsets) comes from differences seen in spatial offsets between TPCs using Spring 2025 crossing muon data: <img width="600" alt="sbnd_sce_dx_vs_x_nominal_sim" src="https://github.com/user-attachments/assets/c7b59bfd-a836-46ad-96c8-fb994d99aee2" />  New FHiCL files for g4 simulation point to these maps and are located in **JobConfigurations/standard/g4/sce_variations/**: - g4_enable_nominalspacecharge_sbnd.fcl - g4_enable_zerospacecharge_sbnd.fcl - g4_enable_doublespacecharge_sbnd.fcl  For validation, a small sample of anode-cathode crossing muons was created at the gen stage, and processed with each of the SCE variation maps at the g4 stage.  Resultant simulated spatial offsets in the drift coordinate are shown here.   CV <img width="500"  alt="sim_edeps_sce_detvar_cv" src="https://github.com/user-attachments/assets/53bb692c-6e51-4d61-922e-cf52ea7b5125" />   0x <img width="500" alt="sim_edeps_sce_detvar_0x" src="https://github.com/user-attachments/assets/28012330-25de-4a83-9bae-dadd768aafba" />   2x <img width="500" alt="sim_edeps_sce_detvar_2x" src="https://github.com/user-attachments/assets/8eff212e-c0ee-40de-96af-6a95a8f583b5" />
  - **Labels**: simulation
  - **Reviewers**: mrmooney
  - **Assignees**: lkashur
- PR #803: Frame Shift Module to Correct Timing in Data - PR For Spring Production
  - **Description**: New module for timing reconstruction. Module make data products for downstream reconstruction. Add to reco2 workflow
  - **Labels**: breaking change, reco1/reco2
  - **Reviewers**: JosiePaton
  - **Assignees**: VCLanNguyen

sbndcode sbndcode
---------------------------------------------------

* 2025-09-04  nathanielerowe : Update CMakeLists.txt
* 2025-09-04  nathanielerowe : Merge pull request #803 from SBNSoftware/lnguyen/frame_shift_pr_spring
* 2025-09-04  nathanielerowe : Merge branch 'production/v10_06_00' into lnguyen/frame_shift_pr_spring
* 2025-09-04  nathanielerowe : Merge pull request #797 from SBNSoftware/feature/lkashur_sce_detvar_prod

* 2025-09-04  nathanielerowe : Merge branch 'production/v10_06_00' into feature/lkashur_sce_detvar_prod
* 2025-09-04  nathanielerowe : Merge pull request #794 from SBNSoftware/feature/mdeltutt_v10_06_00_rockbox
* 2025-09-04  nathanielerowe : Merge branch 'production/v10_06_00' into feature/mdeltutt_v10_06_00_rockbox
* 2025-09-04  nathanielerowe : Merge pull request #790 from pgreen135/feature/pgreen_g4rw_for_production
* 2025-09-04  nathanielerowe : Merge branch 'production/v10_06_00' into lnguyen/frame_shift_pr_spring
* 2025-09-04  nathanielerowe : Merge branch 'production/v10_06_00' into feature/mdeltutt_v10_06_00_rockbox
* 2025-09-04  nathanielerowe : Merge branch 'production/v10_06_00' into feature/pgreen_g4rw_for_production
* 2025-09-04  nathanielerowe : Merge branch 'production/v10_06_00' into feature/lkashur_sce_detvar_prod
* 2025-09-04  nathanielerowe : Update product_deps
* 2025-09-04  VCLanNguyen : set default debug as false
* 2025-09-03  Marco Del Tutto : Ensure that the only dirt events pass with the low energy filter rockbox
* 2025-09-03  VCLanNguyen : move parameters to fcl
* 2025-09-02  VCLanNguyen : add labels to fcl
* 2025-09-02  VCLanNguyen : add caf maker fcl parameter
* 2025-09-02  VCLanNguyen : Merge branch 'lnguyen/frame_shift_pr_spring' of https://github.com/SBNSoftware/sbndcode into lnguyen/frame_shift_pr_spring
* 2025-09-02  VCLanNguyen : add new flag to enable/disable timing correction in caf
* 2025-08-29  VCLanNguyen : Merge branch 'production/v10_06_00' into lnguyen/frame_shift_pr_spring
* 2025-08-29  VCLanNguyen : remove comments
* 2025-08-29  VCLanNguyen : move products from sbndcode to sbnobj
* 2025-08-28  VCLanNguyen : Turn missing TDC products exception to a log
* 2025-08-27  Linyan Wan : Adding printout of the SCE map file name to keep record
* 2025-08-27  Linyan Wan : Recover
* 2025-08-27  Linyan Wan : Recover the accidental removed line
* 2025-08-27  Linyan Wan : Add SCE detvar fcls to detvar
* 2025-08-27  Linyan Wan : Move SCE detvars from g4 to detsim
* 2025-08-27  Linyan Wan : Add include into CMake
* 2025-08-27  Linyan Wan : Remove old files
* 2025-08-26  VCLanNguyen : add reco2 fcl + some fixes
* 2025-08-25  lkashur : Add "rockbox" to g4_enable_zerospacecharge_sbnd.fcl
* 2025-08-25  lkashur : Add "rockbox" to g4_enable_nominalspacecharge_sbnd.fcl
* 2025-08-25  lkashur : Add "rockbox" to g4_enable_doublespacecharge_sbnd.fcl
* 2025-08-25  VCLanNguyen : add a new variable to correct at CAF
* 2025-08-25  lkashur : Create g4_enable_nominalspacecharge_sbnd.fcl
* 2025-08-25  lkashur : Create g4_enable_zerospacecharge_sbnd.fcl
* 2025-08-25  lkashur : Create g4_enable_doublespacecharge_sbnd.fcl
* 2025-08-20  Marco Del Tutto : Add fcls for rockbox with min dep energy of 100, and with dep energy btw 1 and 100
* 2025-08-20  Marco Del Tutto : Set min energy for rockbox to 10 MeV instead of 100 MeV
* 2025-08-20  Marco Del Tutto : Add option to set max dep energy
* 2025-08-19  VCLanNguyen : add frame shift to reco2 fcl
* 2025-08-18  nathanielerowe : Merge branch 'production/v10_06_00' into feature/pgreen_g4rw_for_production
* 2025-08-15  VCLanNguyen : add saving additional info
* 2025-08-12  VCLanNguyen : Add a new object TimingInfo to store timestamp in unix format
* 2025-08-06  VCLanNguyen : first commit
* 2025-08-04  Patrick Green : add set of cafmaker fhicls for g4rw
* 2025-07-24  Patrick Green : adding cafmaker fhicl for g4rw
