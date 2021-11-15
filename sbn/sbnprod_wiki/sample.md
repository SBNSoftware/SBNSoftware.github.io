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



SBN Production Available Samples Page
==========================================

A list of samples that were requested and produced since Oct 2020 and the status of open requests can be checked at the [SBN Production Requests Database](https://docs.google.com/spreadsheets/d/17mFPGsP7gw4GRLSCwIL15QrtUnLVri_2k2Wjzhd6Ork/edit?usp=sharing). 

The spreadsheet contain the configuration files used, the code version, the statistics produced and the SAM dataset for access. Currently the production passes are organized in spreadsheet tabs. If necessary information can't be found, please email the production group at [sbn-mc-prod@fnal.gov](sbn-mc-prod@fnal.gov)

More information about the workflow can be found at the [SBN Analysis Infrastructure Workflow Management page](AnalysisInfrastructure/WorkflowManagement/workflow.md)


Monte Carlo official SBN Production Samples
--------------------------

SBND MC
--------------------------

| Sample Description | production push | release version | # Events | Sample type | Samweb definition |    
| --- | --- | --- | --- | --- | --- |  
| BNB nue + cosmic | MC2021Bv1 | v09_28_01_02 | 15000 | reco2 | official_MC2021Bv1_prodoverlay_corsika_cosmics_proton_genie_nu_spill_gsimple-configh-v1_tpc_reco2_sbnd | 
| --- | --- | --- | 14800 | flat caf | official_MC2021Bv1_prodoverlay_corsika_cosmics_proton_genie_nu_spill_gsimple-configh-v1_tpc_reco2_flat_caf_sbnd |
| BNB nue + cosmic | MC2021Bv1 | v09_28_01_02 | 15000 | reco1 | official_MC2021Bv1_prodoverlay_corsika_cosmics_proton_genie_intrnue_spill_gsimple-configh-v1_tpc_gen_g4_detsim_reco1_sbnd | 
| --- | --- | --- | 15000 | reco2 | official_MC2021Bv1_prodoverlay_corsika_cosmics_proton_genie_nu_spill_gsimple-configh-v1_tpc_reco2_sbnd | 
| --- | --- | --- |  15000 | caf | official_MC2021Bv1_prodoverlay_corsika_cosmics_proton_genie_nu_spill_gsimple-configh-v1_tpc_reco2_caf_sbnd | 
| BNB full osc + cosmics | MC2021Bv1 | v09_28_01_02 | --- | reco1 | test15_official_test15_MC2021Bv1_prodoverlay_corsika_cosmics_proton_genie_fullosc_spill_gsimple-configh-v1_tpc_reco1_sbnd | 
| --- | --- | --- | --- | reco2 | test_official_test_MC2021Bv1_prodoverlay_corsika_cosmics_proton_genie_fullosc_spill_gsimple-configh-v1_tpc_reco2_sbnd |
| --- | --- | --- | --- | caf | test_official_test_MC2021Bv1_prodoverlay_corsika_cosmics_proton_genie_fullosc_spill_gsimple-configh-v1_tpc_reco2_caf_sbnd |
| BNB nu + cosmic | MC2021Bv1 | v09_28_01_02 | --- | reco1 | official_MC2021Bv1_prodoverlay_corsika_cosmics_proton_genie_nu_spill_gsimple-configh-v1_tpc_reco1_sbnd | 
| --- | --- | --- | --- | reco2 | test100_official_test100_MC2021Bv1_prodoverlay_corsika_cosmics_proton_genie_nu_spill_gsimple-configh-v1_tpc_reco2_sbnd | 
| --- | --- | --- | --- | caf | test100_official_test100_MC2021Bv1_prodoverlay_corsika_cosmics_proton_genie_nu_spill_gsimple-configh-v1_tpc_reco2_caf_sbnd | 
| in time cosmics, with SCE | MCP2021A | v09_26_00 | --- | reco2 | official_MCP2021A_prodoverlay_corsika_cosmics_proton_genie_nu_spill_tpc_sbnd_reco2_sbnd | 
| --- | --- | v09_28_00 | 1144 | flat caf | official_MCP2021A_CAF_prodcorsika_proton_intime_filter_sc_concat_caf_sbnd |
| BNB neutrinos + cosmics, with SCE | MCP2021A | v09_26_00 | --- | reco2 | official_MCP2021A_prodgenie_nu_singleinteraction_tpc_sbnd_reco2_sbnd | 
| --- | --- | v09_28_00 | 185300 | flat caf | official_MCP2021A_CAF_prodoverlay_corsika_cosmics_proton_genie_nu_spill_tpc_sbnd_flat_caf_sbnd | 
| BNB nu only, with SCE | MCP2021A | v09_26_00 | --- | reco2 | official_MCP2021A_prodcorsika_proton_intime_filter_sce_reco2_sbnd | 
| --- | --- | v09_28_00 | 150000 | flat caf | official_MCP2021A_CAF_prodgenie_nu_singleinteraction_tpc_sbnd_flat_caf_sbnd	| 
| Intime Cosmics | SBNWorkshop0421 | v09_19_00_02 | 150627 | flat cafs | 	workshop_SBNWorkshop0421_prodcorsika_proton_intime_filter_flat_caf_sbnd	|
| NuE Overlay | SBNWorkshop0421 | v09_19_00_01 | 45700 | flat cafs | 	workshop_SBNWorkshop0421_prodoverlay_corsika_cosmics_proton_genie_intrnue_spill_gsimple-configf-v1_tpc_flat_caf_sbnd |
| BNB Overlay | SBNWorkshop0421 | v09_19_00_01 | 286850 | flat cafs | workshop_SBNWorkshop0421_prodoverlay_corsika_cosmics_proton_genie_nu_spill_gsimple-configf-v1_tpc_flat_caf_sbnd | 
| Intime cosmics | MCP2020A | v09_09_00 | 151407 | reco2 | official_MCP2020A_prodcorsika_proton_intime_filter_reco2_sbnd	|
| BNBnue | MCP2020A | v09_09_00 | 72300 | reco2 | official_MCP2020A_prodgenie_intrnue_singleinteraction_tpc_gsimple-configf-v1_reco2_sbnd	|
| BNBnue + cosmics | MCP2020A | v09_09_00 | 45950 | reco2 | official_MCP2020A_prodoverlay_corsika_cosmics_proton_genie_intrnue_spill_gsimple-configf-v1_tpc-configf-v1_tpc_reco2_sbnd | 
| BNB nu + cosmics | MCP2020A | v09_09_00 | 287350 | reco2 | official_MCP2020A_prodoverlay_corsika_cosmics_proton_genie_nu_spill_gsimple-configf-v1_tpc-configf-v1_tpc_reco2_sbnd	|
| Cathode crossing muons | MCP2020A | v09_08_00 | 9700 | detsim | official_MCP2020A_prodsingle_mu_10GeV_cathodecrossing_detsim_sbnd |
| low energy electrons | MCP2020A | v09_08_00 | 19000 | detsim | official_MCP2020A_prodsingle_electron_1-50MeV_detsim_sbnd |
| Stopping muons from top | MCP2020A | v09_08_00 | 9500 | detsim | official_MCP2020A_prodsingle_muplus_stopping_fromtop_detsim_sbnd |
| BNB nu (single interaction) | MCP2020A | v09_09_00 | 198400 | reco2 | official_MCP2020A_prodgenie_nu_singleinteraction_tpc_gsimple-configf-v1_reco2_sbnd |


ICARUS MC
--------------------------

| Sample Description | production push | release version | # Events | Sample type | Samweb definition |   
| --- | --- | --- | --- | --- | --- |
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
    * bug in LArSoft can lead to issues where the best matching particle is non existent
    * more information: [DocDB:20894](https://sbn-docdb.fnal.gov/cgi-bin/private/ShowDocument?docid=20894) 

Processed Data SBN Production Samples
--------------------------

ICARUS DATA
--------------------------
              

