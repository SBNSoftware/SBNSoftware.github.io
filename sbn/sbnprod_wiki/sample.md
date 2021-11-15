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

| Sample Description | production push | approx. date production | release version | # Events | Sample type | Samweb definition | Notes |   
| --- | --- | --- | --- | --- | --- | --- | --- |
| BNB nue+cosmic | MC2021B | --- | v09_28_01_02 | 14800 | reco2 | official_MC2021Bv1_prodoverlay_corsika_cosmics_proton_genie_nu_spill_gsimple-configh-v1_tpc_reco2_sbnd | test test |
| --- | --- | --- | --- | --- | calib | hists_official_MC2021Bv1_prodoverlay_corsika_cosmics_proton_genie_nu_spill_gsimple-configh-v1_tpc_reco2_sbnd | test test |
| --- | --- | --- | --- | --- | caf | official_MC2021Bv1_prodoverlay_corsika_cosmics_proton_genie_nu_spill_gsimple-configh-v1_tpc_reco2_caf_sbnd | test test |



| Sample Description | production push | approx. date production | release version | # Events | Sample type | Samweb definition | Notes |   
| --- | --- | --- | --- | --- | --- | --- | --- |
| Intime cosmics | MCP2020A | --- | v09_09_00 | 151407 | reco2 | official_MCP2020A_prodcorsika_proton_intime_filter_reco2_sbnd	| --- |
| BNBnue | MCP2020A | --- | v09_09_00 | 72300 | reco2 | official_MCP2020A_prodgenie_intrnue_singleinteraction_tpc_gsimple-configf-v1_reco2_sbnd	| --- |
| BNBnue+cosmics | MCP2020A | --- | v09_09_00 | 45950 | reco2 | official_MCP2020A_prodoverlay_corsika_cosmics_proton_genie_intrnue_spill_gsimple-configf-v1_tpc-configf-v1_tpc_reco2_sbnd	| MCP2020A |
| BNB nu+cosmics | --- | --- | v09_09_00 | 287350 | reco2 | official_MCP2020A_prodoverlay_corsika_cosmics_proton_genie_nu_spill_gsimple-configf-v1_tpc-configf-v1_tpc_reco2_sbnd	| --- |
| Cathode crossing muons | MCP2020A | --- |	v09_08_00 | 9700 | detsim | official_MCP2020A_prodsingle_mu_10GeV_cathodecrossing_detsim_sbnd	| --- |
| low energy electrons | MCP2020A | --- |	v09_08_00 | 19000 | detsim | official_MCP2020A_prodsingle_electron_1-50MeV_detsim_sbnd	| --- |
| Stopping muons from top | MCP2020A | --- |	v09_08_00 | 9500 | detsim | official_MCP2020A_prodsingle_muplus_stopping_fromtop_detsim_sbnd	| --- |
| BNB nu (single interaction) | MCP2020A | --- |	v09_09_00 | 198400 | reco2 | official_MCP2020A_prodgenie_nu_singleinteraction_tpc_gsimple-configf-v1_reco2_sbnd	| --- |

ICARUS MC
--------------------------

| Sample Description | production push | approx. date production | release version | # Events | Sample type | Samweb definition | Notes |   
| --- | --- | --- | --- | --- | --- | --- | --- |
| BNB nu-only | --- | MCP2020A | v09_09_02_01 | 113302 | reco2 | poms_icarus_prod_2020A_00_BNB_nu_v09_09_02_01_reco2		| --- |
| NuMI off axis for ICARUS | --- | MCP2020A | v09_07_00_prof | 70790 | reco2 | ICARUS_prod_2020A_00_numioffaxis_v09_10_01_reco2	| --- |
| COSMICs_ML | --- | --- | v09_07_00_prof	 | 543700 | detsim | ICARUS_poms_prod_cosmics_ML_v09_07_00_detsim	| --- |
| Intime cosmics | MCP2020A | --- | v09_09_00 | 189534 | reco2 | ICARUS_prod_2020A_00_intime_cosmic_v09_09_00_reco2_halfstats	| --- |
| --- | --- | --- | --- | 159538 | reco2SCEfix | ICARUS_prod_intime_cosmic_v09_09_02_01_reco2SCEfix | --- |
| BNB Nue+cosmics | MCP2020A | --- | v09_09_00 | 58339 | reco2 | ICARUS_prod_2020A_00_BNB_nue_cosmic_v09_09_00_reco2	| --- |
| --- | --- | --- | --- | 56514 | reco2SCEfix | ICARUS_prod_BNB_nue_cosmic_v09_09_02_01_reco2SCEfix | --- |
| BNB Nu+cosmics | MCP2020A | --- | v09_09_00 | 189775 | reco2 | ICARUS_prod_2020A_00_BNB_nu_cosmic_v09_09_00_reco2_halfstats	| --- |
| --- | --- | --- | --- | 165816 | reco2SCEfix | ICARUS_prod_BNB_nu_cosmic_v09_09_02_01_reco2SCEfix | --- |
| BNB nue | MCP2020A | --- | v09_09_00 | 50976 | reco2 | ICARUS_prod_2020A_00_BNB_nue_v09_09_00_reco2	| --- |
| --- | --- | --- | --- | 51092 | reco2SCEfix | ICARUS_prod_BNB_nue_v09_09_02_01_reco2SCEfix | --- |




### Notes on samples ###
* MC2020A
  * SBND Intime Cosmic sample in MCP2020A (and possibly older productions)
    * bug in LArSoft can lead to issues where the best matching particle is non existent
    * more information: [DocDB:20894](https://sbn-docdb.fnal.gov/cgi-bin/private/ShowDocument?docid=20894) 

Processed Data SBN Production Samples
--------------------------

ICARUS DATA
--------------------------
              

