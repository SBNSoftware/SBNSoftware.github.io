---
layout: page
title: SBN Production Available Samples wiki
subtitle: Wiki for SBN Production available samples
description: Wiki for the SBN Production Team samples bookkeeping 
hero_height: is-medium
# menubar: sbnprod_menu
toc: true
toc_title: SBN Production Available Samples
---



SBN Production Available Samples Page-
==========================================

A list of samples that were requested and produced since Oct 2020 and the status of open requests can be checked at the [SBN Production Requests Database](https://docs.google.com/spreadsheets/d/17mFPGsP7gw4GRLSCwIL15QrtUnLVri_2k2Wjzhd6Ork/edit?usp=sharing). More information on how to make requests can be found at the [SBN Production Wiki](https://sbnsoftware.github.io/sbn/sbnprod_wiki/Wiki).

The spreadsheet contain the configuration files used, the code version, the statistics produced and the SAM dataset for access. Currently the production passes are organized in spreadsheet tabs. If necessary information can't be found, please email the production group at [sbn-mc-prod@fnal.gov](sbn-mc-prod@fnal.gov)

In 2024, ongoing ICARUS production requests started being tracked with the issue system of GitHub via the dummy repository [SBNSoftware/icarus-production](https://github.com/SBNSoftware/icarus-production/issues).

More information about the workflow can be found at the [SBN Analysis Infrastructure Workflow Management page](../../AnalysisInfrastructure/WorkflowManagement/workflow.md).

[Samweb client commands reference](https://cdcvs.fnal.gov/redmine/projects/sam-main/wiki/Sam_web_client_Command_Reference#samweb-base-options-describe-definition-command-options-ltdataset-definitiongt)

How to access the samples
--------------------------

MC sample datasets are declared to the SBN SAM instance which is acessible to both SBND and ICARUS collaborators. All samweb commands should specify the SBN instance with `samweb -e sbn` <span style="color: red; font-weight: bold;">Nov 2024: MCP2024B SBND currently only on SBND SAM acessible using <code>samweb -e sbnd</code></span>, following are some useful commands:

### Definition commands
- checking definition files: `samweb -e sbn list-definition-files {definition}`
- checking number of files and events (for samples with full metadata): `samweb -e sbn list-definition-files {definition} --summary`

### File commands
- checking metadata: `samweb -e sbn get-metadata {filename}` (fcl files used are listed in metadata) 
- file location: `samweb -e sbn locate-file {filename}`

### Finding the file that contains a specific run/subrun/event (SBND only)
#### **MC samples**
Each SBND MC file has a unique subrun, so one just nedd the run/subrun to identify the file:
- search: `samweb -e sbnd list-files "defname: {dataset name} and run_number run#.subrun#"`

### Accessing files at CNAF
some of ICARUS samples are available at CNAF, those files are declared to samweb and can be accessed from grid jobs from FNAL.

Recommended workflow:
- Identify files  
`samweb -e icarus get-file-access-url --schema https “file-name.root”`
- Copy a few files locally for development/testing  
`ifdh cp -D <url from above command> /path/to/user/data/area/`
- Submit grid jobs over full sample  

More info about CNAF: https://wiki.infn.it/progetti/icarus/home


Monte Carlo official SBN Production Samples
--------------------------

### SBND MC
--------------------------

| Sample Description | production push | release version | # Events | File type | Samweb definition |    
| --- | --- | --- | --- | --- | --- |
| Fall Production 2025 (gen2) - BNB Light - 2e19 POT | SBND2025C | v10_14_02 | ~1M | reco1 | mc_MCP2025C_FallProduction_prodgenie_corsika_proton_rockbox0p1_sbnd_CV_v10_14_02_reco1_sbnd |
| --- | --- | --- | --- | larcv | mc_MCP2025C_FallProduction_prodgenie_corsika_proton_rockbox0p1_sbnd_CV_v10_14_02_larcvreco1_sbnd |
| --- | --- | --- | --- | calib ntuple | mc_MCP2025C_FallProduction_prodgenie_corsika_proton_rockbox0p1_sbnd_CV_v10_14_02_histreco2_sbnd |
| --- | --- | --- | --- | caf | mc_MCP2025C_FallProduction_prodgenie_corsika_proton_rockbox0p1_sbnd_CV_v10_14_02_caf_sbnd |
| --- | --- | --- | --- | flatcaf | mc_MCP2025C_FallProduction_prodgenie_corsika_proton_rockbox0p1_sbnd_CV_v10_14_02_flatcaf_sbnd |
| Spring25 (gen1) BNB+Cosmics - Syst Variations - CV | MC2025B | v10_06_00_10 | ~170k | flatcaf | mc_MCP2025B_1e20_10_prodgenie_corsika_proton_rockbox_sbnd_SystVar_CV_caf_flat_caf_sbnd |
| Syst Variations - No SCE | --- | --- | --- | --- | mc_MCP2025B_1e20_10_prodgenie_corsika_proton_rockbox_sbnd_SystVar_0xSCE_caf_flat_caf_sbnd |
| Syst Variations - 2x SCE | --- | --- | --- | --- | mc_MCP2025B_1e20_10_prodgenie_corsika_proton_rockbox_sbnd_SystVar_2xSCE_caf_flat_caf_sbnd |
| Syst Variations - PMT Gain | --- | --- | --- | --- | mc_MCP2025B_1e20_10_prodgenie_corsika_proton_rockbox_sbnd_SystVar_PMTGainFluct_caf_flat_caf_sbnd |
| Syst Variations - PMT QE | --- | --- | --- | --- | mc_MCP2025B_1e20_10_prodgenie_corsika_proton_rockbox_sbnd_SystVar_PMTLowEff_caf_flat_caf_sbnd |
| Syst Variations - PMT High SPE Noise | --- | --- | --- | --- | mc_MCP2025B_1e20_10_prodgenie_corsika_proton_rockbox_sbnd_SystVar_PMTHighNoise_caf_flat_caf_sbnd |
| Syst Variations - WireMod X-θXW | --- | --- | --- | --- | mc_MCP2025B_1e20_10_prodgenie_corsika_proton_rockbox_sbnd_SystVar_WireMod_XThetaXW_caf_flat_caf_sbnd |
| Syst Variations - WireMod Y-Z | --- | --- | --- | --- | mc_MCP2025B_1e20_10_prodgenie_corsika_proton_rockbox_sbnd_SystVar_WireMod_YZ_caf_flat_caf_sbnd |
| Fall25 Validation II - BNB Light - 1e19 POT | MC2025B |  | ~600k | reco1 | mc_MCP2025C_FallValidationII_prodgenie_corsika_proton_rockbox0p1_sbnd_CV_gen_g4_detsim_reco1_sbnd |
| --- | --- | --- | --- | larcv | mc_MCP2025C_FallValidationII_prodgenie_corsika_proton_rockbox0p1_sbnd_CV_gen_g4_detsim_reco1_larcv_sbnd |
| --- | --- | --- | --- | calib tuple | hist_mc_MCP2025C_FallValidationII_prodgenie_corsika_proton_rockbox0p1_sbnd_CV_reco2_sbnd |
| --- | --- | --- | --- | caf | mc_MCP2025C_FallValidationII_prodgenie_corsika_proton_rockbox0p1_sbnd_CV_caf_sbnd |
| --- | --- | --- | --- | flatcaf | mc_MCP2025C_FallValidationII_prodgenie_corsika_proton_rockbox0p1_sbnd_CV_caf_flat_caf_sbnd |
| Fall25 Validation - Intime - DNN | MC2025B | v10_10_03_02 | ~80k | larcv | mc_MCP2025_FallValidation_prodcorsika_proton_intime_sbnd_CV_gen_g4_detsim_reco1_larcv_sbnd |
| --- | --- | --- | --- | calib tuple | hist_mc_MCP2025_FallValidation_prodcorsika_proton_intime_sbnd_CV_reco2_sbnd |
| --- | --- | --- | --- | caf | mc_MCP2025_FallValidation_prodcorsika_proton_intime_sbnd_CV_caf_sbnd |
| --- | --- | --- | --- | flatcaf | mc_MCP2025_FallValidation_prodcorsika_proton_intime_sbnd_CV_caf_flat_caf_sbnd |
| Fall25 Validation - BNB+Cosmics - DNN | MC2025B | v10_10_03_02 | ~450k | larcv | mc_MCP2025_FallValidation_prodgenie_corsika_proton_rockbox_sbnd_CV_gen_g4_detsim_reco1_larcv_sbnd |
| --- | --- | --- | --- | calib tuple | hist_mc_MCP2025_FallValidation_DNN_prodgenie_corsika_proton_rockbox_sbnd_CV_reco2_sbnd |
| --- | --- | --- | --- | caf | mc_MCP2025_FallValidation_DNN_prodgenie_corsika_proton_rockbox_sbnd_CV_caf_sbnd |
| --- | --- | --- | --- | flatcaf | mc_MCP2025_FallValidation_DNN_prodgenie_corsika_proton_rockbox_sbnd_CV_caf_flat_caf_sbnd |
| Fall25 Validation - BNB+Cosmics | MC2025B | v10_10_03_02 | ~450k | larcv | mc_MCP2025_FallValidation_trad_prodgenie_corsika_proton_rockbox_sbnd_CV_reco1_larcv_sbnd |
| --- | --- | --- | --- | calib tuple | hist_mc_MCP2025_FallValidation_trad_prodgenie_corsika_proton_rockbox_sbnd_CV_reco2_sbnd |
| --- | --- | --- | --- | caf | mc_MCP2025_FallValidation_trad_prodgenie_corsika_proton_rockbox_sbnd_CV_caf_sbnd |
| --- | --- | --- | --- | flat caf | mc_MCP2025_FallValidation_trad_prodgenie_corsika_proton_rockbox_sbnd_CV_caf_flat_caf_sbnd |
| Spring25 - Low Energy 1-100MeV | MC2025B | v10_06_00_05 | ~1.8M | reco1 | mc_MCP2025B_prodgenie_corsika_proton_rockbox_lowenergydirt_sbnd_CV_gen_g4_detsim_reco1_sbnd |
| --- | --- | --- | --- | larcv | mc_MCP2025B_prodgenie_corsika_proton_rockbox_lowenergydirt_sbnd_CV_gen_g4_detsim_reco1_larcv_sbnd |
| --- | --- | v10_06_00_09 | --- | calib tuple | hist_mc_MCP2025B_v10_06_00_09_prodgenie_corsika_proton_rockbox_lowenergydirt_sbnd_CV_reco2_sbnd |
| --- | --- | --- | --- | caf | mc_MCP2025B_v10_06_00_09_prodgenie_corsika_proton_rockbox_lowenergydirt_sbnd_CV_caf_sbnd |
| --- | --- | --- | --- | flatcaf | mc_MCP2025B_v10_06_00_09_prodgenie_corsika_proton_rockbox_lowenergydirt_sbnd_CV_caf_flat_caf_sbnd |
| Spring25 - BNB + Cosmics 1e20 POT (100 events p/ file pre-filter) | MC2025B | v10_06_00_02 | ~6.8M | reco1 | mc_MCP2025B_1e20_02_prodgenie_corsika_proton_rockbox_sbnd_CV_gen_g4_detsim_reco1_sbnd |
| --- | --- | --- | --- | larcv | mc_MCP2025B_1e20_02_prodgenie_corsika_proton_rockbox_sbnd_CV_gen_g4_detsim_reco1_larcv_sbnd  |
| --- | --- | v10_06_00_09 | --- | calib tuple | hist_mc_MCP2025B_1e20_v10_06_00_09_prodgenie_corsika_proton_rockbox_sbnd_CV_reco2_sbnd |
| --- | --- | --- | --- | caf | mc_MCP2025C_1e20_v10_06_00_09_prodgenie_corsika_proton_rockbox_sbnd_CV_caf_sbnd |
| --- | --- | --- | --- | flatcaf | mc_MCP2025C_1e20_v10_06_00_09_prodgenie_corsika_proton_rockbox_sbnd_CV_caf_flat_caf_sbnd |
| Spring25 - Intime Cosmics 1e20 POT (500 events p/ file pre-filter) | MC2025B | v10_06_00_02 | ~2.2M | reco1 | mc_MCP2025B_1e20_02_prodcorsika_proton_intime_sbnd_CV_gen_g4_detsim_reco1_sbnd | 
| --- | --- | --- | --- | larcv | mc_MCP2025B_1e20_02_prodcorsika_proton_intime_sbnd_CV_gen_g4_detsim_reco1_larcv_sbnd  |
| --- | --- | v10_06_00_09 | --- | calib tuple | hist_mc_MCP2025B_1e20_v10_06_00_09_prodcorsika_proton_intime_sbnd_CV_reco2_sbnd |
| --- | --- | --- | --- | caf | mc_MCP2025B_1e20__v10_06_00_09_prodcorsika_proton_intime_sbnd_CV_caf_sbnd |
| --- | --- | --- | --- | flatcaf | mc_MCP2025B_1e20__v10_06_00_09_prodcorsika_proton_intime_sbnd_CV_caf_flat_caf_sbnd |
| Spring25 - BNB + Cosmics 5e18 POT (100 events p/ file pre-filter) | MC2025B | v10_06_00 | ~170k | reco1 | mc_MCP2025B_5e18_prodgenie_corsika_proton_rockbox_sbnd_CV_gen_g4_detsim_reco1_sbnd | 
| --- | --- | --- | --- | larcv | mc_MCP2025B_5e18_prodgenie_corsika_proton_rockbox_sbnd_CV_gen_g4_detsim_reco1_larcv_sbnd |
| --- | --- | v10_06_00_09 | --- | reco2 | mc_MCP2025B_5e18_v10_06_00_09_prodgenie_corsika_proton_rockbox_sbnd_CV_reco2_sbnd |
| --- | --- | --- | --- | calib tuple | hist_mc_MCP2025B_5e18_v10_06_00_09_prodgenie_corsika_proton_rockbox_sbnd_CV_reco2_sbnd |
| --- | --- | --- | --- | caf | mc_MCP2025B_5e18_v10_06_00_09_prodgenie_corsika_proton_rockbox_sbnd_CV_caf_sbnd |
| --- | --- | --- | --- | flatcaf | mc_MCP2025B_5e18_v10_06_00_09_prodgenie_corsika_proton_rockbox_sbnd_CV_caf_flat_caf_sbnd |
| Spring25 - Intime Cosmics 5e18 POT (500 events p/ file pre-filter) | MC2025B | v10_06_00 | ~290k | reco1 | mc_MCP2025B_5e18_prodcorsika_proton_intime_sbnd_CV_gen_g4_detsim_reco1_sbnd | 
| --- | --- | --- | --- | larcv | mc_MCP2025B_5e18_prodcorsika_proton_intime_sbnd_CV_gen_g4_detsim_reco1_larcv_sbnd |
| --- | --- | v10_06_00_09 | --- | reco2 | mc_MCP2025B_5e18_v10_06_00_09_prodcorsika_proton_intime_sbnd_CV_reco2_sbnd |
| --- | --- | --- | --- | calib tuple | hist_mc_MCP2025B_5e18_v10_06_00_09_prodcorsika_proton_intime_sbnd_CV_reco2_sbnd |
| --- | --- | --- | --- | caf | mc_MCP2025B_5e18_v10_06_00_09_prodcorsika_proton_intime_sbnd_CV_caf_sbnd |
| --- | --- | --- | --- | flatcaf | mc_MCP2025B_5e18_v10_06_00_09_prodcorsika_proton_intime_sbnd_CV_caf_flat_caf_sbnd |
| Spring25 - BNB + Cosmics (100 events p/ file pre-filter) | MC2025B | v10_06_00 | ~680k | reco1 | mc_MCP2025B_prodgenie_corsika_proton_rockbox_sbnd_CV_gen_g4_detsim_reco1_sbnd | 
| --- | --- | --- | --- | larcv | mc_MCP2025B_prodgenie_corsika_proton_rockbox_sbnd_CV_gen_g4_detsim_reco1_larcv_sbnd |
| --- | --- | v10_06_00_09 | --- | calib tuple | hist_mc_MCP2025B_v10_06_00_09_prodgenie_corsika_proton_rockbox_sbnd_CV_reco2_sbnd |
| --- | --- | --- | --- | caf | mc_MCP2025B_v10_06_00_09_prodgenie_corsika_proton_rockbox_sbnd_CV_caf_sbnd |
| --- | --- | --- | --- | flatcaf | mc_MCP2025B_v10_06_00_09_prodgenie_corsika_proton_rockbox_sbnd_CV_caf_flat_caf_sbnd |
| Spring25 - Intime Cosmics (500 events p/ file pre-filter) | MC2025B | v10_06_00 | ~510k | reco1 | mc_MCP2025B_prodcorsika_proton_intime_sbnd_CV_gen_g4_detsim_reco1_sbnd | 
| --- | --- | --- | --- | larcv | mc_MCP2025B_prodcorsika_proton_intime_sbnd_CV_gen_g4_detsim_reco1_larcv_sbnd |
| --- | --- | v10_06_00_09 | --- | reco2 | mc_MCP2025B_v10_06_00_09_prodcorsika_proton_intime_sbnd_CV_reco2_sbnd |
| --- | --- | --- | --- | calib tuple | hist_mc_MCP2025B_v10_06_00_09_prodcorsika_proton_intime_sbnd_CV_reco2_sbnd |
| --- | --- | --- | --- | caf | mc_MCP2025B_v10_06_00_09_prodcorsika_proton_intime_sbnd_CV_caf_sbnd |
| --- | --- | --- | --- | flatcaf | mc_MCP2025B_v10_06_00_09_prodcorsika_proton_intime_sbnd_CV_caf_flat_caf_sbnd |
| Spring25 - Nue CC | MC2025B | v10_06_02 | 556k | reco1 | mc_MCP2025B_prodgenie_corsika_proton_rockbox_ccnue_sbnd_reco1_sbnd | 
| --- | --- | --- | --- | caf | mc_MCP2025B_prodgenie_corsika_proton_rockbox_ccnue_sbnd_caf_sbnd |
| --- | --- | --- | --- | flatcaf | mc_MCP2025B_prodgenie_corsika_proton_rockbox_ccnue_sbnd_caf_flat_caf_sbnd |
| --- | --- | v10_06_00_09 | --- | calib tuple | hist_mc_MCP2025C_v10_06_00_09_prodgenie_corsika_proton_rockbox_ccnue_sbnd_CV_reco2_sbnd |
| --- | --- | --- | --- | caf | mc_MCP2025C_v10_06_00_09_prodgenie_corsika_proton_rockbox_ccnue_sbnd_CV_caf_sbnd |
| --- | --- | --- | --- | flatcaf | mc_MCP2025C_v10_06_00_09_prodgenie_corsika_proton_rockbox_ccnue_sbnd_CV_caf_flat_caf_sbnd | 
| Feb25 Workshop - BNB + Cosmics | MC2025A | v10_04_03 | 60k | reco1 | official_MCP2025A_prodoverlay_corsika_cosmics_proton_genie_rockbox_sce_LArv10_gen_g4_detsim_reco1_sbnd | 
| --- | --- | --- | --- | larcv | official_MCP2025A_prodoverlay_corsika_cosmics_proton_genie_rockbox_sce_LArv10_gen_g4_detsim_reco1_larcv_sbnd |
| --- | --- | --- | --- | caf | official_MCP2025A_prodoverlay_corsika_cosmics_proton_genie_rockbox_sce_LArv10_caf_sbnd |
| --- | --- | --- | --- | flatcaf | official_MCP2025A_prodoverlay_corsika_cosmics_proton_genie_rockbox_sce_LArv10_caf_flat_caf_sbnd |
| Feb25 Workshop - BNB + Cosmics | MC2025A | v10_04_01 | 60k | reco1 | official_MCP2025A_prodoverlay_corsika_cosmics_proton_genie_rockbox_sce_MCP2025A_gen_g4_detsim_reco1_sbnd | 
| --- | --- | --- | --- | larcv | official_MCP2025A_prodoverlay_corsika_cosmics_proton_genie_rockbox_sce_MCP2025A_gen_g4_detsim_reco1_larcv_sbnd |
| --- | --- | --- | --- | calib tuple | hist_official_MCP2025A_prodoverlay_corsika_cosmics_proton_genie_rockbox_sce_MCP2025A_reco2_sbnd |
| --- | --- | --- | --- | caf | official_MCP2025A_prodoverlay_corsika_cosmics_proton_genie_rockbox_sce_MCP2025A_caf_sbnd |
| --- | --- | --- | --- | flatcaf | official_MCP2025A_prodoverlay_corsika_cosmics_proton_genie_rockbox_sce_MCP2025A_caf_flat_caf_sbnd |
| BNB + Cosmics - w/o diffusion  | MC2024B | v09_91_02_02 | 50504 | CV reco1 | official_MCP2024B_prodoverlay_corsika_cosmics_proton_genie_rockbox_sce_gen_g4_detsim_reco1_50k_sbnd | 
| --- | --- | --- | --- | reco1 | official_MCP2024B_prodoverlay_corsika_cosmics_proton_genie_rockbox_sce_VAR1_g4_detsim_reco1_sbnd |
| --- | --- | --- | --- | calib tuple | hist_official_MCP2024B_prodoverlay_corsika_cosmics_proton_genie_rockbox_sce_VAR1_reco2_sbnd |
| --- | --- | --- | --- | caf | official_MCP2024B_prodoverlay_corsika_cosmics_proton_genie_rockbox_sce_VAR1_caf_sbnd |
| --- | --- | --- | --- | flatcaf | official_MCP2024B_prodoverlay_corsika_cosmics_proton_genie_rockbox_sce_VAR1_caf_flat_caf_sbnd |
| BNB + Cosmics CV | MC2024B | v09_91_02_02 | 316623 | reco1 | official_MCP2024B_prodoverlay_corsika_cosmics_proton_genie_rockbox_sce_gen_g4_detsim_reco1_sbnd | 
| --- | --- | --- | --- | larcv | official_MCP2024B_prodoverlay_corsika_cosmics_proton_genie_rockbox_sce_gen_g4_detsim_reco1_larcv_sbnd |
| --- | --- | --- | --- | calib tuple | hist_official_MCP2024B_prodoverlay_corsika_cosmics_proton_genie_rockbox_sce_reco2_sbnd |
| --- | --- | --- | --- | caf | official_MCP2024B_prodoverlay_corsika_cosmics_proton_genie_rockbox_sce_caf_sbnd |
| --- | --- | --- | --- | flatcaf | official_MCP2024B_prodoverlay_corsika_cosmics_proton_genie_rockbox_sce_caf_flat_caf_sbnd |
| BNB + Cosmics GENIE CV | MC2023B | v09_75_03_02 | 102189 | reco1 | official_MCP2023B_prodoverlay_corsika_cosmics_proton_genie_rockbox_sce_gen_g4_wcsim_detsim_reco1_sbnd | 
| --- | --- | --- | --- | calib tuple | hist_official_MCP2023B_prodoverlay_corsika_cosmics_proton_genie_rockbox_sce_reco2_sbnd |
| --- | --- | --- | --- | caf | official_MCP2023B_prodoverlay_corsika_cosmics_proton_genie_rockbox_sce_caf_sbnd |
| --- | --- | --- | --- | flatcaf | official_MCP2023B_prodoverlay_corsika_cosmics_proton_genie_rockbox_sce_caf_flat_caf_sbnd |
| BNB + Cosmics GiBUU | MC2023B | v09_75_03_02 | 102189 | reco1 | official_MCP2023B_prodoverlay_corsika_cosmics_proton_gibuu_dirtpropagation_sbnd_gibuu_g4_wcsim_detsim_reco1_sbnd | 
| --- | --- | --- | --- | calib tuple | hist_official_MCP2023B_prodoverlay_corsika_cosmics_proton_gibuu_dirtpropagation_sbnd_reco2_sbnd |
| --- | --- | --- | --- | caf | official_MCP2023B_prodoverlay_corsika_cosmics_proton_gibuu_dirtpropagation_sbnd_caf_sbnd |
| --- | --- | --- | --- | flatcaf | official_MCP2023B_prodoverlay_corsika_cosmics_proton_gibuu_dirtpropagation_sbnd_caf_flat_caf_sbnd |


### ICARUS MC
--------------------------
* NuMI neutrino + cosmics Central Value sample
  
| Sample Description | production push | release version | # Events | File type | Samweb definition |   
| --- | --- | --- | --- | --- | --- |
| NuMI neutrino + cosmics | MC2025A | v09_89_01_02p02 | 200k | stage1 | icaruspro_production_v09_89_01_02p02_2025A_NuMI_nuCos_CV_detsys_nu_cos_CV_stage1 |
| --- | --- | --- | --- | calibtuple | icaruspro_production_v09_89_01_02p02_2025A_NuMI_nuCos_CV_detsys_nu_cos_CV_calibtuple |
| --- | --- | --- | --- | caf | icaruspro_production_v09_89_01_02p02_2025A_NuMI_nuCos_CV_detsys_nu_cos_CV_caf |
| --- | --- | --- | --- | flatcaf | icaruspro_production_v09_89_01_02p02_2025A_NuMI_nuCos_CV_detsys_nu_cos_CV_flatcaf |
| --- | --- | --- | --- | larcv | icaruspro_production_v09_89_01_02p02_2025A_NuMI_nuCos_CV_detsys_nu_cos_CV_larcv |

* NuMI neutrino + cosmics det var samples (Scrub stage:
  
| NuMI DetSyst -High Gain | MC2025A | v09_89_01_02p02 | 200k | calibtuple | icaruspro_production_v09_89_01_02p02_2025A_NuMI_nuCos_CV_detsys_nu_cos_GainHigh_V2_calibtuples |
| --- | --- | --- | --- | caf |icaruspro_production_v09_89_01_02p02_2025A_NuMI_nuCos_CV_detsys_nu_cos_GainHigh_V2_caf |
| --- | --- | --- | --- | flatcaf |icaruspro_production_v09_89_01_02p02_2025A_NuMI_nuCos_CV_detsys_nu_cos_GainHigh_V2_flatcaf |
| transferred to SLAC | --- | --- | --- | larcv |icaruspro_production_v09_89_01_02p02_2025A_NuMI_nuCos_CV_detsys_nu_cos_GainHigh_V2_larcv |

| NuMI DetSyst-Low Gain | MC2025A | v09_89_01_02p02 | 200k | calibtuple |icaruspro_production_v09_89_01_02p02_2025A_NuMI_nuCos_CV_detsys_nu_cos_Gain_Low_calibtuples |
| --- | --- | --- | --- | caf |icaruspro_production_v09_89_01_02p02_2025A_NuMI_nuCos_CV_detsys_nu_cos_Gain_Low_caf|
| --- | --- | --- | --- | flatcaf |icaruspro_production_v09_89_01_02p02_2025A_NuMI_nuCos_CV_detsys_nu_cos_Gain_Low_flatcaf|
| transferred to SLAC | --- | --- | --- | larcv |icaruspro_production_v09_89_01_02p02_2025A_NuMI_nuCos_CV_detsys_nu_cos_Gain_Low_larcv|

| NuMI DetSyst-Low lifetime| MC2025A | v09_89_01_02p02 | 200k | calibtuple |icaruspro_production_v09_89_01_02p02_2025A_NuMI_nuCos_CV_detsys_nu_cos_Low_LT_calibtuples|
| --- | --- | --- | --- | caf |icaruspro_production_v09_89_01_02p02_2025A_NuMI_nuCos_CV_detsys_nu_cos_Low_LT_caf|
| --- | --- | --- | --- | flatcaf |icaruspro_production_v09_89_01_02p02_2025A_NuMI_nuCos_CV_detsys_nu_cos_Low_LT_flatcaf |
| transferred to SLAC | --- | --- | ---  | larcv |icaruspro_production_v09_89_01_02p02_2025A_NuMI_nuCos_CV_detsys_nu_cos_Low_LT_larcv|

| NuMI DetSyst-High lifetime| MC2025A | v09_89_01_02p02 | 200k | calibtuple |icaruspro_production_v09_89_01_02p02_2025A_NuMI_nuCos_CV_detsys_nu_cos_High_LT_calibtuples|
| --- | --- | --- | --- | caf |icaruspro_production_v09_89_01_02p02_2025A_NuMI_nuCos_CV_detsys_nu_cos_High_LT_caf|
| --- | --- | --- | --- | flatcaf |icaruspro_production_v09_89_01_02p02_2025A_NuMI_nuCos_CV_detsys_nu_cos_High_LT_flatcaf |
| transferred to SLAC | --- | --- | ---  | larcv | icaruspro_production_v09_89_01_02p02_2025A_NuMI_nuCos_CV_detsys_nu_cos_High_LT_larcv |

| NuMI DetSyst- Recomb model|MC2025A | v09_89_01_02p02 | 200k | calibtuple |icaruspro_production_v09_89_01_02p02_2025A_NuMI_nuCos_CV_detsys_nu_cos_RecombModel_calibtuples|
| --- | --- | --- | --- | caf |icaruspro_production_v09_89_01_02p02_2025A_NuMI_nuCos_CV_detsys_nu_cos_RecombModel_caf|
| --- | --- | --- | --- | flatcaf |icaruspro_production_v09_89_01_02p02_2025A_NuMI_nuCos_CV_detsys_nu_cos_RecombModel_flatcaf|
| transferred to SLAC | --- | --- | ---  | larcv |icaruspro_production_v09_89_01_02p02_2025A_NuMI_nuCos_CV_detsys_nu_cos_RecombModel_larcv|

| NuMI DetSyst-High TPC Coh Noise|MC2025A|v09_89_01_02p02|200k|calibtuple| icaruspro_production_v09_89_01_02p02_2025A_NuMI_nuCos_CV_detsys_nu_cos_TPCnoice_high_calibtuples|
| --- | --- | --- | --- | caf |icaruspro_production_v09_89_01_02p02_2025A_NuMI_nuCos_CV_detsys_nu_cos_TPCnoice_high_caf|
| --- | --- | --- | --- | flatcaf |icaruspro_production_v09_89_01_02p02_2025A_NuMI_nuCos_CV_detsys_nu_cos_TPCnoice_high_flatcaf|
| transferred to SLAC | --- | --- | ---  | larcv |icaruspro_production_v09_89_01_02p02_2025A_NuMI_nuCos_CV_detsys_nu_cos_TPCnoice_high_larcv|

|NuMI DetSyst-Low TPC Coh Noise|MC2025A|v09_89_01_02p02|200k|calibtuple| icaruspro_production_v09_89_01_02p02_2025A_NuMI_nuCos_CV_detsys_nu_cos_TPCnoice_low_calibtuples|
| --- | --- | --- | --- | caf |icaruspro_production_v09_89_01_02p02_2025A_NuMI_nuCos_CV_detsys_nu_cos_TPCnoice_low_caf|
| --- | --- | --- | --- | flatcaf |icaruspro_production_v09_89_01_02p02_2025A_NuMI_nuCos_CV_detsys_nu_cos_TPCnoice_low_flatcaf|
| transferred to SLAC | --- | --- | ---  | larcv |icaruspro_production_v09_89_01_02p02_2025A_NuMI_nuCos_CV_detsys_nu_cos_TPCnoice_low_larcv|

|NuMI DetSyst-Hgh TPC int noise|MC2025A|v09_89_01_02p02|200k|calibtuple|icaruspro_production_v09_89_01_02p02_2025A_NuMI_nuCos_CV_detsys_nu_cos_TPCnoice_Int_high_calibtuples|
| --- | --- | --- | --- | caf |icaruspro_production_v09_89_01_02p02_2025A_NuMI_nuCos_CV_detsys_nu_cos_TPCnoice_Int_high_caf|
| --- | --- | --- | --- | flatcaf |icaruspro_production_v09_89_01_02p02_2025A_NuMI_nuCos_CV_detsys_nu_cos_TPCnoice_Int_high_flatcaf|
| transferred to SLAC | --- | --- | ---  | larcv |icaruspro_production_v09_89_01_02p02_2025A_NuMI_nuCos_CV_detsys_nu_cos_TPCnoice_Int_high_larcv|

| BNB neutrino + cosmics (Respun CV) | MC2024A | v09_89_01_02p01 | 200k | stage1 | icaruspro_production_v09_89_01_02p01_2024A_ICARUS_MC_Sys_NuCos_2024A_MC_Sys_NuCos_respunCV_2ndV_stage1 |
| --- | --- | --- | --- | calibtuple | icaruspro_production_v09_89_01_02p01_2024A_ICARUS_MC_Sys_NuCos_2024A_MC_Sys_NuCos_respunCV_2ndV_calibtuple |
| --- | --- | --- | --- | caf | icaruspro_production_v09_89_01_02p01_2024A_ICARUS_MC_Sys_NuCos_2024A_MC_Sys_NuCos_respunCV_2ndV_caf |
| --- | --- | --- | --- | flatcaf | icaruspro_production_v09_89_01_02p01_2024A_ICARUS_MC_Sys_NuCos_2024A_MC_Sys_NuCos_respunCV_2ndV_flatcaf |
| --- | --- | --- | --- | larcv | icaruspro_production_v09_89_01_02p01_2024A_ICARUS_MC_Sys_NuCos_2024A_MC_Sys_NuCos_respunCV_2ndV_larcv |
| BNB neutrino + cosmics (CV) | MC2024A | v09_89_01_01 | 200k | calibtuple | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_Sys_NuCos_2024A_MC_Sys_NuCos_CV_2ndV_calibtuple|
| --- | --- | --- | --- | caf | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_Sys_NuCos_2024A_MC_Sys_NuCos_CV_2ndV_caf|
| --- | --- | --- | --- | flatcaf | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_Sys_NuCos_2024A_MC_Sys_NuCos_CV_2ndV_flatcaf|
| --- | --- | --- | --- | larcv | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_Sys_NuCos_2024A_MC_Sys_NuCos_CV_2ndV_larcv|
| BNB neutrino + cosmics det var - Ind1 gain low  | MC2024A | v09_89_01_01p03 | 200k | calibtuple | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_Sys_NuCos_2024A_MC_Sys_NuCos_GainVar_2ndV_calibtuple |
| --- | --- | --- | --- | caf | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_Sys_NuCos_2024A_MC_Sys_NuCos_GainVar_2ndV_caf |
| --- | --- | --- | --- | flatcaf | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_Sys_NuCos_2024A_MC_Sys_NuCos_GainVar_2ndV_flatcaf |
| --- | --- | --- | --- | larcv | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_Sys_NuCos_2024A_MC_Sys_NuCos_GainVar_2ndV_larcv |
| BNB nu only sample (CV) | MC2024A | v09_89_01_01 | 203323 | stage1/reco2 | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_MC_CV_Sys_stage1 |
| --- | --- | --- | --- | calibtuple | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_MC_CV_Sys_calibtuple |
| --- | --- | --- | --- | larcv | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_MC_CV_Sys_larcv |
| --- | --- | --- | --- | caf | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_MC_CV_Sys_caf |
| --- | --- | --- | --- | flatcaf | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_MC_CV_Sys_flatcaf |
| BNB nu only det var - null variation (VAR0) | MC2024A | v09_89_01_01 | 203320 | stage1/reco2 | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR0_null_stage1 |
| --- | --- | --- | --- | calibtuple | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR0_null_calibtuple |
| --- | --- | --- | --- | larcv | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR0_null_larcv |
| --- | --- | --- | --- | caf | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR0_null_caf |
| --- | --- | --- | --- | flatcaf | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR0_null_flatcaf |
| BNB nu only det var - TPC Signal shape variation (VAR1) | MC2024A | v09_89_01_01 | 203316 | stage1/reco2 | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR1_untunedtpcsigshape_stage1 |
| --- | --- | --- | --- | calibtuple | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR1_untunedtpcsigshape_calibtuple |
| --- | --- | --- | --- | larcv | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR1_untunedtpcsigshape_larcv |
| --- | --- | --- | --- | caf | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR1_untunedtpcsigshape_caf |
| --- | --- | --- | --- | flatcaf | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR1_untunedtpcsigshape_flatcaf |
| BNB nu only det var - Middle Induction Minimal Transparency (VAR2) | MC2024A | v09_89_01_01 | 207729 | stage1/reco2 | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR2_tpcind2opaque_stage1 |
| --- | --- | --- | --- | calibtuple | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR2_tpcind2opaque_calibtuple |
| --- | --- | --- | --- | larcv | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR2_tpcind2opaque_larcv |
| --- | --- | --- | --- | caf | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR2_tpcind2opaque_caf |
| --- | --- | --- | --- | flatcaf | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR2_tpcind2opaque_flatcaf |
| BNB nu only det var - Middle Induction Minimal Transparency (VAR3) | MC2024A | v09_89_01_01 | 203316 | stage1/reco2 | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR3_tpcind2transparent_stage1 |
| --- | --- | --- | --- | calibtuple | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR3_tpcind2transparent_calibtuple |
| --- | --- | --- | --- | larcv | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR3_tpcind2transparent_larcv |
| --- | --- | --- | --- | caf | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR3_tpcind2transparent_caf |
| --- | --- | --- | --- | flatcaf | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR3_tpcind2transparent_flatcaf |
| BNB nu only det var - Front Induction Increased Gain Variation (VAR4) | MC2024A | v09_89_01_01 | 203323 | stage1/reco2 | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR4_tpcind1increasegain_stage1 |
| --- | --- | --- | --- | calibtuple | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR4_tpcind1increasegain_calibtuple |
| --- | --- | --- | --- | larcv | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR4_tpcind1increasegain_larcv |
| --- | --- | --- | --- | caf | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR4_tpcind1increasegain_caf |
| --- | --- | --- | --- | flatcaf | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR4_tpcind1increasegain_flatcaf |
| BNB nu only det var - Front Induction Decreased Gain Variation (VAR5) | MC2024A | v09_89_01_01 | 203148 | stage1/reco2 | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR5_tpcind1decreasegain_stage1 |
| --- | --- | --- | --- | calibtuple | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR5_tpcind1decreasegain_calibtuple |
| --- | --- | --- | --- | larcv | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR5_tpcind1decreasegain_larcv |
| --- | --- | --- | --- | caf | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR5_tpcind1decreasegain_caf |
| --- | --- | --- | --- | flatcaf | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR5_tpcind1decreasegain_flatcaf |
| BNB nu only det var - PMT Quantum Efficiency Variation (VAR6) | MC2024A | v09_89_01_01 | 203284 | stage1/reco2 | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR6_pmtdecreasedqe_stage1 |
| --- | --- | --- | --- | calibtuple | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR6_pmtdecreasedqe_calibtuple |
| --- | --- | --- | --- | larcv | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR6_pmtdecreasedqe_larcv |
| --- | --- | --- | --- | caf | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR6_pmtdecreasedqe_caf |
| --- | --- | --- | --- | flatcaf | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR6_pmtdecreasedqe_flatcaf |
| BNB nu only det var - Recombination Model Variation (VAR7) | MC2024A | v09_89_01_01 | 203323 | stage1/reco2 | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR7_ellipsoidalrecomb_stage1 |
| --- | --- | --- | --- | calibtuple | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR7_ellipsoidalrecomb_calibtuple |
| --- | --- | --- | --- | larcv | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR7_ellipsoidalrecomb_larcv |
| --- | --- | --- | --- | caf | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR7_ellipsoidalrecomb_caf |
| --- | --- | --- | --- | flatcaf | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR7_ellipsoidalrecomb_flatcaf |
| BNB nu only det var - TPC Coherent Noise Increase Variation (VAR8) | MC2024A | v09_89_01_01 | 202614 | stage1/reco2 | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR8_tpccohnoisep1sigma_stage1 |
| --- | --- | --- | --- | calibtuple | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR8_tpccohnoisep1sigma_calibtuple |
| --- | --- | --- | --- | larcv | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR8_tpccohnoisep1sigma_larcv |
| --- | --- | --- | --- | caf | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR8_tpccohnoisep1sigma_caf |
| --- | --- | --- | --- | flatcaf | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR8_tpccohnoisep1sigma_flatcaf |
| BNB nu only det var - TPC Coherent Noise Decrease Variation (VAR9) | MC2024A | v09_89_01_01 | 202733 | stage1/reco2 | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR9_tpccohnoisem1sigma_stage1 |
| --- | --- | --- | --- | calibtuple | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR9_tpccohnoisem1sigma_calibtuple |
| --- | --- | --- | --- | larcv | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR9_tpccohnoisem1sigma_larcv |
| --- | --- | --- | --- | caf | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR9_tpccohnoisem1sigma_caf |
| --- | --- | --- | --- | flatcaf | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR9_tpccohnoisem1sigma_flatcaf |
| BNB nu only det var - TPC Intrinsic Noise Increase Variation (VAR10) | MC2024A | v09_89_01_01 | 202887 | stage1/reco2 | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR10_tpcintnoisep1sigma_stage1 |
| --- | --- | --- | --- | calibtuple | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR10_tpcintnoisep1sigma_calibtuple |
| --- | --- | --- | --- | larcv | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR10_tpcintnoisep1sigma_larcv |
| --- | --- | --- | --- | caf | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR10_tpcintnoisep1sigma_caf |
| --- | --- | --- | --- | flatcaf | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR10_tpcintnoisep1sigma_flatcaf |
| BNB nu only det var - TPC Intrinsic Noise Decrease Variation (VAR11) | MC2024A | v09_89_01_01 | 202568 | stage1/reco2 | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR11_tpcintnoisem1sigma_stage1 |
| --- | --- | --- | --- | calibtuple | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR11_tpcintnoisem1sigma_calibtuple |
| --- | --- | --- | --- | larcv | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR11_tpcintnoisem1sigma_larcv |
| --- | --- | --- | --- | caf | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR11_tpcintnoisem1sigma_caf |
| --- | --- | --- | --- | flatcaf | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR11_tpcintnoisem1sigma_flatcaf |
| BNB nu only det var  - New Light Variation (VAR12) | MC2024A | v09_89_01_01 | 203282 | stage1/reco2 | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR12_pmtdecreasedqe2_stage1 |
| --- | --- | --- | --- | calibtuple | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR12_pmtdecreasedqe2_calibtuple |
| --- | --- | --- | --- | larcv | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR12_pmtdecreasedqe2_larcv |
| --- | --- | --- | --- | caf | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR12_pmtdecreasedqe2_caf |
| --- | --- | --- | --- | flatcaf | icaruspro_production_v09_89_01_01_2024A_ICARUS_MC_CV_Sys_2024A_Sys_VAR12_pmtdecreasedqe2_flatcaf |
| BNB + Intime Cosmics (2d deconvolution validation) | MC2024A | v09_83_01 | 24851 | calibtuple |  icaruspro_production_v09_83_01_2024A_ICARUS_BNB_Intime_Cosmics_MC_2024_BNB_MC_calibtuple |
| --- | --- | --- | --- | caf | icaruspro_production_v09_83_01_2024A_ICARUS_BNB_Intime_Cosmics_MC_2024_BNB_MC_caf |
| --- | --- | --- | --- | flatcaf | icaruspro_production_v09_83_01_2024A_ICARUS_BNB_Intime_Cosmics_MC_2024_BNB_MC_flatcaf |
| NuMI Dirt + Cosmic | MC2023A | v09_72_00_03 | 211500 | reco2 |  icaruspro_v09_72_00_03_2023A_ICARUS_NuMI_MC_dirt_plus_cosmics_pretuned_signal_shape_stage1 |
| --- | --- | --- | --- | calibtuple |  icaruspro_production_v09_72_00_03_2023A_ICARUS_NuMI_MC_dirt_plus_cosmics_pretuned_signal_shape_calibtuple |
| --- | --- | --- | --- | caf | icaruspro_production_v09_72_00_03_2023A_ICARUS_NuMI_MC_dirt_plus_cosmics_pretuned_signal_shape_caf |
| --- | --- | --- | --- | flatcaf | icaruspro_production_v09_72_00_03_2023A_ICARUS_NuMI_MC_dirt_plus_cosmics_pretuned_signal_shape_flatcaf |
| NuMI Intime Cosmic | MC2023A | v09_72_00_03 | 200375 | reco2 | icaruspro_v09_72_00_03_2023A_ICARUS_NuMI_MC_intime_cosmics_pretuned_signal_shape_stage1 |
| --- | --- | --- | --- | calibtuple |  icaruspro_production_v09_72_00_03_2023A_ICARUS_NuMI_MC_intime_cosmics_pretuned_signal_shape_calibtuple |
| --- | --- | --- | --- | caf | icaruspro_production_v09_72_00_03_2023A_ICARUS_NuMI_MC_intime_cosmics_pretuned_signal_shape_caf |
| --- | --- | --- | --- | flatcaf | icaruspro_production_v09_72_00_03_2023A_ICARUS_NuMI_MC_intime_cosmics_pretuned_signal_shape_flatcaf |
| NuMI Neutrino MC Phase 1 | MC2023A | v09_72_00_03 | 586890 | reco2 | icaruspro_v09_72_00_03_2023A_ICARUS_NuMI_MC_Nu_Phase1_sample_pretuned_signal_shape_stage1 |
| ICARUS BNB Mini Production intime cosmics | MC2023A | v09_72_00_01 | 90093 | reco2 |  icaruspro_2023A_ICARUS_BNB_cosmics_reco2 |
| --- | --- | --- | --- | calibtuple | icaruspro_hists_2023A_ICARUS_BNB_cosmics_reco2 |
| --- | --- | --- | --- | caf | icaruspro_2023A_ICARUS_BNB_cosmics_caf |
| --- | --- | --- | --- | flatcaf | icaruspro_2023A_ICARUS_BNB_cosmics_flatcaf | 
| ICARUS BNB Mini Production | MC2023A | v09_69_01 | 94980 | reco2 |  icaruspro_2023A_ICARUS_BNB_cosmics_reco2 |
| --- | --- | --- | --- | calibtuple | icaruspro_hists_2023A_ICARUS_BNB_cosmics_reco2 |
| --- | --- | --- | --- | caf | icaruspro_2023A_ICARUS_NuMI_MC_flatcaf_2023Mar10 |
| --- | --- | --- | --- | flatcaf | icaruspro_2023A_ICARUS_NuMI_MC_flatcaf_2023Mar10 |
| NuMI Neutrino Mini Production | MC2023A | v09_68_00_01 | 74600 | calibtuples | icaruspro_2023A_ICARUS_NuMI_MC_caf_2023Mar10 |
| --- | --- | --- | --- | caf | icaruspro_2023A_ICARUS_NuMI_MC_caf_2023Mar10 |
| --- | --- | --- | --- | flatcaf | icaruspro_2023A_ICARUS_NuMI_MC_flatcaf_2023Mar10 |
| NuMI in-time cosmics w/Overburden | MC2022A | v09_37_02_04 | 809054 | reco2 | IcarusProd_2022A_NUMI_in-time_Cosmics_withOverburden_v09_37_02_04_reco2 |
| --- | --- | --- | --- | calibtuples |  IcarusProd_2022A_NUMI_in-time_Cosmics_withOverburden_v09_37_02_04_calibtuples |
| --- | --- | --- | --- | caf | IcarusProd_2022A_NUMI_in-time_Cosmics_withOverburden_v09_37_02_07_caf |
| --- | --- | --- | --- | flatcaf | IcarusProd_2022A_NUMI_in-time_Cosmics_withOverburden_v09_37_02_07_flatcaf |
| ICARUS_numi_higgs_M200_th2e-4_KDIF | MC2022A | v09_37_02_05 | 77950 | reco2 | IcarusProd_2022A_ICARUS_numi_higgs_M200_th2e-4_KDIF_reco2 |
| --- | --- | --- | 77950 | caf | IcarusProd_2022A_ICARUS_numi_higgs_M200_th2e-4_KDIF_caf |
| --- | --- | --- | 77950 | flatcaf | IcarusProd_2022A_ICARUS_numi_higgs_M200_th2e-4_KDIF_flatcaf |
| ICARUS_numi_higgs_M150_th2e-4_KDIF | MC2022A | v09_37_02_05 | 56300 | reco2 | IcarusProd_2022A_ICARUS_numi_higgs_M150_th2e-4_KDIF_reco2 |
| --- | --- | --- | 56300 | caf | IcarusProd_2022A_ICARUS_numi_higgs_M150_th2e-4_KDIF_caf |
| --- | --- | --- | 56300 | flatcaf | IcarusProd_2022A_ICARUS_numi_higgs_M150_th2e-4_KDIF_flatcaf |
| ICARUS_numi_higgs_M100_th2e-4_KDIF | MC2022A | v09_37_02_05 | 111100 | reco2 | IcarusProd_2022A_ICARUS_numi_higgs_M100_th2e-4_KDIF_reco2 |
| --- | --- | --- | 110900 | caf | IcarusProd_2022A_ICARUS_numi_higgs_M100_th2e-4_KDIF_caf |
| --- | --- | --- | 110900 | flatcaf | IcarusProd_2022A_ICARUS_numi_higgs_M100_th2e-4_KDIF_flatcaf |
| ICARUS_numi_higgs_M050_th2e-4_KDIF | MC2022A | v09_37_02_05 | 59850 | reco2 | IcarusProd_2022A_ICARUS_numi_higgs_M050_th2e-4_KDIF_reco2 |
| --- | --- | --- | 59750 | caf | IcarusProd_2022A_ICARUS_numi_higgs_M050_th2e-4_KDIF_caf |
| --- | --- | --- | 59750 | flatcaf | IcarusProd_2022A_ICARUS_numi_higgs_M050_th2e-4_KDIF_flatcaf |
| ICARUS intime cosmics 1D drift simulation waveform files | MC2022A | v09_51_00 | 217,332 | reco2 | IcarusProd_2022A_Intime_Cosmic_WF_v09_51_00_reco2 | 
| --- | --- | --- | 204,630 | calib tuple | IcarusProd_2022A_Intime_Cosmic_WF_v09_51_00_calibtuples |
| NUMI in-time cosmics with Overburden | MC2022A | v09_37_02_04 | 809,054 | reco2 | IcarusProd_2022A_NUMI_in-time_Cosmics_withOverburden_v09_37_02_04_reco2 | 
| --- | --- | --- | --- | calib tuple | IcarusProd_2022A_NUMI_in-time_Cosmics_withOverburden_v09_37_02_04_calibtuples |
| --- | --- | v09_37_02_07 | 809,054 | caf | IcarusProd_2022A_NUMI_in-time_Cosmics_withOverburden_v09_37_02_07_caf |
| --- | --- | --- | --- | flatcaf | IcarusProd_2022A_NUMI_in-time_Cosmics_withOverburden_v09_37_02_07_flatcaf |
| NUMI in-time cosmics without Overburden | MC2022A | v09_37_02_04 | 1,441,943 | reco2 | IcarusProd_2022A_NUMI_in-time_Cosmics_v09_37_02_04_reco2 | 
| --- | --- | --- | --- | calib tuple | IcarusProd_2022A_NUMI_in-time_Cosmics_v09_37_02_04_calibtuples |
| --- | --- | v09_37_02_07 | 1,443,061 | caf | IcarusProd_2022A_NUMI_in-time_Cosmics_v09_37_02_07_caf |
| --- | --- | --- | --- | flatcaf | IcarusProd_2022A_NUMI_in-time_Cosmics_v09_37_02_07_flatcaf |
| BNB in-time cosmics with Overburden | MC2022A | v09_37_02_04 | 1,909,017 | reco2 | IcarusProd_2022A_BNB_in-time_Cosmics_v09_37_02_04_reco2 | 
| --- | --- | --- | --- | calib tuple | IcarusProd_2022A_BNB_in-time_Cosmics_v09_37_02_04_calibtuples |
| --- | --- | v09_37_02_07 | 1,909,017 | caf | IcarusProd_2022A_BNB_in-time_Cosmics_v09_37_02_07_caf |
| --- | --- | --- | --- | flatcaf | IcarusProd_2022A_BNB_in-time_Cosmics_v09_37_02_07_flatcaf |
| nu+cosmics w/Overburden | MC2022A | v09_37_02_04 | 437044 | reco1 | IcarusProd2022A_icarus_BNB_Nu_Cosmics_v09_37_02_04_reco1 |
| --- | --- | --- | --- | reco2 | IcarusProd2022A_icarus_BNB_Nu_Cosmics_v09_37_02_04_reco2 |
| --- | --- | --- | --- | calib tuples | hist_IcarusProd2022A_icarus_BNB_Nu_Cosmics_v09_37_02_04_reco2 |
| --- | --- | --- | 346060 | caf | IcarusProd2022A_icarus_BNB_Nu_Cosmics_v09_37_02_04_caf |
| --- | --- | --- | --- | flatcaf | IcarusProd2022A_icarus_BNB_Nu_Cosmics_v09_37_02_04_flatcaf |
| NuMI nu+cosmics w/o Overburden | MC2022A | v09_37_02_04 | --- | reco1 | IcarusProd2022A_icarus_numi_nu_cosmics_v09_37_02_04_reco1 |
| --- | --- | --- | --- | reco2 | IcarusProd2022A_icarus_numi_nu_cosmics_v09_37_02_04_reco2 |
| --- | --- | --- | 628249 | caf | IcarusProd2022A_icarus_numi_nu_cosmics_v09_37_02_04_caf |
| BNB fullosc+cosmics w/Overburden | MC2022A | v09_37_02_04 | --- | reco1 | IcarusProd_2022A_BNB_FullOsc_Cosmics_v09_37_02_04_reco1 |
| --- | --- | --- | --- | reco2 | IcarusProd_2022A_BNB_FullOsc_Cosmics_v09_37_02_04_reco2 |
| --- | --- | --- | 194 | caf | IcarusProd_2022A_BNB_FullOsc_Cosmics_v09_37_02_04_caf |
| BNB nue+cosmics w/Overburden | MC2022A | v09_37_02_04 | --- | reco1 | IcarusProd_2022A_BNB_Nue_Cosmics_v09_37_02_04_reco1 |
| --- | --- | --- | --- | reco2 | IcarusProd_2022A_BNB_Nue_Cosmics_v09_37_02_04_reco2 |
| --- | --- | --- | 200 | caf | IcarusProd_2022A_BNB_Nue_Cosmics_v09_37_02_04_caf |
| NuMI full-osc+cosmics w/o Overburden | MC2022A | v09_37_02_04 | --- | reco1 | IcarusProd_2022A_NuMI_FullOsc_Cosmics_v09_37_02_04_reco1 |
| --- | --- | --- | --- | reco2 | IcarusProd_2022A_NuMI_FullOsc_Cosmics_v09_37_02_04_reco2 |
| --- | --- | --- | 3724 | caf | IcarusProd_2022A_NuMI_FullOsc_Cosmics_v09_37_02_04_caf |
| NuMI nue+cosmics w/o Overburden | MC2022A | v09_37_02_04 | --- | reco1 | IcarusProd_2022A_NuMI_Nue_Cosmics_v09_37_02_04_reco1 |
| --- | --- | --- | --- | reco2 | IcarusProd_2022A_NuMI_Nue_Cosmics_v09_37_02_04_reco2 |
| --- | --- | --- | 3554 | caf | IcarusProd_2022A_NuMI_Nue_Cosmics_v09_37_02_04_caf |
| Cosmics, Lifetime 3.5 ms, No SCE  | MCP2021C | v09_37_01_03p01 | 24400 | reco2 | IcarusProd_PuritySample_eLifetime3.5ms_NoSCE_v09_37_01_03p01_reco2 |
| --- | --- | --- | --- | calib ntuples | IcarusProd_PuritySample_eLifetime3.5ms_NoSCE_v09_37_01_03p01_calibtuples |
| Cosmics, Lifetime 6 ms, No SCE  | MCP2021C | v09_37_01_03p01 | 24400 | reco2 | IcarusProd_PuritySample_eLifetime6ms_NoSCE_v09_37_01_03p01_reco2 |
| --- | --- | --- | --- | calib ntuples | IcarusProd_PuritySample_eLifetime6ms_NoSCE_v09_37_01_03p01_calibtuples |
| Cosmics, Lifetime 3.5 ms, No Diffusion  | MCP2021C | v09_37_01_03p01 | 20925 | reco2 | IcarusProd_PuritySample_eLifetime3.5ms_NoDiffusion_v09_37_01_03p01_reco2 |
| --- | --- | --- | --- | calib ntuples | IcarusProd_PuritySample_eLifetime3.5ms_NoDiffusion_v09_37_01_03p01_calibtuples |
| Cosmics, Lifetime 6 ms, No Diffusion  | MCP2021C | v09_37_01_03p01 | 20750 | reco2 | IcarusProd_PuritySample_eLifetime6ms_NoDiffusion_v09_37_01_03p01_reco2 |
| --- | --- | --- | --- | calib ntuples | IcarusProd_PuritySample_eLifetime6ms_NoDiffusion_v09_37_01_03p01_calibtuples |
| Cosmics, Lifetime 3.5 ms, No SCE No Diffusion | MCP2021C | v09_37_01_03p01 | 21125 | reco2 | IcarusProd_PuritySample_eLifetime3.5ms_NoSCE_NoDiffusion_v09_37_01_03p01_reco2 |
| --- | --- | --- | --- | calib ntuples | IcarusProd_PuritySample_eLifetime3.5ms_NoSCE_NoDiffusion_v09_37_01_03p01_calibtuples |
| Cosmics, Lifetime 6 ms, No SCE No Diffusion | MCP2021C | v09_37_01_03p01 | 20600 | reco2 | IcarusProd_PuritySample_eLifetime6ms_NoSCE_NoDiffusion_v09_37_01_03p01_reco2 |
| --- | --- | --- | --- | calib ntuples | IcarusProd_PuritySample_eLifetime6ms_NoSCE_NoDiffusion_v09_37_01_03p01_calibtuples |
| Cosmics, Lifetime 1 ms  | MCP2021C | v09_37_01_03p01 | 20200 | reco2 | IcarusProd_PuritySample_eLifetime1ms_v09_37_01_03p01_reco2_commonruns |
| --- | --- | --- | --- | calib ntuples | IcarusProd_PuritySample_eLifetime1ms_v09_37_01_03p01_calibtuples_commonruns |
| Cosmics, Lifetime 3.5 ms  | MCP2021C | v09_37_01_03p01 | 20200 | reco2 | IcarusProd_PuritySample_eLifetime3.5ms_v09_37_01_03p01_reco2_commonruns |
| --- | --- | --- | --- | calib ntuples | IcarusProd_PuritySample_eLifetime3.5ms_v09_37_01_03p01_calibtuples_commonruns |
| Cosmics, Lifetime 6 ms  | MCP2021C | v09_37_01_03p01 | 20200 | reco2 | IcarusProd_PuritySample_eLifetime6ms_v09_37_01_03p01_reco2_commonruns |
| --- | --- | --- | --- | calib ntuples | IcarusProd_PuritySample_eLifetime6ms_v09_37_01_03p01_calibtuples_commonruns |
| Cosmics, Lifetime 10 ms  | MCP2021C | v09_37_01_03p01 | 20200 | reco2 | IcarusProd_PuritySample_eLifetime10ms_v09_37_01_03p01_reco2_commonruns |
| --- | --- | --- | --- | calib ntuples | IcarusProd_PuritySample_eLifetime10ms_v09_37_01_03p01_calibtuples_commonruns |
| NuMI nue + cosmics | MCP2021C | v09_37_01_02p01 | 13326 | reco1 | Official_IcarusProd2021C_NUMI_Nue_Cosmics_v09_37_01_02p01_reco1 |
| --- | --- | --- | 13326 | reco2 | Official_IcarusProd2021C_NUMI_Nue_Cosmics_v09_37_01_02p01_reco2 |
| --- | --- | --- | --- | calib ntuples | Official_IcarusProd2021C_NUMI_Nue_Cosmics_v09_37_01_02p01_CalibTuples |
| --- | --- | v09_37_01_03p01 | 13326 | caf |Official_IcarusProd2021C_NUMI_Nue_Cosmics_v09_37_01_03p01_caf |
| NuMI nu + cosmic | MCP2021C | v09_37_01_02p01 | 48487 | reco1 | Official_IcarusProd2021C_NUMI_Nu_Cosmics_v09_37_01_02p01_reco1 |
| --- | --- | --- | 48459 | reco2 | Official_IcarusProd2021C_NUMI_Nu_Cosmics_v09_37_01_02p01_reco2 |
| --- | --- | --- | --- | calib ntuples | Official_IcarusProd2021C_NUMI_Nu_Cosmics_v09_37_01_02p01_CalibTuples |
| --- | --- | v09_37_01_03p01 | 48459 | caf | Official_IcarusProd2021C_NUMI_Nu_Cosmics_v09_37_01_03p01_caf |
| NUMI full osc | MCP2021C | v09_37_01_02p01 | 16565 | reco1 | Official_IcarusProd2021C_NUMI_FullOsc_Cosmics_v09_37_01_02p01_reco1 |
| --- | --- | --- | 16564 | reco2 | Official_IcarusProd2021C_NUMI_FullOsc_Cosmics_v09_37_01_02p01_reco2 |
| --- | --- | --- | --- | calib ntuples | Official_IcarusProd2021C_NUMI_FullOsc_Cosmics_v09_37_01_02p01_CalibTuples |
| --- | --- | v09_37_01_03p01 | 16564 | caf | Official_IcarusProd2021C_NUMI_FullOsc_Cosmics_v09_37_01_03p01_caf |
| NUMI Intime Cosmics | MCP2021C | v09_37_01_02p01 | 350794 | reco1 | Official_IcarusProd2021C_NUMI_in-time_Cosmics_v09_37_01_02p01_reco1 |
| --- | --- | --- | 350554 | reco2 | Official_IcarusProd2021C_NUMI_in-time_Cosmics_v09_37_01_02p01_reco2 |
| --- | --- | --- | --- | calib ntuples | Official_IcarusProd2021C_NUMI_in-time_Cosmics_v09_37_01_02p01_CalibTuples |
| --- | --- | v09_37_01_03p01 | 350554 | caf | Official_IcarusProd2021C_NUMI_in-time_Cosmics_v09_37_01_03p01_caf |
| BNB nue + cosmic | MCP2021C | v09_37_01_02p01 | 2549 | reco1 | Official_IcarusProd2021C_BNB_Nue_Cosmics_v09_37_01_02p01_reco1 |
| --- | --- | --- | 2549 | reco2 | Official_IcarusProd2021C_BNB_Nue_Cosmics_v09_37_01_02p01_reco2 |
| --- | --- | --- | --- | calib ntuples | Official_IcarusProd2021C_BNB_Nue_Cosmics_v09_37_01_02p01_CalibTuples |
| --- | --- | v09_37_01_03p01 | 2549 | caf | Official_IcarusProd2021C_BNB_Nue_Cosmics_v09_37_01_03p01_caf |
| BNB nu + cosmics |MCP2021C | v09_37_01_02p01 | 34800 | reco1 | Official_IcarusProd2021C_BNB_Nu_Cosmics_v09_37_01_02p01_reco1 |
| --- | --- | --- | 34770 | reco2 | Official_IcarusProd2021C_BNB_Nu_Cosmics_v09_37_01_02p01_reco2 |
| --- | --- | --- | --- | calib ntuples | Official_IcarusProd2021C_BNB_Nu_Cosmics_v09_37_01_02p01_CalibTuples |
| --- | --- | v09_37_01_03p01 | 34770 | caf | Official_IcarusProd2021C_BNB_Nu_Cosmics_v09_37_01_03p01_caf |
| BNB full osc | MCP2021C | v09_37_01_02p01 | 2146 | reco1 | Official_IcarusProd2021C_BNB_FullOsc_Cosmics_v09_37_01_02p01_reco1 |
| --- | --- | --- | 2129 | reco2 | Official_IcarusProd2021C_BNB_FullOsc_Cosmics_v09_37_01_02p01_reco2 |
| --- | --- | --- | --- | calib ntuples | Official_IcarusProd2021C_BNB_FullOsc_Cosmics_v09_37_01_02p01_CalibTuples |
| --- | --- | v09_37_01_03p01 | 2129 | caf | Official_IcarusProd2021C_BNB_FullOsc_Cosmics_v09_37_01_03p01_caf |
| BNB Intime Cosmics | MCP2021C | v09_37_01_02p01 | 339541 | reco1 | Official_IcarusProd2021C_BNB_in-time_Cosmics_v09_37_01_02p01_reco1 |
| --- | --- | --- | 339305 | reco2 | Official_IcarusProd2021C_BNB_in-time_Cosmics_v09_37_01_02p01_reco2 |
| --- | --- | --- | --- | calib ntuples | Official_IcarusProd2021C_BNB_in-time_Cosmics_v09_37_01_02p01_CalibTuples |
| --- | --- | v09_37_01_03p01 | 339257 | caf | Official_IcarusProd2021C_BNB_in-time_Cosmics_v09_37_01_03p01_caf |
| NuMI nue + cosmics | MCP2021B | v09_28_01_01_01 | 10020 | reco2 | IcarusProd2021B_NuMI_Nue_Cosmics_v09_28_01_01_01_reco2 |
| --- | --- | --- | --- | calib ntuples | IcarusProd2021B_NuMI_Nue_Cosmics_v09_28_01_01_01_CalibTuples |
| --- | --- | --- | 10020 | caf |IcarusProd2021B_NuMI_Nue_Cosmics_v09_28_01_01_01_caf |
| NuMI + cosmic | MCP2021B | v09_28_01_01_01 | 60278 | reco1 | IcarusProd2021B_NuMI_Nu_Cosmics_v09_28_01_01_01_reco1 |
| --- | --- | --- | 59625 | reco2 | IcarusProd2021B_NuMI_Nu_Cosmics_v09_28_01_01_01_reco2 |
| --- | --- | --- | --- | calib ntuples | IcarusProd2021B_NuMI_Nu_Cosmics_v09_28_01_01_01_CalibTuples |
| --- | --- | --- | 59625 | caf | IcarusProd2021B_NuMI_Nu_Cosmics_v09_28_01_01_01_caf |
| BNB nue + cosmic | MCP2021B | v09_28_01_01_01 | 16598 | reco1 | IcarusProd2021B_BNB_Nue_Cosmics_v09_28_01_01_01_reco1 |
| --- | --- | --- | 15471 | reco2 | IcarusProd2021B_BNB_Nue_Cosmics_v09_28_01_01_01_reco2 |
| --- | --- | --- | --- | calib ntuples | IcarusProd2021B_BNB_Nue_Cosmics_v09_28_01_01_01_CalibTuples |
| --- | --- | --- | 15471 | caf | IcarusProd2021B_BNB_Nue_Cosmics_v09_28_01_01_01_caf |
| BNB full osc | MCP2021B | v09_28_01_01_01 | 16091 | reco1 | IcarusProd2021B_BNB_FullOsc_Cosmics_v09_28_01_01_01_reco1 |
| --- | --- | --- | 15960 | reco2 | IcarusProd2021B_BNB_FullOsc_Cosmics_v09_28_01_01_01_reco2 |
| --- | --- | --- | --- | calib ntuples | IcarusProd2021B_BNB_FullOsc_Cosmics_v09_28_01_01_01_CalibTuples |
| --- | --- | --- | 9048 | caf | IcarusProd2021B_BNB_FullOsc_Cosmics_v09_28_01_01_01_caf |
| Intime Cosmics | MCP2021B | v09_28_01_01_01 | 50479 | reco1 | IcarusProd2021B_Intime_Cosmic_v09_28_01_01_01_reco1 |
| --- | --- | --- | 50452 | reco2 | IcarusProd2021B_Intime_Cosmic_v09_28_01_01_01_reco2 |
| --- | --- | --- | --- | calib ntuples | IcarusProd2021B_Intime_Cosmic_v09_28_01_01_01_CalibTuples |
| --- | --- | --- | 50452 | caf | IcarusProd2021B_Intime_Cosmic_v09_28_01_01_01_caf |
| BNB nu + cosmics | MCP2021B | v09_28_01_01_01 | 51827 | reco1 | IcarusProd2021B_BNB_Nu_Cosmics_v09_28_01_01_01_reco1 |
| --- | --- | --- | 50478 | reco2 | IcarusProd2021B_BNB_Nu_Cosmics_v09_28_01_01_01_reco2 |
| --- | --- | --- | --- | calib ntuples | IcarusProd2021B_BNB_Nu_Cosmics_v09_28_01_01_01_CalibTuples |
| --- | --- | --- | 49872 | caf | IcarusProd2021B_BNB_Nu_Cosmics_v09_28_01_01_01_caf |
| Intime cosmics with overburden | MCP2021A | v09_27_00_02 | 32525 | reco2 | ICARUS_prod_2021A_00_nu_outoftime_ovb_v09_27_00_02 |
| Nu + Cosmics Overburden | MCP2021A | v09_27_00_02 | 31489 | reco2 | ICARUS_prod_2021A_00_intime_outoftime_ovb_v09_27_00_02	|
| intime cosmics | MCP2020A | v09_17_00 | 14939 | detsim | ICARUS_event_selection_intime_cosmics_v09_17_00_detsim	|
| BNB Nu + intime cosmics | MCP2020A | v09_17_00 | 11175 | detsim | ICARUS_event_selection_BNB_NuPlus_intime_cosmics_v09_17_00_detsim	|
| Intime Cosmics | SBNWorkshop0421 | v09_19_00_02 | 112223 | caf | workshop_SBNWorkshop0421_prod_corsika_intime_cosmics-config_caf_icarus	|
| BNB Nue | SBNWorkshop0421 | v09_19_00_02 | 53250 | caf | workshop_SBNWorkshop0421_prodoverlay_corsika_cosmics_cosmics_proton_genie_intrnue_spill_gsimple-config_caf_icarus |
| BNB Nu | SBNWorkshop0421 | v09_19_00_02 | 162896 | caf | workshop_SBNWorkshop0421_prodoverlay_corsika_cosmics_cosmics_proton_genie_nu_spill_gsimple-config_caf_icarus	|
| BNB Nue + cosmics | MCP2020A | v09_17_01 | 9190 | reco2 | poms_icarus_bnb_nue_cosmic_v09_17_01_reco2	|
| --- | --- | --- | 8790 | caf | poms_icarus_bnb_nue_cosmic_v09_17_01_caf | 
| Numi off axis + cosmic | MCP2020A | v09_17_01 | 47425 | reco2 | icarus_numi_offaxis_cosmic_v09_17_01	|
| BNB nu-only | MCP2020A | v09_09_02_01 | 113302 | reco2 | poms_icarus_prod_2020A_00_BNB_nu_v09_09_02_01_reco2		|
| NuMI off axis for ICARUS | MCP2020A | v09_07_00_prof | 70790 | reco2 | ICARUS_prod_2020A_00_numioffaxis_v09_10_01_reco2	|
| COSMICs_ML | --- | v09_07_00_prof | 543700 | detsim | ICARUS_poms_prod_cosmics_ML_v09_07_00_detsim	|
| Intime cosmics | MCP2020A | v09_09_00 | 189534 | reco2 | ICARUS_prod_2020A_00_intime_cosmic_v09_09_00_reco2_halfstats	| 
| --- | --- | --- | 159538 | reco2SCEfix | ICARUS_prod_intime_cosmic_v09_09_02_01_reco2SCEfix | 
| BNB Nue + cosmics | MCP2020A | v09_09_00 | 58339 | reco2 | ICARUS_prod_2020A_00_BNB_nue_cosmic_v09_09_00_reco2	| 
| --- | --- | --- | 56514 | reco2SCEfix | ICARUS_prod_BNB_nue_cosmic_v09_09_02_01_reco2SCEfix | 
| BNB Nu + cosmics | MCP2020A | v09_09_00 | 189775 | reco2 | ICARUS_prod_2020A_00_BNB_nu_cosmic_v09_09_00_reco2_halfstats	|
| --- | --- | --- | 165816 | reco2SCEfix | ICARUS_prod_BNB_nu_cosmic_v09_09_02_01_reco2SCEfix | 
| BNB nue | MCP2020A | v09_09_00 | 50976 | reco2 | ICARUS_prod_2020A_00_BNB_nue_v09_09_00_reco2	| 
| --- | --- | --- | 51092 | reco2SCEfix | ICARUS_prod_BNB_nue_v09_09_02_01_reco2SCEfix | 
		

### Notes on samples ###
* MC2020A
  * SBND Intime Cosmic sample in MCP2020A (and possibly older productions)
    * bug in LArSoft can lead to issues where the best matching particle is non existent.
    * more information: [DocDB:20894](https://sbn-docdb.fnal.gov/cgi-bin/private/ShowDocument?docid=20894) 

Data SBN Production Samples
--------------------------

### SBND DATA
--------------------------

| Sample Description | release version | # Events | File type | Samweb definition |    
| --- | --- | --- | --- | --- |
| Run2 - gen1 (spring 2025) - BNB+light Fixed Dev | v10_06_00_09 | ~2k files | raw | SBND_DATA_Run2_FixedDev_Raw |
| --- | --- | --- | reco1 | data_MCP2025C_Spring25-Run2_FixedDev_bnblight_v10_06_00_09_reco1_sbnd |
| --- | --- | --- | larcv | data_MCP2025C_Spring25-Run2_FixedDev_bnblight_v10_06_00_09_larcvreco1_sbnd |
| --- | --- | --- | calib ntuple | data_MCP2025C_Spring25-Run2_FixedDev_bnblight_v10_06_00_09_histreco2_sbnd |
| --- | --- | --- | caf | data_MCP2025C_Spring25-Run2_FixedDev_bnblight_v10_06_00_09_caf_sbnd |
| --- | --- | --- | flatcaf | data_MCP2025C_Spring25-Run2_FixedDev_bnblight_v10_06_00_09_flatcaf_sbnd |
| Fall Production 2025 (gen2) - Run 1 - BNB Dev | v10_14_02 | ~3.5k files | raw | SBND_DATA_Run1_DevSample_bnblight_Raw |
| --- | --- | --- | reco1 | data_MCP2025C_Fall25-Run1_BNB_Dev_bnblight_v10_14_02_reco1_sbnd |
| --- | --- | --- | larcv | data_MCP2025C_Fall25-Run1_BNB_Dev_bnblight_v10_14_02_larcvreco1_sbnd |
| --- | --- | --- | calib ntuple | data_MCP2025C_Fall25-Run1_BNB_Dev_bnblight_v10_14_02_histreco2_sbnd |
| --- | --- | --- | caf | data_MCP2025C_Fall25-Run1_BNB_Dev_bnblight_v10_14_02_caf_sbnd |
| --- | --- | --- | flatcaf | data_MCP2025C_Fall25-Run1_BNB_Dev_bnblight_v10_14_02_flatcaf_sbnd |
| Fall Production 2025 (gen2) - Run 1 - Intime Dev | v10_14_02 | ~1.5k files | raw | SBND_DATA_Run1_DevSample_offbeamlight_Raw |
| --- | --- | --- | reco1 | data_MCP2025C_Fall25-Run1_InTime_offbeamlight_v10_14_02_reco1_sbnd |
| --- | --- | --- | larcv | data_MCP2025C_Fall25-Run1_InTime_offbeamlight_v10_14_02_larcvreco1_sbnd |
| --- | --- | --- | calib ntuple | data_MCP2025C_Fall25-Run1_InTime_offbeamlight_v10_14_02_histreco2_sbnd |
| --- | --- | --- | caf | data_MCP2025C_Fall25-Run1_InTime_offbeamlight_v10_14_02_caf_sbnd |
| --- | --- | --- | flatcaf | data_MCP2025C_Fall25-Run1_InTime_offbeamlight_v10_14_02_flatcaf_sbnd |
| Fall25 Validation II - Run 1 - Intime Dev | v10_14_02 | ~1.5k files | raw | SBND_DATA_FallValidationII_RollingDev_bnblight_Raw_Nov2025 |
| --- | --- | --- | reco1 | data_MCP2025C_FallValidationII_RollingDev_bnblight_v10_14_00_reco1_sbnd |
| --- | --- | --- | larcv | data_MCP2025C_FallValidationII_RollingDev_bnblight_v10_14_00_larcvreco1_sbnd |
| --- | --- | --- | calib ntuple | data_MCP2025C_FallValidationII_RollingDev_bnblight_v10_14_00_histreco2_sbnd |
| --- | --- | --- | caf | data_MCP2025C_FallValidationII_RollingDev_bnblight_v10_14_00_caf_sbnd |
| --- | --- | --- | flatcaf | data_MCP2025C_FallValidationII_RollingDev_bnblight_v10_14_00_flatcaf_sbnd |
| Fall25 Validation II - Run 1 - Intime Rolling Dev | v10_14_02 | ~700 files | raw | SBND_DATA_FallValidationII_RollingDev_offbeamlight_Raw_Nov2025 |
| --- | --- | --- | reco1 | data_MCP2025C_FallValidationII_RollingDev_offbeamlight_v10_14_00_reco1_sbnd |
| --- | --- | --- | larcv | data_MCP2025C_FallValidationII_RollingDev_offbeamlight_v10_14_00_larcvreco1_sbnd |
| --- | --- | --- | calib ntuple | data_MCP2025C_FallValidationII_RollingDev_offbeamlight_v10_14_00_histreco2_sbnd |
| --- | --- | --- | caf | data_MCP2025C_FallValidationII_RollingDev_offbeamlight_v10_14_00_caf_sbnd |
| --- | --- | --- | flatcaf | data_MCP2025C_FallValidationII_RollingDev_offbeamlight_v10_14_00_flatcaf_sbnd |
| Fall25 Validation - FullRun1 - RollingDev - bnblight  | v10_10_03_01 | ~75k | raw | SBND_DATA_FullRun1_RollingSample_bnblight_Raw |
| --- | --- | --- | reco1 | data_MCP2025B_noPOT_FullRun1_RollingDev_bnblight_v10_10_03_01_reco1_sbnd | 
| --- | --- | --- | larcv | data_MCP2025B_noPOT_FullRun1_RollingDev_bnblight_v10_10_03_01_larcvreco1_sbnd |
| --- | --- | --- | calib tuple | data_MCP2025B_noPOT_FullRun1_RollingDev_bnblight_bnblight_v10_10_03_01_histreco2_sbnd |
| --- | --- | --- | caf | data_MCP2025B_noPOT_FullRun1_RollingDev_bnblight_bnblight_v10_10_03_01_caf_sbnd |
| --- | --- | --- | flat caf | data_MCP2025B_noPOT_FullRun1_RollingDev_bnblight_bnblight_v10_10_03_01_flatcaf_sbnd |
| Fall25 Validation - FullRun1 - RollingDev - bnblight - DNN  | v10_10_03_02 | ~75k | raw | SBND_DATA_FullRun1_RollingSample_bnblight_Raw |
| --- | --- | --- | reco1 | data_MCP2025B_FullRun1_RollingDev_DNN_bnblight_v10_10_03_02_reco1_sbnd | 
| --- | --- | --- | larcv | data_MCP2025B_FullRun1_RollingDev_DNN_bnblight_v10_10_03_02_larcvreco1_sbnd |
| --- | --- | --- | calib tuple | data_MCP2025B_FullRun1_RollingDev_DNN_bnblight_v10_10_03_02_histreco2_sbnd |
| --- | --- | --- | caf | data_MCP2025B_FullRun1_RollingDev_DNN_bnblight_v10_10_03_02_caf_sbnd |
| --- | --- | --- | flat caf | data_MCP2025B_FullRun1_RollingDev_DNN_bnblight_v10_10_03_02_flatcaf_sbnd |
| Fall25 Validation - FullRun1 - RollingDev - offbeamlight - DNN  | v10_10_03_02 | ~40k | raw | SBND_DATA_FullRun1_RollingSample_offbeamlight_Raw | 
| --- | --- | --- | reco1 | data_MCP2025B_FullRun1_RollingDev_offbeamlight_v10_10_03_02_reco1_sbnd | 
| --- | --- | --- | larcv | data_MCP2025B_FullRun1_RollingDev_offbeamlight_v10_10_03_02_larcvreco1_sbnd |
| --- | --- | --- | calib tuple | data_MCP2025B_FullRun1_RollingDev_offbeamlight_v10_10_03_02_histreco2_sbnd |
| --- | --- | --- | caf | data_MCP2025B_FullRun1_RollingDev_offbeamlight_v10_10_03_02_caf_sbnd |
| --- | --- | --- | flat caf | data_MCP2025B_FullRun1_RollingDev_offbeamlight_v10_10_03_02_flatcaf_sbnd |
| Crossing Muon afterlight trigger | v10_06_03 | ~30k | raw | sbnd_CrossingMuon_FullRun1_AfterLight_raw |
| --- | --- | --- | decode | data_MCP2025B_CrossingMuon_FullRun1_AfterLight_8_crossingmuon_v10_06_03_decode_sbnd |
| --- | --- | --- | reco1 | data_MCP2025B_CrossingMuon_FullRun1_AfterLight_8_crossingmuon_v10_06_03_reco1_sbnd |
| --- | --- | --- | larcv | data_MCP2025B_CrossingMuon_FullRun1_AfterLight_8_crossingmuon_v10_06_03_larcvreco1_sbnd |
| --- | --- | --- | reco2 | data_MCP2025B_CrossingMuon_FullRun1_AfterLight_8_crossingmuon_v10_06_03_reco2_sbnd |
| --- | --- | --- | calib tuple | data_MCP2025B_CrossingMuon_FullRun1_AfterLight_8_crossingmuon_v10_06_03_histreco2_sbnd |
| --- | --- | --- | caf | data_MCP2025B_CrossingMuon_FullRun1_AfterLight_8_crossingmuon_v10_06_03_caf_sbnd |
| --- | --- | --- | flatcaf | data_MCP2025B_CrossingMuon_FullRun1_AfterLight_8_crossingmuon_v10_06_03_flatcaf_sbnd |
| Spring25 - BNB 1e20 POT | v10_06_00_02 | ~1.7M | raw | SBND_DATA_1e20_Raw_May2025 |
| --- | --- | --- | decode | data_MCP2025B_02_FullData_1e20_bnblight_v10_06_00_02_decode_sbnd |
| --- | --- | --- | reco1 | data_MCP2025B_02_FullData_1e20_bnblight_v10_06_00_02_reco1_sbnd |
| --- | --- | --- | larcv | data_MCP2025B_02_FullData_1e20_bnblight_v10_06_00_02_larcvreco1_sbnd |
| --- | --- | --- | reco2 | data_MCP2025B_02_FullData_1e20_bnblight_v10_06_00_02_reco2_sbnd |
| --- | --- | --- | calib tuple | data_MCP2025B_02_FullData_1e20_bnblight_v10_06_00_02_histreco2_sbnd |
| --- | --- | --- | caf | data_MCP2025B_02_FullData_1e20_bnblight_v10_06_00_02_caf_sbnd |
| --- | --- | --- | flatcaf | data_MCP2025B_02_FullData_1e20_bnblight_v10_06_00_02_flatcaf_sbnd |
| --- | v10_06_00_05 | --- | reco2 | data_MCP2025B_02_FullData_1e20_bnblight_v10_06_00_05_reco2_sbnd |
| --- | --- | --- | calib tuple | data_MCP2025B_02_FullData_1e20_bnblight_v10_06_00_05_histreco2_sbnd |
| --- | --- | --- | caf | data_MCP2025B_02_FullData_1e20_bnblight_v10_06_00_05_caf_sbnd |
| --- | --- | --- | flatcaf | data_MCP2025B_02_FullData_1e20_bnblight_v10_06_00_05_flatcaf_sbnd |
| --- | v10_06_00_09 | --- | calib tuple | data_MCP2025C_Spring25_reprocess_FullData1e20_bnblight_v10_06_00_09_histreco2_sbnd |
| --- | --- | --- | caf | data_MCP2025C_Spring25_reprocess_FullData1e20_bnblight_v10_06_00_09_caf_sbnd |
| --- | --- | --- | flatcaf | data_MCP2025C_Spring25_reprocess_FullData1e20_bnblight_v10_06_00_09_flatcaf_sbnd |
| Spring25 - Intime Cosmics | v10_06_00 | ~k | raw | SBND_DATA_InTime-Cosmic_Raw_Snapshot-20250527 |
| --- | --- | --- | decode | data_MCP2025B_InTimeCosmics_offbeamlight_v10_06_00_decode_sbnd |
| --- | --- | --- | reco1 | data_MCP2025B_InTimeCosmics_offbeamlight_v10_06_00_reco1_sbnd |
| --- | --- | --- | larcv | data_MCP2025B_InTimeCosmics_offbeamlight_v10_06_00_larcvreco1_sbnd |
| --- | v10_06_00_02 | --- | reco2 | data_MCP2025B_02_InTimeCosmics_offbeamlight_v10_06_00_02_reco2_sbnd |
| --- | --- | --- | calib tuple | data_MCP2025B_02_InTimeCosmics_offbeamlight_v10_06_00_02_histreco2_sbnd |
| --- | --- | --- | caf | data_MCP2025B_02_InTimeCosmics_offbeamlight_v10_06_00_02_caf_sbnd |
| --- | --- | --- | flatcaf | data_MCP2025B_02_InTimeCosmics_offbeamlight_v10_06_00_02_flatcaf_sbnd |
| --- | v10_06_00_05 | --- | reco2 | data_MCP2025B_02_InTimeCosmics_offbeamlight_v10_06_00_05_reco2_sbnd |
| --- | --- | --- | calib tuple | data_MCP2025B_02_InTimeCosmics_offbeamlight_v10_06_00_05_histreco2_sbnd |
| --- | --- | --- | caf | data_MCP2025B_02_InTimeCosmics_offbeamlight_v10_06_00_05_caf_sbnd |
| --- | --- | --- | flatcaf | data_MCP2025B_02_InTimeCosmics_offbeamlight_v10_06_00_05_flatcaf_sbnd |
| --- | v10_06_00_09 | --- | calib tuple | data_MCP2025C_Spring25_reprocess_Intime_offbeamlight_v10_06_00_09_histreco2_sbnd |
| --- | --- | --- | caf | data_MCP2025C_Spring25_reprocess_Intime_offbeamlight_v10_06_00_09_caf_sbnd |
| --- | --- | --- | flatcaf | data_MCP2025C_Spring25_reprocess_Intime_offbeamlight_v10_06_00_09_flatcaf_sbnd |
| Spring25 - fixed DevSample (5e18 POT)| v10_06_00 | ~90k | raw | SBND_DATA_DevSample_Raw_Mar2025 |
| --- | --- | --- | decode | data_MCP2025B_DevSample_bnblight_v10_06_00_decode_sbnd |
| --- | --- | --- | reco1 | data_MCP2025B_DevSample_bnblight_v10_06_00_reco1_sbnd |
| --- | --- | --- | larcv | data_MCP2025B_DevSample_bnblight_v10_06_00_larcvreco1_sbnd |
| --- | v10_06_00_02 | --- | reco2 | data_MCP2025B_02_DevSample_bnblight_v10_06_00_02_reco2_sbnd |
| --- | --- | --- | calib tuple | data_MCP2025B_02_DevSample_bnblight_v10_06_00_02_histreco2_sbnd |
| --- | --- | --- | caf | data_MCP2025B_02_DevSample_bnblight_v10_06_00_02_caf_sbnd |
| --- | --- | --- | flatcaf | data_MCP2025B_02_DevSample_bnblight_v10_06_00_02_flatcaf_sbnd |
| --- | v10_06_00_05 | --- | reco2 | data_MCP2025B_05_DevSample_bnblight_v10_06_00_05_reco2_sbnd |
| --- | --- | --- | calib tuple | data_MCP2025B_05_DevSample_bnblight_v10_06_00_05_histreco2_sbnd |
| --- | --- | --- | caf | data_MCP2025B_05_DevSample_bnblight_v10_06_00_05_caf_sbnd |
| --- | --- | --- | flatcaf | data_MCP2025B_05_DevSample_bnblight_v10_06_00_05_flatcaf_sbnd |
| Spring25 - rolling DevSample | v10_06_00 | ~30k | raw | SBND_DATA_DevSample_Run1Rolling_5e18_Raw_May2025 |
| --- | --- | --- | decode | data_MCP2025B_DevSample_Run1Rolling_5e18_bnblight_v10_06_00_decode_sbnd |
| --- | --- | --- | reco1 | data_MCP2025B_DevSample_Run1Rolling_5e18_bnblight_v10_06_00_reco1_sbnd |
| --- | --- | --- | larcv | data_MCP2025B_DevSample_Run1Rolling_5e18_bnblight_v10_06_00_larcvreco1_sbnd |
| --- | v10_06_00_02 | --- | reco2 | data_MCP2025B_02_DevSample_Run1Rolling_5e18_bnblight_v10_06_00_02_reco2_sbnd |
| --- | --- | --- | calib tuple | data_MCP2025B_02_DevSample_Run1Rolling_5e18_bnblight_v10_06_00_02_histreco2_sbnd |
| --- | --- | --- | caf | data_MCP2025B_02_DevSample_Run1Rolling_5e18_bnblight_v10_06_00_02_caf_sbnd |
| --- | --- | --- | flatcaf | data_MCP2025B_02_DevSample_Run1Rolling_5e18_bnblight_v10_06_00_02_flatcaf_sbnd |
| --- | v10_06_00_04 | --- | reco2 | data_MCP2025B_04_DevSample_Run1Rolling_5e18_bnblight_v10_06_00_04_reco2_sbnd |
| --- | --- | --- | calib tuple | data_MCP2025B_04_DevSample_Run1Rolling_5e18_bnblight_v10_06_00_04_histreco2_sbnd |
| --- | --- | --- | caf | data_MCP2025B_04_DevSample_Run1Rolling_5e18_bnblight_v10_06_00_04_caf_sbnd |
| --- | --- | --- | flatcaf | data_MCP2025B_04_DevSample_Run1Rolling_5e18_bnblight_v10_06_00_04_flatcaf_sbnd |
| --- | v10_06_00_05 | --- | reco2 | data_MCP2025B_05_DevSample_Run1Rolling_bnblight_v10_06_00_05_reco2_sbnd |
| --- | --- | --- | calib tuple | data_MCP2025B_05_DevSample_Run1Rolling_bnblight_v10_06_00_05_histreco2_sbnd |
| --- | --- | --- | caf | data_MCP2025B_05_DevSample_Run1Rolling_bnblight_v10_06_00_05_caf_sbnd |
| --- | --- | --- | flatcaf | data_MCP2025B_05_DevSample_Run1Rolling_bnblight_v10_06_00_05_flatcaf_sbnd |
| Spring25 validation - DevSample | v10_04_06_01 | 90k | raw | SBND_DATA_DevSample_Raw_Mar2025 |
| --- | --- | --- | decode | MCP2025Av3_DevSample_bnblight_v10_04_06_01_decode |
| --- | --- | --- | reco1 | MCP2025Av3_DevSample_bnblight_v10_04_06_01_reco1 |
| --- | --- | --- | larcv | MCP2025Av3_DevSample_bnblight_v10_04_06_01_larcvreco1 |
| --- | --- | --- | reco2 | MCP2025Av3_DevSample_bnblight_v10_04_06_01_reco2 |
| --- | --- | --- | calib tuple | MCP2025Av3_DevSample_bnblight_v10_04_06_01_histreco2 |
| --- | --- | --- | caf | MCP2025Av3_DevSample_bnblight_v10_04_06_01_caf |
| --- | --- | --- | flatcaf | MCP2025Av3_DevSample_bnblight_v10_04_06_01_flatcaf |
| Feb25 Workshop - Run 18115 OffBeam Zero Bias Data | v10_04_03 | 240k | raw | GoldenRun_18115_ZeroBias_raw |
| --- | --- | --- | reco1 | MCP2025A_GoldenRun_LArv10_v10_04_03_offbeamzerobias_reco1 |
| --- | --- | --- | reco2 | MCP2025A_GoldenRun_LArv10_v10_04_03_offbeamzerobias_reco2 |
| --- | --- | --- | calib tuple | MCP2025A_GoldenRun_LArv10_v10_04_03_offbeamzerobias_histreco2 |
| --- | --- | --- | caf | MCP2025A_GoldenRun_LArv10_v10_04_03_offbeamzerobias_caf |
| --- | --- | --- | flatcaf | MCP2025A_GoldenRun_LArv10_v10_04_03_offbeamzerobias_flatcaf |
| Feb25 Workshop - Run 18115 BNB Zero Bias Data | v10_04_03 | 610k | raw | GoldenRun_18115_ZeroBias_raw |
| --- | --- | --- | reco1 | MCP2025A_GoldenRun_LArv10_v10_04_03_bnbzerobias_reco1 |
| --- | --- | --- | reco2 | MCP2025A_GoldenRun_LArv10_v10_04_03_bnbzerobias_reco2 |
| --- | --- | --- | calib tuple | MCP2025A_GoldenRun_LArv10_v10_04_03_bnbzerobias_histreco2 |
| --- | --- | --- | caf | MCP2025A_GoldenRun_LArv10_v10_04_03_bnbzerobias_caf |
| --- | --- | --- | flatcaf | MCP2025A_GoldenRun_LArv10_v10_04_03_bnbzerobias_flatcaf |
| Feb25 Workshop - Calibration / CrossingMuons | v10_04_03 | - | raw | CalibData_18115_17934_CrossingMuon_raw |
| --- | --- | --- | decode | MCP2025A_CalibData_LArv10_v10_04_03_decode |
| --- | --- | --- | reco1 | MCP2025A_CalibData_LArv10_v10_04_03_reco1 |
| Feb25 Workshop - Calibration / CrossingMuons | v10_04_01_01 | - | raw | CalibData_18115_17934_CrossingMuon_raw |
| --- | --- | --- | decode | MCP2025A_CalibDatawraw_18115_17934_CrossingMuon_v10_04_01_01_decode_DATA_SBND |
| --- | --- | --- | reco1 | MCP2025A_CalibDatawraw_18115_17934_CrossingMuon_v10_04_01_01_reco1_DATA_SBND |
| BNB Summer 2024 Data | v09_93_01_01 | - | raw | sbnd_keepup_summer2024_neutrino_data_bnbZeroBiasAndSunset0-00009 |
| --- | --- | --- | decode | sbnd_keepup_summer2024_neutrino_data_bnbZeroBiasAndSunset0-00009_decode |
| --- | --- | --- | reco1 | sbnd_keepup_summer2024_neutrino_data_bnbZeroBiasAndSunset0-00009_reco1 |
| --- | --- | --- | reco2 | sbnd_keepup_summer2024_neutrino_data_bnbZeroBiasAndSunset0-00009_reco2 |
| --- | --- | --- | calib tuple | hist_sbnd_keepup_summer2024_neutrino_data_bnbZeroBiasAndSunset0-00009_reco2 |
| --- | --- | --- | caf | sbnd_keepup_summer2024_neutrino_data_bnbZeroBiasAndSunset0-00009_caf |
| --- | --- | --- | flatcaf | sbnd_keepup_summer2024_neutrino_data_bnbZeroBiasAndSunset0-00009_flatcaf |

ICARUS SBN Production Samples
---------------------------
**Notes on samples:** These are produced with v10_xx_xx_xx using ***wcdnn*** fcls.

### ICARUS SBN data production
-----------------------------

| **Sample Description**| **release version** | **# Events** | **File type** | **Samweb definition** |
| --- | --- | --- | --- | --- | 
|ICARUS Spring, Run 2 BNB Majority Data w/o calib| v10_06_00_01p05 | --- | stage0 w PMT WF |Icaruspro_2025_wcdnn_production_Reproc_Run2_SBN_v10_06_00_01p05_bnbmajority_stage0 |
| --- | --- | --- | stage0 w/o PMT WF | Icaruspro_2025_wcdnn_production_Reproc_Run2_SBN_v10_06_00_01p05_bnbmajority_stage0_daqPMT_drop |
| --- | --- | --- | calibration tuples | Icaruspro_2025_wcdnn_production_Reproc_Run2_SBN_v10_06_00_01p05_bnbmajority_calibtuples |
| --- | --- | --- | caf_prescaled | Icaruspro_2025_wcdnn_production_Reproc_Run2_SBN_v10_06_00_01p05_bnbmajority_caf_prescaled |
| --- | --- | --- | caf_blind | Icaruspro_2025_wcdnn_production_Reproc_Run2_SBN_v10_06_00_01p05_bnbmajority_caf_blind |
| --- | --- | --- | caf_unblind | Icaruspro_2025_wcdnn_production_Reproc_Run2_SBN_v10_06_00_01p05_bnbmajority_caf_unblind |
| --- | --- | --- | flatcaf_prescaled | Icaruspro_2025_wcdnn_production_Reproc_Run2_SBN_v10_06_00_01p05_bnbmajority_flatcaf_prescaled |
| --- | --- | --- | flatcaf_blind | Icaruspro_2025_wcdnn_production_Reproc_Run2_SBN_v10_06_00_01p05_bnbmajority_flatcaf_blind |
| --- | --- | --- | flatcaf_unblind | Icaruspro_2025_wcdnn_production_Reproc_Run2_SBN_v10_06_00_01p05_bnbmajority_flatcaf_unblind |
| --- | --- | --- | larcv | Icaruspro_2025_wcdnn_production_Reproc_Run2_SBN_v10_06_00_01p05_bnbmajority_larcv |
| ICARUS Spring, Run 2 Off-Beam BNB Majority Data | v10_06_00_01p05  | --- | stage0 w PMT WF | Icaruspro_2025_wcdnn_production_Reproc_Run2_SBN_v10_06_00_01p05_offbeambnbmajority_stage0 |
| --- | --- | --- | stage0 w/o PMT WF | Icaruspro_2025_wcdnn_production_Reproc_Run2_SBN_v10_06_00_01p05_offbeambnbmajority_stage0_daqPMT_drop |
| --- | --- | --- | calibration tuples | Icaruspro_2025_wcdnn_production_Reproc_Run2_SBN_v10_06_00_01p05_offbeambnbmajority_calibtuples |
| --- | --- | --- | caf_prescaled | Icaruspro_2025_wcdnn_production_Reproc_Run2_SBN_v10_06_00_01p05_offbeambnbmajority_caf_prescaled |
| --- | --- | --- | caf_blind | Icaruspro_2025_wcdnn_production_Reproc_Run2_SBN_v10_06_00_01p05_offbeambnbmajority_caf_blind |
| --- | --- | --- | caf_unblind | Icaruspro_2025_wcdnn_production_Reproc_Run2_SBN_v10_06_00_01p05_offbeambnbmajority_caf_unblind |
| --- | --- | --- | flatcaf_prescaled | Icaruspro_2025_wcdnn_production_Reproc_Run2_SBN_v10_06_00_01p05_offbeambnbmajority_flatcaf_prescaled |
| --- | --- | --- | flatcaf_blind | Icaruspro_2025_wcdnn_production_Reproc_Run2_SBN_v10_06_00_01p05_offbeambnbmajority_flatcaf_blind |
| --- | --- | --- | flatcaf_unblind | Icaruspro_2025_wcdnn_production_Reproc_Run2_SBN_v10_06_00_01p05_offbeambnbmajority_flatcaf_unblind |
| --- | --- | --- | larcv | Icaruspro_2025_wcdnn_production_Reproc_Run2_SBN_v10_06_00_01p05_offbeambnbmajority_larcv |
|ICARUS Spring, Run 2 BNB Majority w Calibrated CAFs | v10_06_00_04p03 | --- | calibration tuples | Icaruspro_2025_wcdnn_production_Reproc_Run2_SBN_wCalib_v10_06_00_04p03_bnbmajority_calibtuples |
| --- | --- | --- | caf_prescaled | Icaruspro_2025_wcdnn_production_Reproc_Run2_SBN_wCalib_v10_06_00_04p03_bnbmajority_caf_prescaled |
| --- | --- | --- | caf_blind | Icaruspro_2025_wcdnn_production_Reproc_Run2_SBN_wCalib_v10_06_00_04p03_bnbmajority_caf_blind |
| --- | --- | --- | caf_unblind | Icaruspro_2025_wcdnn_production_Reproc_Run2_SBN_wCalib_v10_06_00_04p03_bnbmajority_caf_unblind |
| --- | --- | --- | flatcaf_prescaled | Icaruspro_2025_wcdnn_production_Reproc_Run2_SBN_wCalib_v10_06_00_04p03_bnbmajority_flatcaf_prescaled |
| --- | --- | --- | flatcaf_blind | Icaruspro_2025_wcdnn_production_Reproc_Run2_SBN_wCalib_v10_06_00_04p03_bnbmajority_flatcaf_blind |
| --- | --- | --- | flatcaf_unblind | Icaruspro_2025_wcdnn_production_Reproc_Run2_SBN_wCalib_v10_06_00_04p03_bnbmajority_flatcaf_unblind |
| --- | --- | --- | larcv | Icaruspro_2025_wcdnn_production_Reproc_Run2_SBN_wCalib_v10_06_00_04p03_bnbmajority_larcv |


### ICARUS SBN MC Overlay production
-----------------------------------
**Notes on samples:** 
* These are produced with v10_xx_xx_xx using ***wcdnn*** fcls. 
* As of Oct 13th 2025, these productions are ongoing. You might notice increasing number of files in the output datasets.

| **Sample Description**| **release version** | **# Events** | **File type** | **Samweb definition** |
| --- | --- | --- | --- | --- | 
| ICARUS Spring 2025A BNB Run 2 Overlay w offbeamminbias data | v10_06_00_04p04 | --- | stage0 | production_mc_2025A_ICARUS_Overlays_BNB_MC_RUN2_September_v10_06_00_04p04_stage0 |
| --- | --- | --- | calibtuples | production_mc_2025A_ICARUS_Overlays_BNB_MC_RUN2_summer_2025_v10_06_00_04p04_calibtuples |
| --- | --- | --- | caf | production_mc_2025A_ICARUS_Overlays_BNB_MC_RUN2_summer_2025_v10_06_00_04p04_caf |
| --- | --- | --- | flatcaf | production_mc_2025A_ICARUS_Overlays_BNB_MC_RUN2_summer_2025_v10_06_00_04p04_flatcaf |
| --- | --- | --- | larcv | production_mc_2025A_ICARUS_Overlays_BNB_MC_RUN2_summer_2025_v10_06_00_04p04_larcv |




ICARUS DATA
---------------------
### ICARUS Reconstructed DATA (Run2)
-----------------------------------

**Notes on samples:**
* These are Run2 reprocessed data with v09_89_xx_xx icaruscode used for BNB ν<sub>μ</sub> disappearance analysis and some of the mature NuMI cross-section analyses

| **Sample Description**| **release version** | **# Events** | **File type** | **Samweb definition** |
| --- | --- | --- | --- | --- | 
| Run2 reprocessed BNB majority | v09_89_01_01p03 | --- | stage1 | Icaruspro_2024_Run2_production_Reproc_Run2_v09_89_01_01p03_bnbmajority_stage1 |
| --- | --- | --- | caf blind | Icaruspro_2024_Run2_production_Reproc_Run2_v09_89_01_01p03_bnbmajority_caf_blind |
| --- | --- | --- | caf unblind | Icaruspro_2024_Run2_production_Reproc_Run2_v09_89_01_01p03_bnbmajority_caf_unblind |
| --- | --- | --- | caf prescaled | Icaruspro_2024_Run2_production_Reproc_Run2_v09_89_01_01p03_bnbmajority_caf_prescaled |
| --- | --- | --- | flatcaf blind |  Icaruspro_2024_Run2_production_Reproc_Run2_v09_89_01_01p03_bnbmajority_flatcaf_blind |
| --- | --- | --- | flatcaf unblind | Icaruspro_2024_Run2_production_Reproc_Run2_v09_89_01_01p03_bnbmajority_flatcaf_unblind |
| --- | --- | --- | flatcaf prescaled | Icaruspro_2024_Run2_production_Reproc_Run2_v09_89_01_01p03_bnbmajority_flatcaf_prescaled |
| --- | --- | --- | larcv | Icaruspro_2024_Run2_production_Reproc_Run2_v09_89_01_01p03_bnbmajority_larcv |
|Run2 reprocessed BNB majority recaf |  v09_89_02_01| --- | caf blind | Icaruspro_2025_Run2_production_Reproc_Run2_v09_89_02_01_bnbmajority_caf_blind |
| --- | --- | --- | caf unblind | Icaruspro_2025_Run2_production_Reproc_Run2_v09_89_02_01_bnbmajority_caf_unblind|
| --- | --- | --- | caf prescaled | Icaruspro_2025_Run2_production_Reproc_Run2_v09_89_02_01_bnbmajority_caf_prescaled |
| --- | --- | --- | flatcaf blind| Icaruspro_2025_Run2_production_Reproc_Run2_v09_89_02_01_bnbmajority_flatcaf_blind|
| --- | --- | --- | flatcaf unblind | Icaruspro_2025_Run2_production_Reproc_Run2_v09_89_02_01_bnbmajority_flatcaf_unblind|
| --- | --- | --- | flatcaf prescaled | Icaruspro_2025_Run2_production_Reproc_Run2_v09_89_02_01_bnbmajority_flatcaf_prescaled |
| Run2 reprocessed NuMI majority | v09_89_01_02p02 | --- | stage1 | Icaruspro_2025_Run2_production_Run2reprocess_v09_89_01_02p02_numimajority_stage1 |
| --- | --- | --- | caf blind | Icaruspro_2025_Run2_production_Run2reprocess_v09_89_01_02p02_numimajority_caf_blind |
| --- | --- | --- | caf unblind | Icaruspro_2025_Run2_production_Run2reprocess_v09_89_01_02p02_numimajority_caf_unblind |
| --- | --- | --- | caf prescaled |  Icaruspro_2025_Run2_production_Run2reprocess_v09_89_01_02p02_numimajority_caf_prescaled |
| --- | --- | --- | flatcaf blind | Icaruspro_2025_Run2_production_Run2reprocess_v09_89_01_02p02_numimajority_flatcaf_blind |
| --- | --- | --- | flatcaf unblind | Icaruspro_2025_Run2_production_Run2reprocess_v09_89_01_02p02_numimajority_flatcaf_unblind |
| --- | --- | --- | flatcaf prescaled |  Icaruspro_2025_Run2_production_Run2reprocess_v09_89_01_02p02_numimajority_flatcaf_prescaled |
| --- | --- | --- | larcv | Icaruspro_2025_Run2_production_Run2reprocess_v09_89_01_02p02_numimajority_larcv |
| Run2 reprocessed OFFBeam NuMI majority | v09_89_01_02p02 | --- | stage1 | Icaruspro_2025_Run2_production_Run2reprocess_v09_89_01_02p02_offbeamnumimajority_stage1 |
| --- | --- | --- | caf blind |  Icaruspro_2025_Run2_production_Run2reprocess_v09_89_01_02p02_offbeamnumimajority_caf_blind |
| --- | --- | --- | caf unblind |  Icaruspro_2025_Run2_production_Run2reprocess_v09_89_01_02p02_offbeamnumimajority_caf_unblind |
| --- | --- | --- | caf prescaled |  Icaruspro_2025_Run2_production_Run2reprocess_v09_89_01_02p02_offbeamnumimajority_caf_prescaled |
| --- | --- | --- | flatcaf blind |  Icaruspro_2025_Run2_production_Run2reprocess_v09_89_01_02p02_offbeamnumimajority_flatcaf_blind |
| --- | --- | --- | flatcaf unblind |  Icaruspro_2025_Run2_production_Run2reprocess_v09_89_01_02p02_offbeamnumimajority_flatcaf_unblind |
| --- | --- | --- | flatcaf prescaled |  Icaruspro_2025_Run2_production_Run2reprocess_v09_89_01_02p02_offbeamnumimajority_flatcaf_prescaled |
| --- | --- | --- | larcv | Icaruspro_2025_Run2_production_Run2reprocess_v09_89_01_02p02_offbeamnumimajority_larcv |


### ICARUS Reconstructed DATA (Run1)
-----------------------------------
**Notes on samples:** 
* Run 1 reprocessing is the reprocessing of selected runs based on the good run list created by Gray and Minerba. Please refer to this docdb for the list of runs: https://sbn-docdb.fnal.gov/cgi-bin/sso/RetrieveFile?docid=25407&filename=ICARUS%20Data%20Re-Processing.pdf&version=1
* Run 1 batch 2 is the processing of run_number > 7621 and run_number < 8460 (before the update to the new DAQ configuration)
* Run 1 batch 3 is the processing of run_number >= 8460 and run_number < 8598 (after the update to the new DAQ configuration resulting in 8 new data stream: (offbeam) BNB/NuMI Majority/MinBias)

| Sample Description | production push | release version | # Events | Sample type | Samweb definition |    
| --- | --- | --- | --- | --- | --- | 
| Offbeam NuMI MinBias stream | Run 1 batch3 | v09_37_02_09 | 374836 | stage0 | IcarusProd_Run1_batch3_OffBeamNuMIMinBiasstream_stage0      |  
| --- | --- | --- | 374836 | stage1 | IcarusProd_Run1_batch3_OffBeamNuMIMinBiasstream_stage1 |
| Offbeam BNB MinBias stream | Run 1 batch3 | v09_37_02_09 | 741147 | stage0 | IcarusProd_Run1_batch3_OffBeamBNBMinBiasstream_stage0        | 
| --- | --- | --- | 741147 | stage1 | IcarusProd_Run1_batch3_OffBeamBNBMinBiasstream_stage1 |
| NuMI MinBias stream | Run 1 batch3 | v09_37_02_09 | 19566 | stage0 | IcarusProd_Run1_batch3_NuMIMinBiasstream_stage0     |  
| --- | --- | --- | 19566 | stage1 | IcarusProd_Run1_batch3_NuMIMinBiasstream_stage1 |
| BNB MinBias stream | Run 1 batch3 | v09_37_02_09 | 42680 | stage0 | IcarusProd_Run1_batch3_BNBMinBiasstream_stage0       | 
| --- | --- | --- | 42680 | stage1 | IcarusProd_Run1_batch3_BNBMinBiasstream_stage1 |            
| Offbeam NuMI Majority stream | Run 1 batch3 | v09_37_02_09 | 109510 | stage0 | IcarusProd_Run1_batch3_OffBeamNuMIMajoritystream_stage0      |       
| --- | --- | --- | 109510 | stage1 | IcarusProd_Run1_batch3_OffBeamNuMIMajoritystream_stage1 |
| Offbeam BNB Majority stream | Run 1 batch3 | v09_37_02_09 | 231169 | stage0 | IcarusProd_Run1_batch3_OffBeamBNBMajoritystream_stage0        | 
| --- | --- | --- | 231169 | stage1 | IcarusProd_Run1_batch3_OffBeamBNBMajoritystream_stage1 |
| NuMI Majority stream | Run 1 batch3 | v09_37_02_09 | 284336 | stage0 | IcarusProd_Run1_batch3_NuMIMajoritystream_stage0     |       
| --- | --- | --- | 284336 | stage1 | IcarusProd_Run1_batch3_NuMIMajoritystream_stage1 |
| BNB Majority stream | Run 1 batch3 | v09_37_02_09 | 368711 | stage0 | IcarusProd_Run1_batch3_BNBMajoritystream_stage0       | 
| --- | --- | --- | 368711 | stage1 | IcarusProd_Run1_batch3_BNBMajoritystream_stage1 |
| Offbeam NuMI stream | Run 1 batch2 | v09_37_02_03 | 102488 | stage0 | IcarusProd_Run1_batch2_OffBeamNuMIstream_stage0      |       
| --- | --- | --- | 102488 | stage1 | IcarusProd_Run1_batch2_OffBeamNuMIstream_stage1 |
| Offbeam BNB stream | Run 1 batch2 | v09_37_02_03 | 327855 | stage0 | IcarusProd_Run1_batch2_OffBeamBNBstream_stage0        | 
| --- | --- | --- | 327855 | stage1 | IcarusProd_Run1_batch2_OffBeamBNBstream_stage1 |
| NuMI stream | Run 1 batch2 | v09_37_02_03 | 200220 | stage0 | IcarusProd_Run1_batch2_NuMIstream_stage0     |       
| --- | --- | --- | 200220 | stage1 | IcarusProd_Run1_batch2_NuMIstream_stage1 |
| BNB stream | Run 1 batch2 | v09_37_02_03 | 935069 | stage0 | IcarusProd_Run1_batch2_BNBstream_stage0       | 
| --- | --- | --- | 935069 | stage1 | IcarusProd_Run1_batch2_BNBstream_stage1 |
| Offbeam NuMI stream | Run 1 reprocessing | v09_37_02_01 | 212809 | stage0 | IcarusProd_Run1_reprocess_OffBeamNuMIstream_stage0	| 
| --- | --- | --- | 212809 | stage1 | IcarusProd_Run1_reprocess_OffBeamNuMIstream_stage1 |
| Offbeam BNB stream | Run 1 reprocessing | v09_37_02_01 | 127768 | stage0 | IcarusProd_Run1_reprocess_OffBeamBNBstream_stage0	| 
| --- | --- | --- | 127768 | stage1 | IcarusProd_Run1_reprocess_OffBeamBNBstream_stage1 |
| NuMI stream | Run 1 reprocessing | v09_37_02_01 | 333097 | stage0 | IcarusProd_Run1_reprocess_NuMIstream_stage0	| 
| --- | --- | --- | 333097 | stage1 | IcarusProd_Run1_reprocess_NuMIstream_stage1 |
| BNB stream | Run 1 reprocessing | v09_37_02_01 | 627484 | stage0 | IcarusProd_Run1_reprocess_BNBstream_stage0	| 
| --- | --- | --- | 627484 | stage1 | IcarusProd_Run1_reprocess_BNBstream_stage1 |

### ICARUS Compressed RAW DATA (Run2)
--------------------------

| Run | datastream | SAM dataset | Raw Files not in the compressed datasets |
| --- | --- | --- | --- |
| Run 2 | numiminbias | run2_compression_production_v09_82_02_01_numiminbias_compressed_data | numiminbias_run2_physics_9301_to_10097_recover |
| Run 2 | bnbminbias | run2_compression_production_v09_82_02_01_bnbminbias_compressed_data | nbnbminbias_run2_physics_9301_to_10097_recover |
| Run 2 | offbeamnumiminbias | run2_compression_production_v09_82_02_01_offbeamnumiminbias_compressed_data | offbeamnumiminbias_run2_physics_9301_to_10097_recover |
| Run 2 | offbeamnumimajority | run2_compression_production_v09_82_02_01_offbeamnumimajority_compressed_data | offbeamnumimajority_run2_physics_9301_to_10097_recover |
| Run 2 | numimajority | run2_compression_production_v09_82_02_01_numimajority_compressed_data | numimajority_run2_physics_9301_to_10097_recover |
| Run 2 | offbeambnbmajority | run2_compression_production_v09_82_02_01_offbeambnbmajority_compressed_data | offbeambnbmajority_run2_physics_9301_to_10097_recover |
| Run 2 | bnbmajority | run2_compression_production_v09_82_02_01_bnbmajority_compressed_data | bnbmajority_run2_physics_9301_to_10097_recover |
| Run 2 | offbeambnbminbias | run2_compression_production_v09_82_02_01_offbeambnbminbias_compressed_data | offbeambnbminbias_run2_physics_9301_to_10097_recover |


Polaris Production Samples
--------------------------

MC files generated on the Polaris computer at Argonne National Lab.

### SBND Data
--------------------------
_2024 Winter_: Calibration request for data processing to produce calibration ntuples was performed on Polaris.

Run list: 17625, 17635, 17648, 17658, 17660, 17662, 17664

| Sample Description | release version | # Events | File type | Samweb definition |
| --- | --- | --- | --- | --- |
| Winter 2024 calibration request | v09_93_01_01 | --- | calib tuple | polaris_v09_93_01_01_data_calibration_ntuple_sbnd |

### SBND MC
--------------------------

_2024 November_: A sample of central value SBND MC events were generated on Polaris as part of production tests. The Flat CAF files are copied from Polaris and are available on `/pnfs`. The `.fcl` files used for each stage are as follows:
- _gen_: `prodoverlay_corsika_cosmics_proton_genie_rockbox_sbnd.fcl`
- _g4_: `g4_dirt_filter_lite.fcl`
- _detsim_: `standard_detsim_sbnd.fcl`
- _reco1_: `standard_reco1_sbnd.fcl`
- _reco2_: `standard_reco2_sbnd.fcl`
- _caf_: `cafmakerjob_sbnd_systtools_and_fluxwgt.fcl`

| Sample Description | release version | # Events | File type | Samweb definition |
| --- | --- | --- | --- | --- |
| BNB + Cosmics CV | v09_93_01 | 274387 | flatcaf | polaris_v09_93_01_prodoverlay_corsika_cosmics_proton_genie_rockbox_sbnd_caf_flat_caf_sbnd |


### ICARUS RUN4 DATA
-----------------------------

| Sample Description | release version | # Events | File type | Samweb definition |
| ICARUS Spring Run 4 BNB Majority Data | v10_06_00_01p05 | --- | stage0 | Icaruspro_2025_wcdnn_production_Run4_SBN_v10_06_00_01p05_fstrmBNBMAJORITY_stage0 |
| --- | --- | --- | calib_ntuples | Icaruspro_2025_wcdnn_production_Run4_SBN_v10_06_00_01p05_fstrmBNBMAJORITY_calib_ntuples |
| ICARUS Spring Run 4 BNB OffbeamMajority Data | v10_06_00_01p05 | --- | stage0 | Icaruspro_2025_wcdnn_production_Run4_SBN_v10_06_00_01p05_fstrmOffBeamBNBMAJORITY_stage0 |
| --- | --- | --- | calib_ntuples | Icaruspro_2025_wcdnn_production_Run4_SBN_v10_06_00_01p05_fstrmOffBeamBNBMAJORITY_calib_ntuples |





SBND Production Progress Report
--------------------------
<div style="position: relative; padding-bottom: 60%; height: 0; overflow: hidden;">
  <iframe 
	src="https://docs.google.com/spreadsheets/d/e/2PACX-1vTf2_LhvACU-MiRJ4Jv0c02PH7pLmjVwo8wzzEeVq7JTxgRFU4jQfcBD25MA7tz9yoYnQ6iRFL_P5qI/pubhtml?gid=615578792&amp;single=true&amp;widget=true&amp;headers=false"
	style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; border: none;"
    loading="lazy">  
   </iframe>
</div>
